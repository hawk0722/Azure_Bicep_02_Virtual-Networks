@description('System code')
param systemCode string

@description('VNet name')
param vnetName string = 'vnet-${systemCode}'

@description('Virtual network address prefix')
param vnetAddressPrefix string

@description('Subnet address prefix')
param subnets object

@description('Location for all resources.')
param location string

resource vnet 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [for subnet in items(subnets): {
      name: subnet.value.name
      properties: {
        addressPrefix: subnet.value.subnetPrefix
      }
    }]
  }
}
