# Bicep Sample
## Azure Resource
This includes of the following resources:
- Resource groups
- Virtual Networks

## SystemConfiguration
![SystemConfiguration](/img/SystemConfiguration.svg)

## Instructions
To get going with Bicep:
1. Start by [installing the tooling.](https://learn.microsoft.com/ja-jp/azure/azure-resource-manager/bicep/install)
2. Complete the [Bicep Learning Path.](https://learn.microsoft.com/ja-jp/training/paths/fundamentals-bicep/)
3. Update Parameters with your desired values.
4. Run the following command.

```cmd:Azure CLI
az login
az deployment sub create --location <Your location> --template-file main.bicep
```

## Notes
- The deployment was tested on windows.
