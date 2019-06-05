import 'package:flutter/material.dart';

import 'package:manabie_code_challenge/models/card.dart';
import 'package:manabie_code_challenge/utils/common_style.dart';
import 'package:manabie_code_challenge/utils/hex_color.dart';
import 'package:manabie_code_challenge/utils/keys.dart';

class CardElement extends StatefulWidget {
  final CardModel card;

  CardElement({Key key, this.card}) : super(key: key);

  @override
  _CardElementState createState() => _CardElementState();
}

class _CardElementState extends State<CardElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      color: HexColor(widget.card.color),
      child: Center(
        child: Text(
          '${widget.card.value}',
          key: cardItemTextKey(widget.card.id),
          style: TEXT_BIG,
        ),
      ),
    );
  }
}
