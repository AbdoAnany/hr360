import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/1login/data/repositries/auth_repo_impl.dart';
import 'package:hr360/features/home/date/repositries/repo_impl.dart';
import 'package:meta/meta.dart';

import '../../../../../app.dart';
import '../../../../../core/utils/error/failure.dart';
import '../../../../1login/domain/repositires/auth_repo.dart';
import '../../../domain/repositires/repo.dart';
import '../../pages/pages/Employee/employees.dart';
import '../../widgets/Mainbar.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialState());
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo _homeRepo = HomeRepoImpl();
  PageType currentPage = PageType.Dashboard;
  void update() {

    emit( ChangeState());
  }
  void changePage(PageType newPage) {
    MainBarControl.currentPage = newPage;
    currentPage = newPage;
    _navigateToPage(newPage);

    emit(const ChangePageState());
    emit(const StartGetData());
  }

  void _navigateToPage(PageType pageType) {
    String routeName;
    switch (pageType) {
      case PageType.Dashboard:
        routeName = '/dashboard';
        break;
      case PageType.Employees:
        routeName = '/employees';
        break;
      case PageType.profile:
        routeName = '/profile';
        break;
      default:
        routeName = '/default';
        break;
    }
    navigatorKey.currentState?.pushNamed(routeName);
  }
  Future getDataFromServer() async {
    var dateList;
    var val = await _homeRepo.getAllUserDetails();
    val.fold((e) {
      dateList =     damyList;
    }, (data) {
      dateList = data;
    });
    return dateList;
  }

  Future<Either<Failure, dynamic>> getDataFromServerTEST() async {
    var val = await _homeRepo.getAllUserDetails().then((val) {
      return val.fold((e) {
        emit(const FailGetData());

        Left(e);
      }, (data) {
        print(data);
        Right(data);
        emit(SuccessfulGetData(data: data));
      });
    });
    return val;
  }
}
// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   static HomeBloc get(context) => BlocProvider.of(context);
//   final HomeRepo _HomeRepo=HomeRepoImpl();
//
//   HomeBloc()
//       : super(const HomeState()) {
//     on<HomeEvent>((event, emit) async {
//       if (event is InitialHomeEvent) {
//         await getDataFromServer();
//
//       }
//
//       if (event is ChangePageEvent) {
//         print('eeeeeeeeeeeeee  ${event.newPage}');
//
//         emit(ChangePageState(newPage: event.newPage));
//       }
//     });
//   }
//
//   void changePage(PageType newPage) {
//     MainBarControl.currentPage = newPage;
//     add(ChangePageEvent(newPage));
//   }
//
//   Future<void> getDataFromServer() async {
//     _HomeRepo.getAllUserDetails().then((val){
//
//       val.fold((e){
//         emit(const FailGetData());
//
//         Left(e);
//       },(data){
//         print(data);
//         Right(data);
//         add( SuccessfulGetDataEvent(data:data));
//
//       });
//     });
//   }
// }
