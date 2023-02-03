targetScope = 'subscription'

// Parameters for common
param systemCode string = 'hawk'
param location string = 'japaneast'

// Parameters for resorce group
param resourceGroupName string = 'rg-${systemCode}'

// Parameters for virtual network
param vnetAddressPrefix string = '10.0.0.0/16'
param subnets object = {
  subnet1: {
    name: 'snet-frontend'
    subnetPrefix: '10.0.1.0/24'
  }
  subnet2: {
    name: 'snet-backend'
    subnetPrefix: '10.0.2.0/24'
  }
}

// deploy resource groups
resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

// deploy virtual network
module vnetModule 'modules/vnet.bicep' = {
  scope: rg
  name: 'Deploy_virtual_network'
  params: {
    location: location
    systemCode: systemCode
    vnetAddressPrefix: vnetAddressPrefix
    subnets: subnets
  }
}
