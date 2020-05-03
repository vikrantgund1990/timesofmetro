import 'package:flutter/cupertino.dart';
import 'package:timesofmetro/bloc/bloc.dart';

class BaseBlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BaseBlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BaseBlocProvider<T>>();
    final BaseBlocProvider<T> provider =
    context.findAncestorRenderObjectOfType();
    return provider.bloc;
  }

  // 3
  static Type _providerType<T>() => T;

  /* @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }*/

  @override
  State<StatefulWidget> createState() {
    return _BaseBlocProviderState();
  }

}

class _BaseBlocProviderState extends State<BaseBlocProvider> {

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

}
