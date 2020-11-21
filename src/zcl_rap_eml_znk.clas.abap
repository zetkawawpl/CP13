CLASS zcl_rap_eml_znk DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAP_EML_ZNK IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Step 1 - READ
*    READ ENTITIES OF zi_rap_travel_znk
*        ENTITY Travel
*            FROM VALUE #( ( TravelUUID = '38E818D08BB6924D170009027659A94B' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

    " Step 2 - READ with fields
*    READ ENTITIES OF zi_rap_travel_znk
*        ENTITY Travel
*            FIELDS ( AgencyID CustomerID )
*            WITH VALUE #( ( TravelUUID = '38E818D08BB6924D170009027659A94B' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

    " Step 3 - READ with ALL fields
*    READ ENTITIES OF zi_rap_travel_znk
*        ENTITY Travel
*            ALL FIELDS
*            WITH VALUE #( ( TravelUUID = '38E818D08BB6924D170009027659A94B' ) )
*        RESULT DATA(travels).
*
*    out->write( travels ).

    " Step 4 - READ by association
*    READ ENTITIES OF zi_rap_travel_znk
*        ENTITY Travel BY \_Booking
*            ALL FIELDS
*            WITH VALUE #( ( TravelUUID = '38E818D08BB6924D170009027659A94B' ) )
*        RESULT DATA(bookings).
*
*    out->write( bookings ).

    " Step 5 - Unsuccessful READ
*    READ ENTITIES OF zi_rap_travel_znk
*        ENTITY Travel
*            ALL FIELDS
*            WITH VALUE #( ( TravelUUID = '38E818D08BB6924D170009027659AFFF' ) )
*        RESULT DATA(travels)
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).
*    out->write( reported ).

    " Step 6 MODIFY Update
*    MODIFY ENTITIES OF zi_rap_travel_znk
*        ENTITY Travel
*            UPDATE
*                SET FIELDS WITH VALUE
*                    #( ( TravelUUID = '38E818D08BB6924D170009027659A94B'
*                         Description = 'I like RAP@openSAP' ) )
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    out->write( 'Update done...' ).
*
*    COMMIT ENTITIES
*        RESPONSE OF zi_rap_travel_znk
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).

    " Step 7 MODIFY Create
*    MODIFY ENTITIES OF zi_rap_travel_znk
*        ENTITY Travel
*            CREATE
*                SET FIELDS WITH VALUE
*                    #( ( %cid = 'MyContentID_1'
*                         AgencyID = '70012'
*                         CustomerID = '14'
*                         BeginDate = cl_abap_context_info=>get_system_date( )
*                         EndDate = cl_abap_context_info=>get_system_date( ) + 10
*                         Description = 'I like RAP@openSAP' ) )
*        MAPPED DATA(mapped)
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*        RESPONSE OF zi_rap_travel_znk
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).
*
*    out->write( 'Create done...' ).
*
**    READ ENTITIES OF zi_rap_travel_znk
**        ENTITY Travel
**            ALL FIELDS
**            WITH VALUE #( ( TravelUUID = mapped-travel[ %cid = 'MyContentID_1' ]-TravelUUID ) )
**        RESULT DATA(travels).
**
**    out->write( travels ).

    " Step 8 MODIFY Delete
*    MODIFY ENTITIES OF zi_rap_travel_znk
*        ENTITY Travel
*            DELETE FROM
*                VALUE #( ( TravelUUID = '024DEF08E9B61EDB88A0C298049719A1' ) )
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    COMMIT ENTITIES
*        RESPONSE OF zi_rap_travel_znk
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).
*
*    out->write( 'Delete done...' ).

  ENDMETHOD.
ENDCLASS.
