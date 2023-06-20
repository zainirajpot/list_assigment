// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String title;
  double price;
  String description;
  String imageAssetPath;
  Product({
    required this.title,
    required this.price,
    required this.description,
    required this.imageAssetPath,
  });

  Product copyWith({
    String? title,
    double? price,
    String? description,
    String? imageAssetPath,
  }) {
    return Product(
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      imageAssetPath: imageAssetPath ?? this.imageAssetPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
      'description': description,
      'imageAssetPath': imageAssetPath,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      imageAssetPath: map['imageAssetPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(title: $title, price: $price, description: $description, imageAssetPath: $imageAssetPath)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.price == price &&
        other.description == description &&
        other.imageAssetPath == imageAssetPath;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        price.hashCode ^
        description.hashCode ^
        imageAssetPath.hashCode;
  }
}
