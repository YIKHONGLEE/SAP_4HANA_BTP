using app.interactions from '../db/interactions';
using {sap} from '@sap/cds-common-content';

service CatalogService {

  @odata.draft.enabled: true
  entity DeliveryOrders as projection on interactions.DeliveryOrder {
    ID,
    items,         // Include composition
    customer,
    country,
    orderDate,
    status
  };

  entity DeliveryOrderItems as projection on interactions.DeliveryOrderItems {
    ID,
    deliveryOrder, // FK
    productId,
    quantity,
    price,
    currency
  };

  @odata.draft.enabled: true
  entity Invoices as projection on interactions.Invoice {
    ID,
    items,
    deliveryOrder,
    customer,
    country,
    invoiceDate,
    totalAmount,
    currency
  };

  entity InvoiceItems as projection on interactions.InvoiceItems {
    ID,
    invoice,
    productId,
    quantity,
    unitPrice
  };
}
