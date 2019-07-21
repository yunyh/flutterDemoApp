import 'dart:async';

import 'package:flutter_app/api/beers_api.dart';
import 'package:flutter_app/bloc/bloc.dart';
import 'package:flutter_app/model/beer_model.dart';

class BeersBloc implements AbstractBloc {
  final BeersApi _beersApi;

  StreamController<List<BeerModel>> _controller = StreamController.broadcast();

  Stream<List<BeerModel>> get result => _controller.stream;

  BeersBloc(this._beersApi);

  @override
  void dispose() {
    _controller.close();
  }

  void getBeers(int page, int perPage) =>
      _beersApi.fetchPage(page, perPage).then((list) {
        _controller.sink.add(list);
      });
}
