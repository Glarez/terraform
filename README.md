![gh_logo](images\github-tf-logos.png)

# Terraform cicd using Github Actions and Terraform cloud (TFC).

![workflow](images\workflow.png)

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

- TFC setup.
- Github repository setup for tfc.
- Actions workflow.
- Creating and merging pull requests for demo.
- Verify the provisioned resources.
___

