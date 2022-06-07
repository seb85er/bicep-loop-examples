targetScope = 'subscription'

 param resourceGroups array = [
  {
    name: 'rg-001'
    tags: {
      tagName1: 'tagValue1'
      tagName2: 'tagValue2'
    }
    location: 'uksouth'
  }
  {
    name: 'rg-002'
    tags: {
      tagName1: 'tagValue1'
      tagName2: 'tagValue2'
    }
    location: 'uksouth'
  }
]

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = [ for resourceGroup in resourceGroups : {
  name: resourceGroup.name
  location:resourceGroup.location
}]
