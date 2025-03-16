
class TicketCardModel {
 String id; // Firestore document ID
 String title;
 String description;
 String status;
 String createBy;
 String date;
 bool isEdited; // Track if the ticket was edited
 bool isDeleted; // Track if the ticket was soft-deleted

 TicketCardModel({
  required this.id,
  required this.title,
  required this.description,
  required this.status,
  required this.createBy,
  required this.date,
  this.isEdited = false,
  this.isDeleted = false,
 });

 // Convert to Firestore-compatible map
 Map<String, dynamic> toFirestore() {
  return {
   'id': id,
   'title': title,
   'description': description,
   'status': status,
   'createBy': createBy,
   'date': date,
   'isEdited': isEdited,
   'isDeleted': isDeleted,
  };
 }

 // Create from Firestore snapshot
 factory TicketCardModel.fromFirestore(Map<String, dynamic> data, String id) {
  return TicketCardModel(
   id: id,
   title: data['title'] ?? '',
   description: data['description'] ?? '',
   status: data['status'] ?? 'Unassigned',
   createBy: data['createBy'] ?? '',
   date: data['date'] ?? '',
   isEdited: data['isEdited'] ?? false,
   isDeleted: data['isDeleted'] ?? false,
  );
 }
}