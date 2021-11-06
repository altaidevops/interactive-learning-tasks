resource "null_resource" "myscript" {
    depends_on = [aws_instance.r1soft, aws_security_group.r1soft]
    triggers = {
        always_run = timestamp()
    }
    provisioner "remote-exec" {
    inline = [
      "echo r1soft installation",
    ]
  }
    connection {
        type     = "ssh"
        user     = "centos"
        private_key = file("~/.ssh/id_rsa")
        host     = aws_instance.r1soft.public_ip
    }
}