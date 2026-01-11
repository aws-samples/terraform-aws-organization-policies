// Copyright Amazon.com, Inc. or its a:w:ffiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

locals {
  policies_directory = var.policies_directory == null ? lower(var.policy_type) : var.policies_directory

  policy_content = merge(
    {
      for file_path in fileset(path.root, "${local.policies_directory}/*.json") :
      file_path => file(file_path)
    },
    {
      for file_path in fileset(path.root, "${local.policies_directory}/*.json.tpl") :
      replace(file_path, ".json.tpl", ".json") => templatefile(file_path, var.template_variables)
    }
  )
}

