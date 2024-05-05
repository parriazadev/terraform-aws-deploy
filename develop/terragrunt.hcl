include {
    path = find_in_parent_folders()
}
terraform {
  source = "https://github.com/parriazadev/terraform_aws.git//terraform-aws-infra?ref=develop"
  extra_arguments "retry_lock" {
    commands = get_terraform_commands_that_need_lock()
    arguments = ["-lock-timeout=60m"]
  }

inputs = {
  project = "terraform_aws"
  component_id = "ta"
  namespace = "parriazadev"
  region = "us-east-1"
  owner