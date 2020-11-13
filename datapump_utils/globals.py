import os

DATA_API_URI = ""
DYNAMODB_DB_TABLE = ""

AWS_REGION = ""
RESULT_BUCKET = ""
MASTER_INSTANCE_TYPE = ""
WORKER_INSTANCE_TYPES = ""
EC2_KEY_NAME = ""
PUBLIC_SUBNET_IDS = ""
EMR_INSTANCE_PROFILE = os.enivron.get("EMR_INSTANCE_PROFILE", None)
EMR_SERVICE_ROLE = os.enivron.get("EMR_SERVICE_ROLE", None)

EMR_VERSION = "emr-5.24.0"

GEOTRELLIS_JAR_PATH = ""
WORKER_COUNT_MIN = 5
WORKER_COUNT_PER_GB_FEATURES = 50
