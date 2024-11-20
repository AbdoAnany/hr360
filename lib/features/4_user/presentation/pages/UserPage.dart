import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/home/presentation/pages/pages/Employee/employees.dart';

import '../../../../di.dart';
import '../../../ProfileScreen/UI/ProfileScreen.dart';
import '../manager/bloc/user_bloc.dart';
import '../manager/bloc/user_event.dart';
import '../manager/bloc/user_state.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>(),
      child: UserView(),
    );
  }
}

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
  //  sl<UserBloc>().add(GetUser());
  //   sl<UserBloc>().add(CreateUser(
  //   UserModel.fromJson(  damyList.first)
  //   ));

    context.read<UserBloc>().add(GetUser(damyList[0]['user_id']));
    super.initState();
  }
  @override
  void dispose() {
    if (! getIt<UserBloc>().isClosed) {
      getIt<UserBloc>().close();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return ProfileScreen(userDetails: state.user);
        } else if (state is UserError) {
          return Center(child: Text("Error: ${state.message}"));
        }
        return const Center(child: Text("Welcome to User Management"));
      },
    );
  }
}
