## **Bicep array indexer loop in a module example**
#### Overview
 <font size="2">
In this example I will be demonstrating creating an array of spoke vnets and 1 hub vnet and then looping through those spokes and connecting it to the hub.

- - - -

**Code Structure**
```
demo-array-indexer-loop
├─ deployment.ps1
├─ main.bicep
├─ modules
│  └─ hubSpoke.bicep
├─ params
│  ├─ parameters.json
│  └─ schema.json
└─ README.md
```
**Deployment Guide**
**Prerequisites:**

- Azure powershell 5.6.0 or laters is installed. [Install instructions](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)
- An account and relevant access permissions to a subscription

**Deployment steps:**

- Clone this repo and change directory to this folder 'demo-array-indexer-loop'
- Update the resourceGroups.parameters.json file with your vnet details
- Next update deployment.ps1 $SubscriptionId , $TenantId, $ResourceGroupName and $Location  variables to your environment details.
- now run the powershell .\deployment file

[Home](../README.md)