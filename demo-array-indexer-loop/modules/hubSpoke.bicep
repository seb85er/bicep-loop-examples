param hub_name string
param location string
param hub_address_space array
param default_subnet string
param subnet_prefix string
param spoke_vnets object
param allowForwardedTraffic bool
param allowGatewayTransit bool
param allowVirtualNetworkAccess bool

resource hub_vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: hub_name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: hub_address_space
    }
    subnets: [
      {
        name: default_subnet
        properties: {
          addressPrefix: subnet_prefix
        }
      }
    ]
  }
}

resource spokes 'Microsoft.Network/virtualNetworks@2021-05-01' = [for vnet in items(spoke_vnets): {//loop through each item in spoke_vnets "items" function returns an array which is consistently ordered if you use the object "spoke_vnets" you receive Loop expected an expression of type "array" but the provided value is of type "object""
  name: vnet.value.name//the value of vnet name for the item you are looping over
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: vnet.value.address_space
    }
    subnets: [
      {
        name: vnet.value.subnet_name
        properties: {
          addressPrefix: vnet.value.subnet_prefix
        }
      }
    ]
  }
}]

resource spoke_to_hub_peering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-05-01' = [for (spoke, i) in items(spoke_vnets): {//for each spoke in spoke_vnets applying an array indexer
  name: '${spokes[i].name}-to-hub'// sourceing the spoke resource name by selecting the index element (0 or 1 in our case) and then concatenating it with "-to_hub"
  parent: hub_vnet
  properties: {
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransit
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    remoteVirtualNetwork: {
      id: spokes[i].id //the index element for the spoke resource name.
    }
  }
}]

resource hub_to_spoke_peering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-05-01' = [for (spoke, i) in items(spoke_vnets): {
  name: 'hub-to-${spokes[i].name}'
  parent: spokes[i]
  properties: {
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransit
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
    remoteVirtualNetwork: {
      id: hub_vnet.id
    }
  }
}]



output vnets array = [for (output, i) in items(spoke_vnets): {
  name: spokes[i].name
  resourceId: spokes[i].id
  addressPrefixes: spokes[i].properties.addressSpace.addressPrefixes
}]
