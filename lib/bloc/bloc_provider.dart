import 'package:flutter/cupertino.dart';
import 'package:timesofmetro/bloc/bloc.dart';

class BlocProvider<T extends Bloc> extends InheritedWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T> provider =
        context.dependOnInheritedWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }

  // 3
  static Type _providerType<T>() => T;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

/* @override
  State<StatefulWidget> createState() {
    return _BlocProviderState();
  }*/

}
/*
class _BlocProviderState extends State<BlocProvider>{

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

}*/
