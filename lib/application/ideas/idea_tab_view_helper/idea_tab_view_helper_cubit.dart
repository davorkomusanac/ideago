import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/databases/shared_prefs/shared_prefs_db.dart';

part 'idea_tab_view_helper_state.dart';

class IdeaTabViewHelperCubit extends Cubit<IdeaTabViewHelperState> {
  IdeaTabViewHelperCubit() : super(const IdeaTabViewHelperState()) {
    _loadPrefs();
  }

  late SharedPrefsDb sharedPrefsDb;

  void _loadPrefs() async {
    sharedPrefsDb = SharedPrefsDb();
    await sharedPrefsDb.initDb();
    bool isListViewIdeaTabViewPref = sharedPrefsDb.getIdeaTabViewPref();
    emit(
      state.copyWith(
        isListViewSelected: isListViewIdeaTabViewPref,
      ),
    );
  }

  void changeIdeaTabLayoutPressed() {
    emit(
      state.copyWith(
        isListViewSelected: !state.isListViewSelected,
      ),
    );
    sharedPrefsDb.writeIdeaTabViewPref(state.isListViewSelected);
  }
}
