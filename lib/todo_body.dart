
import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/content.dart';
import 'package:todo/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:todo/ui/theme/app_theme.dart';

class TodoBody extends StatefulWidget {

   TodoBody({Key? key,}) : super(key: key);


  @override
  State<TodoBody> createState() => _TodoBodyState();
}

class _TodoBodyState extends State<TodoBody> {
   var box= Hive.box('todoBox');
   bool show=false;
   File? file;
   String? path;





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        child: buildTodoNotesList(),
      ),
    );
  }


  buildTodoNotesList() {
    return ValueListenableBuilder(valueListenable: box.listenable(), builder: (context,Box box,index){

      return Container(
        height: 400,
        child: ListView.builder(itemCount: box.length,itemBuilder: (context,index){
          return  GestureDetector(
            onTap: ()async{
              final tempDir = await getTemporaryDirectory();
              File file = await File('${tempDir.path}/$index.png').create();
              file.writeAsBytesSync(box.getAt(index)[2]);
              setState(() {
                path = file.path;
                show=true;
              });
              Navigator.of(context).pushNamed(Content.id,arguments:[box.getAt(index)[0].toString(),box.getAt(index)[1].toString(),path] );
            },
            child: Padding(
              padding:  EdgeInsets.only(left:6.w,right: 6.w,top: 2.5.h,bottom: 1.5.h),
              child: Container(
                width: 85.w,
                padding: EdgeInsets.all(15),
                decoration:buildDecoration(context),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      box.getAt(index)[0].toString(),
                      style: TextStyle(color: Theme.of(context).textColor),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      box.getAt(index)[1].toString(),
                      style: TextStyle(color: Theme.of(context).textColor),
                    ) ,
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: (){box.deleteAt(index);},
                          child: Icon(Icons.delete_outline,size: 20,)),
                    )
                  ],
                ) ,
              ),
            ),
          );
        }),
      );});
  }

  buildDecoration(context) {
    return  BoxDecoration(
      color: Theme.of(context).containerBackgorunColor,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).containerElevationColor,
          offset: const Offset(0.0, 2.0), //(x,y)
          blurRadius:10.0,
        ),
      ],
      borderRadius: BorderRadius.circular(10),
    );
  }
}
