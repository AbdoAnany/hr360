import '../../domain/entities/item.dart';

abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemAdding extends ItemState {}

class ItemAdded extends ItemState {}

class ItemError extends ItemState {
  final String message;

  ItemError(this.message);
}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<Item> items;
  ItemLoaded(this.items);
}

