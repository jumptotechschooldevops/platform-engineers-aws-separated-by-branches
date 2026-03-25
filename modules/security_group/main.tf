resource "aws_security_group" "this" {
  name        = "${var.project_name}-${var.environment}-${var.name}"
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name        = "${var.project_name}-${var.environment}-${var.name}"
      Project     = var.project_name
      Environment = var.environment
    }
  )
}

resource "aws_security_group_rule" "ingress" {
  for_each = { for index, rule in var.ingress_rules : index => rule }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = each.value.description
  security_group_id = aws_security_group.this.id
}

resource "aws_security_group_rule" "egress" {
  for_each = { for index, rule in var.egress_rules : index => rule }

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  description       = each.value.description
  security_group_id = aws_security_group.this.id
}
