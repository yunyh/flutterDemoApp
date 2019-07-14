import 'dart:async';

import 'package:flutter_app/api/beers_api.dart';
import 'package:flutter_app/model/beer_model.dart';

class BeersBloc {
  final BeersApi _beersApi;

  StreamController<List<BeerModel>> _controller = StreamController();

  Stream<List<BeerModel>> get result => _controller.stream;

  BeersBloc(this._beersApi);

  void dispose() {
    _controller.close();
  }

  void getBeers() {
    _beersApi.fetchPage(1, 10).then((list) {
      _controller.sink.add(list);
    });
  }
}
