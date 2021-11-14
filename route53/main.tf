resource "aws_db_instance" "my-test-sql" {
  instance_class          = "db.t2.micro"
  engine                  = "mysql"
  engine_version          = "5.7"
  multi_az                = false
  storage_type            = "gp2"
  allocated_storage       = 50
  max_allocated_storage = 500
  storage_encrypted     = false
  name                    = "mytestrds"
  username                = "admin"
  password                = "admin123"
  apply_immediately       = "true"
  backup_retention_period = 10
  backup_window           = "09:46-10:16"
  db_subnet_group_name    = aws_db_subnet_group.my-rds-db-subnet.name
  vpc_security_group_ids  = [aws_security_group.my-rds-sg.id]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
}

resource "aws_db_subnet_group" "my-rds-db-subnet" {
  name       = "my-rds-db-subnet"
  subnet_ids = ["10.0.1.0/24", "10.0.2.0/24"]
}

resource "aws_security_group" "mysql" {
  name   = "mysql"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "my-rds-sg-rule" {
  from_port         = 3306
  protocol          = "tcp"
  security_group_id = aws_security_group.mysql.id
  to_port           = 3306
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound_rule" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.mysql.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

data "aws_kms_secret" "rds" {
  secret {
    name = "db-password"
    payload = "AQICAHibS2rwth4UleeAxsSEfxgwqkPtD0jzkRM/Ez91Y7cbvwEHP2YRcuplZp/H7GqmIuXVAAAAZjBkBgkqhkiG9w0BBwagVzBVAgEAMFAGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMps5PwT/x3nCnBMfTAgEQgCNd+Y6q9KBZbIX8JZlqP7EDErQLuaBLh6mKaYBz+5blxWstwQ=="
  }
}