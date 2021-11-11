resource "aws_instance" "nagios" {
    ami = data.aws_ami.centos.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.sec_group_for_nagios.id]
    key_name               = aws_key_pair.key_pair_for_nagios.key_name
}

resource "null_resource" "nagios_installation" {
  depends_on = [aws_instance.nagios, aws_security_group.sec_group_for_nagios]
  triggers = {
    always_run = timestamp()
  }

  provisioner "remote-exec" {
    connection {
      host        = aws_instance.nagios.public_ip
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
    }
    inline = [
        # "sudo yum install wget -y",
        # "cd /tmp",
        # "sudo wget https://assets.nagios.com/downloads/nagiosxi/xi-latest.tar.gz", 
        # "sudo tar -zxvf xi-latest.tar.gz",
        # "cd nagiosxi",
        # "./fullinstall",
        "curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sudo sh",
    ]
  }
}