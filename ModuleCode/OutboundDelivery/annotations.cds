using CatalogService as service from '../../srv/outboundDelivery'; // Adjust the path as necessary

annotate service.OutboundDeliveries with @(
  UI.HeaderInfo: {
    Title: {
      $Type: 'UI.DataField',
      Value: deliveryOrderId
    },
    TypeName: 'Outbound Delivery',
    TypeNamePlural: 'Outbound Deliveries',
    Description: { Value: customerName }
  },
  UI.HeaderFacets: [
    {
      $Type: 'UI.ReferenceFacet',
      Target: '@UI.FieldGroup#Admin'
    }
  ],
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data: [
      {
        $Type: 'UI.DataField',
        Label: 'Sales Order ID',
        Value: salesOrderId,
        @UI.ValueList: {
          entity: 'SalesOrders',
          label: 'Sales Order ID',
          description: 'Sales Order Description'
        }
      },
      { $Type: 'UI.DataField', Label: 'Delivery Order ID', Value: deliveryOrderId },
      { $Type: 'UI.DataField', Label: 'Customer Name', Value: customerName },
      { $Type: 'UI.DataField', Label: 'Order Date', Value: orderDate },
      { $Type: 'UI.DataField', Label: 'Quantity', Value: quantity },
      { $Type: 'UI.DataField', Label: 'Price', Value: price },
      { $Type: 'UI.DataField', Label: 'Item Description', Value: itemDescription }
    ]
  },
  UI.FieldGroup #Admin: {
    Data: [
      { $Type: 'UI.DataField', Value: createdAt },
      { $Type: 'UI.DataField', Value: modifiedAt }
    ]
  },
  UI.Facets: [
    {
      $Type: 'UI.ReferenceFacet',
      ID: 'GeneratedFacet1',
      Label: 'General Information',
      Target: '@UI.FieldGroup#GeneratedGroup'
    }
  ],
  UI.LineItem: [
    { $Type: 'UI.DataField', Label: 'Sales Order ID', Value: salesOrderId },
    { $Type: 'UI.DataField', Label: 'Delivery Order ID', Value: deliveryOrderId },
    { $Type: 'UI.DataField', Label: 'Customer Name', Value: customerName },
    { $Type: 'UI.DataField', Label: 'Order Date', Value: orderDate },
    { $Type: 'UI.DataField', Label: 'Quantity', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Price', Value: price },
    { $Type: 'UI.DataField', Label: 'Item Description', Value: itemDescription }
  ],
  UI.Action: {
    $Type: 'UI.Action',
    Label: 'Create New Outbound Delivery',
    Target: 'create'
  }
);

annotate service.OutboundDeliveryItems with @(
  UI.HeaderInfo: {
    Title: {
      $Type: 'UI.DataField',
      Value: itemDescription
    },
    TypeName: 'Outbound Delivery Item',
    TypeNamePlural: 'Outbound Delivery Items'
  },
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data: [
      { $Type: 'UI.DataField', Label: 'Item Description', Value: itemDescription },
      { $Type: 'UI.DataField', Label: 'Quantity', Value: quantity },
      { $Type: 'UI.DataField', Label: 'Price', Value: price },
      { $Type: 'UI.DataField', Label: 'Currency', Value: currency_code }
    ]
  },
  UI.Facets: [
    {
      $Type: 'UI.ReferenceFacet',
      ID: 'GeneratedFacet1',
      Label: 'General Information',
      Target: '@UI.FieldGroup#GeneratedGroup'
    }
  ],
  UI.LineItem: [
    { $Type: 'UI.DataField', Label: 'Item Description', Value: itemDescription },
    { $Type: 'UI.DataField', Label: 'Quantity', Value: quantity },
    { $Type: 'UI.DataField', Label: 'Price', Value: price },
    { $Type: 'UI.DataField', Label: 'Currency', Value: currency_code }
  ]
);

annotate service.OutboundDeliveryItems.texts with @(UI: {
  Identification: [{ Value: itemDescription }],
  SelectionFields: [locale, itemDescription],
  LineItem: [
    { Value: locale, Label: 'Locale' },
    { Value: itemDescription }
  ]
});
annotate service.OutboundDeliveryItems.texts with { ID @UI.Hidden; }

annotate service.OutboundDeliveryItems.texts {
  locale @(ValueList.entity: 'Languages', Common.ValueListWithFixedValues);
}
