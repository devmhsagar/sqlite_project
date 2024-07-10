class User {
  int? id;
  String name;
  String mobile;
  String? photo;
  int age;
  String gender;
  String address;

  User({
    this.id,
    required this.name,
    required this.mobile,
    this.photo,
    required this.age,
    required this.gender,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'photo': photo,
      'age': age,
      'gender': gender,
      'address': address,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      mobile: map['mobile'],
      photo: map['photo'],
      age: map['age'],
      gender: map['gender'],
      address: map['address'],
    );
  }
}
