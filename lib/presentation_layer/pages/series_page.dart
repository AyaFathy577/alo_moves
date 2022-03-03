import 'package:alo_moves/bloc_layer/series_bloc.dart';
import 'package:alo_moves/data_layer/models/series_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesPage extends StatefulWidget {
  final String id;

  const SeriesPage({Key? key, required this.id}) : super(key: key);

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  SeriesModel? seriesModel;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await BlocProvider.of<SeriesBloc>(context).getSeriesById(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<SeriesBloc, SeriesState>(builder: (context, state) {
          if (state is ShowSeries) {
            seriesModel = state.seriesModel;
          }
          return seriesModel != null
              ? Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: seriesModel!.image,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Image.network("https://ancdmy.com/wp-content/plugins/"
                              "all-in-one-seo-pack-pro/images/default-user-image.png"),
                    ),
                    Text(seriesModel!.name),
                    Text(seriesModel!.description),
                  ],
                )
              : const Center(
                  child: Text("No data found"),
                );
        }),
      ),
    );
  }
}
