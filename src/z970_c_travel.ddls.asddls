@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Travel (Projection)'
@Metadata.allowExtensions: true
define root view entity Z970_C_TRAVEL
  provider contract transactional_query
  as projection on Z970_R_TRAVEL
{
  key AgencyId,
  key TravelId,
      @Search.defaultSearchElement: true
      Description,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [
      { entity: { name: '/DMO/I_Customer_StdVH',
      element: 'CustomerID' } } ]
      CustomerId,
      BeginDate,
      EndDate,
      @EndUserText.label: 'Duration (days)'
      Duration,
      Status,
      ChangedAt,
      ChangedBy,
      LocChangedAt
}
