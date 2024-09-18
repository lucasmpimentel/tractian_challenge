import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/assets_view/domain/usecases/assets_usecase.dart';
import 'package:tractian_challenge/features/assets_view/presenter/widgets/filter_widget.dart';

class TreeMenu extends StatelessWidget {
  final TreeNode root;

  const TreeMenu({super.key, required this.root});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FilterWidget(),
          Container(
            padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView(
              children: _buildTree(root),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTree(TreeNode node) {
    if (node.type == 'root') {
      return node.children.expand(_buildTree).toList();
    }
    if (node.children.isEmpty) {
      return [
        ListTile(
          leading: _pickIcon(node.type),
          title: Row(
            children: [
              Text(node.name),
              const SizedBox(width: 8),
              node.sensorType != null ? _pickSensorIcon(node.sensorType) : const SizedBox.shrink(),
              node.status == 'alert' ? const Icon(Icons.warning, color: Colors.red) : const SizedBox.shrink(),
            ],
          ),
        ),
      ];
    }
    return [
      ExpansionTile(
        leading: _pickIcon(node.type),
        title: Row(
          children: [
            Text(node.name),
            const SizedBox(width: 8),
            node.sensorType != null ? _pickSensorIcon(node.sensorType) : const SizedBox.shrink(),
            node.status == 'alert' ? const Icon(Icons.warning, color: Colors.red) : const SizedBox.shrink(),
          ],
        ),
        children: node.children.expand(_buildTree).toList(),
      ),
    ];
  }

  dynamic _pickIcon(String type) {
    switch (type) {
      case 'location':
        return const Icon(
          Icons.location_on_outlined,
          color: Colors.blue,
        );
      case 'sublocation':
        return const Icon(
          Icons.location_on_outlined,
          color: Colors.blue,
        );
      case 'asset':
        return Image.asset('assets/icons/IoCubeOutlineCUBE.png', width: 24, height: 24);
      case 'subasset':
        return Image.asset('assets/icons/IoCubeOutlineCUBE.png', width: 24, height: 24);
      case 'component':
        return Image.asset('assets/icons/Codepenblock.png', width: 24, height: 24);
      default:
        return const SizedBox();
    }
  }

  Icon _pickSensorIcon(String? sensorType) {
    switch (sensorType) {
      case 'energy':
        return const Icon(Icons.flash_on_sharp, color: Colors.green);
      case 'vibration':
        return Icon(Icons.vibration_outlined, color: Colors.grey[500]);
      default:
        return const Icon(Icons.devices_other);
    }
  }
}
