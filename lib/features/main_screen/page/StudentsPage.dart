// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hr360/features/4_user/presentation/manager/bloc/user_event.dart';
//
// import '../../../di.dart';
// import '../../4_user/presentation/manager/bloc/user_bloc.dart';
// import '../../4_user/presentation/manager/bloc/user_state.dart';
// import '../../home/presentation/pages/pages/Employee/employees.dart';
//
// class StudentsPage extends StatelessWidget {
//   const StudentsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//    return BlocProvider(
//     create: (context) => sl<UserBloc>(),
//     child: const Scaffold(
//      //   appBar: AppBar(title: Text("User Management")),
//      body: StudentsPageView(),
//     ),
//    );
//   }
// }
//
// class StudentsPageView extends StatefulWidget {
//   const StudentsPageView({super.key});
//
//   @override
//   State<StudentsPageView> createState() => _StudentsPageState();
// }
//
// class _StudentsPageState extends State<StudentsPageView> {
//  @override
//   void initState() {
//   sl<UserBloc>().add(const GetAllUsers(  ));
//
//
//     super.initState();
//   }
//  @override
//  Widget build(BuildContext context) {
//   return BlocBuilder<UserBloc, UserState>(
//    builder: (context, state) {
//     if (state is UserLoading) {
//      return const Center(child: CircularProgressIndicator());
//     } else if (state is UsersLoaded) {
//      return ListView.builder(
//       itemCount: state.users.length,
//       itemBuilder: (context, index) {
//        final user = state.users[index];
//        return ListTile(
//         title: Text(user.firsName ?? "No First Name"),
//         subtitle: Text(user.email ?? "No Email"),
//        );
//       },
//      );
//     } else if (state is UserError) {
//      return Center(child: Text("Error: ${state.message}"));
//     }
//     return const Center(child: Text("No Users Available"));
//    },
//   );
//  }
// }