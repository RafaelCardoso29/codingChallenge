import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_dependency.dart';

import 'features/album_search/presentation/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocDependency.setBlocs(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: SearchScreen(),
        theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
          fontFamily: 'Muli',
        ),
      ),
    );
  }
}
