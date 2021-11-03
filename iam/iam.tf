resource "aws_iam_user" "bob" {
  name = "bob"
  tags = {
    Team = "DevOps"
  }
}
resource "aws_iam_group" "sysusers" {
  name = "sysusers"
}

resource "aws_iam_user_group_membership" "sysusersgroup" {
  user = aws_iam_user.bob.name
  groups = [
    aws_iam_group.sysusers.name,
  ]
}