class OrdersModel {
  int? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  double? ordersTotalprice;
  String? ordersCoupon;
  String? ordersRating;
  String? ordersNoterating;
  String? ordersPaymrntmethod;
  String? ordersStatus;
  String? ordersDiseases;
  String? ordersMedications;
  String? ordersDoctornotes;
  String? ordersDatetime;

  // الحقول الطبية الجديدة
  int? ordersAge;
  int? ordersHeight;
  int? ordersWeight;
  String? ordersGender;
  String? ordersBloodType;
  String? ordersAllergies;

  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressNote;
  double? addressLat;
  double? addressLong;

  OrdersModel(
      {this.ordersId,
        this.ordersUsersid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPricedelivery,
        this.ordersPrice,
        this.ordersTotalprice,
        this.ordersCoupon,
        this.ordersRating,
        this.ordersNoterating,
        this.ordersPaymrntmethod,
        this.ordersStatus,
        this.ordersDiseases,
        this.ordersMedications,
        this.ordersDoctornotes,
        this.ordersDatetime,
        this.addressId,
        this.addressUsersid,
        this.addressName,
        this.addressCity,
        this.addressStreet,
        this.addressNote,
        this.addressLat,
        this.addressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'].toString();
    ordersAddress = json['orders_address'].toString();
    ordersType = json['orders_type'].toString();
    ordersPricedelivery = json['orders_pricedelivery'].toString();
    ordersPrice = json['orders_price'].toString();
    ordersTotalprice = json['orders_totalprice'] is int
        ? (json['orders_totalprice'] as int).toDouble()
        : json['orders_totalprice']?.toDouble();
    ordersCoupon = json['orders_coupon'].toString();
    ordersRating = json['orders_rating'].toString();
    ordersNoterating = json['orders_noterating'].toString();
    ordersPaymrntmethod = json['orders_paymrntmethod'].toString();
    ordersStatus = json['orders_status'].toString();
    ordersDiseases = json['orders_diseases'].toString();
    ordersMedications = json['orders_medications'].toString();
    ordersDoctornotes = json['orders_doctornotes'].toString();
    ordersDatetime = json['orders_datetime'].toString();

    ordersAge = json['orders_age'] != null ? int.tryParse(json['orders_age'].toString()) : null;
    ordersHeight = json['orders_height'] != null ? int.tryParse(json['orders_height'].toString()) : null;
    ordersWeight = json['orders_weight'] != null ? int.tryParse(json['orders_weight'].toString()) : null;
    ordersGender = json['orders_gender'];
    ordersBloodType = json['orders_blood_type'];
    ordersAllergies = json['orders_allergies'];
    
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressNote = json['address_note'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['orders_paymrntmethod'] = ordersPaymrntmethod;
    data['orders_status'] = ordersStatus;
    data['orders_diseases'] = ordersDiseases;
    data['orders_medications'] = ordersMedications;
    data['orders_doctornotes'] = ordersDoctornotes;
    data['orders_datetime'] = ordersDatetime;
    
    // إضافة الحقول الطبية الجديدة
    data['orders_age'] = ordersAge;
    data['orders_height'] = ordersHeight;
    data['orders_weight'] = ordersWeight;
    data['orders_gender'] = ordersGender;
    data['orders_blood_type'] = ordersBloodType;
    data['orders_allergies'] = ordersAllergies;
    
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_note'] = addressNote;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}