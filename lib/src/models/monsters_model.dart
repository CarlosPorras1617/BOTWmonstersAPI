class MonstersModel{
  String ? category;
  List<dynamic> ? common_locations;
  String ? description;
  List<dynamic> ? drops;
  String ? name;
  String ? image;
  int ? id;

  MonstersModel({
    this.category,
    this.common_locations,
    this.description,
    this.drops,
    this.id,
    this.image,
    this.name
  });

  factory MonstersModel.fromMapJson(Map<String, dynamic>data)=>MonstersModel(
    category: data['category'],
    common_locations: data['common_locations'],
    description: data['description'],
    drops: data['drops'],
    id: data['id'],
    image: data['image'],
    name: data['name']
  );
}

