import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/AddItemUseCase.dart';
import '../../domain/use_cases/GetItemsUseCase.dart';
import 'ItemEvent.dart';
import 'ItemState.dart';
import '../../domain/entities/item.dart';


class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final AddItemUseCase addItemUseCase;
  final GetItemsUseCase getItemsUseCase;


  ItemBloc(this.getItemsUseCase,this.addItemUseCase) : super(ItemInitial()) {

    on<FetchItemsEvent>((event, emit) async {
      emit(ItemLoading());
      try {
        final items = await getItemsUseCase.execute();
        emit(ItemLoaded(items));
      } catch (e) {
        emit(ItemError(e.toString()));
      }
    });
    on<AddItemEvent>((event, emit) async {
      emit(ItemAdding());
      try {
        await addItemUseCase.execute(event.item);
        emit(ItemAdded());
      } catch (e) {
        emit(ItemError(e.toString()));
      }
    });
  }
}
