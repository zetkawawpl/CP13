CLASS zcm_rap_znk DEFINITION INHERITING FROM cx_static_check
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_t100_dyn_msg,
      if_t100_message,
      if_abap_behv_message.

    CONSTANTS:
      BEGIN OF date_interval,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_ZNK',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'BEGINDATE',
        attr2 TYPE scx_attrname VALUE 'ENDDATE',
        attr3 TYPE scx_attrname VALUE 'TRAVELID',
        attr4 TYPE scx_attrname VALUE '',
      END OF date_interval .
    CONSTANTS:
      BEGIN OF begin_date_before_system_date,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_ZNK',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'BEGINDATE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF begin_date_before_system_date .
    CONSTANTS:
      BEGIN OF customer_unknown,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_ZNK',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'CUSTOMERID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF customer_unknown .
    CONSTANTS:
      BEGIN OF agency_unknown,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_ZNK',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'AGENCYID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF agency_unknown .
    CONSTANTS:
      BEGIN OF unauthorized,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_ZNK',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF unauthorized .

    METHODS:
      constructor
        IMPORTING
          severity   TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
          textid     LIKE if_t100_message=>t100key OPTIONAL
          previous   TYPE REF TO cx_root OPTIONAL
          begindate  TYPE /dmo/begin_date OPTIONAL
          enddate    TYPE /dmo/end_date OPTIONAL
          travelid   TYPE /dmo/travel_id OPTIONAL
          customerid TYPE /dmo/customer_id OPTIONAL
          agencyid   TYPE /dmo/agency_id  OPTIONAL.

    DATA:
      begindate  TYPE /dmo/begin_date READ-ONLY,
      enddate    TYPE /dmo/end_date READ-ONLY,
      travelid   TYPE string READ-ONLY,
      customerid TYPE string READ-ONLY,
      agencyid   TYPE string READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCM_RAP_ZNK IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( previous = previous ).

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->begindate = begindate.
    me->enddate = enddate.
    me->travelid = |{ travelid ALPHA = OUT }|.
    me->customerid = |{ customerid ALPHA = OUT }|.
    me->agencyid = |{ agencyid ALPHA = OUT }|.

  ENDMETHOD.
ENDCLASS.
