@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Travel Data Model'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z970E_R_TRAVEL as select from Z970_TRAVEL
composition [0..*] of z970E_R_Travelitem as _TravelItem
{
    key agency_id as AgencyId,
    key travel_id as TravelId,
    description as Description,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
          @EndUserText.label: 'Duration (days)'
        dats_days_between( begin_date, end_date ) as Duration,
    status as Status,
     @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt,
     @Semantics.user.lastChangedBy: true
    changed_by as ChangedBy,
     @Semantics.systemDateTime.localInstanceLastChangedAt: true
    loc_changed_at as LocChangedAt,
    
    _TravelItem
 
}
