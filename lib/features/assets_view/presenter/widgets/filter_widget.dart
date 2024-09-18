import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  FilterWidget({super.key}); 

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          controller: widget.controller
        )
      ],
    );
  }
}