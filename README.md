# url-shortener
Let's Build it: Url Shortener

## Infrastructure as Code

### Download Azure CLI
https://learn.microsoft.com/en-us/cli/azure

### Log into Azure
```bash
az login
```

### Create Resource Group
```bash
az group create --name url-shortener-dev --location westus
```

### Create User for GH Actions
```bash
az ad sp create-for-rbac --name "GitHub-Actions-SP"\
    --role contributor \
    --scopes /subscriptions/30d73681-a5d0-47ac-9089-d92eb447f20f \
    --sdk-auth
    ```

### Configure a federated identity credential on an application
```bash
