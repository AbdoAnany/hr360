import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String? name;
  final String? email;
  final String? avatar;
  final String? phone;
  final String? token;
  final String? gender;

  UserEntity(
      {this.gender,
      required this.phone,
      required this.token,
      required this.id,
      required this.name,
      required this.email,
      required this.avatar});

  @override
  List<Object> get props => [avatar!, email!, phone!, name!, id, token!];
}
