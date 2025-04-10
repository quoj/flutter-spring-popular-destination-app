class Destination {
  final int id;
  final String name;
  final String image;
  final double rating;
  bool favorite;

  Destination({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    this.favorite = false,
  });

  factory Destination.fromJson(Map<String, dynamic> j) => Destination(
    id: j['id'],
    name: j['name'],
    image: j['image'],
    rating: (j['rating'] as num).toDouble(),
    favorite: j['favorite'] ?? false,
  );
}
