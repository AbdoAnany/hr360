part of 'home_bloc.dart';


@immutable
abstract class HomeEvent {}

class ChangePageEvent extends HomeEvent {
  final PageType newPage;

  ChangePageEvent(this.newPage);

  @override
  List<Object?> get props => [newPage];
}
