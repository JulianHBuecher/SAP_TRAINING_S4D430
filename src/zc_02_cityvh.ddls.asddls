@AbapCatalog.sqlViewName: 'ZC02CITYVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Value Helper: City'
define view ZC_02_CityVH 
    as select from sgeocity {
    key city as City,
    key country as Country
}
