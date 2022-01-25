import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/ui/theme/app_theme.dart';


part 'theme_state.dart';

class ThemeCubit extends Cubit<AppThemeState> {
  ThemeCubit() : super(LightThemeState());

  toggleDarkMode() {
    if (state is LightThemeState) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }
}
