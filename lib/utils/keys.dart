import 'package:flutter/foundation.dart';

const LIST_TILES_KEY = Key('__LIST_TILES_KEY__');
const DETAIL_TILE_KEY = Key('__DETAIL_TILE_KEY__');
const EMPTY_DETAIL_TILE_KEY = Key('__EMPTY_DETAIL_TILE_KEY__');

listTileItemKey(id) => Key('__LIST_TILES_ITEM_${id}_KEY__');
listTileItemTextKey(id) => Key('__LIST_TILES_ITEM_${id}_TEXT_KEY__');
