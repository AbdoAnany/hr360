import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/const.dart';
import '../../domain/entities/item.dart';
import '../../domain/repositories/ItemRepositoryInterface.dart';
import '../models/ItemModel.dart';

class ItemRepository implements ItemRepositoryInterface {
  final FirebaseFirestore firestore;

  ItemRepository(this.firestore);

  @override
  Future<void> addItem(Item item) async {
    await firestore.collection('items').add({
      'name': item.name,
      'dateTime': item.dateTime,
      'state': item.state,
      'taskNote': item.taskNote,
    });
  }

  @override
  Future<List<ItemModel>> getItems() async {
    final snapshot = await firestore.collection('items').get();
    // return listItemCards;
   return snapshot.docs.map((doc) => ItemModel.fromFirebase(doc.data())).toList();
  }
  Future<void> addAllItems() async {
    final batch = firestore.batch();

    for (var item in listItemCards) {
      final docRef = firestore.collection('items').doc();
      batch.set(docRef, {
        'name': item.name,
        'dateTime': item.dateTime,
        'state': item.state,
        'taskNote': item.taskNote,
        'image': item.image,
        'avatarUrls': item.avatarUrls,
      });
    }

    await batch.commit();
  }
}

final listItemCards=[
  ItemModel(
    name: 'Item title',
    dateTime: '5 Nights (Jan 16 - Jan 20, 2024)',
    state: 'Pending Approval',
    taskNote: 'Jan 16 - Jan 20, 2024',
    image:  AppConst.cardBg2,  avatarUrls: [
    AppConst.profile,
    AppConst.profile,
    AppConst.profile,
    AppConst.profile,
  ],
  ),
  ItemModel(
    name: 'Long item title highlighti Long item title highlighti',
    dateTime: '5 Nights (Jan 16 - Jan 20, 2024) ',
    state: 'Pending Approval',
    taskNote: '4 unfinished tasks',
    image:  AppConst.cardBg1,  avatarUrls: [
    AppConst.profile,
    AppConst.profile,
  ],
  ),
  ItemModel(
    name: 'Long item title highlighting the main aspect of the card',
    dateTime: '5 Nights (Jan 16 - Jan 20, 2024)',
    state: 'Pending Approval',
    taskNote: '4 unfinished tasks',
    image:  AppConst.cardBg2,  avatarUrls: [
    AppConst.profile,
    AppConst.profile,
  ],
  ),
  ItemModel(
    name: 'Long item title highlighting the main aspect of the card',
    dateTime: '5 Nights (Jan 16 - Jan 20, 2024)',
    state: 'Pending Approval',
    taskNote: '4 unfinished tasks',
    image:  AppConst.cardBg3,  avatarUrls: [
    AppConst.profile,
    AppConst.profile,
  ],
  ),
  ItemModel(
    name: 'Long item title highlighting the main aspect of the card',
    dateTime: '5 Nights (Jan 16 - Jan 20, 2024)',
    state: 'Pending Approval',
    taskNote: '4 unfinished tasks',
    image:  AppConst.cardBg2,  avatarUrls: [
    AppConst.profile,
    AppConst.profile,
  ],
  ),
  ItemModel(
    name: 'Long item title highlighting the main aspect of the card',
    dateTime: '5 Nights (Jan 16 - Jan 20, 2024)',
    state: 'Pending Approval',
    taskNote: '4 unfinished tasks',
    image:  AppConst.cardBg2,  avatarUrls: [
    AppConst.profile,
    AppConst.profile,
  ],
  ),
  ItemModel(
    name: 'Long item title highlighting the main aspect of the card',
    dateTime: '5 Nights (Jan 16 - Jan 20, 2024)',
    state: 'Pending Approval',
    taskNote: '4 unfinished tasks',
    image:  AppConst.cardBg1,  avatarUrls: [
    AppConst.profile,
    AppConst.profile,
  ],
  ),
  ItemModel(
    name: 'Long item title highlighting the main aspect of the card',
    dateTime: '5 Nights (Jan 16 - Jan 20, 2024)',
    state: 'Pending Approval',
    taskNote: '4 unfinished tasks',
    image:  AppConst.cardBg2,  avatarUrls: [
    AppConst.profile,
    AppConst.profile,
  ],
  ),
  ItemModel(
    name: 'Long item title highlighting the main aspect of the card',
    dateTime: '5 Nights (Jan 16 - Jan 20, 2024)',
    state: 'Pending Approval',
    taskNote: '4 unfinished tasks',
    image:  AppConst.cardBg3,  avatarUrls: [
    AppConst.profile,
    AppConst.profile,
    AppConst.profile,
    AppConst.profile,
  ],
  ),


];