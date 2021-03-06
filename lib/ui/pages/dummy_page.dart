import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praetorium/bloc/dummy_bloc.dart';
import 'package:praetorium/ui/widgets/bloc_widget.dart';
import 'package:praetorium/ui/widgets/dummy_item_widget.dart';

class DummyPage extends BlocWidget<DummyBloc> {
  DummyPage() : super(DummyBloc());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AAAAA'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => bloc.add(
                DummyEvent(10),
              ),
            )
          ],
        ),
        body: BlocBuilder<DummyBloc, DummyState>(
          builder: (_, state) => ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (_, int index) => DummyItemWidget(
              index: index,
              text: state.items[index],
            ),
          ),
        ));
  }
}

