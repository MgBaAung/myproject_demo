class ProductListResponse {
  int? page;
  int? size;
  int? totalElements;
  int? totalPages;
  bool? last;
  List<Product>? content;

  ProductListResponse(
      {this.page,
      this.size,
      this.totalElements,
      this.totalPages,
      this.last,
      this.content});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    size = json['size'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    last = json['last'];
    if (json['content'] != null) {
      content = <Product>[];
      json['content'].forEach((v) {
        content!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['size'] = size;
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    data['last'] = last;
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  String? image;
  String? createdDate;
  String? name;
  double? amount;
  String? description;
  Category? category;

  Product(
      {this.id,
      this.image,
      this.createdDate,
      this.name,
      this.amount,
      this.description,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    createdDate = json['createdDate'];
    name = json['name'];
    amount = json['amount'];
    description = json['description'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['createdDate'] = createdDate;
    data['name'] = name;
    data['amount'] = amount;
    data['description'] = description;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.image == image &&
        other.createdDate == createdDate &&
        other.name == name &&
        other.amount == amount &&
        other.description == description &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        createdDate.hashCode ^
        name.hashCode ^
        amount.hashCode ^
        description.hashCode ^
        category.hashCode;
  }

  @override
  String toString() {
    return 'Product(id: $id, image: $image, createdDate: $createdDate, name: $name, amount: $amount, description: $description, category: $category)';
  }
}

class Category {
  int? id;
  String? createdDate;
  String? name;

  Category({this.id, this.createdDate, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdDate = json['createdDate'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdDate'] = createdDate;
    data['name'] = name;
    return data;
  }
}
