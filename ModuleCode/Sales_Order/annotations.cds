using CatalogService as service from '../srv/interaction_srv';

// Annotations for SalesOrders
annotate service.SalesOrders with {
  UI.FieldGroup #GeneralInfo {
    Data: [
      { $Type: 'UI.DataField', Label: 'Order ID', Value: ID },
      { $Type: 'UI.DataField', Label: 'Buyer ID', Value: customer_ID },
      { $Type: 'UI.DataField', Label: 'Buyer Name', Value: customer.name },
      { $Type: 'UI.DataField', Label: 'Buyer Address', Value: customer.address },
      { $Type: 'UI.DataField', Label: 'Order Date', Value: orderDate },
      { $Type: 'UI.DataField', Label: 'Total Cost', Value: total },
      { $Type: 'UI.DataField', Label: 'Status', Value: status }
    ]
  }

  UI.FieldGroup #OrderItems {
    Data: [
      { $Type: 'UI.DataField', Label: 'Product ID', Value: Items_ID },
      { $Type: 'UI.DataField', Label: 'Product Name', Value: Items.name },
      { $Type: 'UI.DataField', Label: 'Product Description', Value: Items.description },
      { $Type: 'UI.DataField', Label: 'Quantity', Value: quantity },
      { $Type: 'UI.DataField', Label: 'Price per Item', Value: Items.price }
    ]
  }

  UI.Facets: [
    {
      $Type : 'UI.ReferenceFacet',
      ID : 'GeneralFacet',
      Label : 'General Info',
      Target : '@UI.FieldGroup#GeneralInfo'
    },
    {
      $Type : 'UI.ReferenceFacet',
      ID : 'ItemsFacet',
      Label : 'Order Items',
      Target : '@UI.FieldGroup#OrderItems'
    }
  ]
}

// Line Item View
annotate service.SalesOrders with {
  UI.LineItem: [
    { $Type: 'UI.DataField', Label: 'Order ID', Value: ID },
    { $Type: 'UI.DataField', Label: 'Buyer Name', Value: customer.name },
    { $Type: 'UI.DataField', Label: 'Order Date', Value: orderDate },
    { $Type: 'UI.DataField', Label: 'Total Cost', Value: total },
    { $Type: 'UI.DataField', Label: 'Status', Value: status },
    { $Type: 'UI.DataField', Label: 'Product ID', Value: Items_ID },
    { $Type: 'UI.DataField', Label: 'Product Name', Value: Items.name },
    { $Type: 'UI.DataField', Label: 'Product Description', Value: Items.description },
    { $Type: 'UI.DataField', Label: 'Price per Item', Value: Items.price },
    { $Type: 'UI.DataField', Label: 'Quantity', Value: quantity }
  ]
}

// Value List for Buyer
annotate service.SalesOrders with {
  customer @Common.ValueList: {
    $Type: 'Common.ValueListType',
    CollectionPath: 'Parties',
    Parameters: [
      { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: customer_ID, ValueListProperty: 'ID' },
      { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'name' },
      { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'address' }
    ]
  }
}

// Value List for Products
annotate service.SalesOrders with {
  Items @Common.ValueList: {
    $Type: 'Common.ValueListType',
    CollectionPath: 'Products',
    Parameters: [
      { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: Items_ID, ValueListProperty: 'ID' },
      { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'name' },
      { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'description' },
      { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'quantity' },
      { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'price' }
    ]
  }
}
