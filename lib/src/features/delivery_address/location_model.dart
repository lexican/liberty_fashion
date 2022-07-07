class LocationModel {
  const LocationModel(this.id, this.name, this.amount);

  final String name;
  final String id;
  final int amount;

  Map<String, dynamic> toJson() {
    return {"name": name, "id": id, "amount": amount};
  }

  bool operator ==(o) => o is LocationModel && o.name == name && o.id == id;
}
