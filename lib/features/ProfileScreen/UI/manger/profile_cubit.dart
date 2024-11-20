import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/1_login/data/user_model.dart';
import 'package:meta/meta.dart';

import '../../../4_user/data/repositories/FirebaseUserRepository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  // ProfileCubit(this.userRepository) : super(ProfileInitial());
  final FirebaseUserRepository userRepository=FirebaseUserRepository();
   UserModel? userProfile;
  // Private constructor
  ProfileCubit._() : super(ProfileInitial());
  // Singleton instance
  static ProfileCubit? _instance;
  // Factory constructor for singleton
  factory ProfileCubit(
      // FirebaseUserRepository userRepository
      ) =>
      _instance ??= ProfileCubit._();

  static ProfileCubit get(context) => BlocProvider.of(context);
  updateState(ProfileState profileState) => emit(profileState);

  getUserProfileDate({String? userId}) async {
    updateState(ProfileLoading());
    try {
      userProfile  =await userRepository.getUser(userId??'18');
      updateState(ProfileLoaded(userProfile));
    } catch (e) {
      updateState(ProfileError('Failed to load tasks: $e'));
    }

  }

 String getFullName()  {
    return '${userProfile?.firsName} ${userProfile?.lastName}';
  }

  Future<List<UserModel>> getAllUserProfileDate() async {

    updateState(ProfileLoading());
    try {
    final  userProfileList  =await userRepository.getAllUsers();
      updateState(ProfileListLoaded(userProfileList));
      return userProfileList;
    } catch (e) {
      updateState(ProfileError('Failed to load tasks: $e'));
      return [];
    }

  }


}
