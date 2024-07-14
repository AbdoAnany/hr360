part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ChangePageEvent extends HomeEvent {
  final PageType newPage;

  ChangePageEvent(this.newPage);

  @override
  List<Object?> get props => [newPage];
}

class InitialHomeEvent extends HomeEvent {
  InitialHomeEvent();

  @override
  List<Object?> get props => [];
}




class StartGetDataEvent extends HomeEvent {
   StartGetDataEvent() ;

  @override
  List<Object?> get props => [];
}
class LoadingDataEvent extends HomeEvent {
   LoadingDataEvent() ;

  @override
  List<Object?> get props => [];
}
class SuccessfulGetDataEvent extends HomeEvent {
  SuccessfulGetDataEvent({this.data}) ;
  dynamic data;
  @override
  List<Object?> get props => [data];
}
class FailGetDataEvent extends HomeEvent {
   FailGetDataEvent() ;

  @override
  List<Object?> get props => [];
}
