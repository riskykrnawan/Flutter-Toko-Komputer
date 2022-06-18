class MyUser {
  String image;
  String name;
  String email;
  String phone;
  String address;

  // Constructor
  MyUser({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  MyUser copy({
    String? imagePath,
    String? name,
    String? phone,
    String? email,
    String? about,
  }) =>
      MyUser(
        image: imagePath ?? this.image,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: about ?? this.address,
      );

  static MyUser fromJson(Map<String, dynamic> json) => MyUser(
        image: json['imagePath'],
        name: json['name'],
        email: json['email'],
        address: json['about'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': image,
        'name': name,
        'email': email,
        'about': address,
        'phone': phone,
      };
}
