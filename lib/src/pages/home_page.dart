import 'package:flutter/material.dart';
import 'package:monsters_botw/src/models/monsters_model.dart';
import 'package:monsters_botw/src/providers/monsters_provider.dart';

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
        children: [
          _FondoCielo(),
          _TriforceFondo(),
          FutureBuilder(
            future: monstersProvider.obtenerMonsters(),
            builder: (BuildContext context,
                AsyncSnapshot<List<MonstersModel>> snap) {
              final _mediaSize = MediaQuery.of(context).size;
              final monsters = snap.data;
              return Container(
                height: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: monsters!.length,
                  itemBuilder: (BuildContext context, int i) {
                    final monstersData = monsters[i];
                    return GestureDetector(
                      onTap: () {
                        //send data
                        Navigator.pushNamed(context, '/monstersInfo',
                            arguments: monstersData);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: _mediaSize.width * 0.11),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _MonsterName(monstersData),
                                  MonsterImage(monstersData),
                                ],
                              ),
                            ),
                          ],
                        ),
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
    final _mediaSize = MediaQuery.of(context).size;
    return Positioned(
        bottom: _mediaSize.height * 0.0,
        child: Image.asset(
          'assets/paisaje.gif',
          height: _mediaSize.height * 0.30,
          fit: BoxFit.cover,
        ));
  }
}

class MonsterImage extends StatelessWidget {
  final MonstersModel _monstersData;
  MonsterImage(this._monstersData);
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          top: _mediaSize.height * 0.02, bottom: _mediaSize.height * 0.01),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/triforceLoading.gif'),
          image: NetworkImage(
            _monstersData.image!,
          ),
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
    final _mediaSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Monster name:',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        SizedBox(
          height: _mediaSize.height * 0.02,
        ),
        Text(
          _monstersData.name!.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        )
      ],
    );
  }
}

class _FondoCielo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(170, 207, 193, 1),
      ),
    );
  }
}

class _TriforceFondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Image.asset('assets/triforce.png'),
    );
  }
}
