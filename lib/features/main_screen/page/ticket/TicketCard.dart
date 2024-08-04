import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import 'model/TicketCardModel.dart';

class TicketCard extends StatelessWidget {
 final TicketCardModel ticketCardModel;
 const TicketCard({Key? key, required this.ticketCardModel}) : super(key: key);
 @override
 Widget build(BuildContext context) {
  return Container(

   decoration: BoxDecoration(
    color:Color(0xffE9EBF5),
    borderRadius: BorderRadius.circular(30),
   ),
   margin: EdgeInsets.symmetric(vertical: 10),
   child: Padding(
    padding: const EdgeInsets.all(16.0),
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
      SizedBox(height: 10),
      Row(
       children: [
        Container(
         decoration: BoxDecoration(
          border: Border.all( color: Color(0xffC2C6D8),),
          borderRadius: BorderRadius.circular(50),
         ),
         padding: EdgeInsets.all(4),
         child: Row(
          children: [
           CircleAvatar(
            radius: 20,backgroundColor: AppColor.borderPrimary,
            // backgroundImage: NetworkImage(
            //  'https://via.placeholder.com/50',
            // ),
           ),
           SizedBox(width: 10),
           Text(ticketCardModel.createBy,style: TextStyle( color:  Color(0xff777C94)),),
          ],
         ),
        ),

        SizedBox(width: 20),
        Row(
         children: [
          Icon(Icons.date_range, size: 16, color: Colors.grey),
          SizedBox(width: 5),
          Text(ticketCardModel.date),
         ],
        ),
        SizedBox(width: 20),
        Container(
         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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