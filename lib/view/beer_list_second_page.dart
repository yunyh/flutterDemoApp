import 'package:flutter/material.dart';
import 'package:flutter_app/api/beers_api.dart';
import 'package:flutter_app/bloc/beers_bloc2.dart';
import 'package:flutter_app/bloc/beers_bloc_provider.dart';
import 'package:flutter_app/model/beer_model.dart';

class BeerListSecondPage extends StatelessWidget {
  const BeerListSecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: _BeerListSecondPage(),
      bloc: BeersBloc2(BeersApi()),
    );
  }
}

class _BeerListSecondPage extends StatefulWidget {
  const _BeerListSecondPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BeerListSecondPageState();
  }
}

class _BeerListSecondPageState extends State<_BeerListSecondPage> {
  List<BeerModel> list = List();

  ScrollController _controller = ScrollController();
  BeersBloc2 _beersBloc;

  int _currentPage = 0;
  final _pageOffset = 10;

  void _listener() {
    double offset = _controller.offset;
    if (offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _beersBloc.notiMessage("_controller.position.maxScrollExtent");
      _beersBloc.getBeers(_currentPage++, _pageOffset);
    }
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _beersBloc = BlocProvider.of(context);
    List<BeerModel> list = PageStorage.of(context)
        .readState(context, identifier: ValueKey("list2"));
    if (list != null) {
      this.list.addAll(list);
    } else {
      _beersBloc.getBeers(_currentPage++, _pageOffset);
    }
  }

  @override
  void dispose() {
    list.clear();
    _beersBloc.dispose();
    _controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return Column(
      children: <Widget>[
        Container(
          height: 50.0,
          child: StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data);
              } else {
                return Text("");
              }
            },
            stream: _beersBloc.resultMessageStream,
          ),
        ),
        Expanded(
          child: StreamBuilder<List<BeerModel>>(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return _loadingView;
                case ConnectionState.done:
                case ConnectionState.active:
                  if (snapshot.hasData) {
                    list.addAll(snapshot.data);
                    PageStorage.of(context).writeState(context, list,
                        identifier: ValueKey("list2"));
                    return _listView();
                  }
                  return _loadingView;
              }
            },
            stream: _beersBloc.result,
          ),
        )
      ],
    );
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _listView() {
    return ListView.builder(
        controller: _controller,
        itemCount: list.length + 1,
        itemBuilder: (context, index) {
          if (index == list.length) {
            return _loadingView;
          }
          return _listItemBuilder(list[index]);
        });
  }

  Widget _listItemBuilder(BeerModel item) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      leading: Image(image: NetworkImage(item.imageUrl)),
      title: Text(item.name),
    );
  }
}
