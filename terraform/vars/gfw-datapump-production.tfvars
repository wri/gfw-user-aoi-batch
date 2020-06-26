environment = "production"

lambda_submit_job_runtime     = "python3.7"
lambda_submit_job_memory_size = 1024
lambda_submit_job_timeout     = 300

lambda_upload_results_runtime     = "python3.7"
lambda_upload_results_memory_size = 1024
lambda_upload_results_timeout     = 300

lambda_check_datasets_runtime     = "python3.7"
lambda_check_datasets_memory_size = 1024
lambda_check_datasets_timeout     = 300

lambda_check_new_aoi_runtime     = "python3.7"
lambda_check_new_aoi_memory_size = 3008
lambda_check_new_aoi_timeout     = 900

lambda_update_new_aoi_statuses_runtime     = "python3.7"
lambda_update_new_aoi_statuses_memory_size = 3008
lambda_update_new_aoi_statuses_timeout     = 900

lambda_check_new_glad_alerts_runtime     = "python3.7"
lambda_check_new_glad_alerts_memory_size = 1024
lambda_check_new_glad_alerts_timeout     = 300

lambda_get_latest_fire_alerts_runtime     = "python3.6"
lambda_get_latest_fire_alerts_memory_size = 3008
lambda_get_latest_fire_alerts_timeout     = 900

geotrellis_jar = "s3://gfw-pipelines-staging/geotrellis/jars/treecoverloss-assembly-1.1.2.jar"

datasets = {
  "geostore": {
    "annualupdate_minimal": {
      "change" = "d67db9ab-1462-4622-b4a7-e29f403df1a5"
      "summary" = "09c2a7b5-120b-4907-a4ea-c7b62a3b252b"
      "whitelist" = "6c004b6c-c940-495d-9ba7-c952afa960ec"
    }
    "gladalerts": {
      "daily_alerts" = "0064ccfb-efb0-4bd4-befa-b2ba034197d1"
      "weekly_alerts" = "5c62a80a-7846-4dfc-b174-53285da9e37a"
      "summary" = "d78f39a4-9273-4f45-8ec4-d9665b8666d9"
      "whitelist" = "b2d07932-beff-4590-93e7-1d03cdb2d6b4"
    }
    "firealerts_modis": {
      "daily_alerts" = "N/A"
      "weekly_alerts" = "N/A"
    }
    "firealerts_viirs": {
      "daily_alerts" = "N/A"
      "weekly_alerts" = "N/A"
    }
  }
  "gadm": {
    "gladalerts": {
      "iso": {
        "weekly_alerts" = "e090cf7c-d52e-4511-8d54-7ff083cd5ba4"
      }
      "adm1": {
        "weekly_alerts" = "7dfccab0-7b5b-4812-926f-bdda40fd2d73"
      }
      "adm2": {
        "daily_alerts" = "591dfe99-3184-4ab5-a5b5-1efb642f1606",
        "weekly_alerts" = "9388c2dd-2b32-449f-9ce9-d31386a45d74"
      }
    }
    "firealerts_viirs": {
      "all" = "a2475f80-e48b-455d-b8d1-198bd6b8e91d"
      "iso": {
        "weekly_alerts" = "6d1798f3-f6ea-4252-87fd-fdac7c7c74e0"
      }
      "adm1": {
        "weekly_alerts" = "984ba347-eb45-41ca-8c4d-021efc9fc338"
      }
      "adm2": {
        "daily_alerts" = "875863d1-35bb-44f2-8b71-03beb5c90c38"
        "weekly_alerts" = "91da566b-687f-4083-a701-41e7324d666e"
      }
    }
    "firealerts_modis": {
      "iso": {
        "weekly_alerts" = "e999d124-b19b-4b26-89dd-b8744fbfb6de"
      }
      "adm1": {
        "weekly_alerts" = "fb311b24-1b50-4ed9-93d8-bb4fca3a797c"
      }
      "adm2": {
        "daily_alerts" = "be395f10-6ee0-4e51-aa1d-593f5f2f1ee2"
        "weekly_alerts" = "105010b0-f121-49f3-a82b-6ce253d26350"
      }
    }
  }
  "wdpa": {
    "gladalerts": {
      "daily_alerts" = "cb00f471-63d5-4531-9177-17b4c7acaccf",
      "weekly_alerts" = "325f79c1-550f-4928-97c2-c4d0904edc88"
    }
    "firealerts_modis": {
      "daily_alerts" = "83b55c8f-2d0c-4002-bd8b-568593393c24"
      "weekly_alerts" = "33d2256e-645f-44cf-b0d3-2613a71cf62b"
    }
    "firealerts_viirs": {
      "daily_alerts" = "43371354-4a60-4cac-afd9-1e4627682ea2"
      "weekly_alerts" = "02f3d46b-ba14-469c-b536-4d189834d71a"
    }
  }
}