@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Item Data Definition Unmanaged save'
@Metadata.ignorePropagatedAnnotations: true
//@Search.searchable: true
@Metadata.allowExtensions: true
@AbapCatalog.extensibility: {
extensible: true,
allowNewDatasources: false,
dataSources: ['_Extension'],
elementSuffix: 'Z97'
}

define view entity Z970F_R_TRAVELITEM as select from z970_tritem
association to parent Z970F_R_TRAVEL as _Travel
 on $projection.AgencyId = _Travel.AgencyId
 and $projection.TravelId = _Travel.TravelId
association to Z970_E_TravelItem1 as _Extension
on $projection.ItemUuid = _Extension.ItemUuid
{
    key item_uuid as ItemUuid,
    agency_id as AgencyId,
    travel_id as TravelId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    booking_id as BookingId,
    passenger_first_name as PassengerFirstName,
    passenger_last_name as PassengerLastName,
    changed_at as ChangedAt,
    changed_by as ChangedBy,
    loc_changed_at as LocChangedAt,
    _Travel,
    _Extension
}
