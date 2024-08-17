import 'package:flutter/material.dart';

class Header extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Container(
   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
   color: Colors.white,
   child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
     const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       SizedBox(height: 20),
       Text(
        'Welcome Pooran',
        style: TextStyle(
         fontSize: 24,
         fontWeight: FontWeight.bold,
        ),
       ),
       Text(
        'Senior Admin - TIPSG Education Pvt. Ltd.',
        style: TextStyle(
         color: Colors.grey,
         fontSize: 14,
        ),
       ),
      ],
     ),
     Row(
      children: [
       Container(
        width: 200,
        child: TextField(
         decoration: InputDecoration(
          hintText: 'Search Dashboard',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(8),
          ),
         ),
        ),
       ),
       SizedBox(width: 20),
       Icon(Icons.notifications_active_outlined, color: Colors.black),
       SizedBox(width: 20),
       Icon(Icons.chat_bubble_outline_outlined, color: Colors.black),
       SizedBox(width: 20),
       CircleAvatar(
       radius: 20,
       ),
      ],
     ),
    ],
   ),
  );
 }
}
