import logging
import os
import traceback

from botocore.exceptions import ClientError

from geotrellis_summary_update.emr import (
    get_summary_analysis_steps,
    submit_summary_batch_job,
)
from geotrellis_summary_update.util import get_curr_date_dir_name, bucket_suffix
from geotrellis_summary_update.slack import slack_webhook


# environment should be set via environment variable. This can be done when deploying the lambda function.
if "ENV" in os.environ:
    ENV = os.environ["ENV"]
else:
    ENV = "dev"


def handler(event, context):
    name = event["name"]
    feature_src = event["feature_src"]
    feature_type = event["feature_type"]
    analyses = event["analyses"]

    result_dir = f"geotrellis/results/{name}/{get_curr_date_dir_name()}"

    try:
        steps = get_summary_analysis_steps(
            analyses, feature_src, feature_type, result_dir
        )
        job_flow_id = submit_summary_batch_job(name, steps, "r4.xlarge", 1)

        return {
            "status": "SUCCESS",
            "job_flow_id": job_flow_id,
            "name": name,
            "analyses": analyses,
            "feature_src": feature_src,
            "feature_type": feature_type,
            "result_dir": result_dir,
            "upload_type": event["upload_type"],
        }
    except ClientError:
        logging.error(traceback.print_exc())
        slack_webhook(
            "ERROR", f"Error submitting job to update {ENV} summary datasets.",
        )
        return {"status": "FAILED"}
