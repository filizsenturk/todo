
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

class Content extends StatelessWidget {
  String? path;
  int index;
   Content({Key? key,required this.index,this.path}) : super(key: key);

  Box box = Hive.box('todoBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 5.h,left: 5.w,right: 5.w,bottom: 3.h),
          height: 100.h,
          width: 100.w,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildImage()  ,
              buildBackIcon(context)
            ],
          )
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
          Text(title,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black),),
          const SizedBox(height: 10,),
          Text(description,style:const TextStyle(fontSize: 20,color: Colors.black),),
        ],
      ),
    );
  }

  SingleChildScrollView buildImage() {
    return SingleChildScrollView(
      child: Column(
        children: [
         path==null ? Image.asset("assets/error.png"):Image.file(File(path!),width:50.w,),
          buildTitleAndDescriptionText(box.getAt(index)[0],box.getAt(index)[1]),
        ],
      ),
    );
  }

  IconButton buildBackIcon(context) {
    return IconButton(
        onPressed: (){Navigator.of(context).pop();},
        icon:  Icon(Icons.arrow_back_rounded,color: Colors.black,));
  }
}
