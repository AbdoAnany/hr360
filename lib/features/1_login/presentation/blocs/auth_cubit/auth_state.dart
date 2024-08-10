part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class SettingsLoading extends AuthState {}

class SettingsSuccess extends AuthState {
  final SettingsModel settingsModel;

  SettingsSuccess({required this.settingsModel});
}

class SettingsFailure extends AuthState {
  final String? errMessage;

  SettingsFailure({this.errMessage});
}

class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthState {
  final String? errMessage;

  AuthFailure({this.errMessage});

  @override
  List<Object> get props => [errMessage ?? ''];
}

class AuthSuccessWithSocial extends AuthState {
  final UserModel user;

  AuthSuccessWithSocial({required this.user});

  @override
  List<Object> get props => [user];
}
