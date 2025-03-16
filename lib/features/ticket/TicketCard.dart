import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/constants/colors.dart';
import 'model/TicketCardModel.dart';

class TicketCard extends StatelessWidget {
 final TicketCardModel ticketCardModel;
 const TicketCard({Key? key, required this.ticketCardModel}) : super(key: key);
 @override
 Widget build(BuildContext context) {
  return Container(

   decoration: BoxDecoration(
    color:Color(0xffE9EBF5),
    borderRadius: BorderRadius.circular(16),
   ),
   margin: EdgeInsets.symmetric(vertical: 10),
   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

   child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     Text(
      ticketCardModel.title,
      style: TextStyle(
       fontSize: 18,
       fontWeight: FontWeight.bold,
      ),
     ),
     SizedBox(height: 10.h),
     Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       Container(
        decoration: BoxDecoration(
         border: Border.all( color: Color(0xffC2C6D8),),
         borderRadius: BorderRadius.circular(50),
        ),
        margin: EdgeInsets.zero,
        padding: EdgeInsets.all(2),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.start,

         children: [
          CircleAvatar(
           radius: 16,backgroundColor: AppColor.darkGray,
           // backgroundImage: NetworkImage(
           //  'https://via.placeholder.com/50',
           // ),
          ),
          SizedBox(width: 4),
          Text(ticketCardModel.createBy,style: TextStyle( color:  Color(0xff777C94)),),
          SizedBox(width: 8),
         ],
        ),
       ),
       SizedBox(width: 8),
       Row(
        children: [
         Icon(Icons.date_range, size: 16, color: Colors.grey),
         SizedBox(width: 5),
         Text(ticketCardModel.date),

        ],
       ),
       Spacer(),
       Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
         color:_getStatusColor(  ticketCardModel.status,),
         borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
         ticketCardModel.status,
         style: TextStyle(color: Colors.white),
        ),
       ),
      ],
     ),
     SizedBox(height: 10),
     SizedBox(width: 800,
      child: Text(
       ticketCardModel.description,
       style: TextStyle(color: Colors.grey),
      ),
     ),
    ],
   ),
  );
 }
 Color _getStatusColor(String status) {
  switch (status) {
   case 'Unassigned':
    return Colors.red;
   case 'Assigned to Me':
    return Colors.orange;
   case 'Solved':
    return Colors.green;
   default:
    return Colors.grey;
  }
 }
}