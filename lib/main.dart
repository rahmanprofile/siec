import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siec/controller/data/todo_bloc.dart';
import 'package:siec/controller/searching/searching_bloc.dart';
import 'package:siec/view/main_widget.dart';
import 'package:siec/view/observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (__) => SearchingBloc()),
        BlocProvider(create: (__) => TodoBloc()..add(FetchTodo())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainWidget(),
      ),
    );
  }
}
