import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praetorium/bloc/global_bloc.dart';

class GlobalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () => BlocProvider.of<GlobalBloc>(context).add(GlobalEvent()),
      child: Icon(Icons.fastfood),
    ),
    body: BlocBuilder<GlobalBloc, GlobalState>(
      builder: (_, state) => Center(
        child: Text(state.data),
      ),
    ),
  );
}