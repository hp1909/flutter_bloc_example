import 'package:flutter/material.dart';
import 'package:manabie_code_challenge/blocs/detail/detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_code_challenge/locator.dart';
import 'package:manabie_code_challenge/providers/data_repository.dart';
import 'package:manabie_code_challenge/utils/keys.dart';
import 'package:manabie_code_challenge/widgets/card_detail.dart';

import 'package:manabie_code_challenge/widgets/card_element.dart';
import '../blocs/list/list.dart';
import '../blocs/detail/detail.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DataRepository dataRepository;
  ListBloc _listBloc;
  DetailBloc _detailBloc;

  @override
  void initState() {
    dataRepository = getIt<DataRepository>();
    _listBloc = ListBloc(dataRepository: dataRepository);
    _detailBloc = DetailBloc(listBloc: _listBloc);
    _listBloc.dispatch(InitList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: BlocBuilder(
                bloc: _listBloc,
                builder: (BuildContext context, ListState state) {
                  if (state is ListLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ListLoaded) {
                    final tiles = state.tiles;
                    return ListView.builder(
                      key: LIST_TILES_KEY,
                      scrollDirection: Axis.horizontal,
                      itemCount: tiles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _detailBloc
                                .dispatch(SelectDetail(tile: tiles[index]));
                          },
                          child: CardElement(
                            key: listTileItemKey(tiles[index].id),
                            tile: tiles[index],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: BlocBuilder(
              bloc: _detailBloc,
              builder: (BuildContext context, DetailState state) {
                if (state is DetailUninitialized) {
                  return Container(
                    key: EMPTY_DETAIL_TILE_KEY,
                  );
                }
                if (state is DetailSelected) {
                  return GestureDetector(
                    onTap: () =>
                        _listBloc.dispatch(IncreaseTile(tile: state.tile)),
                    child: CardDetail(
                      key: DETAIL_TILE_KEY,
                      tile: state.tile,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
