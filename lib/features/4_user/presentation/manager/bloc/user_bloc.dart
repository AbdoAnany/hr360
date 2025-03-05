
// User Bloc
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/4_user/presentation/manager/bloc/user_event.dart';
import 'package:hr360/features/4_user/presentation/manager/bloc/user_state.dart';

import '../../../../1_login/data/user_model.dart';
import '../../../data/repositories/FirebaseUserRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/4_user/presentation/manager/bloc/user_event.dart';
import 'package:hr360/features/4_user/presentation/manager/bloc/user_state.dart';
import '../../../../1_login/data/user_model.dart';
import '../../../data/repositories/FirebaseUserRepository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../1_login/data/user_model.dart';
import '../../../data/repositories/FirebaseUserRepository.dart';

enum UserStatus { initial, loading, success, error }

class UserState {
  final UserStatus status;
  final UserModel? user;
  final List<UserModel>? users;
  final String? errorMessage;

  UserState({
    required this.status,
    this.user,
    this.users,
    this.errorMessage,
  });

  UserState copyWith({
    UserStatus? status,
    UserModel? user,
    List<UserModel>? users,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class UserCubit extends Cubit<UserState> {
  final FirebaseUserRepository userRepository;

  UserCubit(this.userRepository) : super( UserState(status: UserStatus.initial));

  Future<void> createUser(UserModel user) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await userRepository.createUser(user);
      emit(state.copyWith(status: UserStatus.success, user: user));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> getAllUsers() async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final users = await userRepository.getAllUsers();
      emit(state.copyWith(status: UserStatus.success, users: users));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> getUser(String userId) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final user = await userRepository.getUser(userId);
      if (user != null) {
        emit(state.copyWith(status: UserStatus.success, user: user));
      } else {
        emit(state.copyWith(status: UserStatus.error, errorMessage: 'User not found'));
      }
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> updateUser(UserModel user) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await userRepository.updateUser(user);
      emit(state.copyWith(status: UserStatus.success, user: user));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> deleteUser(String userId) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await userRepository.deleteUser(userId);
      emit(state.copyWith(status: UserStatus.success));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> assignRole(String userId, String role) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await userRepository.assignRole(userId, role);
      final user = await userRepository.getUser(userId);
      if (user != null) {
        emit(state.copyWith(status: UserStatus.success, user: user));
      } else {
        emit(state.copyWith(status: UserStatus.error, errorMessage: 'User not found'));
      }
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> removeRole(String userId, String role) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await userRepository.removeRole(userId, role);
      final user = await userRepository.getUser(userId);
      if (user != null) {
        emit(state.copyWith(status: UserStatus.success, user: user));
      } else {
        emit(state.copyWith(status: UserStatus.error, errorMessage: 'User not found'));
      }
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, errorMessage: e.toString()));
    }
  }
}