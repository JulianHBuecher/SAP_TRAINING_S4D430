@AbapCatalog.sqlViewName: 'ZI02CUSTOMTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Transactional Interface-View: Customer'
@VDM.viewType: #TRANSACTIONAL
@ObjectModel: {
    transactionalProcessingEnabled: true,
    compositionRoot: true,
    writeActivePersistence: 'scustom',

    modelCategory: #BUSINESS_OBJECT,
    semanticKey: ['Name'],
    representativeKey: ['ID'],

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZI_02_CustomerTP
  as select from ZI_02_Customer_App
  association [*] to ZI_02_BookingTP as _Bookings on ZI_02_Customer_App.ID = _Bookings.CustomerID
{
      @ObjectModel.readOnly: true
  key ID,
      @ObjectModel.mandatory: true
      Name,
      Street,
      Postcode,
      @ObjectModel.mandatory: true
      City,
      @ObjectModel.readOnly: true
      Country,
      Discount,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Bookings
}
