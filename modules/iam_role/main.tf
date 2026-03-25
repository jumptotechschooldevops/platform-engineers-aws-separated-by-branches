resource "aws_iam_role" "this" {
  name = "${var.project_name}-${var.environment}-${var.name}"

  assume_role_policy = var.assume_role_policy_json

  tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      Name        = var.name
    },
    var.tags
  )
}

resource "aws_iam_role_policy" "inline" {
  count = var.policy_json != null ? 1 : 0

  name   = "${var.project_name}-${var.environment}-${var.name}-inline"
  role   = aws_iam_role.this.id
  policy = var.policy_json
}

resource "aws_iam_role_policy_attachment" "managed" {
  count = length(var.managed_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = var.managed_policy_arns[count.index]
}
