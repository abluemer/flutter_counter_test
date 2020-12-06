import 'package:flutter/material.dart';
import 'package:flutter_counter_test/app_root_widget.dart';

class InheritedWidgetExample extends StatelessWidget {
  const InheritedWidgetExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _MyDemoApp(),
    );
  }
}

// ###1. Define an InheritedWidget that stores `MyDemoState` (c.f. the
// 'MyDemo' StatefulWidget  that we defined below).
// All descendants of this widget can access `myState` by:
// final stateOfParent = MyInheritedWidget.of(context).myState;
// NOTE: InheritedWidget are *stateless*.
class MyInheritedWidget extends InheritedWidget {
  final _MyDemoAppState myState;

  const MyInheritedWidget({Key key, Widget child, @required this.myState})
      : super(key: key, child: child);

  @override
  // Returns when it's children widget should be notified for rebuild.
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return this.myState.counterValue != oldWidget.myState.counterValue;
  }

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}

// ###2. Define a stateFUL widget where the corresponding State<MyDemo> is to be
// fetched by children widgets.
class _MyDemoApp extends StatefulWidget {
  @override
  _MyDemoAppState createState() => _MyDemoAppState();
}

class _MyDemoAppState extends State<_MyDemoApp> {
  // In this demo the state is just _counter.
  int _counter = 0;

  int get counterValue => _counter;

  // Note: these state-mutating functions must be wrapped by setState().
  void incrementCounter() => setState(() => _counter++);
  void decrementCounter() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const Text(
            "InheritedWidget allows efficient sharing of app's state down "
            "the widgets tree.\n\n"
            "In this example, the app's root widget is an InheritedWidget, "
            "so it's state is shared to the two `CounterAndButtons` widgets "
            "below. \n\n"
            "Clicking on child widget's button would update the root "
            "widget's counter.\n\n"
            "*Note*: Recommend using ScopedModel or BLoC for CHANGING parent's "
            "state from child widget.\n"),
        // ###3. Put the inherited widget at the root of the widget tree, so that
        // all children widgets can access the state.
        MyInheritedWidget(
          myState: this,
          child: AppRootWidget(),
        ),
      ],
    );
  }
}
