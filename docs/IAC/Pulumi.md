---
tags:
  - GCP
---
Installing:
```bash
brew install pulumi/tap/pulumi
pip install pulumi
```

## GCP

### Set project

Set project:

```bash
gcloud config set project <YOUR_GCP_PROJECT_ID
gcloud auth application-default login

# check the project
gcloud config get-value project 

# if you want use another backend state, for example gcp
pulumi login gs://[your-gs-bucket]

```

- `Pulumi.yaml` defines the [project](https://www.pulumi.com/docs/concepts/projects/).
- `Pulumi.dev.yaml` contains [configuration](https://www.pulumi.com/docs/concepts/config/) values for the [stack](https://www.pulumi.com/docs/concepts/stack/) you initialized.
- `__main__.py` is the Pulumi program that defines your stack resources.

### Deploy stack

```bash
pulumi up
```
This command evaluates your program and determines the resource updates to make. First, a preview is shown that outlines the changes that will be made when you run the update