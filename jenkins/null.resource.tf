resource "null_resource" "myscript" {
  depends_on = [aws_instance.jenkins, aws_security_group.web_traffic]
  triggers = {
    always_run = timestamp()
  }
  provisioner "remote-exec" {
    inline = [
      "echo Jenkins installation",
    ]
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.jenkins.public_ip
  }
}