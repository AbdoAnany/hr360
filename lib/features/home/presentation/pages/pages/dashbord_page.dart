

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/home/presentation/widgets/Mainbar.dart';
import 'package:hr360/utils/constants/sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/features/home/presentation/pages/pages/home_appbar.dart';
import 'package:hr360/features/home/presentation/pages/pages/email_field.dart';
import 'package:hr360/features/home/presentation/pages/pages/home_search_bar.dart';
import 'package:hr360/features/home/presentation/pages/pages/lsit_widget.dart';
import 'package:hr360/features/home/presentation/pages/pages/password_field.dart';



import '../../../../../utils/theme/widget_themes/switch_theme.dart';
import '../../../../../utils/theme/widget_themes/text_theme.dart';
import '../../widgets/InfoCard.dart';
import 'home_appbar.dart';

class DashBordPage extends StatelessWidget {
  const DashBordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
    SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              const HomeAppbar(),
              SizedBox(height: 20,),
              //   Divider(height:2,thickness: 2,color: Theme.of(context).splashColor,),

              SizedBox(height: 20,),
              const HomeSearchBar(),
              SizedBox(height: 20,),
              const EmailField(),
              SizedBox(height: 20,),
              const PasswordField(),
              SizedBox(height: 20,),
              const WidgetList(),
              const   MySwitchTheme(),
              SizedBox(height: 20,),
              InfoCard(
                title: 'Total Registry',
                value: '99',
                bezierCOlor: Colors.orange,
                onTap: (){},
                topColor: Colors.deepOrangeAccent,
              ),

              SizedBox(height: 20,),
              Text('Display Large    ${TTextTheme.displayLarge?.fontSize?.w.toStringAsFixed(1)}',style: TTextTheme.displayLarge),
              SizedBox(height: 10,),
              Text('Display Medium   ${ TTextTheme.displayMedium?.fontSize?.w.toStringAsFixed(1)}',style: TTextTheme.displayMedium),
              SizedBox(height: 10,),
              Text('Display Small    ${Theme.of(context).textTheme.displaySmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.displaySmall),

              SizedBox(height: 20,),
              Text('Headline Large   ${Theme.of(context).textTheme.headlineLarge?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.headlineLarge),
              Text('Headline Medium  ${Theme.of(context).textTheme.headlineMedium?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.headlineMedium),
              Text('Headline Small    ${Theme.of(context).textTheme.headlineSmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.headlineSmall),

              SizedBox(height: 20,),
              Text('Title Large   ${Theme.of(context).textTheme.titleLarge?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.titleLarge),
              Text('Title Medium  ${Theme.of(context).textTheme.titleMedium?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.titleMedium),
              Text('Title Small   ${Theme.of(context).textTheme.titleSmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.titleSmall),

              SizedBox(height: 20,),
              Text('Body Large   ${Theme.of(context).textTheme.bodyLarge?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.bodyLarge),
              Text('Body Medium  ${Theme.of(context).textTheme.bodyMedium?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.bodyMedium),
              Text('Body Small   ${Theme.of(context).textTheme.bodySmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 20,),

              Text('Label Large   ${Theme.of(context).textTheme.labelLarge?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.labelLarge),
              Text('Label Medium   ${Theme.of(context).textTheme.labelMedium?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.labelMedium),
              Text('Label Small   ${Theme.of(context).textTheme.labelSmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.labelSmall),

            ],
          ),
        ),
      )
    ;
  }
}
