resource "aws_instance" "jenkins" {
  ami             = data.aws_ami.centos.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]
  key_name        = aws_key_pair.bastion_host.key_name

  provisioner "remote-exec" {
    inline = [
      "sudo yum install wget -y",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo  --no-check-certificate",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo yum upgrade -y",
      "sudo yum install epel-release java-11-openjdk-devel -y",
      "sudo yum install jenkins -y",
      "sudo systemctl daemon-reload",
      "sudo systemctl start jenkins",
      "sudo systemctl status jenkins",
      "sudo systemctl enable jenkins",
      # "sudo more /var/log/jenkins.log",
      # "sudo cat /var/lib/jenkins/secrets/initialAdminPassword",
    ]
  }

  connection {
    type        = "ssh"
    user        = "centos"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.jenkins.public_ip
  }

  tags = var.tags
}