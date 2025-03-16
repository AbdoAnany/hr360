import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/constants/colors.dart';
import 'model/TicketCardModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/utils/constants/colors.dart';
import 'model/TicketCardModel.dart';

class TicketCard extends StatefulWidget {
 final TicketCardModel ticketCardModel;

 const TicketCard({Key? key, required this.ticketCardModel}) : super(key: key);

 @override
 _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
 late TicketCardModel _ticketCardModel;

 @override
 void initState() {
  super.initState();
  _ticketCardModel = widget.ticketCardModel;
 }

 // Edit ticket
 void _editTicket() async {
  final updatedData = await showDialog<Map<String, dynamic>>(
   context: context,
   builder: (context) {
    final titleController = TextEditingController(text: _ticketCardModel.title);
    final descriptionController = TextEditingController(text: _ticketCardModel.description);
    String status = _ticketCardModel.status;

    return AlertDialog(
     title: const Text('Edit Ticket'),
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
       child: const Text('Save'),
      ),
     ],
    );
   },
  );

  if (updatedData != null) {
   try {
    setState(() {
     _ticketCardModel.title = updatedData['title'];
     _ticketCardModel.description = updatedData['description'];
     _ticketCardModel.status = updatedData['status'];
     _ticketCardModel.isEdited = true; // Mark as edited
    });

    // Update in Firestore
    await FirebaseFirestore.instance
        .collection('tickets')
        .doc(_ticketCardModel.id)
        .update({
     'title': updatedData['title'],
     'description': updatedData['description'],
     'status': updatedData['status'],
     'isEdited': true,
    });

    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(content: Text('Ticket updated successfully')),
    );
   } catch (e) {
    print('Error updating ticket: $e');
    ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text('Failed to update ticket: $e')),
    );
   }
  }
 }

 // Delete ticket (soft delete)
 void _deleteTicket() async {
  final confirm = await showDialog<bool>(
   context: context,
   builder: (context) => AlertDialog(
    title: const Text('Delete Ticket'),
    content: const Text('Are you sure you want to delete this ticket?'),
    actions: [
     TextButton(
      onPressed: () => Navigator.pop(context, false),
      child: const Text('Cancel'),
     ),
     TextButton(
      onPressed: () => Navigator.pop(context, true),
      child: const Text('Delete'),
     ),
    ],
   ),
  );

  if (confirm == true) {
   try {
    setState(() {
     _ticketCardModel.isDeleted = true; // Mark as deleted
    });

    // Update in Firestore (soft delete)
    await FirebaseFirestore.instance
        .collection('tickets')
        .doc(_ticketCardModel.id)
        .update({'isDeleted': true});

    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(content: Text('Ticket deleted successfully')),
    );
   } catch (e) {
    print('Error deleting ticket: $e');
    ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text('Failed to delete ticket: $e')),
    );
   }
  }
 }

 // Change status directly
 void _changeStatus(String newStatus) async {
  try {
   setState(() {
    _ticketCardModel.status = newStatus;
    _ticketCardModel.isEdited = true; // Mark as edited
   });

   // Update in Firestore
   await FirebaseFirestore.instance
       .collection('tickets')
       .doc(_ticketCardModel.id)
       .update({
    'status': newStatus,
    'isEdited': true,
   });

   ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Status updated successfully')),
   );
  } catch (e) {
   print('Error updating status: $e');
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Failed to update status: $e')),
   );
  }
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

 @override
 Widget build(BuildContext context) {
  // Skip rendering if the ticket is deleted
  if (_ticketCardModel.isDeleted) {
   return const SizedBox.shrink();
  }

  return GestureDetector(
   onLongPress: () {
    showModalBottomSheet(
     context: context,
     builder: (context) => SafeArea(
      child: Column(
       mainAxisSize: MainAxisSize.min,
       children: [
        ListTile(
         leading: const Icon(Icons.edit),
         title: const Text('Edit'),
         onTap: () {
          Navigator.pop(context);
          _editTicket();
         },
        ),
        ListTile(
         leading: const Icon(Icons.delete),
         title: const Text('Delete'),
         onTap: () {
          Navigator.pop(context);
          _deleteTicket();
         },
        ),
       ],
      ),
     ),
    );
   },
   child: Container(
    decoration: BoxDecoration(
     color: const Color(0xffE9EBF5),
     borderRadius: BorderRadius.circular(16),
    ),
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Expanded(
         child: Text(
          _ticketCardModel.title,
          style: const TextStyle(
           fontSize: 18,
           fontWeight: FontWeight.bold,
          ),
         ),
        ),
        if (_ticketCardModel.isEdited)
         const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
           '(Edited)',
           style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontStyle: FontStyle.italic,
           ),
          ),
         ),
       ],
      ),
      SizedBox(height: 10.h),
      Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
        Container(
         decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffC2C6D8)),
          borderRadius: BorderRadius.circular(50),
         ),
         margin: EdgeInsets.zero,
         padding: const EdgeInsets.all(2),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           const CircleAvatar(
            radius: 16,
            backgroundColor: AppColor.darkGray,
           ),
           const SizedBox(width: 4),
           Text(
            _ticketCardModel.createBy,
            style: const TextStyle(color: Color(0xff777C94)),
           ),
           const SizedBox(width: 8),
          ],
         ),
        ),
        const SizedBox(width: 8),
        Row(
         children: [
          const Icon(Icons.date_range, size: 16, color: Colors.grey),
          const SizedBox(width: 5),
          Text(_ticketCardModel.date),
         ],
        ),
        const Spacer(),
        GestureDetector(
         onTap: () {
          // Show status change options
          showModalBottomSheet(
           context: context,
           builder: (context) => SafeArea(
            child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
              ListTile(
               title: const Text('Unassigned'),
               onTap: () {
                Navigator.pop(context);
                _changeStatus('Unassigned');
               },
              ),
              ListTile(
               title: const Text('Assigned to Me'),
               onTap: () {
                Navigator.pop(context);
                _changeStatus('Assigned to Me');
               },
              ),
              ListTile(
               title: const Text('Solved'),
               onTap: () {
                Navigator.pop(context);
                _changeStatus('Solved');
               },
              ),
             ],
            ),
           ),
          );
         },
         child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
           color: _getStatusColor(_ticketCardModel.status),
           borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
           _ticketCardModel.status,
           style: const TextStyle(color: Colors.white),
          ),
         ),
        ),
       ],
      ),
      const SizedBox(height: 10),
      SizedBox(
       width: 800,
       child: Text(
        _ticketCardModel.description,
        style: const TextStyle(color: Colors.grey),
       ),
      ),
     ],
    ),
   ),
  );
 }
}