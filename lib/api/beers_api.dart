import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/model/beer_model.dart';
import 'package:http/http.dart' as http;

class BeersApi {
  String url = "https://api.punkapi.com/v2/beers";

  Future<List<BeerModel>> fetchPage(int page, int perPage) async {
    List<BeerModel> list = [];
    await http
        .get(Uri.parse('$url?page=$page&per_page=$perPage'))
        .then((response) => response.body)
        .then(json.decode)
        .then((beers) =>
            beers.forEach((model) => list.add(BeerModel.fromJson(model))));

    return list;

    //Iterable decodeList = json.decode(response);
    //   return response;
    //return decodeList.map((json) => BeerModel.fromJson(json)).toList();

    // return response;
    /* Iterable decodeList = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        return decodeList.map((json) => BeerModel.fromJson(json)).toList();
      default:
        throw Exception("Fail api");
    }*/
  }
}
