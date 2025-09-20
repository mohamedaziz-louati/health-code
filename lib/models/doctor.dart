class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String hospital;
  final String experience;
  final double rating;
  final int reviewCount;
  final String? profileImageUrl;
  final String? bio;
  final List<String> languages;
  final Map<String, List<String>> availability; // day -> [time slots]
  final double consultationFee;
  final String? location;
  final String? phone;
  final String? email;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.hospital,
    required this.experience,
    required this.rating,
    required this.reviewCount,
    this.profileImageUrl,
    this.bio,
    this.languages = const [],
    this.availability = const {},
    required this.consultationFee,
    this.location,
    this.phone,
    this.email,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      hospital: json['hospital'],
      experience: json['experience'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      profileImageUrl: json['profileImageUrl'],
      bio: json['bio'],
      languages: List<String>.from(json['languages'] ?? []),
      availability: Map<String, List<String>>.from(
        json['availability'] ?? {},
      ),
      consultationFee: (json['consultationFee'] ?? 0.0).toDouble(),
      location: json['location'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'hospital': hospital,
      'experience': experience,
      'rating': rating,
      'reviewCount': reviewCount,
      'profileImageUrl': profileImageUrl,
      'bio': bio,
      'languages': languages,
      'availability': availability,
      'consultationFee': consultationFee,
      'location': location,
      'phone': phone,
      'email': email,
    };
  }
}
