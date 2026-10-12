@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity Z970F_C_TRAVEL 
provider contract transactional_query
as projection on Z970F_R_TRAVEL
{
    key AgencyId,
    key TravelId,
    @Search.defaultSearchElement: true
    Description,
     @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition:
         [ { entity:
                { name: '/DMO/I_Customer_StdVH',
                  element: 'CustomerID'
                }
             }
         ]
    CustomerId,
    BeginDate,
    EndDate,
    Duration,
    Status,
    ChangedAt,
    ChangedBy,
    LocChangedAt,
    /* Associations */
    _TravelItem :redirected to composition child Z970F_C_TRAVELITEM 
}
