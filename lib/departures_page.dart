import 'package:bahn_app/bahn_expert_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class DeparturesPage extends StatelessWidget {
  const DeparturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: Center(
        child: BahnExpertView(path: '/'),
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
            print('Filter icon pressed');
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
    return TypeAheadField(
      itemBuilder: (context, text) => ListTile(
        title: Text(text),
      ),
      suggestionsCallback: (input) => [input],
      onSelected: (value) {},
    );
  }
}
