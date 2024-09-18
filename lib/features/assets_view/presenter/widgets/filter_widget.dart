import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterWidget extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SearchBar(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
            surfaceTintColor: WidgetStateProperty.all(Colors.grey[400]),
            leading: const Icon(Icons.search),
            hintText: 'Buscar',
            elevation: WidgetStateProperty.all(1),
            controller: widget.controller,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FilledButton.icon(
                label: const Text('Energia'),
                onPressed: () {},
                icon: const Icon(Icons.bolt),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blueAccent[100]),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              OutlinedButton.icon(
                icon: Icon(
                  Icons.error_outline_sharp,
                  color: Colors.red[200],
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                onPressed: () {},
                label: const Text('Crítico'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
