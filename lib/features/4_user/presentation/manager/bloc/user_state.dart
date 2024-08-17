
// User State
import 'package:equatable/equatable.dart';

import '../../../../1_login/data/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;

  const UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}






class UsersLoaded extends UserState {  // For loading multiple users
  final List<UserModel> users;

  const UsersLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

