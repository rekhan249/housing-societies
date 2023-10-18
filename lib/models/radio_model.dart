class ServiceProAvail {
  int id;
  String title;

  ServiceProAvail({required this.id, required this.title});

  factory ServiceProAvail.fromMap(map) =>
      ServiceProAvail(id: map['id'], title: map['title']);

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title};
  }
}
