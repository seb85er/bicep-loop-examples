param hub_name string
param hub_address_space array
param default_subnet string
param subnet_prefix string
param spoke_vnets object
param allowForwardedTraffic bool
param allowGatewayTransit bool
param allowVirtualNetworkAccess bool

//schema generated using https://www.liquid-technologies.com/online-json-to-schema-converter

module hub_spoke './modules/hubSpoke.bicep' = {
  name: 'hub_and_spoke'
  params: {
    hub_name: hub_name
    location: resourceGroup().location
    hub_address_space: hub_address_space
    default_subnet: default_subnet
    subnet_prefix: subnet_prefix
    spoke_vnets: spoke_vnets
    allowForwardedTraffic: allowForwardedTraffic
    allowGatewayTransit: allowGatewayTransit
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
  }
}
