// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hr360/core/utils/constants/sizes.dart';
// import 'package:hr360/features/1_login/data/user_model.dart';
// import 'package:hr360/features/home/presentation/pages/pages/Employee/employees.dart';
// import 'package:hr360/features/home/presentation/pages/pages/dashbord_page.dart';
// import 'package:hr360/features/home/presentation/widgets/Mainbar.dart';
//
// import '../../../../app.dart';
// import '../../../../core/utils/constants/keys.dart';
// import '../../../../core/utils/local_storage/storage_utility.dart';
// import '../../../../di.dart';
// import '../../../ProfileScreen/UI/ProfileScreen.dart';
// import '../manager/home_bloc/home_bloc.dart';
//
// class HomeControl {
//   static UserLoginModel? userModelLogin;
// }
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   void initState() {
//     super.initState();
//     // try {
//     //   var tem = sl<TLocalStorage>().readData(AppKeys.userDataLogin);
//     //   HomeControl.userModelLogin = UserLoginModel.fromJson(tem);
//     // } catch (e) {
//     //   print('Error loading user data: $e');
//     // }
//   //  HomeCubit.get(context).getDataFromServer();
//
//     HomeControl.userModelLogin = UserLoginModel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit(),
//       child: BlocBuilder<HomeCubit, HomeState>(
//         buildWhen: (previous, current) => current is ChangePageState,
//         builder: (context, state) {
//           final homeCubit = HomeCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(),
//      //       key: Get.scaffoldHomeState,
//             body: SizedBox(
//               width: TSizes.screenWidth,
//               height: TSizes.screenHeight,
//               child: Row(
//                 children: [
//                   const MainBar(),
//                   VerticalDivider(
//                     width: 2,
//                     thickness: 2,
//                     color: Theme.of(context).splashColor,
//                   ),
//
//                   // Expanded(
//                   //   child: Navigator(
//                   //     onGenerateRoute: onGenerateRoute,
//                   //     key: Get.navigatorKey,
//                   //   ),
//                   // )
//                   Expanded(
//                     child:
//
//                     Navigator(
//                       key: HomeCubit.navigatorKey,
//                       onGenerateRoute: (RouteSettings settings) {
//                         WidgetBuilder builder;
//                         var data=settings.arguments;
//                         print("settings.name");
//                         print(data);
//                         print(settings.name);
//                         switch (settings.name) {
//                           case '/dashboard':
//                             builder = (BuildContext _) => const DashBordPage();
//                             break;
//                           case '/employees':
//                             builder = (BuildContext _) => const Employees();
//                             break;
//                             case '/chat':
//                             builder = (BuildContext _) => const Center(child: Text('chat'),);
//                             break;
//                             case '/report':
//                             builder = (BuildContext _) => const Center(child: Text('report'),);
//                             case '/category':
//                             builder = (BuildContext _) => const Center(child: Text('category'),);
//                             break;
//                           case '/profile':
//                             print("data ${data}");
//                             builder = (BuildContext _) => ProfileScreen(
//                                   userDetails: data as UserModel,
//                                 );
//                             break;
//                           default:
//                             builder = (BuildContext _) =>
//                                 const Center(child: Text('Default Page'));
//                         }
//                         return PageRouteBuilder(
//                           pageBuilder: (context, animation, secondaryAnimation) => builder(context),
//                           transitionDuration: Duration(seconds: 1),
//                           reverseTransitionDuration: Duration(seconds: 1),
//                           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                             const begin = Offset(1.0, 0.0); // Start position
//                             const end = Offset.zero; // End position
//                             const curve = Curves.easeInOut; // Animation curve
//
//                             var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//                             var offsetAnimation = animation.drive(tween);
//
//                             return SlideTransition(
//                               position: offsetAnimation,
//                               child: child,
//                             );
//                           },
//                         );
//                       },
//                       initialRoute: '/dashboard', // Set the initial route
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// // class MainBar extends StatelessWidget {
// //   const MainBar({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         ListTile(
// //           title: const Text('Dashboard'),
// //           onTap: () {
// //             Navigator.of(context).pushNamed('/dashboard');
// //           },
// //         ),
// //         ListTile(
// //           title: const Text('Employees'),
// //           onTap: () {
// //             Navigator.of(context).pushNamed('/employees');
// //           },
// //         ),
// //         ListTile(
// //           title: const Text('Profile'),
// //           onTap: () {
// //             Navigator.of(context).pushNamed('/profile');
// //           },
// //         ),
// //         // Add more navigation items as needed
// //       ],
// //     );
// //   }
// // }
