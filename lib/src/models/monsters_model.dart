class MonstersModel{
  String ? category;
  List<CommonLocations> ? commonLocations;
  String ? description;
  List<Drops> ? drops;
  String ? name;
  String ? image;
  int ? id;

  MonstersModel({
    this.category,
    this.commonLocations,
    this.description,
    this.drops,
    this.id,
    this.image,
    this.name
  });

  factory MonstersModel.fromMapJson(Map<String, dynamic>data)=>MonstersModel(
    category: data['category'],
    commonLocations: (data['common_locations'] == null) ? [] :  data['common_locations'].map((data)=>CommonLocations.fromMapJson(data)).toList().cast<CommonLocations>(),
    description: data['description'],
    drops: (data['drops'] == null) ? [] : data['drops'].map((data)=>Drops.fromMapJson(data)).toList().cast<Drops>(),
    id: data['id'],
    image: data['image'],
    name: data['name']
  );
}

class Drops {
  String? drops;
  Drops({this.drops});

  factory Drops.fromMapJson(String data) =>Drops(
    drops:  data);
}

class CommonLocations {
  String ? nameLocation;
  CommonLocations({this.nameLocation});

  factory CommonLocations.fromMapJson(String data) =>CommonLocations(
    nameLocation: data);
}

