variable s3bucket_arn {
  type        = string
  default     = ""
  description = "The ARN of a bucket that the user will be able to upload to"
}

variable s3_path {
  type        = string
  default     = "*"
  description = "The path within the bucket that the user may upload to"
}

variable lambda_arn {
  type        = string
  default     = ""
  description = "ARN of a Lambda function that the user may update the source code for"
}

variable username {
  type    = string
  default = "DeploymentUser"
}

variable tags {
  type    = map
  default = {}
}
