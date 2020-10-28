class Task {
  int id;
  String title;
  String priority;
  DateTime date;
  int status; //0 - imcomplete, 1- complete

  Task({this.title, this.date, this.priority, this.status});
  Task.withId({this.title, this.date, this.priority, this.id, this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['date'] = date.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;

    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map['id'],
      title: map['title'],
      priority: map['priority'],
      date: DateTime.parse(map['date']),
      status: map['status'],
    );
  }
}
