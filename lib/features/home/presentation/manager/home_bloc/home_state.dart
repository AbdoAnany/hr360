part of 'home_bloc.dart';

@immutable
class HomeState {
  final PageType newPage;

  const HomeState({required this.newPage});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeState &&
          runtimeType == other.runtimeType &&
          newPage == other.newPage;

  @override
  int get hashCode => newPage.hashCode;
}

class HomeInitialState extends HomeState {
  const HomeInitialState() : super(newPage: PageType.Dashboard);
}

class ChangePageState extends HomeState {
  const ChangePageState({required PageType newPage}) : super(newPage: newPage);

  @override
  List<Object?> get props => [newPage];
}
