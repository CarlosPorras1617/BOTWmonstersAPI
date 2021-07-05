import 'package:dio/dio.dart';
import 'package:monsters_botw/src/models/monsters_model.dart';

class MonstersProvider{
  final String _url= 'https://botw-compendium.herokuapp.com/api/v2';
  final http = Dio();

  Future<List<MonstersModel>> obtenerMonsters()async{
    List<MonstersModel> monsters = [];
    final response = await http.get(_url);

    List<dynamic> responseData = response.data['data']['monsters'];
    return responseData.map((data) => MonstersModel.fromMapJson(data)).toList();
  }
}