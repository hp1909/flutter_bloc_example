import 'package:flutter/foundation.dart';

const LIST_CARDS_KEY = Key('__LIST_CARDS_KEY__');
const DETAIL_CARD_KEY = Key('__DETAIL_CARD_KEY__');
const EMPTY_DETAIL_CARD_KEY = Key('__EMPTY_DETAIL_CARD_KEY__');

cardItemKey(id) => Key('__CARD_ITEM_${id}_KEY__');
cardItemTextKey(id) => Key('__CARD_ITEM_${id}_TEXT_KEY__');
