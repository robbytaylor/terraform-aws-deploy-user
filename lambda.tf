data aws_iam_policy_document lambda {
  count = var.lambda_arn == "" ? 0 : 1

  statement {
    actions   = ["lambda:UpdateFunctionCode"]
    resources = [var.lambda_arn]
  }
}

resource aws_iam_policy lambda {
  count = var.lambda_arn == "" ? 0 : 1

  name   = "${var.username}-LambdaPolicy"
  policy = data.aws_iam_policy_document.lambda[0].json
}

resource "aws_iam_user_policy_attachment" lambda {
  count = var.lambda_arn == "" ? 0 : 1

  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.lambda[0].arn
}
