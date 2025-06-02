namespace app.interactions;

using {
  Country,
  Currency,
  cuid,
  managed
} from '@sap/cds/common';

type BusinessKey : String(10);
type Price : Decimal(10, 2);
type Text : String(1024);

entity DeliveryOrder : cuid, managed {
  items      : Composition of many DeliveryOrderItems on items.deliveryOrder = $self;
  customer   : BusinessKey;
  country    : Country;
  orderDate  : DateTime;
  status     : String(20); // e.g., "Pending", "Invoiced"
}

entity DeliveryOrderItems : cuid {
  deliveryOrder : Association to DeliveryOrder;
  productId     : BusinessKey;
  quantity      : Integer;
  price         : Price;
  currency      : Currency;
}

entity Invoice : cuid, managed {
  items         : Composition of many InvoiceItems on items.invoice = $self;
  deliveryOrder : Association to DeliveryOrder; // Link to DeliveryOrder
  customer      : BusinessKey;
  country       : Country;
  invoiceDate   : DateTime;
  totalAmount   : Price;
  currency      : Currency;
}

entity InvoiceItems : cuid {
  invoice     : Association to Invoice;
  productId   : BusinessKey;
  quantity    : Integer;
  unitPrice   : Price;
  totalPrice  : Price;
  currency    : Currency;
}
