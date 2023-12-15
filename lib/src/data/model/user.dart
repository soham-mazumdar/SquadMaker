class UserModel {
  int? id;
  String? name;
  String? image;
  String? gender;
  String? phone;
  String? dateOfBirth;
  String? country;

  UserModel({
    this.id,
    this.name,
    this.image,
    this.gender,
    this.phone,
    this.dateOfBirth,
    this.country,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = '${json['first_name']} ${json['last_name']}';
    image = json['avatar'];
    gender = json['gender'];
    phone = json['phone_number'];
    dateOfBirth = json['date_of_birth'];
    country = json['address']['country'];
  }
}
