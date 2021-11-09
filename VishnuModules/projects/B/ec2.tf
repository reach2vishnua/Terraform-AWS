module "myec2module" {
  source = "../../modules/ec2withvariable"
  instancetype = "t2.large"
}