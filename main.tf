provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "automationServer" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name      = "KpFirstAMI_KeyPair3"

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("KpFirstAMI_KeyPair3.pem")}"
      agent       = false
    }

    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y software-properties-common",
      "sudo apt-add-repository -y ppa:ansible/ansible",
      "sudo apt-get update -y",
      "sudo apt-get install -y ansible",
    ]
  }
}

resource "aws_instance" "host1" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  key_name      = "KpFirstAMI_KeyPair3"

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("KpFirstAMI_KeyPair3.pem")}"
    }

    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y software-properties-common",
      "sudo add-apt-repository -y ppa:deadsnakes/ppa",
      "sudo apt-get update -y",
      "sudo apt-get install -y python3.6",
    ]
  }
}
