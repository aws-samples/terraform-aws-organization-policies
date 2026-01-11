// Copyright Amazon.com, Inc. or its a:w:ffiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

locals {
  policies_directory = var.policies_directory == null ? lower(var.policy_type) : var.policies_directory

  json_files     = fileset(path.root, "${local.policies_directory}/*.json")
  template_files = fileset(path.root, "${local.policies_directory}/*.json.tpl")

  policy_content = merge(
    {
      for file_path in local.json_files :
      trimprefix(trimsuffix(file_path, ".json"), "${local.policies_directory}/") => file(file_path)
    },
    {
      for file_path in local.template_files :
      trimprefix(trimsuffix(file_path, ".json.tpl"), "${local.policies_directory}/") => templatefile(file_path, var.template_variables)
    }
  )
}
