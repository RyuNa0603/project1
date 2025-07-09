class AuthorsIdModel {
  final int id;
  final String title;
  final double price;
  final String image;
  final String description;
  final String author;
  final String category;
  final double rating;
  final int reviewCount;
  final String publisher;
  final String publishedDate;
  final String language;
  final int pageCount;
  final String isbn;
  final String vendor;
  final bool specialOffer;
  final String stockStatus;
  final bool offer;
  final int discount;
  final bool topOfWeek;

  AuthorsIdModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.author,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.publisher,
    required this.publishedDate,
    required this.language,
    required this.pageCount,
    required this.isbn,
    required this.vendor,
    required this.specialOffer,
    required this.stockStatus,
    required this.offer,
    required this.discount,
    required this.topOfWeek,
  });

  factory AuthorsIdModel.fromJson(Map<String, dynamic> json) {
    return AuthorsIdModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: json['price'],
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      category: json['category'] ?? '',
      rating: json['rating'] ?? 0,
      reviewCount: json['review_count'] ?? 0,
      publisher: json['publisher'] ?? '',
      publishedDate: json['published_date'] ?? '',
      language: json['language'] ?? '',
      pageCount: json['page_count'] ?? 0,
      isbn: json['isbn'] ?? '',
      vendor: json['vendor'] ?? '',
      specialOffer: json['special_offer'] ?? false,
      stockStatus: json['stock_status'] ?? '',
      offer: json['offer'] ?? false,
      discount: json['discount'] ?? 0,
      topOfWeek: json['top_of_week'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'description': description,
      'author': author,
      'category': category,
      'rating': rating,
      'review_count': reviewCount,
      'publisher': publisher,
      'published_date': publishedDate,
      'language': language,
      'page_count': pageCount,
      'isbn': isbn,
      'vendor': vendor,
      'special_offer': specialOffer,
      'stock_status': stockStatus,
      'offer': offer,
      'discount': discount,
      'top_of_week': topOfWeek,
    };
  }
}
