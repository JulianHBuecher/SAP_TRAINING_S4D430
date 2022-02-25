CLASS zcl_02_a_decrease_discount DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_action~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_a_decrease_discount IMPLEMENTATION.


  METHOD /bobf/if_frw_action~execute.
    DATA customers TYPE zti02_customertp.
    DATA message TYPE REF TO zcm_02_customer.

    " Daten lesen
    io_read->retrieve(
      EXPORTING
        iv_node       = is_ctx-node_key
        it_key        = it_key
      IMPORTING
        eo_message    = eo_message
        et_data       = customers
        et_failed_key = et_failed_key ).

    " Nachrichten-Container erstellen
    IF eo_message IS NOT BOUND.
      eo_message = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.

    " Daten sequentiell durchlaufen
    LOOP AT customers REFERENCE INTO DATA(customer).
      IF customer->discount > 4.
        " Ist der Discount kleiner als 5 (inklusive)...
        customer->discount -= 5.
      ELSE.
        " Ist der Discount kleiner 5 (exklusiv)...
        customer->discount = 0.
        " Error Nachricht erzeugen
        message = NEW zcm_02_customer(
          textid   = zcm_02_customer=>co_decrease_unsuccessful
          severity = zcm_02_customer=>co_severity_error
        ).
        et_failed_key = VALUE #( BASE et_failed_key ( key = customer->key ) ).

        eo_message->add_cm( message ).
        CONTINUE.
      ENDIF.

      " Nachricht erzeugen
      message = NEW zcm_02_customer(
        textid     = zcm_02_customer=>co_decrease_successful
        severity   = zcm_02_customer=>co_severity_info
        i_discount = customer->discount ).
      eo_message->add_cm( message ).

      " Daten zurückschreiben
      io_modify->update(
        EXPORTING
          iv_node = is_ctx-node_key
          iv_key  = customer->key
          is_data = customer ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
