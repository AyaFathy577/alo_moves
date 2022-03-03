import 'package:alo_moves/bloc_layer/series_bloc.dart';
import 'package:alo_moves/presentation_layer/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SeriesBloc()),
      ],
      child: const MaterialApp(
        title: 'AloMoves',
        home: HomePage(),
      ),
    );
  }
}
