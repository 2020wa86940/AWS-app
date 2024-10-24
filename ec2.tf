module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"

  ami                  = data.aws_ami.amzlinux2.id
  instance_type        = var.instance_type
  

  user_data                   = file("${path.module}/app2-mod.sh")
  

  
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.security-group.security_group_id]

  
  associate_public_ip_address = true

  tags = {
    Name = "Appserver"
  }
}