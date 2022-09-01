// Scope
targetScope = 'subscription'

// reference specific array with parameter file
var ukResourceGroups = json(loadTextContent('params/resourceGroups.parameters.json')).ukResourceGroups //settting variable for the nested ukResourceGroups array

//loop through and datasource key vauilt
//ensure the keyvault "Azure Resource Manager for template deployment" is enable

resource kv 'Microsoft.KeyVault/vaults@2019-09-01' existing = [for item in ukResourceGroups: {
  name: item.kvName
  scope: resourceGroup(item.subscriptionId, item.kvResourceGroupName )
}]

// create uks resource groups
module uks './modules/resourceGroup/resourceGroup.bicep' = [for (item, i) in ukResourceGroups: {//for each object in ukResourceGroups
  scope:  subscription()
  name: item.deploymentName
  params: {
    name: kv[i].getSecret('rsgName')
    location: item.location
    tags: contains(item, 'tags') ? item.tags : {}
  }
}]


