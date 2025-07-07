class Home2Model {
  int? subcategoryId;
  String? subcategoryName;
  String? subcategoryNameAr;
  String? subcategoryImage;
  String? subcategoryDatetime;
  int? categoryId;

  Home2Model(
      {this.subcategoryId,
      this.subcategoryName,
      this.subcategoryNameAr,
      this.subcategoryImage,
      this.subcategoryDatetime,
      this.categoryId});

  Home2Model.fromJson(Map<String, dynamic> json) {
    subcategoryId = json['subcategory_id'];
    subcategoryName = json['subcategory_name'];
    subcategoryNameAr = json['subcategory_name_ar'];
    subcategoryImage = json['subcategory_image'];
    subcategoryDatetime = json['subcategory_datetime'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subcategory_id'] = subcategoryId;
    data['subcategory_name'] = subcategoryName;
    data['subcategory_name_ar'] = subcategoryNameAr;
    data['subcategory_image'] = subcategoryImage;
    data['subcategory_datetime'] = subcategoryDatetime;
    data['category_id'] = categoryId;
    return data;
  }
}