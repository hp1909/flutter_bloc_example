class Tile {
  String id;
  int value;
  String color;

  Tile({this.id, this.value = 0, this.color});

  Tile copyWith({String id, int value, String color}) {
    return Tile(
      id: id ?? this.id,
      value: value ?? this.value,
      color: color ?? this.color,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tile &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          value == other.value &&
          color == other.color;
}
