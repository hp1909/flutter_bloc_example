class CardModel {
  String id;
  int value;
  String color;

  CardModel({this.id, this.value = 0, this.color});

  CardModel copyWith({String id, int value, String color}) {
    return CardModel(
      id: id ?? this.id,
      value: value ?? this.value,
      color: color ?? this.color,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          value == other.value &&
          color == other.color;

  @override
  int get hashCode => id.hashCode;
}
