using CatalogService as service from '../../srv/interaction_srv';

annotate service.Invoices with @(
  UI.FieldGroup #GeneratedGroup : {
    $Type : 'UI.FieldGroupType',
    Data : [
      { $Type : 'UI.DataField', Label : 'customer', Value : customer },
      { $Type : 'UI.DataField', Label : 'country_code', Value : country_code },
      { $Type : 'UI.DataField', Label : 'invoiceDate', Value : invoiceDate },
      { $Type : 'UI.DataField', Label : 'totalAmount', Value : totalAmount },
      { $Type : 'UI.DataField', Label : 'currency_code', Value : currency_code },
      { $Type : 'UI.DataField', Label : 'productId', Value : productId }
    ]
  },
  UI.Facets : [
    {
      $Type : 'UI.ReferenceFacet',
      ID : 'GeneratedFacet1',
      Label : 'General Information',
      Target : '@UI.FieldGroup#GeneratedGroup'
    }
  ],
  UI.LineItem : [
    { $Type : 'UI.DataField', Label : 'customer', Value : customer },
    { $Type : 'UI.DataField', Label : 'country_code', Value : country_code },
    { $Type : 'UI.DataField', Label : 'invoiceDate', Value : invoiceDate },
    { $Type : 'UI.DataField', Label : 'totalAmount', Value : totalAmount },
    { $Type : 'UI.DataField', Label : 'currency_code', Value : currency_code },
    { $Type : 'UI.DataField', Label : 'productId', Value : productId }
  ]
);

annotate service.Invoices with {
  deliveryOrder @Common.ValueList : {
    $Type : 'Common.ValueListType',
    CollectionPath : 'DeliveryOrders',
    Parameters : [
      { $Type : 'Common.ValueListParameterInOut', LocalDataProperty : deliveryOrder_ID, ValueListProperty : 'ID' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'customer' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'country_code' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'orderDate' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'status' }
    ]
  }
};
