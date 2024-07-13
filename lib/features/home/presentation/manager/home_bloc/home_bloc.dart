import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/1login/data/repositries/auth_repo_impl.dart';
import 'package:meta/meta.dart';

import '../../../../1login/domain/repositires/auth_repo.dart';
import '../../widgets/Mainbar.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  final AuthRepo _authRepo=AuthRepoImpl();

  HomeBloc()
      : super(const HomeState(newPage: PageType.Dashboard)) {
    on<HomeEvent>((event, emit) async {
      if (event is InitialHome) {
        await getDataFromServer();
      }

      if (event is ChangePageEvent) {
        print('eeeeeeeeeeeeee  ${event.newPage}');

        emit(ChangePageState(newPage: event.newPage));
      }
    });
  }

  void changePage(PageType newPage) {
    MainBarControl.currentPage = newPage;
    add(ChangePageEvent(newPage));
  }

  Future<void> getDataFromServer() async {
    // _authRepo.add(StartGetDataFromServer());
  }
}
