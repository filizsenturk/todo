import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/content.dart';
import 'package:todo/home_page.dart';
import 'package:todo/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  await Hive.initFlutter();
  await Hive.openBox('todoBox');
// await Hive.box('todoBox').clear();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
        ],
        child:Sizer(builder: (context, orientation, screenType) {
          return  MaterialApp(
          theme: context.watch<ThemeCubit>().state.theme,
            initialRoute: HomePage.id,
            routes: {
            HomePage.id: (context)=>HomePage(),
              Content.id: (context)=>Content()
            },
            home:  HomePage(),
            );
        }));
  }
}
