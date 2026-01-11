// Copyright Amazon.com, Inc. or its a:w:ffiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

resource "aws_organizations_policy" "this" {
  for_each = local.policy_content
  name     = each.key
  content  = each.value
  type     = var.policy_type
}

module "policy_attach" {
  depends_on              = [aws_organizations_policy.this]
  source                  = "./modules/policy_attach"
  for_each                = var.ou_map
  ou                      = each.key
  policies                = each.value
  policy_id               = aws_organizations_policy.this
  policies_directory_name = local.policies_directory
}
