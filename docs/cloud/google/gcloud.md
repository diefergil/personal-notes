---
tags:
  - gcloud
  - GCP
  - resource
Area: "[[Google cloud]]"
---
| Command                                                      | Description                                                                           |
| ------------------------------------------------------------ | ------------------------------------------------------------------------------------- |
| `gcloud auth login`                                          | Authorizes the gcloud CLI to access your Google Cloud account using your credentials. |
| `gcloud auth application-default login`                      | Authenticates the CLI for application default credentials.                            |
| `gcloud auth list`                                           | Lists the accounts available for gcloud to use.                                       |
| `gcloud auth activate-service-account --key-file=<KEY_FILE>` | Activates a service account using a key file.                                         |
| `gcloud config set project <PROJECT_ID>`                     | Sets the active project for your gcloud commands.                                     |
| `gcloud config list`                                         | Lists the current active project and configurations.                                  |
| `gcloud config configurations activate <CONFIG_NAME>`        | Activates a specific named configuration.                                             |
| `gcloud config set account <ACCOUNT_EMAIL>`                  | Sets the active account for gcloud commands.                                          |
| `gcloud projects list`                                       | Lists all available projects under your account.                                      |
| `gcloud projects create <PROJECT_ID>`                        | Creates a new project.                                                                |
| `gcloud projects delete <PROJECT_ID>`                        | Deletes an existing project.                                                          |
| `gcloud services list --enabled`                             | Lists all APIs and services currently enabled in the active project.                  |
| `gcloud services enable <SERVICE_NAME>`                      | Enables a specific API or service for the active project.                             |
| `gcloud services disable <SERVICE_NAME>`                     | Disables a specific API or service for the active project.                            |
| `gcloud artifacts repositories list`                         | Lists the repositories in Artifact Registry.                                          |
| `gcloud artifacts repositories create <REPO_NAME>`           | Creates a new repository in Artifact Registry.                                        |
| `gcloud artifacts repositories delete <REPO_NAME>`           | Deletes a repository from Artifact Registry.                                          |
| `gcloud config set artifacts/location <LOCATION>`            | Sets the location of the Artifact Registry repository.                                |
|                                                              |                                                                                       |
