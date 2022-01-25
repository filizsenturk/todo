
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';

class Content extends StatelessWidget {
  static String id = "Content";
   Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = ModalRoute.of(context)!.settings.arguments as List;
    String title= list[0];
    String description = list[1];
    String path = list[2];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 5.h,left: 5.w,right: 5.w),
          height: 100.h,
          width: 100.w,
          color: Colors.white,
          child: Column(
            children: [
              Image.file(File(path),width:90.w,),
             buildTitleAndDescriptionText(title,description),
            ],
          )
        ),
      ),
    );
  }

 Container buildTitleAndDescriptionText(title,description) {
    return  Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 2.h),
      width: 90.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
          SizedBox(height: 10,),
          Text(description,style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}


