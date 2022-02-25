CLASS zcl_i_d_generate_id DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_d_supercl_simple
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS /bobf/if_frw_determination~execute
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_i_d_generate_id IMPLEMENTATION.


  METHOD /bobf/if_frw_determination~execute.
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
      SELECT SINGLE FROM scustom
       FIELDS *
       WHERE id = ( SELECT MAX( id ) FROM scustom )
       INTO @DATA(max_id_entry).

*      customer->id = max_id_entry-id + 1.
      customer->id = customer->postcode.

      " Daten zurückschreiben
      io_modify->update(
        EXPORTING
          iv_node = is_ctx-node_key
          iv_key  = customer->key
          is_data = customer ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
