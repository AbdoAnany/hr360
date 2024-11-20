part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

 class ProfileInitial extends ProfileState {}

class ProfileAdd extends ProfileState {}
class ProfileUpdate extends ProfileState {}
class ProfileDelete extends ProfileState {}
class ProfileGet extends ProfileState {}
class ProfileGetAll extends ProfileState {}
class ProfileGetAllById extends ProfileState {}
class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

class ProfileLoaded extends ProfileState {
  final UserModel? userModel;

  ProfileLoaded(this.userModel);
}class ProfileListLoaded extends ProfileState {
  final List<UserModel>? userModelList;

  ProfileListLoaded(this.userModelList);
}
class ProfileSuccess extends ProfileState {
  final String message;

  ProfileSuccess(this.message);
}