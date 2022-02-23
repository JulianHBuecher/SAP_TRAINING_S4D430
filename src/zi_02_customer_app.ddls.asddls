@AbapCatalog.sqlViewName: 'ZI02CUSTOMAPP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View: Customer App'
@VDM.viewType: #BASIC
define view ZI_02_Customer_App as select from scustom {
    key id as ID,
    name as Name,
    street as Street,
    postcode as Postcode,
    city as City,
    country as Country,
    discount as Discount
}
