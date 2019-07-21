import 'package:flutter/material.dart';

import 'bloc.dart';

class BlocProvider<T extends AbstractBloc> extends InheritedWidget {
  final T blocModel;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static T of<T extends AbstractBloc>(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(_typeOf<BlocProvider<T>>())
      as BlocProvider<T>)
          .blocModel;

  static Type _typeOf<P>() => P;

  BlocProvider({Key key, @required T bloc, Widget child})
      : this.blocModel = bloc,
        super(key: key, child: child);
}
