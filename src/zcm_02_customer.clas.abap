CLASS zcm_02_customer DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cm_frw
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CONSTANTS:
      BEGIN OF co_increase_successful,
        msgid TYPE symsgid VALUE 'Z02CUSTOMER',
        msgno TYPE symsgno VALUE '000',
        attr1 TYPE scx_attrname VALUE 'DISCOUNT',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF co_increase_successful.
    CONSTANTS:
      BEGIN OF co_decrease_successful,
        msgid TYPE symsgid VALUE 'Z02CUSTOMER',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'DISCOUNT',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF co_decrease_successful.
    CONSTANTS:
      BEGIN OF co_increase_unsuccessful,
        msgid TYPE symsgid VALUE 'Z02CUSTOMER',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'DISCOUNT',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF co_increase_unsuccessful.
    CONSTANTS:
      BEGIN OF co_decrease_unsuccessful,
        msgid TYPE symsgid VALUE 'Z02CUSTOMER',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'DISCOUNT',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF co_decrease_unsuccessful.
    CONSTANTS:
      BEGIN OF co_negative_discount,
        msgid TYPE symsgid VALUE 'Z02CUSTOMER',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'attr1',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF co_negative_discount.

    DATA discount TYPE s_discount.

    METHODS constructor
      IMPORTING
        !textid                  LIKE if_t100_message=>t100key OPTIONAL
        !previous                LIKE previous OPTIONAL
        !severity                TYPE ty_message_severity OPTIONAL
        !symptom                 TYPE ty_message_symptom OPTIONAL
        !lifetime                TYPE ty_message_lifetime DEFAULT co_lifetime_transition
        !ms_origin_location      TYPE /bobf/s_frw_location OPTIONAL
        !mt_environment_location TYPE /bobf/t_frw_location OPTIONAL
        !mv_act_key              TYPE /bobf/act_key OPTIONAL
        !mv_assoc_key            TYPE /bobf/obm_assoc_key OPTIONAL
        !mv_bopf_location        TYPE /bobf/conf_key OPTIONAL
        !mv_det_key              TYPE /bobf/det_key OPTIONAL
        !mv_query_key            TYPE /bobf/obm_query_key OPTIONAL
        !mv_val_key              TYPE /bobf/val_key OPTIONAL
        i_discount               TYPE s_discount OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_02_customer IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous                = previous
        severity                = severity
        symptom                 = symptom
        lifetime                = lifetime
        ms_origin_location      = ms_origin_location
        mt_environment_location = mt_environment_location
        mv_act_key              = mv_act_key
        mv_assoc_key            = mv_assoc_key
        mv_bopf_location        = mv_bopf_location
        mv_det_key              = mv_det_key
        mv_query_key            = mv_query_key
        mv_val_key              = mv_val_key.
    CLEAR me->textid.
    discount = i_discount.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
