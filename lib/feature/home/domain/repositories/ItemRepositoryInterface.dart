import '../../data/models/ItemModel.dart';
import '../entities/item.dart';

abstract class ItemRepositoryInterface {
  Future<void> addItem(Item item);
  Future<List<ItemModel>> getItems();

}
