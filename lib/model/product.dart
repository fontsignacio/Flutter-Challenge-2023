class Product {
  int? id;
  String? title;
  String? description;
  int? price;
  int? stock;
  double? discountPercentage;
  double? rating;
  String? brand;
  String? category;
  String? thumbnail;
 // List<String>? images;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      //this.images
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = int.parse(json['price'].toString());
    rating = double.parse(json['rating'].toString());
    stock = int.parse(json['stock'].toString());
    // price = double.parse(json['price']);
    // discountPercentage = double.parse(json['discountPercentage']);
    // rating = double.parse(json['rating']);
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    //images = json['images'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      //'images' : images
    };
  }
}