import 'package:equatable/equatable.dart';

import '../../../../1_login/data/user_model.dart';

// User Events
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class CreateUser extends UserEvent {
  final UserModel user;

  const CreateUser(this.user);

  @override
  List<Object?> get props => [user];
}class AddUser extends UserEvent {
  final UserModel user;

  const AddUser(this.user);

  @override
  List<Object?> get props => [user];
}

class GetUser extends UserEvent {
  final int userId;

  const GetUser(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UpdateUser extends UserEvent {
  final UserModel user;

  const UpdateUser(this.user);

  @override
  List<Object?> get props => [user];
}

class DeleteUser extends UserEvent {
  final int userId;

  const DeleteUser(this.userId);

  @override
  List<Object?> get props => [userId];
}

class AssignRole extends UserEvent {
  final int userId;
  final String role;

  const AssignRole(this.userId, this.role);

  @override
  List<Object?> get props => [userId, role];
}

class RemoveRole extends UserEvent {
  final int userId;
  final String role;

  const RemoveRole(this.userId, this.role);

  @override
  List<Object?> get props => [userId, role];
}



class GetAllUsers extends UserEvent {
  const GetAllUsers();

  @override
  List<Object?> get props => [];
}class AddUserEvent extends UserEvent {
  const AddUserEvent({
    this.user,
  });
final UserModel? user;
  @override
  List<Object?> get props => [];
}

