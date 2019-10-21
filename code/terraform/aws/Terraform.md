Common commands:
    apply              Builds or changes infrastructure
    console            Interactive console for Terraform interpolations
    destroy            Destroy Terraform-managed infrastructure
    env                Workspace management
    fmt                Rewrites config files to canonical format
    get                Download and install modules for the configuration
    graph              Create a visual graph of Terraform resources
    import             Import existing infrastructure into Terraform
    init               Initialize a Terraform working directory
    output             Read an output from a state file
    plan               Generate and show an execution plan
    providers          Prints a tree of the providers used in the configuration
    refresh            Update local state file against real resources
    show               Inspect Terraform state or plan
    taint              Manually mark a resource for recreation
    untaint            Manually unmark a resource as tainted
    validate           Validates the Terraform files
    version            Prints the Terraform version
    workspace          Workspace management

All other commands:
    0.12upgrade        Rewrites pre-0.12 module source code for v0.12
    debug              Debug output management (experimental)
    force-unlock       Manually unlock the terraform state
    push               Obsolete command for Terraform Enterprise legacy (v1)
    state              Advanced state management

https://docs.aws.amazon.com/cli/latest/userguide/install-macos.html
https://cloud-images.ubuntu.com/locator/ec2/

    https://medium.com/@dwdraju/dive-into-aws-with-terraform-e73652206192
```
$ unzip terraform_0.11.7_linux_amd64.zip
$ mv terraform /usr/local/bin
$ terraform -v
$ touch ~/.aws/credentials

[default]
aws_access_key_id = Access key ID
aws_secret_access_key = Secret access key

$ aws configure

$ terraform apply -auto-approve
4 terraform destroy -auto-approve
```