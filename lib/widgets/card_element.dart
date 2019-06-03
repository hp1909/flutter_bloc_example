import 'package:flutter/material.dart';

import 'package:manabie_code_challenge/models/tile.dart';
import 'package:manabie_code_challenge/utils/hex_color.dart';

class CardElement extends StatefulWidget {
  final Tile tile;

  CardElement({Key key, this.tile}) : super(key: key);

  @override
  _CardElementState createState() => _CardElementState();
}

class _CardElementState extends State<CardElement> {
  @override
  Widget build(BuildContext context) {
    print(widget.tile.color);
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      color: HexColor(widget.tile.color),
      child: Center(
        child: Text(
          '${widget.tile.value}',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
