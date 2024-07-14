
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/features/1login/data/user_model.dart';
import 'package:hr360/features/home/presentation/manager/home_bloc/home_bloc.dart';
import 'package:hr360/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/error/failure.dart';

class AttendanceGridView extends StatefulWidget {
  AttendanceGridView({Key? key}) : super(key: key);

  @override
  State<AttendanceGridView> createState() => _AttendanceGridViewState();
}

class _AttendanceGridViewState extends State<AttendanceGridView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context,s) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  AttendanceHeaderItem(
                    title: 'Search by name, role, department...',
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  AttendanceHeaderItem(
                    title: 'Filter',
                    icon: Iconsax.filter_search,
                  ),
                  Spacer(),
                  AttendanceHeaderItem(
                    title: 'All Departments',
                    icon: Iconsax.arrow_bottom,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  AttendanceHeaderItem(
                    title: '13 Jan, 2024',
                    icon: Iconsax.calendar_1,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  AttendanceHeaderItem(
                    title: 'Export CSV',
                    icon: Iconsax.export,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 22.h),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          "ID",
                          style: TextStyle(fontSize: 16.w, color: Colors.black),
                        )),
                    Expanded(
                        flex: 6,
                        child: Text(
                          "Name",
                          style: TextStyle(fontSize: 16.w, color: Colors.black),
                        )),
                    Expanded(
                        flex: 4,
                        child: Text(
                          "Address",
                          style: TextStyle(fontSize: 16.w, color: Colors.black),
                        )),
                    Expanded(
                        flex: 4,
                        child: Text(
                          "Role",textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.w, color: Colors.black),
                        )),
                    Expanded(
                        flex: 4,
                        child: Text(
                          "Status",
                          style: TextStyle(fontSize: 16.w, color: Colors.black),
                        )),
                    Expanded(
                        flex: 4,
                        child: Text(
                          "Gender",
                          style: TextStyle(fontSize: 16.w, color: Colors.black),
                        )),
                    Expanded(
                        flex: 4,
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: 16.w, color: Colors.black),
                        )),
                    Expanded(
                        flex: 3,
                        child: Text(
                          "Phone",
                          style: TextStyle(fontSize: 16.w, color: Colors.black),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 8.h),

              FutureBuilder(

                  future: HomeCubit.get(context).getDataFromServer(),
                  builder: (c,snapshot){
print(snapshot.connectionState);
print(snapshot.hasData);
print(snapshot.hasError);
switch(snapshot.connectionState){

  case ConnectionState.none:
    return   const Center(
      child: Text("Not Date Found",style: TextStyle(color: AppColor.textPrimary),),
    );
  case ConnectionState.waiting:
  return   const Center(
    child: CircularProgressIndicator()
  );
  case ConnectionState.active:
  case ConnectionState.done:
    print('ssssssssssss   '+snapshot.data.toString());
List<UserDetails> userDetailsList= (snapshot.data as List).map<UserDetails>((e)=>UserDetails.fromJson(e)).toList();
if(userDetailsList.isEmpty) {
  return   const Center(
  child: Text("Not Date Found",style: TextStyle(color: AppColor.textPrimary),),
);
}
return    Expanded(
  child: ListView.separated(shrinkWrap: true,
      itemCount: userDetailsList.length,
      itemBuilder: (c, i) {
        return AttendanceBodyItem(item: userDetailsList[i],);
      },
      separatorBuilder: (c, i) => Divider(
        color: Colors.black.withOpacity(.2),
      ),
    ),
);
}
                    //    snapshot.data?.fold((e){
                    //
                    //   String? message=(e as ServerFailure).message;
                    //   return   Center(
                    //     child: Text(message??"Error !!!",style: TextStyle(color: AppColor.textPrimary),),
                    //   );
                    //
                    // },(data){
                    // List<UserDetails> userDetailsList= (data as List).map<UserDetails>((e)=>UserDetails.fromJson(e)).toList();
                    // return    ListView.separated(
                    //     itemCount: userDetailsList.length,
                    //     itemBuilder: (c, i) {
                    //       return AttendanceBodyItem(item: userDetailsList[i],);
                    //     },
                    //     separatorBuilder: (c, i) => Divider(
                    //       color: Colors.black.withOpacity(.2),
                    //     ),
                    //   );
                    //
                    // });



                  }),
              // Container(
              //   height: 432.h,
              //   child: ListView.separated(
              //     itemCount: 12,
              //     itemBuilder: (c, i) {
              //       return AttendanceBodyItem();
              //     },
              //     separatorBuilder: (c, i) => Divider(
              //       color: Colors.black.withOpacity(.2),
              //     ),
              //   ),
              // )
            ],
          ),
        );
      }
    );
  }
}

class AttendanceHeaderItem extends StatelessWidget {
  const AttendanceHeaderItem(
      {Key? key, this.title = "", this.icon = Iconsax.activity})
      : super(key: key);

// 'Search by name, role, department...'
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        //  color : Color.fromRGBO(33, 34, 45, 1),
        border: Border.all(
          color: Color.fromRGBO(0, 0, 0, .5),
          width: 0.2,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Icon(icon),
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                //   fontFamily: 'Outfit',
                fontSize: 16.w,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5),
          ),
        ],
      ),
    );
  }
}

class AttendanceBodyItem extends StatelessWidget {
  const AttendanceBodyItem(
      {Key? key, this.title = "", this.color = const Color(0xff00000), required this.item})
      : super(key: key);

// 'Search by name, role, department...'
  final String title;
  final Color color;
  final UserDetails item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      decoration: BoxDecoration(
          //  color: Color(0xffF5F5F5),
          //   borderRadius: BorderRadius.circular(12),
          ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                item.userId.toString(),
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 6,
              child: Row(
                children: [
                  Image.asset(
                    "assets/weman.png",
                    width: 40.w,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                   " ${item.firsName} ${item.lastName}",
                    style: TextStyle(fontSize: 16.w, color: Colors.black),
                  )
                ],
              )),
          Expanded(
              flex: 4,
              child: Text(
                "${item.address}",
                style: TextStyle(fontSize: 16.w, color: Colors.black,),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "${item.roles}",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.w, color: Colors.black,),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "${item.state}",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "${item.gender}",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "${item.email}",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
          Expanded(
              flex: 3,
              child: Text(
                "${item.phone}",
                style: TextStyle(fontSize: 16.w, color: Colors.black),
              )),
        ],
      ),
    );
  }
}
