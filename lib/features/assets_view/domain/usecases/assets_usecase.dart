import 'package:tractian_challenge/features/assets_view/domain/entities/result_asset.dart';
import 'package:tractian_challenge/features/assets_view/domain/entities/result_location.dart';
import 'package:tractian_challenge/features/assets_view/domain/repositories/assets_repository.dart';

abstract class AssetsUsecase {
  Future<TreeNode> call(String id);
}

class TreeNode {
  String id;
  String name;
  String type;
  String? sensorType;
  String? status;
  List<TreeNode> children;

  TreeNode({
    required this.id,
    required this.name,
    required this.type,
    this.sensorType,
    this.status,
    List<TreeNode>? children,
  }) : children = children ?? [];
}

class GetAssetsImpl implements AssetsUsecase {
  final AssetsRepository repository;
  List<ResultAsset> assetsResults = [];
  List<ResultLocation> locationsResults = [];

  GetAssetsImpl({required this.repository});

  @override
  Future<TreeNode> call(String id) async {
    assetsResults = await repository.getAssetsByCompanyId(id).then((value) => value.fold((l) => throw Exception(), (r) => r));
    locationsResults = await repository.getLocationsByCompanyId(id).then((value) => value.fold((l) => throw Exception(), (r) => r));

    TreeNode tree = await buildTree(locationsResults, assetsResults);

    return tree;
  }

  Future<TreeNode> buildTree(List<ResultLocation> locations, List<ResultAsset> assets) async {
    TreeNode root = await buildLocationTree(locations, assets);
    return root;
  }

  Future<TreeNode> buildLocationTree(List<ResultLocation> locations, List<ResultAsset> assets) async {
    Map<String, TreeNode> locationMap = {};
    TreeNode root = TreeNode(id: 'root', name: 'ROOT', type: 'root');

    // Cria nós para todas as locations
    for (var location in locations) {
      locationMap[location.id] = TreeNode(
        id: location.id,
        name: location.name,
        type: 'location',
      );
    }

    // Adiciona locations à árvore
    for (var location in locations) {
      if (location.parentId == null) {
        root.children.add(locationMap[location.id]!);
      } else if (locationMap.containsKey(location.parentId)) {
        locationMap[location.parentId]!.children.add(locationMap[location.id]!);
      } else {
        throw Exception('Parent location with id ${location.parentId} not found');
      }
    }

    // Adiciona assets à árvore
    for (var asset in assets) {
      if (asset.locationId != null) {
        TreeNode? locationNode = locationMap[asset.locationId];
        locationNode?.children.add(TreeNode(
          id: asset.id,
          name: asset.name,
          sensorType: asset.sensorType,
          status: asset.status,
          type: asset.sensorType != null ? 'component' : 'asset',
        ));
      } else if (asset.parentId != null) {
        TreeNode parentNode = findNodeById(root, asset.parentId!);
        parentNode.children.add(TreeNode(
          id: asset.id,
          name: asset.name,
          sensorType: asset.sensorType,
          status: asset.status,
          type: asset.sensorType != null ? 'component' : 'asset',
        ));
      } else {
        root.children.add(TreeNode(
          id: asset.id,
          name: asset.name,
          sensorType: asset.sensorType,
          status: asset.status,
          type: asset.sensorType != null ? 'component' : 'asset',
        ));
      }
    }

    return root;
  }

  TreeNode findNodeById(TreeNode node, String id) {
    if (node.id == id) {
      return node;
    }
    for (var child in node.children) {
      var result = findNodeById(child, id);
      if (result.id != '') {
        return result;
      }
    }
    return TreeNode(id: '', name: '', type: '');
  }
}
