## **Bicep array loop on a module**
#### Overview
 <font size="2">
In this example I will be demonstrating looping through an array in the parameters file to create a resource group using a module. 

- - - -

**Code Structure**
```
demo-array-loop-module
├─ arrayLoopModule.bicep
├─ deployment.ps1
├─ modules
│  └─ resourceGroup
│     └─ resourceGroup.bicep
├─ params
│  └─ resourceGroups.parameters.json
└─ README.md
**Deployment Guide**
**Prerequisites:**

- Azure powershell 5.6.0 or laters is installed. [Install instructions](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)
- An account and relevant access permissions to a subscription

**Deployment steps:**

- Clone this repo and change directory to this folder 'resourceGroups.parameters.json'
- Update the resourceGroups.parameters.json file with your keyvault and resource group details
- Next update deployment.ps1 $SubscriptionId , $TenantId and $Location  variables to your environment details.
- now run the powershell .\deployment.ps1 file

[Home](../README.md)