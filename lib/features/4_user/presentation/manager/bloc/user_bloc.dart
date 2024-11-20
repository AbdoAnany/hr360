
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
  bool _isClosed = false; // Flag to track if Bloc is closed

  UserBloc(this.userRepository) : super(UserInitial()) {
    // Handle CreateUser event
    on<CreateUser>((event, emit) async {
      if (_isClosed) return; // Avoid emitting if Bloc is closed
      try {
        emit(UserLoading());
        await userRepository.createUser(event.user);
        emit(UserLoaded(event.user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
    on<AddUser>((event, emit) async {
      if (_isClosed) return; // Avoid emitting if Bloc is closed
      try {
        emit(UserLoading());
        await userRepository.addUser(event.user);
        emit(UserLoaded(event.user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    // Handle GetAllUsers event
    on<GetAllUsers>((event, emit) async {
      if (_isClosed) return;
      try {
        emit(UserLoading());
        List<UserModel> users = await userRepository.getAllUsers();
        emit(UsersLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    // Handle GetUser event
    on<GetUser>((event, emit) async {
      if (_isClosed) return;
      try {
        emit(UserLoading());
        UserModel? user = await userRepository.getUser(event.userId.toString());
        if (user != null) {
          emit(UserLoaded(user));
        } else {
          emit(const UserError("User not found"));
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    // Handle UpdateUser event
    on<UpdateUser>((event, emit) async {
      if (_isClosed) return;
      try {
        emit(UserLoading());
        await userRepository.updateUser(event.user);
        emit(UserLoaded(event.user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    // Handle DeleteUser event
    on<DeleteUser>((event, emit) async {
      if (_isClosed) return;
      try {
        emit(UserLoading());
        await userRepository.deleteUser(event.userId.toString());
        emit(UserInitial());
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    // Handle AssignRole event
    on<AssignRole>((event, emit) async {
      if (_isClosed) return;
      try {
        emit(UserLoading());
        await userRepository.assignRole(event.userId, event.role);
        UserModel? user = await userRepository.getUser(event.userId.toString());
        if (user != null) {
          emit(UserLoaded(user));
        } else {
          emit(UserError("User not found"));
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    // Handle RemoveRole event
    on<RemoveRole>((event, emit) async {
      if (_isClosed) return;
      try {
        emit(UserLoading());
        await userRepository.removeRole(event.userId, event.role);
        UserModel? user = await userRepository.getUser(event.userId.toString());
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

  @override
  Future<void> close() async {
    _isClosed = true; // Mark Bloc as closed
    return super.close();
  }
}

