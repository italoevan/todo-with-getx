class Todo extends Comparable<Todo> {
  int? id;
  String? description;
  DateTime dateTime = DateTime.now();

  Todo({this.id, this.description});

  Todo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    description = map['description'];
    dateTime = DateTime.tryParse(map['dateTime']) ?? DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      "description": description,
      "dateTime": dateTime.toString(),
    };
  }

  @override
  int compareTo(Todo other) {
    int order = other.dateTime.compareTo(dateTime);
    if (order == 0) order = dateTime.compareTo(other.dateTime);
    return order;
  }
}
