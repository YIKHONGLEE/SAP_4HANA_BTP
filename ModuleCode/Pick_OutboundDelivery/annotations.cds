using CatalogService as service from '../../srv/interaction_srv';

annotate service.OutboundDelivery with @(
  UI.FieldGroup #General : {
    $Type : 'UI.FieldGroupType',
    Data : [
      { $Type : 'UI.DataField', Label : 'Delivery Number', Value : deliveryNumber },
      { $Type : 'UI.DataField', Label : 'Delivery Date', Value : deliveryDate },
      { $Type : 'UI.DataField', Label : 'Status', Value : status }
    ]
  },
  UI.Facets : [
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'General Information',
      Target : '@UI.FieldGroup#General'
    }
  ],
  UI.LineItem : [
    { $Type : 'UI.DataField', Label : 'Product', Value : items.product },
    { $Type : 'UI.DataField', Label : 'Price', Value : items.price },
    { $Type : 'UI.DataField', Label : 'Quantity', Value : items.quantity },
    { $Type : 'UI.DataField', Label : 'Unit', Value : items.unit },
    { $Type : 'UI.DataField', Label : 'Description', Value : items.description },
    { $Type : 'UI.DataField', Label : 'Pick', Value : items.picked }
  ]
);

annotate service.OutboundDelivery with {
  items @Common.ValueList : {
    $Type : 'Common.ValueListType',
    CollectionPath : 'DeliveryUnits',
    Parameters : [
      { $Type : 'Common.ValueListParameterInOut', LocalDataProperty : items_ID, ValueListProperty : 'ID' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'product' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'price' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'quantity' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'unit' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'description' },
      { $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'picked' }
    ]
  }
};
