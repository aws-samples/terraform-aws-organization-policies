// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

variable "ou_map" {
}

variable "policies_directory" {
  type    = string
  default = null
}

variable "policy_type" {
  type = string
}

variable "template_variables" {
  description = "Variables to substitute in policy templates (.json.tpl files)"
  type        = map(string)
  default     = {}
}
