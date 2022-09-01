## **Bicep keyvault lookup and reference index example**
#### Overview
 <font size="2">
In this example I will demonstrating looping through an array in the parameters file to create a resource group using a module. 
I will also be data sourcing a keyvault then referencing a secret within the keyvault for the name of the resource group.
The purpose of the example is to demonstrate using the keyvault getSecret function but also utlising an index loop to access the relevant keyvault and pass the secret value to the module.

- - - -

**Code Structure**
```
 demo-array-kv-lookup
 ├─ demo-array-kv-lookup.bicep
 ├─ demo-array-kv-lookup.md
 ├─ deployment.ps1
 ├─ modules
 │  └─ resourceGroup
 │     └─ resourceGroup.bicep
 └─ params
   └─ resourceGroups.parameters.json
```
**Deployment Guide**
**Prerequisites:**

- Azure powershell 5.6.0 or laters is installed. [Install instructions](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)
- An account and relevant access permissions to a subscription

**Deployment steps:**

- Clone this repo and change directory to this folder 'demo-array-kv-lookup'
- Update the resourceGroups.parameters.json file with your keyvault and resource group details
- Next update deployment.ps1 $SubscriptionId , $TenantId and $Location  variables to your environment details.
- now run the powershell .\deployment file

[Back to Homepage](../README.md)