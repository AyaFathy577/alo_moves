import 'package:alo_moves/constants/strings.dart';
import 'package:alo_moves/presentation_layer/pages/series_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case seriesPage:
        List<dynamic> arguments = args as List<dynamic>;
        return MaterialPageRoute(
          builder: (_) => SeriesPage(id: arguments[0] as String),
        );
    }
  }
}
