import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praetorium/bloc/dummy_bloc.dart';
import 'package:praetorium/ui/widgets/dummy_item_widget.dart';

class MyOtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AAAAA"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => BlocProvider.of<DummyBloc>(context).add(
                DummyEvent(10),
              ),
            )
          ],
        ),
        body: BlocBuilder<DummyBloc, DummyState>(
          builder: (BuildContext context, DummyState state) => ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (_, int index) => DummyItemWidget(
              index: index,
              text: state.items[index],
            ),
          ),
        ));
  }
}
