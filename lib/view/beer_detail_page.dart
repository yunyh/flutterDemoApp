import 'package:flutter/material.dart';
import 'package:flutter_app/model/beer_model.dart';

class BeerDetailPage extends StatelessWidget {
  final BeerModel beerModel;

  BeerDetailPage({Key key, @required this.beerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${beerModel.name}"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: beerModel.name,
          child: Container(
            margin: EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(beerModel.imageUrl))),
          ),
        ),
      ),
    );
  }
}
