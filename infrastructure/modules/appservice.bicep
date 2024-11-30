param location string = resourceGroup().location
param appServicePlanName string 
param appName  string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  kind: 'linux'
  location: location
  name: appServicePlanName
  properties: {
    reserved:  true
  }
  sku: {
    name: 'B1'
  }
}

resource webApp 'Microsoft.Web/sites@2020-06-01' = {
  name: appName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|9.0'
    }
  }
}

resource webAppConfig 'Microsoft.Web/sites/config@2020-06-01' = {
  parent: webApp
  name: 'web'
  properties: {
    scmType: 'GitHub'
  }
}


output aappServiceId  string = webApp.id
