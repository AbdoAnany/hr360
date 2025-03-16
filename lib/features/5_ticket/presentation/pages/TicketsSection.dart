
import 'package:flutter/material.dart';
import 'package:hr360/core/utils/constants/colors.dart';

import '../../../ticket/TicketCard.dart';
import '../../../ticket/model/TicketCardModel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        id: '$index',
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
  const TicketsSection({super.key});

 @override
 Widget build(BuildContext context) {
  return const TicketBody();
 }


}



class TicketBody extends StatefulWidget {
  const TicketBody({super.key});

  @override
  _TicketBodyState createState() => _TicketBodyState();
}

class _TicketBodyState extends State<TicketBody> {
  // Show dialog to add a new ticket
  void _addTicket() async {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    String status = 'Unassigned'; // Default status

    final newTicketData = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Ticket'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
                DropdownButtonFormField<String>(
                  value: status,
                  decoration: const InputDecoration(labelText: 'Status'),
                  items: ['Unassigned', 'Assigned to Me', 'Solved']
                      .map((status) => DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  ))
                      .toList(),
                  onChanged: (value) {
                    status = value!;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, {
                'title': titleController.text,
                'description': descriptionController.text,
                'status': status,
              }),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );

    if (newTicketData != null && newTicketData['title']!.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('tickets').add({
          'title': newTicketData['title'],
          'description': newTicketData['description'],
          'status': newTicketData['status'],
          'createBy': 'Current User', // Replace with actual user data
          'date': DateTime.now().toString().substring(0, 10),
          'isEdited': false,
          'isDeleted': false,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ticket added successfully')),
        );
      } catch (e) {
        print('Error adding ticket: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add ticket: $e')),
        );
      }
    }
  }

  // Fetch tickets for a specific status
  Widget _buildTicketList(String status) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('tickets')
          .where('status', isEqualTo: status)
          .where('isDeleted', isEqualTo: false) // Only show non-deleted tickets
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final tickets = snapshot.data!.docs
            .map((doc) => TicketCardModel.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id))
            .toList();

        if (tickets.isEmpty) {
          return const Center(child: Text('No tickets found'));
        }

        return ListView.builder(
          itemCount: tickets.length,
          itemBuilder: (context, index) {
            final ticket = tickets[index];
            return TicketCard(ticketCardModel: ticket);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgLight,
      floatingActionButton: FloatingActionButton(
        onPressed: _addTicket,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50.0,
                width: 450,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(text: "Unassigned"),
                    Tab(text: "Assigned to Me"),
                    Tab(text: "Solved"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  width: 1000,
                  child: TabBarView(
                    children: <Widget>[
                      _buildTicketList('Unassigned'),
                      _buildTicketList('Assigned to Me'),
                      _buildTicketList('Solved'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

