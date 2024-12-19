enum CategoryType {
  buy,
  rent
}

extension CategoryTypeExtention on CategoryType {
  String toReadableString() {
    switch (this) {
      case CategoryType.buy:
        return "buy";
      case CategoryType.rent:
        return "rent";
    }
  }
}

enum PropertyType {
  commercial,
  residential;
}

extension PropertyTypeExtention on PropertyType {
  String toReadableString() {
    switch (this) {
      case PropertyType.commercial:
        return "commercial";
      case PropertyType.residential:
        return "residential";
    }
  }
}

enum ResidentialSubType {
  house,
  apartment,
  guestHouse,
  studentHostel,
  hotel
}

extension ResidentialSubTypeExtention on ResidentialSubType {
  String toReadableString() {
    switch (this) {
      case ResidentialSubType.house:
        return "house";
      case ResidentialSubType.apartment:
        return "apartment";
      case ResidentialSubType.guestHouse:
        return "guest house";
      case ResidentialSubType.studentHostel:
        return "student hostel";
      case ResidentialSubType.hotel:
        return "hotel";
    }
  }
}

enum CommercialSubType {
  officeSpace,
  shop,
  wareHouse,
  eventSpace,
}


extension CommercialSubTypeExtention on CommercialSubType {
  String toReadableString() {
    switch (this) {
      case CommercialSubType.officeSpace:
        return "office space";
      case CommercialSubType.shop:
        return "shop";
      case CommercialSubType.wareHouse:
        return "ware house";
      case CommercialSubType.eventSpace:
        return "event space";

    }
  }
}

enum PaymentCurrency {
  ghc,
  usd,
  eur,
  gbp,
}

extension PaymentCurrencyExtention on PaymentCurrency {
  String toReadableString() {
    switch (this) {
      case PaymentCurrency.ghc:
        return "ghc";
      case PaymentCurrency.usd:
        return "usd";
      case PaymentCurrency.eur:
        return "eur";
      case PaymentCurrency.gbp:
        return "gbp";

    }
  }
}

enum StudentHostelPaymentFrequency {
  perSemester,
  perAcademicYear,
}

extension StudentHostelPaymentFrequencyExtention on StudentHostelPaymentFrequency {
  String toReadableString() {
    switch (this) {
      case StudentHostelPaymentFrequency.perSemester:
        return "per semester";
      case StudentHostelPaymentFrequency.perAcademicYear:
        return "per academic year";
    }
  }
}


enum HotelAndGuestHousePaymentFrequency {
  daily,
  weekly,
}


extension HotelAndGuestHousePaymentFrequencyExtention on HotelAndGuestHousePaymentFrequency {
  String toReadableString() {
    switch (this) {
      case HotelAndGuestHousePaymentFrequency.daily:
        return "daily";
      case HotelAndGuestHousePaymentFrequency.weekly:
        return "weekly";
    }
  }
}

 
enum ApartmentAndHousePriceFrequency {
  monthly,
  annually,
  oneTime
}

extension ApartmentAndHousePriceFrequencyExtention on ApartmentAndHousePriceFrequency {
  String toReadableString() {
    switch (this) {
      case ApartmentAndHousePriceFrequency.monthly:
        return "monthly";
      case ApartmentAndHousePriceFrequency.annually:
        return "annually";
      case ApartmentAndHousePriceFrequency.oneTime:
        return "one time";
    }
  }
}