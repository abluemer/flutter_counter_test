import 'package:flutter/material.dart';
import 'package:flutter_counter_test/overview.dart';
import 'counter_and_button.dart';

class AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootWidgetsState = MyInheritedWidget.of(context).myState;
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          const Text('(root widget)'),
          Text(
            '${rootWidgetsState.counterValue}',
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CounterAndButton(),
              CounterAndButton(),
            ],
          ),
        ],
      ),
    );
  }
}
