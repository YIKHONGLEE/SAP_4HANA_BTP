using CatalogService as service from '../../srv/interaction_srv';

annotate service.Invoices with @(
  UI.FieldGroup #GeneratedGroup : {
    $Type : 'UI.FieldGroupType',
    Data : [
      { $Type : 'UI.DataField', Label : 'Customer', Value : customer },
      { $Type : 'UI.DataField', Label : 'Country', Value : country_code },
      { $Type : 'UI.DataField', Label : 'Invoice Date', Value : invoiceDate },
      { $Type : 'UI.DataField', Label : 'Total Amount', Value : totalAmount },
      { $Type : 'UI.DataField', Label : 'Currency Code', Value : currency_code },
      { $Type : 'UI.DataField', Label : 'Product ID', Value : productId }
    ]
  },
  UI.Facets : [
    { Target : '@UI.FieldGroup#GeneratedGroup' }
  ],
  UI.LineItem : [
    { $Type : 'UI.DataField', Label : 'Customer', Value : customer },
    { $Type : 'UI.DataField', Label : 'Country Code', Value : country_code },
    { $Type : 'UI.DataField', Label : 'Invoice Date', Value : invoiceDate },
    { $Type : 'UI.DataField', Label : 'Total Amount', Value : totalAmount },
    { $Type : 'UI.DataField', Label : 'Currency Code', Value : currency_code },
    { $Type : 'UI.DataField', Label : 'Product ID', Value : productId }
  ]
);
