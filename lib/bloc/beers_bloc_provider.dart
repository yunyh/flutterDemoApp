import 'package:flutter/material.dart';
import 'package:flutter_app/api/beers_api.dart';
import 'package:flutter_app/bloc/beers_bloc.dart';

class BeersBlocProvider extends InheritedWidget {
  final BeersBloc beersBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BeersBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BeersBlocProvider)
              as BeersBlocProvider)
          .beersBloc;

  BeersBlocProvider({Key key, BeersBloc beersBloc, Widget child})
      : this.beersBloc = beersBloc ?? BeersBloc(BeersApi()),
        super(child: child, key: key);
}
