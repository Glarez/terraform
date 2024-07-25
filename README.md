<img src="images\github-tf-logos.png" alt="gh_logo"/>

# Terraform cicd using Github Actions and Terraform cloud (TFC).

<img src="images\workflow.png" alt="image"/>

After a PR or a push to master branch in github happens, the git hub workflow generates a terraform run in TFC workspace to deploy resources y the defined AWS account.

## Steps

- Check wheter the configuration is formatted properly.
- Generate a plan for every pull request.
- Apply the configuration when you update the main branch.
- Test the workflow by creating and mergind pull request.

The resources generated in the demo would be a single nginx webserver using an ec2 instance.


## Requisites:

- Github account.
- TFC account.
- Aws account with access credentials.

___
## Objectives

1. TFC setup.
2. Github repository setup for TFC.
3. Actions workflow.
4. Creating and merging pull requests for demo.
5. Verify the provisioned resources.
___

## TFC setup

Go to https://app.terraform.io

1. Create a TFC Organization and Workspace.
2. Add environment variables.
3. Create an API token.
4. Save the token for Github config part.


### 1. Create a TFC Organization and Workspace.

<img src="images\TFCOrganizationWorkspace.png" alt="image"/>

### Name your Organization.
<img src="images\TFCOrganizationWorkspace2.png" alt="image"/>

### Go for api driven workflow.
<img src="images\TFCOrganizationWorkspace3.png" alt="image"/>

### Now we have our backend configuration to manage resources in our organization.

        terraform {
        cloud {
            organization = "Zapalaver"

            workspaces {
            name = "zapalaver-dev"
            }
          }
        }

<img src="images\TFCOrganizationWorkspace4.png" alt="image"/>

### 2. Add environment variables.

#### Add your aws credentials in your workspace.

<img src="images\AddEnvironmentVariables.png" alt="image"/>

### 3. Create an API token.

#### Under your user pic, go to your setting for generating the token to be configured in github later.

<img src="images\TFCApiToken.png" alt="image"/>
<img src="images\TFCApiToken2.png" alt="image"/>
<img src="images\TFCApiToken3.png" alt="image"/>

#### Remember to save the token as you will need it when configuring github to comunicate with TFC.

<img src="images\TFCApiToken4.png" alt="image"/>

## Github repository setup for TFC.

1. Fork this repo.
2. Create a new secret named TF_API_TOKEN.
3. Use TFC API token that you created in step 3. 

### 1. Fork this repo.

#### If you want to make use of mi TF code, just fork the repo but, if you want to write your own, go ahead and mind the backend configuration that you'll need to modify later.

### 2. Create a new secret named TF_API_TOKEN

<img src="images\githubConfig.png" alt="image"/>

### 3. Use TFC API token that you created in step 3.

#### . Create a workflow for terraform deploy:

`.github/workflow/terraform.yml`

## Using the workflow

1. Create a new branch called update-tfc-backend.
2. Update the providers.tf file.
3. Add, commit and push your changes.
4. Review and merge the pull request.

### 1. Create a new branch called update-tfc-backend.

`git switch -C update-tfc-backend`

### 2. Update the providers.tf file.

Make use of the block:

    backend "remote" {
        organization = "Zapalaver"

        workspaces {
          name = "zapalaver-dev"
        }
      }

your providers.tf would be like:

    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "3.26.0"
        }
        random = {
          source  = "hashicorp/random"
          version = "3.0.1"
        }
      }
      required_version = "~> 1.0"

      backend "remote" {
        organization = "Zapalaver"

        workspaces {
          name = "zapalaver-dev"
        }
      }
    }


    provider "aws" {
      region = "us-east-1"
    }


### 3. Add, commit and push your changes.

`git add --all && git commit -m "enabled TFC backend" && git push`

### 4. 4. Review and merge the pull request.

<img src="images\merge1.png" alt="image"/>

A run will start triggering the plan and deploy on TFC 

<img src="images\merge2.png" alt="image"/>


### Check and destroy resources for cleaning TFC.

<img src="images\check_ and_destroy1.png" alt="image"/>

#### Grab the putput and use curl or a browser to chek the instance is ok.

<img src="images\check_ and_destroy2.png" alt="image"/>

#### Queue a destroy plan from TFC to delete resources and clean the remote state

<img src="images\check_ and_destroy3.png" alt="image"/>

<img src="images\check_ and_destroy4.png" alt="image"/>

