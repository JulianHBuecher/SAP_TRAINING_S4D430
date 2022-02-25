class ZCL_I_D_CALC_ID definition
  public
  inheriting from /BOBF/CL_LIB_D_SUPERCL_SIMPLE
  final
  create public .

public section.

  methods /BOBF/IF_FRW_DETERMINATION~EXECUTE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_I_D_CALC_ID IMPLEMENTATION.


  method /BOBF/IF_FRW_DETERMINATION~EXECUTE.
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

  endmethod.
ENDCLASS.
