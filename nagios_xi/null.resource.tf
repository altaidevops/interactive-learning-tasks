resource "null_resource" "myscript" {
  depends_on = [aws_instance.nagios, aws_security_group.web_traffic]
  triggers = {
    always_run = timestamp()
  }
  provisioner "remote-exec" {
    inline = [
      "echo Nagios Server installation",
    ]
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.nagios.public_ip
  }
}