resource "aws_db_instance" "my-test-sql" {
   instance_class          = "db.t2.micro"
   engine                  = "mysql"
   engine_version          = "5.7"
  //  multi_az                = false
   storage_type            = "gp2"
   allocated_storage       = 50
   max_allocated_storage = 500
   storage_encrypted     = true
   name                    = "mytestrds"
   username                = "admin"
   password                = "admin123"
  //  apply_immediately       = "true"
  //  backup_retention_period = 10
  //  backup_window           = "09:46-10:16"
   availability_zone = "us-east-1a"
   db_subnet_group_name    = aws_subnet.subnet1.id
   vpc_security_group_ids  = [aws_security_group.mysql.id]
  //  allow_major_version_upgrade = true
   auto_minor_version_upgrade  = true
 }

