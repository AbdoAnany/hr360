class UserLoginModel {
  UserModel? data;
  String? token;

  UserLoginModel({this.data, this.token});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['token'] = token;
    return data;
  }
}

//[{"id":1,"user_iduser_id":18,"first_name":"Admin","last_name":"User","email":"admin@example.com",
// "phone":"1234567890","address":"123 Admin St, Admin City, Admin State",
// "national_id":"A12345678","gender":"male","roles":"admin","state":"active"},
class UserModel {
  late int? id;
  late int? userId;
  String? firsName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? nationalId;
  String? gender;
  String? avatar;
  String? roles;
  String? state;
  String? birthDate;

  UserModel(
      { this.id,
       this.userId,
      this.firsName = '',
      this.lastName = '',
      this.email,
      this.phone,
      this.address,
      this.gender,
      this.birthDate,
      this.nationalId,
      this.avatar,
      this.roles,
      this.state});

//[{"id":1,"user_id":18,"first_name":"Admin","last_name":"User","email":"admin@example.com",
// "phone":"1234567890","address":"123 Admin St, Admin City, Admin State",
// "national_id":"A12345678","gender":"male","roles":"admin","state":"active"},
  UserModel.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    userId = json['user_id'];
    firsName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    nationalId = json['national_id'];
    gender = json['gender'];
    roles = json['roles'];
    state = json['state'];
    birthDate = json['birth_date'].toString().replaceAll('Z', "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['first_name'] = this.firsName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['national_id'] = this.nationalId;
    data['gender'] = this.gender;
    data['roles'] = this.roles;
    data['state'] = this.state;
    data['birth_date'] = birthDate.toString().replaceAll('Z', "");

    return data;
  }
}
