import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/beers_bloc.dart';
import 'package:flutter_app/bloc/beers_bloc_provider.dart';
import 'package:flutter_app/model/beer_model.dart';
import 'package:flutter_app/view/beer_detail_page.dart';

class BeerListFirstPage extends StatefulWidget {
  const BeerListFirstPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BeerListFirstPageState();
  }
}

class _BeerListFirstPageState extends State<BeerListFirstPage>
    with AutomaticKeepAliveClientMixin<BeerListFirstPage> {
  BeersBloc _beersBloc;

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _beersBloc = BeersBlocProvider.of(context);
    _beersBloc.getBeers();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var state = PageStorage.of(context)
        .readState(context, identifier: ValueKey("list"));
    if (state is List<BeerModel>) {
      return _gridView(state);
    }

    return StreamBuilder<List<BeerModel>>(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return _loadingView;
            case ConnectionState.waiting:
              return _loadingView;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                PageStorage.of(context).writeState(context, snapshot.data,
                    identifier: ValueKey("list"));
                return _gridView(snapshot.data);
              }
              return _loadingView;
          }
          //return _loadingView;
        },
        stream: _beersBloc.result);
  }

  @override
  void dispose() {
    _beersBloc.dispose();
    super.dispose();
  }

  Widget _gridView(List<BeerModel> beerList) {
    //GridView.builder(gridDelegate: null, itemBuilder: null)

    return GridView.count(
      crossAxisCount: 2,
      children: beerList
          .map((beer) => Padding(
                padding: EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BeerDetailPage(beerModel: beer)));
                  },
                  child: Hero(
                    tag: beer.name,
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(beer.imageUrl),
                                    fit: BoxFit.scaleDown)),
                          ),
                          Text(
                            beer.name,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
