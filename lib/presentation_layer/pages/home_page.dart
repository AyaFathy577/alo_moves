import 'package:alo_moves/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alo_moves/bloc_layer/series_bloc.dart';
import 'package:alo_moves/data_layer/models/series_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SeriesModel> series = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await BlocProvider.of<SeriesBloc>(context).getSeries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("AloMoves"),
        ),
        body: BlocBuilder<SeriesBloc, SeriesState>(builder: (context, state) {
          if (state is UpdateSeries) {
            series = state.series;
          }
          return ListView.builder(
            itemCount: series.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(seriesPage, arguments: [series[index].id]),
              child: Container(
                margin: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: series[index].image,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Image.network("https://ancdmy.com/wp-content/plugins/"
                              "all-in-one-seo-pack-pro/images/default-user-image.png"),
                    ),
                    Text(series[index].name),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
