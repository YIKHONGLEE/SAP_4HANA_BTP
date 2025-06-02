namespace app.interactions;

using { cuid, managed } from '@sap/cds/common';

type BusinessKey : String(10);
type Price : Decimal(10, 2);
type Text : String(1024);

entity OutboundDelivery : cuid, managed {
  deliveryNumber : BusinessKey;
  deliveryDate   : DateTime;
  items          : Association to DeliveryUnits;
  quantity       : Decimal(10, 2);
  product        : String(100);
  status         : String(20) default 'PE'; // Default status: Pending
  selectedUnits  : Association to DeliveryUnits; // Transient selection
}

entity DeliveryUnits : managed {
  key ID        : String(255);
  delivery      : Association to OutboundDelivery;
  product       : String(50);
  quantity      : Decimal(10, 3);
  unit          : String(100);
  price         : Decimal(10, 2);
  description   : String(500);
  approvetime   : DateTime;
  picked        : Boolean;
}
