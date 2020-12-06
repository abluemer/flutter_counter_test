import 'package:flutter/material.dart';
import 'package:flutter_counter_test/overview.dart';

class CounterAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ###4. Retrieve parent widget's state using the static of() function.
    final rootWidgetsState = MyInheritedWidget.of(context).myState;
    return Card(
      margin: const EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          const Text('(child widget)'),
          Text(
            '${rootWidgetsState.counterValue}',
            style: Theme.of(context).textTheme.headline4,
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => rootWidgetsState.incrementCounter(),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => rootWidgetsState.decrementCounter(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
