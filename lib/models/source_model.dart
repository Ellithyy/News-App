class SourceModel {
  final String id;
  final String name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.formJson(Map<String, dynamic> json) => SourceModel(
    id: json["id"],
    name: json["name"],
  );

}