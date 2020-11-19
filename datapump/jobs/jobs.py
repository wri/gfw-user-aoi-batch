from enum import Enum
from typing import List

from pydantic import BaseModel


class JobStatus(str, Enum):
    pending = "pending"
    running = "running"
    complete = "success"
    failed = "failed"


class Job(BaseModel):
    id: str
    status: JobStatus = JobStatus.pending


class Analysis(str, Enum):
    """
    Supported analyses to run on datasets
    """

    tcl = "tcl"
    glad = "glad"
    viirs = "viirs"
    modis = "modis"


class AnalysisInputTable(BaseModel):
    """
    A table generated by running an analysis on an existing dataset/version.
    """
    dataset: str
    version: str
    analysis: Analysis


class PartitionSchema(BaseModel):
    partition_type: str
    partition_column: str
    partition_values: List[str]


class AnalysisResultTable(BaseModel):
    dataset: str
    version: str
    source_uri: List[str]
    index_columns: List[str] = None
    partitions: PartitionSchema = None

