
class UserModel {
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        image: json['small'],
      );

  UserModel({
    required this.name,
    required this.image,
    required this.id,
  });

  final String name;
  final String image;
  final String id;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'small': image,
      };

  Map<String, dynamic> toMap(List<dynamic> list) {
    return {
      'id': id,
      'name': name,
      'small': image,
    };
  }
}



//@JsonSerializable()
// class UserModel {

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         data: json['data'],
//       );
//   UserModel({
//     required this.data,
//   });

//   Data data;

//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }

// @JsonSerializable()
// class Data {

//   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
//   Data({
//     required this.name,
//     required this.image,
//     required this.id,
//   });
//   @JsonKey(name: 'id')
//   String id;
//   @JsonKey(name: 'name')
//   String name;
//   String image;
//   Map<String, dynamic> toJson() => _$DataToJson(this);
// }



