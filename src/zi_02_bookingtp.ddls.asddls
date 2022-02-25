@AbapCatalog.sqlViewName: 'ZI02BOOKINGTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transactional Interface-View: Booking'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {
    writeActivePersistence: 'zv02booking',

    semanticKey: ['CarrierID','ConnectionID','FlightDate','BookingID'],
    representativeKey: ['FlightDate'],

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZI_02_BookingTP
  as select from ZI_02_Booking_App
  association [1..1] to ZI_02_CustomerTP as _Customer on _Customer.ID = ZI_02_Booking_App.CustomerID
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
