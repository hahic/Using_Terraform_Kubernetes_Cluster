# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "token" {
  description = "Terraform Cloud Token"
  type        = string
  default     = "UxZe4zbx0Ijvhg.atlasv1.3mcZTYGQA3dRmQeQIZj7yhw550HyCwjZ5ZU5DUaDLm3Xd1TFfSmPp3IYfYcoVtTZB5M"
}