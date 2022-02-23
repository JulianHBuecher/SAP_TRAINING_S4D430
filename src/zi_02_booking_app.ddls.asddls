@AbapCatalog.sqlViewName: 'ZI02BOOKAPP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View: Booking App'
@VDM.viewType: #BASIC
define view ZI_02_Booking_App as select from sbook {
    key carrid as CarrierID,
    key connid as ConnectionID,
    key fldate as FlightDate,
    key bookid as BookingID,
    class as FlightClass,
    order_date as OrderDate,
    customid as CustomerID
}
