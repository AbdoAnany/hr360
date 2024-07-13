import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/features/1login/data/user_model.dart';
import 'package:hr360/features/1login/signup.dart';
import 'package:hr360/features/home/presentation/pages/pages/Employee/employees.dart';
import 'package:hr360/features/home/presentation/widgets/Mainbar.dart';
import 'package:hr360/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../di.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/keys.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../manager/home_bloc/home_bloc.dart';

class HomeControl {
  static Map<String, Widget> pages = {};
  static UserModel? userModelLogin;

  static Widget pageUi(PageType pageType) {
    switch (pageType) {
      case PageType.Dashboard:
//Welcome back, Barbara ☀️
        // return  ExampleDragAndDrop();
        return Employees();
      case PageType.chat:
        return Center(child: Text(PageType.chat.name));

      case PageType.Employees:
        return Employees();
      case PageType.report:
        return Center(child: Text(PageType.report.name));
      case PageType.category:
        return Center(child: Text(PageType.category.name));
      case PageType.Setting:
        return Center(child: Text(PageType.Setting.name));
      case PageType.profile:
        return SignUpScreen();

      default:
        return const Center(child: Text('default'));
    }
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    try {
      var tem = sl<TLocalStorage>().readData<UserModel>(AppKeys.userDataLogin);
      print(tem?.toJson());
      HomeControl.userModelLogin = tem;
    } catch (e) {
      print(e);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return Scaffold(
          //      appBar: AppBar(title: Text(state.newPage.name),),

          body: SizedBox(
            width: TSizes.screenWidth,
            height: TSizes.screenHeight,
            child: Row(
              children: [
                const MainBar(),
                VerticalDivider(
                  width: 2.r,
                  thickness: 2.r,
                  color: Theme.of(context).splashColor,
                ),
                Expanded(
                    child: PageFrame(
                  pageType: state.newPage,
                ))
              ],
            ),
          ),
        );
      }),
    );
  }
}

class PageFrame extends StatelessWidget {
  const PageFrame({super.key, required this.pageType});

  final PageType pageType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 108.h,
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 20.0.w,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Welcome back, ',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      TextSpan(
                        text:
                            '${HomeControl.userModelLogin?.data?.firsName} ${HomeControl.userModelLogin?.data?.lastName}',
                        style: const TextStyle(
                          //  fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: '☀',
                        style: TextStyle(
                          fontSize: 24.0.w,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Iconsax.setting,
                        color: AppColor.darkGrey,
                      ),
                    ),
                    SizedBox(
                      width: TSizes.sm8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.mark_email_unread_outlined,
                        color: AppColor.darkGrey,
                      ),
                    ),
                    SizedBox(
                      width: TSizes.sm8,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Iconsax.notification,
                        color: AppColor.darkGrey,
                      ),
                    ),
                    SizedBox(
                      width: TSizes.lg24,
                    ),
                    CircleAvatar(
                      radius: 40.r,
                    )
                  ],
                )
              ],
            ),
          )),
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        MainBarControl.currentPage.name,
                        style: TextStyle(
                          fontSize: 24.w,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            MainBarControl.currentPage.name,
                            style: TextStyle(
                              color: Color(0xffD9D9D9),
                              fontSize: 14.w,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Color(0xffD9D9D9),
                              radius: 4,
                            ),
                          ),
                          Text(
                            MainBarControl.currentPage.name,
                            style: TextStyle(
                              color: Color(0xffD9D9D9),
                              fontSize: 14.w,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Color(0xffD9D9D9),
                              radius: 4,
                            ),
                          ),
                          Text(
                            MainBarControl.currentPage.name,
                            style: TextStyle(
                              color: Color(0xffD9D9D9),
                              fontSize: 14.w,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  // Text(DateTime.now().toString()
                  //   ,       style:
                  //   TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.normal,
                  //   ),
                  // ),
                ]),
            Expanded(child: HomeControl.pageUi(pageType))
          ],
        ),
      ),
    );
  }
}
