import 'package:flutter/material.dart';

import 'package:manabie_code_challenge/models/card.dart';
import 'package:manabie_code_challenge/utils/common_style.dart';
import 'package:manabie_code_challenge/utils/hex_color.dart';

class CardDetail extends StatelessWidget {
  final CardModel card;

  CardDetail({Key key, this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('render card detail');
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: HexColor(card.color),
        child: Center(
          child: Text(
            '${card.value}',
            style: TEXT_BIG,
          ),
        ),
      ),
    );
  }
}
