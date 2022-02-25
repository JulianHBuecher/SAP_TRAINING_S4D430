@AbapCatalog.sqlViewName: 'ZC02CUSTOMTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional Consumption-View: Customer'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel: {
    transactionalProcessingDelegated: true,

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZC_02_CustomerTP
  as select from ZI_02_CustomerTP
  association [*]    to ZC_02_BookingTP as _Bookings on  ZI_02_CustomerTP.ID = _Bookings.CustomerID
  association [1..1] to ZC_02_CityVH    as _City     on  ZI_02_CustomerTP.City    = _City.City
                                                     and ZI_02_CustomerTP.Country = _City.Country
{
  key ID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Name,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Street,
      Postcode,
      @Consumption.valueHelp: '_City'
      City,
      Country,
      Discount,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Bookings,
      _City
}
