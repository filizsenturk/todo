
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';
import 'package:todo/logic/bloc/theme_cubit/theme_cubit.dart';
import 'package:todo/screens/todo_body.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/ui/theme/app_theme.dart';
import 'package:todo/widgets/text_form_widget.dart';


class HomePage extends StatefulWidget {
  static String id = "HomePage";
   const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var box = Hive.box('todoBox');
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController =TextEditingController();
  final ImagePicker _picker = ImagePicker();
  Uint8List? file;
  File? image;


  Future pickImage()async{
   try{
     final image=  await _picker.pickImage(source: ImageSource.gallery);
     if(image==null)return;
     final imagePath = File(image.path);
     file=await imagePath.readAsBytesSync();
     }  on PlatformException catch(e) { print(e);}}

     onClickDarkMode(){ context.read<ThemeCubit>().toggleDarkMode(); }

     onAddClick(){
    titleController.clear();
    descriptionController.clear();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: buildTitle(),
          content: buildContent(),
          actions: <Widget>[
            buildTextBtn()
             ],);
        },);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: TodoBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child:buildIcon() ,
        onPressed: () { onAddClick(); },
      ),
    );
  }

  AppBar buildAppBar() {
    return  AppBar(
      toolbarHeight: 18.h,
      backgroundColor: Theme.of(context).appBarBackgroundColor,
      title: buildImage(context),
      actions: [
        IconButton(
            onPressed: (){onClickDarkMode();}, icon: buildDarkModeIcon())],
    );}

  Icon buildIcon() {
    return const Icon(
        Icons.add,
        color: Colors.white,
        size: 45);
  }

  Center buildImage(context) {
    return Center(
        child: Image.asset(
          "assets/appbar.png",
          color: Theme.of(context).appBarImageColor,
          width: 50.w,));
  }

 Text buildTitle() {
    return Text(
      'Add TODO',
      style: TextStyle(
          color: Theme.of(context).textColor,
          fontSize: 20
      ),);
  }

  Container buildContent() {
    return Container(
      height: 50.w,
      child: Column(
        children: [
          TextFormWidget(controller: titleController,hint: "Title",),
          TextFormWidget(controller: descriptionController,hint: "Description",),
          buildAddImageBtn(),
        ],
      ),
    );
  }

  TextButton buildTextBtn() {
    return TextButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
      child:  Text('ADD',style: TextStyle(color: Theme.of(context).textColor),),
      onPressed: () {
        box.add([titleController.text,descriptionController.text,file]);
        setState(() {
          file=null;
        });
        Navigator.of(context).pop();
      },
    );
  }

 Padding buildAddImageBtn() {
    return   Padding(
      padding:  EdgeInsets.only(top: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Add Photo',style: TextStyle(color: Theme.of(context).textColor,fontSize: 15),),
          IconButton(
              onPressed: (){pickImage();},
              icon: Icon(Icons.add_photo_alternate_outlined,size: 35,)),
        ],
      ),
    );
  }

 BlocBuilder buildDarkModeIcon() {
    return  BlocBuilder<ThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Image.asset(
          (appThemeState is LightThemeState)
              ? "assets/light.png"
              : "assets/dark.png",
          width: 55,
        );
      },
    );
  }

}
