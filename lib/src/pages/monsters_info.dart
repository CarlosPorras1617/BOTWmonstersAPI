import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:monsters_botw/src/models/monsters_model.dart';
import 'package:monsters_botw/src/pages/home_page.dart';

class MonstersInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Take information from arguments
    final MonstersModel monster =
        ModalRoute.of(context)!.settings.arguments as MonstersModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(170, 207, 193, 1),
        title: Text(monster.name!.toUpperCase()),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: MonsterImage(monster),
              ),
              _BackgroundBodyRectangle(monster),
            ],
          ),
        ],
      ),
    );
  }
}

class _BackgroundBodyRectangle extends StatelessWidget {
  final MonstersModel monster;
  _BackgroundBodyRectangle(this.monster);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Color.fromRGBO(170, 207, 193, 1)),
        child: Column(
          children: [
            _TitlesMonster(
              monster: monster,
              textAdd: 'CATEGORY',
            ),
            _InfoMonsters(
              infoMonsters: monster.category,
            ),
            _TitlesMonster(
              monster: monster,
              textAdd: 'DESCRIPTION',
            ),
            _InfoMonsters(
              infoMonsters: monster.description,
            ),
            _TitlesMonster(
              monster: monster,
              textAdd: 'LOCATIONS',
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
              ),
              child: Column(
                children: monster.commonLocations!
                    .map(
                      (locations) => Container(
                        child: Column(
                          children: [
                            Text(locations.nameLocation!,style: TextStyle(fontSize: 18.0),),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            _TitlesMonster(
              monster: monster,
              textAdd: 'DROPS',
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
              ),
              child: Column(
                children: monster.drops!
                    .map(
                      (locations) => Container(
                        child: Column(
                          children: [
                            Text(locations.drops!,style: TextStyle(fontSize: 18.0),),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
  }
}

class _TitlesMonster extends StatelessWidget {
  final MonstersModel? monster;
  final String? textAdd;
  _TitlesMonster({this.monster, this.textAdd});
  @override
  Widget build(BuildContext context) {
    final _mediaSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            'assets/swordHorizontal.png',
            height: _mediaSize.height * 0.139,
          ),
        ),
        Positioned(
          top: _mediaSize.height * 0.052,
          left: _mediaSize.width * 0.45,
          child: Text(
            textAdd!.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
          ),
        ),
      ],
    );
  }
}

class _InfoMonsters extends StatelessWidget {
  final String? infoMonsters;
  _InfoMonsters({this.infoMonsters});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: Text(
        infoMonsters!,
        overflow: TextOverflow.ellipsis,
        maxLines: 20,
        style: TextStyle(fontSize: 18.0),textAlign: TextAlign.justify,
      ),
    );
  }
}
