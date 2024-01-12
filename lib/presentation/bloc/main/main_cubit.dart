import 'package:bloc/bloc.dart';
import 'main_state.dart';

enum NavbarItem { posts, business, school }

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(NavbarItem.posts, 0));

  getNavbarItem(int index) {
    switch (index) {
      case 0:
        emit(MainState(NavbarItem.posts, 0));
        break;
      case 1:
        emit(MainState(NavbarItem.business, 1));
        break;
      case 2:
        emit(MainState(NavbarItem.school, 2));
        break;
    }
  }
}
