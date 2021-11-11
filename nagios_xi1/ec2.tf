resource "aws_instance" "nagios" {
  ami             = data.aws_ami.centos.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_traffic.name]
  key_name        = aws_key_pair.bastion_host.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo yum install wget -y",
      "cd /tmp",
      "sudo wget https://assets.nagios.com/downloads/nagiosxi/xi-latest.tar.gz",
      "sudo tar -zxvf xi-latest.tar.gz",
      "cd nagiosxi",
      "./fullinstall",
    ]
  }

  connection {
    type        = "ssh"
    user        = "centos"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.nagios.public_ip
  }

  tags = var.tags
}