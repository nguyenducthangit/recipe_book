
class User {
  int id;
  String username;
  String email;
  String firtName;
  String lastName;
  String gender;
  String image;
  String token;

    User({
      required this.id,
      required this.username,
      required this.email,
      required this.firtName,
      required this.lastName,
      required this.gender,
      required this.image,
      required this.token,
    });
    User copyWith({
      int? id,
      String? username,
      String? email,
      String? firtName,
      String? lastName,
      String? gender,
      String? image,
      String? token,
    })=>User(
      id: id?? this.id,
      username: username??this.username,
      email: email??this.email,
      firtName: firtName??this.firtName,
      lastName: lastName??this.lastName,
      gender: gender??this.gender,
      image: image??this.image,
      token: token??this.token,
    );
    factory User.fromJson(Map<String,dynamic>json)=>User(
      id:json["id"],
      username: json["username"],
      email: json["email"],
      firtName: json["firtName"],
      lastName: json["lastName"],
      gender: json["gender"],
      image: json["image"],
      token: json["token"],

    );
    Map<String,dynamic>toJson()=>{
      "id":id,
      "username":username,
      "email":email,
      "firtName":firtName,
      "lastName":lastName,
      "gender":gender,
      "token":token,
    };
}