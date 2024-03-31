import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/home/presentation/pages/pages/Employee/employees.dart';
import 'package:hr360/features/home/presentation/widgets/Mainbar.dart';
import 'package:hr360/utils/constants/sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../manager/home_bloc/home_bloc.dart';

class HomeControl {
  static Map<String, Widget> pages = {};

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
        return Center(child: Text(PageType.profile.name));

      default:
        return const Center(child: Text('default'));
    }
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(

          builder:  (context, state) {


            return SafeArea(
              child: Scaffold(
          //      appBar: AppBar(title: Text(state.newPage.name),),

                body: SizedBox(
                  width: TSizes.screenWidth,
                  height: TSizes.screenHeight,
                  child: Row(
                    children: [
                      const MainBar(),
                      VerticalDivider(
                        width: 2,
                        thickness: 2,
                        color: Theme.of(context).splashColor,
                      ),
                      Expanded(child: PageFrame(pageType: state.newPage,))

                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

class PageFrame extends StatelessWidget {
   const PageFrame({super.key,required this.pageType});
 final PageType pageType;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(      appBar: AppBar(
        toolbarHeight: 88,
        title: Padding(
          padding:  const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text:  const TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Welcome back, ',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: 'Barbara ',
                      style: TextStyle(
                        //  fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: '☀️',
                      style: TextStyle(
                        fontSize: 24.0,

                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),

              Row(children: [
                InkWell(
                  onTap: (){},
                  child: Icon(Iconsax.setting, color: AppColor.black,),
                ),
                SizedBox(width: TSizes.sm8,),
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.mark_email_unread_outlined, color: AppColor.black,),
                )

                ,                  SizedBox(width: TSizes.sm8,), InkWell(
                  onTap: (){},
                  child: Icon(Iconsax.notification, color: AppColor.black,),
                ),
                SizedBox(width: TSizes.lg24,),
                CircleAvatar(radius: 20,)
              ],)
            ],
          ),
        )),
      backgroundColor: AppColor.white,
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal:  24),
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
                      Text(MainBarControl.currentPage.name
                        ,       style:
                        TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),SizedBox(height: 8,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Text(MainBarControl.currentPage.name
                            ,       style:
                            TextStyle(color: Color(0xffD9D9D9),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,

                            ),
                          ),  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(backgroundColor: Color(0xffD9D9D9),radius: 4,),
                          ),     Text(MainBarControl.currentPage.name
                            ,       style:
                            TextStyle(color: Color(0xffD9D9D9),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(backgroundColor: Color(0xffD9D9D9),radius: 4,),
                          ),     Text(MainBarControl.currentPage.name
                            ,       style:
                            TextStyle(color: Color(0xffD9D9D9),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,

                            ),
                          ),

                        ],
                      )
                    ],
                  ),

                  Text(DateTime.now().toString()
                    ,       style:
                    TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),



                ]),
            Expanded(child: HomeControl.pageUi(pageType))
          ],
        ),
      ),
      );
  }
}

