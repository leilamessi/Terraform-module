resource "aws_instance" "name" {
  ami = data.aws_ami.amazon-linux.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.ec2_key.key_name
  
  tags = {
    Name = "server1"
  }

  /*connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("keypair.pem")
    host = self.public_ip
  }
  provisioner "remote-exec" {
     inline = [ 
      "sudo yum update -y",
      "mkdir leila",
      "pwd",
      "nproc"
      ]
  }

  provisioner "file" {
    source = "week12b.pem"
    destination = "/tmp/week12b.pem"
  }

  depends_on = [ aws_key_pair.ec2_key ] */
}

resource "null_resource" "null" {
  
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("keypair.pem")
    host = aws_instance.name.public_dns
  }
  provisioner "remote-exec" {
     inline = [ 
      "sudo yum update -y",
      "mkdir leila",
      "pwd",
      "nproc"
      ]
  }

  provisioner "file" {
    source = "week12b.pem"
    destination = "/tmp/week12b.pem"
  }
}