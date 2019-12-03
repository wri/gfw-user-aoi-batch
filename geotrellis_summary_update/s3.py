from botocore.exceptions import ClientError
from urllib.parse import urlparse


def s3_directory_exists(bucket, prefix, s3_client):
    """
    Checks if an s3 directory exists.

    Since s3 doesn't really have directories, just checking if call list objects on a prefix throws an error.
    """
    try:
        s3_client.list_objects(Bucket=bucket, Prefix=prefix)
        return True
    except ClientError:
        return False


def get_s3_path_parts(path):
    parsed = urlparse(path)
    bucket = parsed.netloc
    key = parsed.path.lstrip("/")
    return bucket, key


def get_s3_path(bucket, key):
    return "s3://{}/{}".format(bucket, key)
