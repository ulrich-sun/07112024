module "ec2" {
  source = "./modules/ec2"
  user =  var.user
  instance_name_master =  var.instance_name_master
  instance_name_worker =  var.instance_name_worker
  instance_type =  var.instance_type
  number =  var.number
  key_name = var.key_name
  security_groups = module.sg.security_groups_name
  az = var.az
}

module "sg" {
  source = "./modules/sg"
  security_groups =  var.security_groups
  ingress_rules = var.ingress_rules
}

module "ebs" {
  source = "./modules/ebs"
  az = var.az
 volume_size = var.volume_size
 number = var.number
}

module "eip" {
  source = "./modules/eip"
  number =  var.number
  name = var.name
}

resource "aws_eip_association" "master" {
  instance_id = module.ec2.ec2_instance_master_id
  allocation_id = module.eip.eip_master_id
}

resource "aws_eip_association" "worker" {
  instance_id = module.ec2.ec2_instance_worker_id
  allocation_id = module.eip.eip_worker_id
}

resource "aws_volume_attachment" "master" {
  
}

resource "aws_volume_attachment" "worker" {
  
}