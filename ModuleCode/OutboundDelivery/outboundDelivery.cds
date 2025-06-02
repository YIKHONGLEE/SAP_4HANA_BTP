using { my } from '../db/schema'; // Adjust the path if necessary
using { sap } from '@sap/cds-common-content';

service CatalogService {

  @odata.draft.enabled: true
  entity OutboundDeliveries as projection on my.OutboundDelivery;

  @odata.draft.enabled: true
  entity OutboundDeliveryItem as projection on my.OutboundDeliveryItem; // Ensure this entity is defined in your schema

  @readonly
  entity Languages as projection on sap.common.Languages;
}
