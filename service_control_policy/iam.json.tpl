{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "IAM",
      "Effect": "Deny",
      "Action": [
        "iam:AttachRolePolicy",
        "iam:CreateRole",
        "iam:Delete*",
        "iam:DetachRolePolicy",
        "iam:Put*",
        "iam:Update*",
        "iam:TagRole",
        "iam:UntagRole"
      ],
      "Resource": "*",
      "Condition": {
        "ArnNotLike": {
          "aws:PrincipalARN": [
            "arn:aws:iam::*:role/AWSControlTowerExecution",
            "arn:aws:iam::${management_account_id}:role/AWSAFTAdmin"
          ]
        }
      }
    }
  ]
}
