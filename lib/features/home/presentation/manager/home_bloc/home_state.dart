part of 'home_bloc.dart';

@immutable
class HomeState {

  const HomeState();

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is HomeState &&
  //         runtimeType == other.runtimeType ;
  //

}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}
class ChangeState extends HomeState {
}

class ChangePageState extends HomeState {
  final PageType newPage;

  const ChangePageState({ this. newPage=PageType.Dashboard}) ;

  @override
  List<Object?> get props => [newPage];
}
class StartGetData extends HomeState {
  const StartGetData() ;

  @override
  List<Object?> get props => [];
}
class LoadingData extends HomeState {
  const LoadingData() ;

  @override
  List<Object?> get props => [];
}
class SuccessfulGetData extends HomeState {
   SuccessfulGetData({this.data}) ;
dynamic data;
  @override
  List<Object?> get props => [data];
}
class FailGetData extends HomeState {
  const FailGetData() ;

  @override
  List<Object?> get props => [];
}
