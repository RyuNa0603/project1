class AuthorsModel {
  final int id;
  final String name;
  final String biography;
  final String birth_date;
  final String death_date;
  final String nationality;
  final List genres;
  final String website;
  final String image;
  final String publisher;
  final List awards;
  final List<Map> books;

  AuthorsModel({
    required this.id,
    required this.name,
    required this.biography,
    required this.birth_date,
    required this.death_date,
    required this.nationality,
    required this.genres,
    required this.website,
    required this.image,
    required this.publisher,
    required this.awards,
    required this.books,
  });

  factory AuthorsModel.fromJson(Map<String, dynamic> json) {
    return AuthorsModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      biography: json['biography'] ?? '',
      birth_date: json['birth_date'] ?? '',
      death_date: json['death_date'] ?? '',
      nationality: json['nationality'] ?? '',
      genres: json['genres'] ?? [],
      website: json['website'] ?? '',
      image: json['image'] ?? '',
      publisher: json['publisher'] ?? '',
      awards: json['awards'] ?? [],
      books: json['books'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'biography': biography,
      'birth_date': birth_date,
      'death_date': death_date,
      'nationality': nationality,
      'genres': genres.toString(),
      'website': website,
      'image': image,
      'publisher': publisher,
      'awards': awards.toString(),
      'books': books,
    };
  }
}
