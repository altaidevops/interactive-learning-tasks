# resource "aws_db_instance" "my-test-sql" {
#   instance_class          = "db.t2.micro"
#   engine                  = "mysql"
#   engine_version          = "5.7"
#   multi_az                = false
#   storage_type            = "gp2"
#   allocated_storage       = 50
#   max_allocated_storage = 500
#   storage_encrypted     = false
#   name                    = "mytestrds"
#   username                = "admin"
#   password                = "admin123"
#   apply_immediately       = "true"
#   backup_retention_period = 10
#   backup_window           = "09:46-10:16"
#   db_subnet_group_name    = aws_db_subnet_group.my-rds-db-subnet.name
#   vpc_security_group_ids  = [aws_security_group.mysql.id]
#   allow_major_version_upgrade = true
#   auto_minor_version_upgrade  = true
# }

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = "db.t2.large"
  multi_az                = false
  storage_type            = "gp2"
  allocated_storage       = 50
  max_allocated_storage = 500
  storage_encrypted     = false

  name     = "demodb"
  username = "user"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [aws_security_group.mysql.id]

  vpc_id = module.vpc.id
  subnets = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1],
    module.vpc.private_subnets[2],
  ]

  allowed_cidr_blocks             = ["10.20.0.0/20"]

  apply_immediately               = true
  monitoring_interval             = 10
  db_parameter_group_name         = "default.mysql8.0"
  db_cluster_parameter_group_name = "default.mysql8.0"
  tags                            = var.tags

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically

  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true
  auto_minor_version_upgrade  = true


  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  deletion_protection = false

  parameters = [
    {
      name = "character_set_client"
      value = "utf8mb4"
    },
    {
      name = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}