class User {
  User({required this.id, required this.name});

  String id;
  String name;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
