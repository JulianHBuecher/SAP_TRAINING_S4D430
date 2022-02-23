@AbapCatalog.sqlViewName: 'ZI02CUSTOMTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Transactional Interface-View: Customer'
@VDM.viewType: #TRANSACTIONAL
define view ZI_02_CustomerTP
  as select from ZI_02_Customer_App
{
  key ID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      Discount
}
