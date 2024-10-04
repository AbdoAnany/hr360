import '../entities/item.dart';
import '../repositories/ItemRepositoryInterface.dart';

class AddItemUseCase {
  final ItemRepositoryInterface repository;

  AddItemUseCase(this.repository);

  Future<void> execute(Item item) async {
    await repository.addItem(item);
  }
}
