class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  double? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  String? itemsScientificformula;
  String? itemsScientificformulaAr;
  int? itemsPrescription;
  int? subcategoryId;
  String? subcategoryName;
  String? subcategoryNameAr;
  String? subcategoryImage;
  String? subcategoryDatetime;
  int? categoryId;
  String? favorite;
  double? itemspricediscount;

  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCat,
        this.itemsScientificformula,
        this.itemsScientificformulaAr,
        this.itemsPrescription,
        this.subcategoryId,
        this.subcategoryName,
        this.subcategoryNameAr,
        this.subcategoryImage,
        this.subcategoryDatetime,
        this.categoryId,
        this.favorite,
        this.itemspricediscount});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'] is int
        ? (json['items_price'] as int).toDouble()
        : json['items_price']?.toDouble();
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    itemsScientificformula = json['items_scientificformula'];
    itemsScientificformulaAr = json['items_scientificformula_ar'];
    itemsPrescription = json['items_prescription'];
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    subcategoryNameAr = json['subcategory_name_ar'];
    subcategoryImage = json['subcategory_image'];
    subcategoryDatetime = json['subcategory_datetime'];
    categoryId = json['category_id'];
    favorite = json['favorite'];
    itemspricediscount = json['itemspricediscount'] is int
        ? (json['itemspricediscount'] as int).toDouble()
        : json['itemspricediscount']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['items_scientificformula'] = itemsScientificformula;
    data['items_scientificformula_ar'] = itemsScientificformulaAr;
    data['items_prescription'] = itemsPrescription;
    data['subcategory_id'] = subcategoryId;
    data['subcategory_name'] = subcategoryName;
    data['subcategory_name_ar'] = subcategoryNameAr;
    data['subcategory_image'] = subcategoryImage;
    data['subcategory_datetime'] = subcategoryDatetime;
    data['category_id'] = categoryId;
    data['favorite'] = favorite;
    data['itemspricediscount'] = itemspricediscount;
    return data;
  }
}