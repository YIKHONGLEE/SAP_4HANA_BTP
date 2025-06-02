namespace cp.interactions;

using { cuid, sap.common } from '@sap/cds/common';

// Type definitions
type UUID : String(36);
type Decimal15_2 : Decimal(15, 2);
type Quantity : Decimal(10, 2);

// Product Entity
entity Product : managed {
  key ID          : UUID;
  name            : String(255);
  price           : Decimal15_2;
  quantity        : Quantity;
  description     : String(255);
}

// Party Entity (Buyer)
entity Party : managed {
  key ID          : UUID;
  name            : String(255);
  address         : String(255);
}

// SalesOrder Entity
entity SalesOrder : cuid, managed {
  customer_ID     : UUID;
  total           : Decimal15_2;
  orderDate       : Date;
  status          : String(20);

  toCustomer      : Association to Party;
  toItems         : Composition of many SalesOrderItem on toItems.salesOrder = $self;
}

// SalesOrderItem Entity
entity SalesOrderItem : cuid, managed {
  product_ID      : UUID;
  quantity        : Quantity;
  price           : Decimal15_2;
  description     : String(255);

  toProduct       : Association to Product;
  salesOrder      : Association to SalesOrder;
}

// Invoice Entity
entity Invoice : cuid, managed {
  salesOrder_ID   : UUID;
  billingDate     : Date;
  totalAmount     : Decimal15_2;
  status          : String(20);

  toSalesOrder    : Association to SalesOrder;
}
