using app.interactions from '../db/interactions';

service CatalogService {
  // Expose entities with draft functionality
  entity Products        as projection on interactions.Product;
  entity Parties         as projection on interactions.Party;
  @odata.draft.enabled
  entity SalesOrders     as projection on interactions.SalesOrder;
  @odata.draft.enabled
  entity SalesOrderItems as projection on interactions.SalesOrderItem;
  @odata.draft.enabled
  entity Invoices        as projection on interactions.Invoice;

  // Custom Actions / Functions
  action AddProduct(orderID: UUID, productID: UUID, quantity: Decimal) returns String;
  function CalculateOrderTotal(orderID: UUID) returns Decimal(15, 2);
  action GenerateInvoice(orderID: UUID) returns String;
}
