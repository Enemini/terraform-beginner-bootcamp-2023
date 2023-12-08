
# Terraform Beginner Bootcamp 2023

## Table of Contents

- [Semantic Versioning](#Semantic-Versioning)
- [Install Terraform CLI](#Install-Terraform-CLI)
- [Considerations with the Terraform CLI Changes](#Considerations-with-the-Terraform-CLI-Changes)

## Semantic Versioning
This project is going to utilize smantic versioning for its tagging. 
[semver.org](https://semver.org)

### Summary
 When you are making changes to your code, it is important to ensure that the changes are being tagged and versioned properly and one way to do so is to understand the use of semantics apropriately, hence we will review some of the features below:


- **MAJOR** version when you make incompatible API changes, eg `1.0.1`.
- **MINOR** version when you add functionality in a backward compatible manner.
- **PATCH** version when you make backward compatible bug fixes


Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

### Introduction
In the world of software management there exists a dreaded place called “dependency hell.” The bigger your system grows and the more packages you integrate into your software, the more likely you are to find yourself, one day, in this pit of despair.

As usual, do not depend only on the content of this document as google [google.com] (https://www.google.com) id always a friend on further research.

## Install Terraform CLI


### Considerations with the terraform CLI changes

The terraform CLI installation instructions have changed due ti gpg keyring changes. So, we needed to refer to the latest install CLI instructions through Terraform Documentation and change the scripting for install.

[terraform install](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Consideration for Linux Distribution

This project was built with Ubuntu, so might need to ensure the type of linux distro you use when implementing this project.

####
[How to check OS version in linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)
Example of checking os version
```sh
$cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
### Shebang
 A shebang tells the bash script what interpreter that will interpret the script. eg. #!/bin/bash
 
 chatGPT recommended this format for bash: '#!/usr/bin/env bash'

 - for portability for different OS distributions
 - will search the user's PATHfor the bash executable

 https://en.wikipedia.org/wiki/Shebang_(Unix)

 ### Execution Consideratios

 When executing the bash scrip, we can use the './' shorthand notation to execute the bash script.

 eg. './bin/install_terraform_cli'

 If we are using a script in .gitpod.yml we need the script to program to interpret it.

 eg 'source ./bin/install_terraform_CLI


 ### Linux Permissions

 In order to make our bash scripts executable, we need to change linux permission to be executable at the user mode.

```sh
 chmod u+x ./bin/install_terraform_CLI

```
alternatively:

```sh
chmod 744 ./bin/install_terraform_CLI

```
https://en.wikipedia.org/wiki/chmod

### Github Lifecycle (Before, init, comand)

We need to be careful when using init because it will not rerun when restarting an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks

### Refactoring into Bash Scripts

While fixing the Teraform CLI gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So, we decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_CLI(./bin/install_terraform_CLI)]

- This will keep the Gitpod Task File ([gitpod.yml](gitpod.yml)) tidy.
- This allow us an easier to debug and execute manually Terraform CLI install
- This wil allow better portability for other projects that need to install Terraform CLI.

 
 ### Working with Env Vars

 #### env command

 * We can list out all Environment Variables(Env Vars) using the `env` command.
 ** We can filter specific env vars using grep e.g: `env | grep AWS_`

 #### Setting and Unsetting Env Vars

 In the terminal, we can set an env var using `export HELLO = 'World'`
 We can unset using `unset HELLO`

 Env var can be set temporarily when just running a command
 ```sh
 HELLO = 'World' ./bin/print_message
 ```

 Within a bash script, env var can be set without writing "export" eg:
 ```sh
 #!/usr/bin/env bash
 HELLO = 'World'
    echo $HELLO
 ```

 ### Pinting Vars
 We can print an env var using echo eg:
 `echo $HELLO`

 #### Scoping of Env Vars
 When you open up a new bash terminal in vscode it will not be aware of env vars that have been set in another window

 If you want Env Vars to persist above all future bash terminal, that are opened you need to set env vars in your bash profile e.g: `bash_profile`


 #### Persisting Env Vars in Gitpod
 This can be done by storing them in gitpod secrets storage

 ```sh
 gp env HELLO = 'World'
 ``` 
 All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.
 
You can also set the env vars `.gitpod.yml` but that should only contain one sensitive env vars


#### AWS CLI Installation

AWS CLI is installed for the project through the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting-started install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our aws credentials is configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```

If this is successful, you should see a json payload that looks like this: 
```json
{
    "UserId": "AIDPS8NILCGCLXY1WNX3Y",
    "Account": "198758415444",
    "Arn": "arn:aws:iam::198458413444:user/terraform-beginner-bootcamp-user"
}
```
We will need to generate AWS CLI credentials from IAM user in order to use the AWS CLI


### Terraform Basics

####Terraform Registry
Terraform sources their providers and modules for the Terraform registry which is located at [registry.terraform.io](https:registry.terraform.io)

**Providers** is an interface to APIs that will allow to create resources in terraform.
**Modules** are a way to make large amount of terraform code modular, portable and sharable.

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)

#### Terraform Console
We can see a list of all the Terraformcommands by simply typing `terraform`

#### Terraform Init
At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we will use in this project.

#### Terraform Plan
`terraform plan`
This will generate out a changeset about the state of our infrastructure and what will be changed.
We can output this changeset i.e "plan" to be passed to an applybut often you can just ignore outputing.

#### Terraform Apply
`terraform apply`
This will run a plan and pass the changes to be executed by terraform. Apply should prompt a yes or no. 
If we want to automatically approve an apply, we provide the auto approve flag e.g:     `terraform apply --auto-approve`

#### Terraform Destroy
`terraform destroy`
This will destroy/delete/tear-down infrastructure resources that was previously created using terraform.

The auto-approve can also be used to skim through the approve prompt e.g: `terraform destroy --auto-approve`

#### Terraform Lock Files
`.terraform.lock.hcl` contains the locked versioning for the providers or modules that should be used with this project.
The terraform lock file **should be committed** to your version control system e.g: Github

#### Terraform State Files
`.terraform.tfstate` contain information about the current state of your infrastructure.
The file **should not be committed** to your version control system.
This file can contain sensitive data. If you lose this file, you lose knowing the state of your infrastructure.

`.terraformtfstate.backup` is the previous state file state.

## Issues with Terraform Cloud and Gitpod Workspace

When attempting to run `terraform login` it will launch bash a wiswig view to generate a token. However it does not work expected in Gitpod VSCode in the browser.

The workaround is manually generate a token in Terraform Cloud

```
https://app.terraform.io/app/settings/tokens?source=terraform-login
```
Then create the file manually here:

```sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json

open /home/gitpod/.terraform.d/credentials.tfrc.json

```
Provide the following code (replace your token in the file):

```json
{
    "credentials": {
        "app.terraform.io": {
            "token": "Your-Terraform-Cloud-Token"
        }
    }
}

```
Then open the  file

## Root Module Structure

Our root module structure is as follows:

- PROJECT_ROOT
    - variable.tf #Stores the structure of input variables
    - main.tf #Everything else
    - outputs.tf #Defined required providers and their configuration
    - providers.tf #Stores our outputs
    - terraform.tfvars #The dataof variables we want to load into our terraform project
    - REAADME.md - #Required for root module

[Standard Structured Module](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

