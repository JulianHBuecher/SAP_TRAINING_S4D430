@AbapCatalog.sqlViewName: 'ZI02BOOKINGTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transactional Interface-View: Booking'
@VDM.viewType: #TRANSACTIONAL
define view ZI_02_BookingTP as select from ZI_02_Booking_App {
    key CarrierID,
    key ConnectionID,
    key FlightDate,
    key BookingID,
    FlightClass,
    OrderDate,
    CustomerID
}
