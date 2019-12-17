data aws_iam_policy_document s3 {
  count = var.s3bucket_arn == "" ? 0 : 1

  statement {
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:DeleteObject"
    ]

    resources = ["${var.s3bucket_arn}/${var.s3_path}"]
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [var.s3bucket_arn]
  }
}

resource aws_iam_policy s3 {
  count = var.s3bucket_arn == "" ? 0 : 1

  name   = "${var.username}-S3Policy"
  policy = data.aws_iam_policy_document.s3[0].json
}

resource aws_iam_user_policy_attachment user {
  count = var.s3bucket_arn == "" ? 0 : 1

  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.s3[0].arn
}
