import 'package:alo_moves/presentation_layer/pages/series_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alo_moves/bloc_layer/series_bloc.dart';
import 'package:alo_moves/data_layer/models/series_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:alo_moves/data_layer/services/series_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      SeriesService().getSeries(context);
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
          List<SeriesModel> series = [];
          if (state is UpdateSeries) {
            series = state.series;
          }
          // if (series.isNotEmpty) print(series[0].image);
          return ListView.builder(
            itemCount: series.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SeriesPage(id: series[index].id),
              )),
              child: Container(
                margin: const EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: CachedNetworkImage(
                  imageUrl: series[index].image,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Image.network("https://ancdmy.com/wp-content/plugins/"
                          "all-in-one-seo-pack-pro/images/default-user-image.png"),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
