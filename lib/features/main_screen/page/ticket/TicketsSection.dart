
import 'package:flutter/material.dart';

import 'TicketCard.dart';
import 'model/TicketCardModel.dart';

List<TicketCardModel> generateTicketList({Statuses}) {
List<String> statuses = ['Unassigned', 'Assigned to Me', 'Solved'];
List<String> creators = ['Natasha Goswami', 'John Doe', 'Jane Smith'];
List<String> titles = [
        'Cannot access the app',
        'UI not responsive',
        'Feature request: Dark mode',
        'Error on login',
        'App crashes on launch',
        'Payment gateway issue',
        'Slow loading time',
        'Data not syncing',
        'Push notifications not received',
        'User profile not updating',
        'Issue with settings',
        'Network connectivity issue',
        'Bug in chat feature',
        'Problem with media upload',
        'Error 404 on page',
        'Password reset issue',
        'Unexpected logout',
        'Feature request: Offline mode',
        'Security vulnerability',
        'Privacy settings issue',
        'Calendar not syncing',
        'Data export problem',
        'Customization options limited',
        'Error message not clear',
        'Language translation error',
        'Content missing on page',
        'Accessibility feature request',
        'Performance optimization needed',
        'Audio/video issue',
        'Feedback form not submitting'
        ];

List<TicketCardModel> ticketList = List.generate(30, (index) {
  return TicketCardModel(
        title: titles[index % titles.length],
        description:
                'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit. This is a description for ${titles[index % titles.length]}.',
        status: statuses[index % statuses.length],
        createBy: creators[index % creators.length],
        date: '${10 + index} August 2024',
        );
 }).where((e)=>e.status==Statuses).toList();

 return ticketList;
}

class TicketsSection extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Padding(
   padding: const EdgeInsets.all(16.0),
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     Text(
      'Tickets',
      style: TextStyle(
       fontSize: 22,
       fontWeight: FontWeight.bold,
      ),
     ),
     SizedBox(height: 20),
     Expanded(child: _tabSection(context)),

    ],
   ),
  );
 }

 Widget _tabSection(BuildContext context) {
  return DefaultTabController(
   length: 3,
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
     SizedBox(     height: 50.0,
      width: 450,
      child: TabBar(
       // labelColor: Colors.blue,
       // unselectedLabelColor: Colors.grey,
       // indicatorColor: Colors.blue,
       indicatorSize: TabBarIndicatorSize.tab,
       indicatorWeight: 3,
       tabs: [
        Tab(text: "Unassigned"),
        Tab(text: "Assigned to Me"),
        Tab(text: "Solved"),
       ],
      ),
     ),        SizedBox(height: 20),

     Expanded(
      child: SizedBox(width: 1000,
       child: TabBarView(
        children: <Widget>[
         ListView.builder(
          itemCount: generateTicketList( Statuses: 'Unassigned').length,
          itemBuilder: (context, index) {
           final ticket = generateTicketList(Statuses: 'Unassigned')[index];
           return TicketCard(ticketCardModel: ticket,);
          },
         ),
         ListView.builder(
          itemCount: generateTicketList( Statuses: 'Assigned to Me').length,
          itemBuilder: (context, index) {
           final ticket = generateTicketList(Statuses: 'Assigned to Me')[index];
           return TicketCard(ticketCardModel: ticket,);
          },
         ),
         ListView.builder(
          itemCount: generateTicketList( Statuses: 'Solved').length,
          itemBuilder: (context, index) {
           final ticket = generateTicketList(Statuses: 'Solved')[index];
           return TicketCard(ticketCardModel: ticket,);
          },
         ),
        ],
       ),
      ),
     ),
    ],
   ),
  );
 }
}
