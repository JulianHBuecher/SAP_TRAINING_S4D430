@AbapCatalog.sqlViewName: 'ZC02BOOKINGTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Consumption-View: Booking'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
@ObjectModel: {
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZC_02_BookingTP
  as select from ZI_02_BookingTP
  association [1..1] to ZC_02_CustomerTP as _Customer on ZI_02_BookingTP.CustomerID = _Customer.ID
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
      FlightClass,
      OrderDate,
      CustomerID,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
      _Customer
}
