class Product {
  Product(
      {required this.active,
      required this.catalogId,
      required this.createDate,
      required this.description,
      required this.displayDate,
      required this.id,
      required this.modifiedDate,
      required this.name,
      required this.productId,
      required this.shortDescription,
      required this.productImageUrl});

  bool active;
  int catalogId;
  DateTime createDate;
  String description;
  DateTime displayDate;
  int id;
  DateTime modifiedDate;
  String name;
  int productId;
  String shortDescription;
  String productImageUrl;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      active: json["active"],
      catalogId: json["catalogId"],
      createDate: DateTime.parse(json["createDate"]),
      description: json["description"],
      displayDate: DateTime.parse(json["displayDate"]),
      id: json["id"],
      modifiedDate: DateTime.parse(json["modifiedDate"]),
      name: json["name"],
      productId: json["productId"],
      shortDescription: json["shortDescription"],
      productImageUrl: json["productImageUrl"]);

  Map<String, dynamic> toJson() => {
        "active": active,
        "catalogId": catalogId,
        "createDate": createDate.toIso8601String(),
        "description": description,
        "displayDate": displayDate.toIso8601String(),
        "id": id,
        "modifiedDate": modifiedDate.toIso8601String(),
        "name": name,
        "productId": productId,
        "shortDescription": shortDescription,
        "productImageUrl": productImageUrl
      };
}
