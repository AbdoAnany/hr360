import '../../data/repositories/ItemRepository.dart';
import '../entities/item.dart';

class GetItemsUseCase {
  final ItemRepository repository;

  GetItemsUseCase(this.repository);

  Future<List<Item>> execute() async {
     // await repository.addAllItems();
    final items = await repository.getItems();
    return items.map((itemModel) => Item(
      name: itemModel.name,
      dateTime: itemModel.dateTime,
      state: itemModel.state,
      taskNote: itemModel.taskNote,
      avatarUrls: itemModel.avatarUrls, image: itemModel.image,
    )).toList();
  }
}
