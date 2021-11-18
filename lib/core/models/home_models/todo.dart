class Todo {
  int? id;
  String? description;

  Todo({this.id, this.description});

  Todo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    description = map['description'];
  }

  Map<String, dynamic> toMap() {
    return {"description": description};
  }
}
