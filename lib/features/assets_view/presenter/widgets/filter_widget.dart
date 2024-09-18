// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add this import

import 'package:tractian_challenge/features/assets_view/presenter/cubit/assets_view_cubit.dart';

class FilterWidget extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  bool isEnergyFilterActive = false;
  FilterWidget({
    super.key,
    this.isEnergyFilterActive = false,
  });

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  _activateEnergyFilter() {
    widget.isEnergyFilterActive = !widget.isEnergyFilterActive;
    context.read<AssetsViewCubit>().filterByEnergy(widget.isEnergyFilterActive);
  }

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
              widget.isEnergyFilterActive
                  ? FilledButton.icon(
                      label: const Text(
                        'Energia',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: _activateEnergyFilter,
                      icon: const Icon(Icons.bolt),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blueAccent[100]),
                        surfaceTintColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    )
                  : OutlinedButton.icon(
                      label: const Text('Energia'),
                      onPressed: _activateEnergyFilter,
                      icon: const Icon(Icons.bolt),
                      style: ButtonStyle(
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
