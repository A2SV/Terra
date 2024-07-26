enum EventSpaceSuitableEvents {
  wedding,
  religious,
  funeral,
  festival,
  conference,
  party,
  concert
}

enum OfficeSpaceType {
  openPlan,
  individualOffice,
}

enum PaymentCurrency { ghs, usd, eur, gbp }

enum PaymentFrequency {
  daily,
  weekly,
  monthly,
  annually,
  perSemester,
  perAcademicYear,
  once
}

enum PropertyListingType { forRent, forSale }

enum PropertyMarketStatus { unavailable, available, rented, sold }

enum PropertyPublishStatus { unpublished, published, inReview }

enum PropertySubType {
  house,
  apartment,
  studentHostel,
  hotel,
  guestHouse,
  officeSpace,
  shop,
  warehouse,
  eventSpace
}
enum PropertyType {
  residential,
  commercial,
}

enum StudentHostelLocation { onCampus, offCampus }

enum StudentHostelRoomTypes { single, double, triple, quad, dormitory }

enum StudentHostelType { male, female, coed }

enum WarehouseSuitableGoods {
  generalMerchandise,
  perishableGoods,
  hazardousMaterials,
  electronics,
  industrialOrConstructionMaterials,
}
