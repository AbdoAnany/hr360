import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workmanager/workmanager.dart';
import 'firebase_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String syncTask = "syncFirestoreData";




void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == syncTask) {
      print("🔄 Running background sync...");
      await fetchUpdatedData('students');
      await fetchUpdatedData('teachers');
      return Future.value(true);
    }
    return Future.value(false);
  });
}

void initializeBackgroundSync() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerPeriodicTask("1", syncTask, frequency: Duration(minutes: 15));
}

Future<void> fetchUpdatedData(String collection) async {
  FirebaseHandler handler = FirebaseHandler(collection);
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? lastSyncTime = prefs.getString('lastSyncTime_$collection');
  DateTime? lastSync = lastSyncTime != null ? DateTime.parse(lastSyncTime) : null;

  QuerySnapshot snapshot = await handler.fetchUpdatedItems(lastSync);

  if (snapshot.docs.isNotEmpty) {
    print("✅ New data fetched for $collection: ${snapshot.docs.length} items");
    prefs.setString('lastSyncTime_$collection', DateTime.now().toIso8601String());
  } else {
    print("⚡ No new updates found for $collection.");
  }
}

