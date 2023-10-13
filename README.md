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
2. Github repository setup for tfc.
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