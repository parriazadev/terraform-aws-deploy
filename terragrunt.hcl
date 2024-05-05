locals{
    repo_id ="terraform_aws"
}

terraform{
    extra_arguments "retry_lock"{
        commands = get_terraform_commands_that_need_lock()
        arguments = ["-lock-timeout=60m"]
    } 
}

generate "provider"{
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
locals{
    repo_id     = "terraform_aws"
    project     = "terraform_aws"
    region      = "us-east-1"
    owner       = "Pablo Arriaza"
    provider    = "aws"
}

provider "aws"{
    region = local.region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    default_tags = {
        "Owner" = local.owner
        "Project" = local.project
        "Repo" = local.repo_id
    }
}
EOF
}