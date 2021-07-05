import 'package:get/get.dart';
import 'package:monsters_botw/src/models/monsters_model.dart';
import 'package:monsters_botw/src/providers/monsters_provider.dart';

class MonstersState extends GetxController{
  List<MonstersModel> monsters =[];
  final _monstersProvider = MonstersProvider();
  Future<void> obtenerMonsters()async{
    final moustros = await _monstersProvider.obtenerMonsters();
    monsters.addAll(moustros);
    update();
  }
}