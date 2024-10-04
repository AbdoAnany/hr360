import '../../domain/entities/item.dart';

abstract class ItemEvent {}

class AddItemEvent extends ItemEvent {
  final Item item;

  AddItemEvent(this.item);
}
class FetchItemsEvent extends ItemEvent {}
