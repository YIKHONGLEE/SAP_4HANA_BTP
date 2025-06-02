using app.interactions from '../db/interactions';

service CatalogService {

  @odata.draft.enabled: true
  entity OutboundDelivery as projection on interactions.OutboundDelivery {
    ID,
    deliveryNumber,
    deliveryDate,
    items,          // Association to DeliveryUnits
    quantity,
    product,
    status,
    selectedUnits   // Transient selection field
  };

  @odata.draft.enabled: true
  entity DeliveryUnits as projection on interactions.DeliveryUnits {
    ID,
    delivery,
    product,
    quantity,
    unit,
    price,
    description,
    approvetime,
    picked
  };
}
