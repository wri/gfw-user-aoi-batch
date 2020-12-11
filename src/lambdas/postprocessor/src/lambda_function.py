import os
from typing import Union, cast, List
from pprint import pformat

from pydantic import parse_obj_as

from datapump.globals import LOGGER
from datapump.jobs.jobs import JobStatus
from datapump.jobs.geotrellis import GeotrellisJob
from datapump.clients.datapump_store import DatapumpStore, DatapumpConfig
from datapump.commands import SyncType

if "ENV" in os.environ:
    ENV = os.environ["ENV"]
else:
    ENV = "dev"


def handler(event, context):
    LOGGER.info(f"Postprocessing results of map: {pformat(event)}")
    jobs = parse_obj_as(Union[List[GeotrellisJob]], event["jobs"])
    config_client = DatapumpStore()

    for job in jobs:
        LOGGER.info(f"Postprocessing job: {pformat(job.dict())}")

        if isinstance(job, GeotrellisJob):
            cast(job, GeotrellisJob)

            # add any results with sync enabled to the config table
            if job.status == JobStatus.complete and job.sync:
                # it's possible to have multiple sync types for a single table (e.g. viirs and geostore),
                # so add all to config table
                sync_types = SyncType.get_sync_types(
                    job.table.dataset, job.table.analysis
                )
                LOGGER.debug(
                    f"Writing entries for {job.table.dataset} - {job.table.analysis} - {sync_types}"
                )
                for sync_type in SyncType.get_sync_types(
                    job.table.dataset, job.table.analysis
                ):
                    config_client.add(
                        DatapumpConfig(
                            analysis_version=job.analysis_version,
                            dataset=job.table.dataset,
                            dataset_version=job.table.version,
                            analysis=job.table.analysis,
                            sync=job.sync,
                            sync_type=sync_type,
                            metadata={
                                "geotrellis_version": job.geotrellis_version,
                                "features_1x1": job.features_1x1,
                            },
                        )
                    )

    config_client.close()