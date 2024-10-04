
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/feature/home/data/repositories/ItemRepository.dart';
import 'package:hr360/feature/home/domain/use_cases/AddItemUseCase.dart';
import 'package:iconsax/iconsax.dart';

import 'core/color.dart';
import 'core/const.dart';
import 'feature/home/domain/use_cases/GetItemsUseCase.dart';
import 'feature/home/presentation/manager/ItemBloc.dart';
import 'feature/home/presentation/manager/ItemEvent.dart';
import 'feature/home/presentation/pages/BodyView.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firestore = FirebaseFirestore.instance;
  final itemRepository = ItemRepository(firestore);
  final getItemsUseCase = GetItemsUseCase(itemRepository);
  final addItemUseCase = AddItemUseCase(itemRepository);

  runApp(MyApp(getItemsUseCase: getItemsUseCase,addItemUseCase: addItemUseCase,));
}

class MyApp extends StatelessWidget {
  final GetItemsUseCase getItemsUseCase;
  final AddItemUseCase addItemUseCase;

  const MyApp({Key? key, required this.getItemsUseCase ,required this.addItemUseCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemBloc>(
      create: (_) => ItemBloc(getItemsUseCase,addItemUseCase)..add(FetchItemsEvent()),
      child: MaterialApp(
      title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          scaffoldBackgroundColor: AppColors.blackColor,
          useMaterial3: true,
        ),
      home:  ResponsiveNavBar(),
      ),
    );
  }
}


class ResponsiveNavBar extends StatelessWidget {
  const ResponsiveNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1100) {
            return const Column(
              children: [
                DesktopNavBar(horizontal: 60,),
                BodyView(horizontal: 60,)
              ],
            );
          } else if (constraints.maxWidth > 600) {
            return const Column(
              children: [
                TabletNavBar(horizontal: 16,),
                BodyView(horizontal: 40,)
              ],
            );

          } else {
            return const Column(
              children: [
                MobileNavBar(horizontal: 60,),
                BodyView(horizontal: 16,)
              ],
            );

          }
        },
      ),
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({super.key, required this.horizontal});
 final double horizontal ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding:  EdgeInsets.symmetric(horizontal: horizontal, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildNavItems(),
              _buildUserSection(),
            ],
          ),
        ],
      ),
    );
  }
}

class TabletNavBar extends StatelessWidget {
  const TabletNavBar({super.key, required this.horizontal});
  final double horizontal ;
  @override
  Widget build(BuildContext context) {
    return Container(

      padding:  EdgeInsets.symmetric(horizontal: horizontal, vertical: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogo(),
              _buildUserSection(),
            ],
          ),
          const SizedBox(height: 10),
          _buildNavItems(),
        ],
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key, required this.horizontal});
  final double horizontal ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Row(
        children: [
          SizedBox(width: 12,),
          IconButton(icon: const Icon(Icons.menu,color: AppColors.whiteColor,size: 25,), onPressed: () {}),
          SizedBox(width: 16,),
          _buildLogo(),
          Spacer(),

          Container(height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            // toolbarHeight:  40,
            //   backgroundColor: Colors.black,
            //   title:
              children: [
                SizedBox(width: 16,),
                IconButton(icon: const Icon(Iconsax.setting,color: AppColors.whiteColor,), onPressed: () {}),
                IconButton(icon: const Icon(Iconsax.notification,color: AppColors.whiteColor,), onPressed: () {}),
                SizedBox(height:22,child: VerticalDivider(color: AppColors.dividerColor,width: 24,)),

                _buildUserAvatar(),
                SizedBox(width: 32,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildLogo() {
  return Image.asset(AppConst.appLogo, height: 40, width: 82);
}

Widget _buildNavItems() {
  return const Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      NavBarItem('Items'),
      SizedBox(width: 32),
      NavBarItem('Pricing'),
      SizedBox(width: 32),
      NavBarItem('Info'),
      SizedBox(width: 32),
      NavBarItem('Tasks'),
      SizedBox(width: 32),
      NavBarItem('Analytics'),
    ],
  );
}

Widget _buildUserSection() {
  return Row(
    children: [
      Container(color: AppColors.dividerColor,
        width: 1,height: 22,
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
      ),
      const Icon(Icons.notifications_outlined, color: Colors.white),
      const SizedBox(width: 24),
      const Icon(Icons.settings_outlined, color: Colors.white),
      Container(color: AppColors.dividerColor,
        width: 1,height: 22,
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
      ),
      _buildUserAvatar(),
      const SizedBox(width: 12),
      const Text('John Doe', style: TextStyle(color: Colors.white)),
      const Icon(Icons.arrow_drop_down, color: Colors.white),
    ],
  );
}

Widget _buildUserAvatar() {
  return const CircleAvatar(radius: 30,
    backgroundImage: NetworkImage(AppConst.profile),
  );
}

class NavBarItem extends StatelessWidget {
  final String text;

  const NavBarItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyle.titleStyle,
    );
  }
}

// class BodyView extends StatelessWidget {
//   const BodyView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 60.0,vertical: 24),
//               child: Row(
//                 mainAxisAlignment:MainAxisAlignment.start,
//                 children: [
//                   Expanded(child: Text('Items', style: AppStyle.headingStyle,)),
//
//                   CircleAvatar(
//                     backgroundColor: AppColors.secondaryBgColor,
//                     child: Icon(Iconsax.setting_44, color: AppColors.whiteColor,),
//                   ),
//                   Container(color: AppColors.dividerColor,
//                   width: 1,height: 48,
//                   margin: const EdgeInsets.symmetric(horizontal: 14.0),
//                   ),
//                   ElevatedButton.icon(
//                     label: Text('Add a New Item', style: AppStyle.titleBlackStyle),
//                     icon: Icon(Iconsax.add, color: AppColors.blackColor),
//                     style: ButtonStyle(
//                       padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0)),
//                       backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
//                     ),
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (_) => BlocProvider.value(
//                           value: BlocProvider.of<ItemBloc>(context),
//                           child: AddItemDialog(),
//                         ),
//                       );
//                     },
//                   )
//
//
//                 ],
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 60.0,vertical: 12),
//               child: Wrap(
//
//                 crossAxisAlignment: WrapCrossAlignment.start,
//                 alignment: WrapAlignment.start,
//                 runAlignment: WrapAlignment.start,
//                 runSpacing: 16,
//                 spacing: 16,
//                 children: listItemCards.map((e)=> ItemCard(item:e)).toList(),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }








