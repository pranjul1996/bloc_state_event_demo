import 'package:bloc_demo/UserBloc/user_bloc.dart';
import 'package:bloc_demo/amino_bloc_observer.dart';
import 'package:bloc_demo/bloc/counter_bloc.dart';
import 'package:bloc_demo/ui/user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AminoBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) =>
              CounterBloc()..add(const CounterEvent()),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc()..add(LoadUserEvent()),
        ),
      ], child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 2;

  void _incrementCounter() {
    BlocProvider.of<CounterBloc>(context).add(UpdateCounterOnClick(_counter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const UserListScreen(),
      // body: blocBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget blocBody() {
    return BlocBuilder<CounterBloc, CounterState>(
      buildWhen: (previous, current) {
        return previous.counterUpdate != current.counterUpdate;
      },
      builder: (context, state) {
        _counter = state.counterUpdate ?? 0;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${state.counterUpdate}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
