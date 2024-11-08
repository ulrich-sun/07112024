data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners = [  ]
  filter {
    name = "name"
    values = [  ]
  }
}

resource "aws_instance" "ec2_instance_master" {
  ami = data.aws_ami.ubuntu_ami.id 
  instance_type = var.instance_type 
  availability_zone = var.az
  key_name = var.key_name  
  security_groups = [ "${var.var.security_groups}" ] 
  count = var.number
   connection {
     type = "ssh"
     user =  var.user
     host =  self.public_ip
     private_key = file("${var.key_name}.pem")
   }
   provisioner "remote-exec" {
     inline = [  
        "sudo apt update", 
        "sudo apt install sshpass -y",
        "sudo apt install ansible -y"
      ]
   }


  tags = {
    Name = "${var.instance_name_master}-${count.index}"
  }
  depends_on = [ aws_instance.ec2_instance_worker ]
}

resource "aws_instance" "ec2_instance_worker" {
  ami = data.aws_ami.ubuntu_ami.id 
  availability_zone = var.az
  instance_type = var.instance_type 
  key_name = var.key_name  
  security_groups = [ "${var.var.security_groups}" ] 
  count = var.number

  tags = {
    Name = "${var.instance_name_worker}-${count.index}"
  }
}

