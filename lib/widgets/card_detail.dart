import 'package:flutter/material.dart';

import 'package:manabie_code_challenge/models/tile.dart';
import 'package:manabie_code_challenge/utils/common_style.dart';
import 'package:manabie_code_challenge/utils/hex_color.dart';

class CardDetail extends StatelessWidget {
  final Tile tile;

  CardDetail({Key key, this.tile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('render card detail');
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: HexColor(tile.color),
        child: Center(
          child: Text(
            '${tile.value}',
            style: TEXT_BIG,
          ),
        ),
      ),
    );
  }
}
