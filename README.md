
# Terraform Beginner Bootcamp 2023

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

