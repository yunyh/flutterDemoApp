import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/beers_bloc_provider.dart';

class BeerListSecondPage extends StatefulWidget {
  const BeerListSecondPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BeerListSecondPageState();
  }
}

class _BeerListSecondPageState extends State<BeerListSecondPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    BeersBlocProvider.of(context).getBeers();
    return Scaffold();
  }

  @override
  bool get wantKeepAlive => true;
}
