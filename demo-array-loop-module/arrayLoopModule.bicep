// Scope
targetScope = 'subscription'

// reference specific array with parameter file
var ukResourceGroups = json(loadTextContent('params/resourceGroups.parameters.json')).ukResourceGroups //settting variable for the nested ukResourceGroups array
var usResourceGroups = json(loadTextContent('params/resourceGroups.parameters.json')).usResourceGroups //settting variable for the nested usResourceGroups array

// create uks resource groups
module uks './modules/resourceGroup/resourceGroup.bicep' = [for item in ukResourceGroups: {//for each object in ukResourceGroups
  scope:  subscription()
  name: item.name
  params: {
    name: item.name
    location: item.location
    tags: contains(item, 'tags') ? item.tags : {}
  }
}]

// create ukw resource groups
module us './modules/resourceGroup/resourceGroup.bicep' = [for item in usResourceGroups: {
  scope:  subscription()
  name: item.name
  params: {
    name: item.name
    location: item.location
    tags: contains(item, 'tags') ? item.tags : {}
  }
}]
