# How to use Terraform workspaces for multi-stage environment

Create two workspaces `dev` and ` prod` under current directory using following commands:

```
terraform workspace new dev
terraform workspace new prod
```

Switch to `dev` workspace using this command:

`terraform workspace select dev`

Now your current workspace is `dev`

`main.tf` should be at present at the top level:

Sample tree:

```
|___main.tf
└───terraform.tfstate.d
    ├───dev
    └───prod
```

Run below command to apply terraform configuration for `dev` from the directory where `main.tf` is located.

`terraform apply`

If you want to run `terraform apply` for `prod`, then first switch to `prod` using `terraform workspace select prod` command. Then run `terraform apply`
