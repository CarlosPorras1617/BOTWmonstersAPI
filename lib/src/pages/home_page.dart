import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monsters_botw/src/providers/monsters_state.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState()=> HomePageState();
}

class HomePageState extends State{
  @override

  void initState(){
    final monstersState = Get.put(MonstersState());
    monstersState.obtenerMonsters();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monsters BOTW'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<MonstersState>(
              builder: (MonstersState monstersState){
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: monstersState.monsters.length,
                  itemBuilder: (BuildContext context, int i){
                    final _monsters = monstersState.monsters[i];
                    return Column(
                      children: [
                        //Text(_monsters.description!),
                        Text(_monsters.drops.toString())
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}