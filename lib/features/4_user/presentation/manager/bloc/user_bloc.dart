
// User Bloc
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/4_user/presentation/manager/bloc/user_event.dart';
import 'package:hr360/features/4_user/presentation/manager/bloc/user_state.dart';

import '../../../../1_login/data/user_model.dart';
import '../../../data/repositories/FirebaseUserRepository.dart';
import '../../../domain/repositories/UserRepository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseUserRepository userRepository;
  // UserBloc(this.userRepository) : super(UserInitial());

  static UserBloc get(BuildContext context) => BlocProvider.of(context);

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<CreateUser>((event, emit) async {
      try {
        emit(UserLoading());
        await userRepository.createUser(event.user);
        emit(UserLoaded(event.user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
    on<GetAllUsers>((event, emit) async {
      try {
        emit(UserLoading());
        List<UserModel> users = await userRepository.getAllUsers();
        emit(UsersLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
    on<GetUser>((event, emit) async {
      try {
        print(event.userId);
        emit(UserLoading());
        UserModel? user = await userRepository.getUser(event.userId);
        if (user != null) {
          print(user.firsName);
          emit(UserLoaded(user));
        } else {
          emit(const UserError("User not found"));
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<UpdateUser>((event, emit) async {
      try {
        emit(UserLoading());
        await userRepository.updateUser(event.user);
        emit(UserLoaded(event.user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<DeleteUser>((event, emit) async {
      try {
        emit(UserLoading());
        await userRepository.deleteUser(event.userId);
        emit(UserInitial());
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<AssignRole>((event, emit) async {
      try {
        emit(UserLoading());
        await userRepository.assignRole(event.userId, event.role);
        UserModel? user = await userRepository.getUser(event.userId);
        if (user != null) {
          emit(UserLoaded(user));
        } else {
          emit(UserError("User not found"));
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<RemoveRole>((event, emit) async {
      try {
        emit(UserLoading());
        await userRepository.removeRole(event.userId, event.role);
        UserModel? user = await userRepository.getUser(event.userId);
        if (user != null) {
          emit(UserLoaded(user));
        } else {
          emit(UserError("User not found"));
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
