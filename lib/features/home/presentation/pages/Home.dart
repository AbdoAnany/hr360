import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/home/presentation/pages/pages/dashbord_page.dart';
import 'package:hr360/features/home/presentation/pages/pages/dragdrop.dart';
import 'package:hr360/features/home/presentation/widgets/Mainbar.dart';
import 'package:hr360/utils/constants/sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../di.dart';
import '../manager/home_bloc/home_bloc.dart';

class HomeControl {
  static Map<String, Widget> pages = {};

  static Widget pageUi(PageType pageType) {
    switch (pageType) {
      case PageType.dashboard:

       // return  ExampleDragAndDrop();
        return Center(child:ketStack.currentWidget);
        return Center(child: Text(PageType.dashboard.name));
      case PageType.chat:
       // return     MyDragAndDropWidget();
        return Center(child: Text(PageType.chat.name));

      case PageType.users:
        return Center(child: Text(PageType.users.name));
      case PageType.report:
        return Center(child: Text(PageType.report.name));
      case PageType.category:
        return Center(child: Text(PageType.category.name));
      case PageType.setting:
        return Center(child: Text(PageType.setting.name));
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
                appBar: AppBar(title: Text(state.newPage.name),),

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
                          child: HomeControl.pageUi(state.newPage)),

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
