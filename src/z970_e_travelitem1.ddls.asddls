@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extension Include for Travel Items'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.extensibility: {
extensible: true,
allowNewDatasources: false,
dataSources: ['Item'],
elementSuffix: 'Z97'
}
define view entity Z970_E_TravelItem1 as select from z970_tritem as Item
{
    key item_uuid as ItemUuid
  
}
