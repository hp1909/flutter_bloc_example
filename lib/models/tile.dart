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
}
