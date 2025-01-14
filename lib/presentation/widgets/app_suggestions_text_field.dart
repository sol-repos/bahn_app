import 'dart:async';

import 'package:bahn_app/data/data_sources/local/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AppSuggestionsTextField extends StatefulWidget {
  final FutureOr<List<String>?> Function(String) suggestionsCallback;
  final Widget Function(BuildContext context, String text)? itemBuilder;
  final void Function(String)? onSelected;
  final TextEditingController controller;
  final FocusNode focusNode;

  AppSuggestionsTextField({
    super.key,
    required this.suggestionsCallback,
    this.itemBuilder,
    this.onSelected,
  })  : controller = TextEditingController(),
        focusNode = FocusNode();

  @override
  AppSuggestionsTextFieldState createState() => AppSuggestionsTextFieldState();
}

class AppSuggestionsTextFieldState extends State<AppSuggestionsTextField> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      itemBuilder: widget.itemBuilder ??
          (context, String text) => ListTile(
                title: Text(text),
              ),
      suggestionsCallback: widget.suggestionsCallback,
      onSelected: (selected) {
          widget.onSelected?.call(selected);
          widget.focusNode.unfocus();
          widget.controller.text = selected;
        },
      controller: widget.controller,
      focusNode: widget.focusNode,
      emptyBuilder: (context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          AppTexts.noStationsFound,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
