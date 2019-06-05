import 'package:manabie_code_challenge/models/card.dart';

class DataRepository {
  Future<List<CardModel>> initCards() async {
    List<CardModel> cards = [
      CardModel(id: '1', color: '#2ecc71'),
      CardModel(id: '2', color: '#2ecc71', value: 1),
      CardModel(id: '3', color: '#2ecc71', value: 2),
      CardModel(id: '4', color: '#2ecc71'),
      CardModel(id: '5', color: '#2ecc71'),
      CardModel(id: '6', color: '#2ecc71'),
      CardModel(id: '7', color: '#2ecc71'),
      CardModel(id: '8', color: '#2ecc71'),
      CardModel(id: '9', color: '#2ecc71'),
      CardModel(id: '10', color: '#2ecc71'),
    ];
    return Future.delayed(
      Duration(seconds: 1),
      () => cards,
    );
  }
}
