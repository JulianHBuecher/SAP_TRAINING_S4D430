@AbapCatalog.sqlViewName: 'ZC02CUSTOMTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Consumption-View: Customer'
@VDM.viewType: #CONSUMPTION
define view ZC_02_CustomerTP
  as select from ZI_02_CustomerTP
  association [1..*] to ZC_02_BookingTP as _Bookings on ZI_02_CustomerTP.ID = _Bookings.CustomerID
{

  key ID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      Discount,
      _Bookings
}
