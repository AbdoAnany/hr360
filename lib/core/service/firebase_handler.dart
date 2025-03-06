import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHandler<T> {
  final String collection;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseHandler(this.collection);

  // ✅ Add Document (Auto-generated ID)
  Future<void> addItem(Map<String, dynamic> data) async {
    data['updatedAt'] = FieldValue.serverTimestamp();
    await _firestore.collection(collection).add(data);
  }

  // 🔄 Update Document (Using ID)
  Future<void> updateItem(String id, Map<String, dynamic> updates) async {
    updates['updatedAt'] = FieldValue.serverTimestamp();
    await _firestore.collection(collection).doc(id).update(updates);
  }

  // 🚀 Batch Update Multiple Documents
  Future<void> batchUpdate(List<Map<String, dynamic>> items) async {
    WriteBatch batch = _firestore.batch();
    for (var item in items) {
      String id = item['id'];
      DocumentReference docRef = _firestore.collection(collection).doc(id);
      batch.update(docRef, item);
    }
    await batch.commit();
  }

  // ❌ Delete Document
  Future<void> deleteItem(String id) async {
    await _firestore.collection(collection).doc(id).delete();
  }

  // 🔄 Get Real-time Updates
  Stream<QuerySnapshot> getItems() {
    return _firestore.collection(collection).orderBy('updatedAt', descending: true).snapshots();
  }

  // 📢 Fetch Only Updated Data Since Last Sync
  Future<QuerySnapshot> fetchUpdatedItems(DateTime? lastSync) async {
    Query query = _firestore.collection(collection).orderBy('updatedAt');
    if (lastSync != null) {
      query = query.where('updatedAt', isGreaterThan: lastSync);
    }
    return await query.get();
  }
}
