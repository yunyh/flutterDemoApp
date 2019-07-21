import 'dart:async';

import 'package:flutter_app/api/beers_api.dart';
import 'package:flutter_app/bloc/bloc.dart';
import 'package:flutter_app/model/beer_model.dart';

class BeersBloc2 implements AbstractBloc {
  final BeersApi beersApi;

  StreamController<List<BeerModel>> _controller = StreamController.broadcast();
  StreamController<String> _notificationMessageController =
      StreamController.broadcast();

  Stream<List<BeerModel>> get result => _controller.stream;

  Stream<String> get resultMessageStream =>
      _notificationMessageController.stream;

  BeersBloc2(this.beersApi);

  void getBeers(int page, int pageOffset) {
    beersApi
        .fetchPage(page, pageOffset)
        .then((list) => _controller.sink.add(list));
  }

  void notiMessage(String message) {
    _notificationMessageController.sink.add(message);
  }

  @override
  void dispose() {
    _controller.close();
    _notificationMessageController.close();
  }
}
