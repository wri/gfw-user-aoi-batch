data "archive_file" "lambda_check_datasets_saved" {
  type        = "zip"
  source_dir  = "../lambdas/check_datasets_saved/src"
  output_path = "../lambdas/check_datasets_saved/lambda.zip"
}

data "archive_file" "lambda_check_new_areas" {
  type        = "zip"
  source_dir  = "../lambdas/check_new_areas/src"
  output_path = "../lambdas/check_new_areas/lambda.zip"
}

data "archive_file" "lambda_submit_job" {
  type        = "zip"
  source_dir  = "../lambdas/submit_job/src"
  output_path = "../lambdas/submit_job/lambda.zip"
}

data "archive_file" "lambda_update_new_area_statuses" {
  type        = "zip"
  source_dir  = "../lambdas/update_new_area_statuses/src"
  output_path = "../lambdas/update_new_area_statuses/lambda.zip"
}

data "archive_file" "lambda_upload_results_to_datasets" {
  type        = "zip"
  source_dir  = "../lambdas/upload_results_to_datasets/src"
  output_path = "../lambdas/upload_results_to_datasets/lambda.zip"
}