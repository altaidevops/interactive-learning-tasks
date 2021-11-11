resource "aws_instance" "jenkins" {
  ami             = data.aws_ami.centos.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]
  key_name        = aws_key_pair.bastion_host.key_name

  provisioner "remote-exec" {
    inline = [
      "wget http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo",
      "sudo cp jenkins.repo /etc/yum.repos.d/",
      "sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key'",
      "sudo yum upgrade",
      "sudo yum install epel-release java-11-openjdk-devel",
      "sudo yum install jenkins",
      "sudo systemctl daemon-reload",
      "sudo systemctl start jenkins",
      "sudo systemctl enable jenkins",
      "sudo cat /var/lib/jenkins/secrets/initialAdminPassword",
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