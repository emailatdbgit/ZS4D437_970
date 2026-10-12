@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AbapCatalog.extensibility: {
extensible: true,
allowNewDatasources: false,
dataSources: ['Item'],
elementSuffix: 'Z97'
}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Item Projection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z970F_C_TRAVELITEM as projection on Z970F_R_TRAVELITEM as item
{
    key ItemUuid,
    AgencyId,
    TravelId,
       @Consumption.valueHelpDefinition:
                 [ { entity: { name:    '/DMO/I_Carrier_StdVH',
                               element: 'AirlineID'
                             }
                   }
                 ]
    CarrierId,
    @Consumption.valueHelpDefinition:
                   [ { entity: { name:    '/DMO/I_Connection_StdVH',
                                 element: 'ConnectionID'
                               },
                       additionalBinding:
                            [ { localElement: 'CarrierId',
                                     element: 'AirlineID',
                                       usage: #FILTER_AND_RESULT
                              }
                            ],
                       label: 'Value Help by Connection'
                     },
                     { entity: { name:    '/DMO/I_Flight_StdVH',
                                 element: 'ConnectionID'
                               },
                       additionalBinding:
                            [ { localElement: 'CarrierId',
                                element:      'AirlineID',
                                usage:        #FILTER_AND_RESULT
                              },
                              { localElement: 'FlightDate',
                                element:      'FlightDate',
                                usage:         #RESULT
                             }
                           ],
                       label: 'Value Help by Flight',
                       qualifier: 'Secondary Value help'
                     }
                   ]
    ConnectionId,
        @Consumption.valueHelpDefinition:
              [ { entity: { name:    '/DMO/I_Flight_StdVH',
                            element: 'FlightDate'
                          },
                  additionalBinding:
                       [ { localElement: 'CarrierId',
                           element:      'AirlineID',
                           usage:         #FILTER_AND_RESULT
                         },
                         { localElement: 'ConnectionId',
                           element:      'ConnectionID',
                           usage:        #RESULT
                         }
                       ]
                }
              ]
    FlightDate,
    BookingId,
    PassengerFirstName,
    PassengerLastName,
    ChangedAt,
    ChangedBy,
    LocChangedAt,
    /* Associations */
    _Travel :redirected to parent Z970F_C_TRAVEL
}
