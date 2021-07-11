import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monsters_botw/src/pages/home_page.dart';
import 'package:monsters_botw/src/pages/monsters_info.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monster BOTW',
      initialRoute: '/',
      routes: {
        '/':(_)=>HomePage(),
        '/monstersInfo': (_)=> MonstersInfo()
      },
    );
  }
}