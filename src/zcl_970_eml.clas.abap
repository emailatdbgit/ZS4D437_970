CLASS zcl_970_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    CONSTANTS c_agency_id TYPE /dmo/agency_id VALUE '70000'.
    CONSTANTS C_travel_id TYPE /dmo/travel_id VALUE '25737'.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_970_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    READ ENTITIES OF z970_r_travel
        ENTITY Travel
            ALL FIELDS WITH VALUE #( ( AgencyId = c_agency_id
                                       TravelId = c_travel_id
            ) )
            RESULT DATA(travels)
            FAILED DATA(failed).
    IF failed IS NOT INITIAL.
      out->write( 'Erro retrieving the travel' ).
    ELSE.
*     out->write( travels[ 1 ] ).
      MODIFY ENTITIES OF z970_r_travel
          ENTITY Travel
          UPDATE
          FIELDS ( Description )
           WITH VALUE #( ( agencyid = c_agency_id
                                travelid = c_travel_id
                                description = `My new Description` ) )
                                FAILED failed.
      IF failed IS INITIAL.
        COMMIT ENTITIES.
        IF sy-subrc = 0.
          out->write( 'Travel description was updated' ).
        ELSE.
          out->write( 'Error updating the travel description' ).
        ENDIF.
      ELSE.
        ROLLBACK ENTITIES.
        out->write( 'Error updating the travel description' ).
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
