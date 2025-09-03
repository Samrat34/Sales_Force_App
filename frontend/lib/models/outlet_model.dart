class Outlet {
  final String id;
  final String name;
  final String location;
  final String category;
  final int sales;
  final int credit;
  final double distance;
  final String nextVisit;
  final int progress;
  final String status;
  final String? imageUrl;
  final double rating;
  final bool isOpen;

  Outlet({
    required this.id,
    required this.name,
    required this.location,
    required this.category,
    required this.sales,
    required this.credit,
    required this.distance,
    required this.nextVisit,
    required this.progress,
    required this.status,
    this.imageUrl,
    this.rating = 0.0,
    this.isOpen = true,
  });

  // Convert from JSON
  factory Outlet.fromJson(Map<String, dynamic> json) {
    return Outlet(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      category: json['category'] ?? '',
      sales: json['sales']?.toInt() ?? 0,
      credit: json['credit']?.toInt() ?? 0,
      distance: json['distance']?.toDouble() ?? 0.0,
      nextVisit: json['nextVisit'] ?? '',
      progress: json['progress']?.toInt() ?? 0,
      status: json['status'] ?? 'active',
      imageUrl: json['imageUrl'],
      rating: json['rating']?.toDouble() ?? 0.0,
      isOpen: json['isOpen'] ?? true,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'category': category,
      'sales': sales,
      'credit': credit,
      'distance': distance,
      'nextVisit': nextVisit,
      'progress': progress,
      'status': status,
      'imageUrl': imageUrl,
      'rating': rating,
      'isOpen': isOpen,
    };
  }
}
