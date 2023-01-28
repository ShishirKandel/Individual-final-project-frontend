class DoctorUser {
  String? id;
  String? fname;
  String? lname;
  String? gender;
  int? age;
  String? username;
  String? email;
  int? phone;
  String? address;
  String? department;
  String? picture;
  String? password;
  double? lat;
  double? lng;

  DoctorUser({
    this.id,
    this.fname,
    this.lname,
    this.gender,
    this.age,
    this.username,
    this.email,
    this.phone,
    this.address,
    this.department,
    this.picture,
    this.lat,
    this.lng,
    this.password,
  });

  // converting to dart object from server json file
  factory DoctorUser.fromJson(Map<String, dynamic> json) => DoctorUser(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        gender: json["gender"],
        age: json["age"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        department: json["department"],
        picture: json["picture"],
        password: json["password"],
        lng: json["lng"],
        lat: json["lat"],
      );

  // converting to json format from dart object
  Map<String, dynamic> toJson() => {
        "id": id,
        "fname": fname,
        "lname": lname,
        "gender": gender,
        "age": age,
        "username": username,
        "email": email,
        "phone": phone,
        "address": address,
        "department": department,
        "picture": picture,
        "password": password,
        "lat" : lat,
        "lng" : lng,
      };
}
