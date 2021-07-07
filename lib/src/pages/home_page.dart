import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monsters_botw/src/models/monsters_model.dart';
import 'package:monsters_botw/src/providers/monsters_provider.dart';
import 'package:monsters_botw/src/providers/monsters_state.dart';

class HomePage extends StatelessWidget {
  final monstersProvider = MonstersProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(170, 207, 193, 1),
        title: Text('Monsters BOTW'),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          FutureBuilder(
            future: monstersProvider.obtenerMonsters(),
            builder: (BuildContext context,
                AsyncSnapshot<List<MonstersModel>> snap) {
              final monsters = snap.data;
              return Container(
                height: double.infinity,
                child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: monsters!.length,
                itemBuilder: (BuildContext context, int i) {
                  final monstersData = monsters[i];
                  return Container(
                    width: 360,
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(170, 207, 193, 1)),
                    child: Stack(
                      children: [
                        //_Fondo(),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _MonsterName(monstersData),
                              _MonsterImage(monstersData),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              );
            },
          ),
          _Fondo(),
        ],
      ),
    );
  }
}

class _Fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -10,
        child: Image.asset(
          'assets/paisaje.gif',
          height: 220.0,
          fit: BoxFit.cover,
        ));
  }
}

class _CategoryName extends StatelessWidget {
  final MonstersModel _monstersData;
  _CategoryName(this._monstersData);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Category:",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        Text(
          _monstersData.category!,
          style: TextStyle(fontSize: 24.0),
        ),
      ],
    );
  }
}

class _MonsterImage extends StatelessWidget {
  final MonstersModel _monstersData;
  _MonsterImage(this._monstersData);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          _monstersData.image!,
          alignment: Alignment.center,
          height: 300.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _MonsterName extends StatelessWidget {
  final MonstersModel _monstersData;
  _MonsterName(this._monstersData);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Monster name:',
          style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          _monstersData.name!.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ],
    );
  }
}
