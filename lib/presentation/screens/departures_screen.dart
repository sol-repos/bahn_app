import 'package:bahn_app/data/data_sources/remote/station_data_remote_datasource.dart';
import 'package:bahn_app/domain/usecases/station_search.dart';
import 'package:bahn_app/presentation/controllers/bahn_expert_web_view_controller.dart';
import 'package:bahn_app/presentation/widgets/bahn_expert_web_view.dart';
import 'package:flutter/material.dart';

import '../widgets/app_suggestions_text_field.dart';

class DeparturesScreen extends StatelessWidget {
  const DeparturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: Center(
        child: BahnExpertWebView(path: '/'),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          print('Menu icon pressed');
        },
      ),
      title: _SearchBar(),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {
            StationDataRemoteDatasource.getStations(search: 'Würzburg*');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppSuggestionsTextField(
      suggestionsCallback: (input) async {
        if (input.isEmpty) {
          return null;
        }
        // TODO: Mabye filter bc eg. Berlin Anhalter Bahnhof is not a valid station on bahn.expert
        final stationData = await StationDataSearch.use(StationDataSearchParams(
          searchString: '$input*',
          limit: 5,
        ));
        return stationData.map((station) => station.name).toList();
      },
      onSelected: (selected) {
        BahnExpertWebViewController.loadPath(selected);
      },
    );
  }
}
