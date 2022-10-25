import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocWidget<B extends Bloc> extends StatefulWidget {
  final B bloc;

  const BlocWidget(this.bloc, {Key? key}) : super(key: key);

  @override
  BlocWidgetState<B> createState() => BlocWidgetState<B>();

  Widget build(BuildContext context);
}

class BlocWidgetState<B extends Bloc> extends State<BlocWidget<B>> {
  BlocWidgetState();

  @override
  Widget build(BuildContext context) => BlocProvider<B>(
        create: (context) => widget.bloc,
        child: widget.build(context),
      );

  @override
  void dispose() {
    widget.bloc.close();
    super.dispose();
  }
}
