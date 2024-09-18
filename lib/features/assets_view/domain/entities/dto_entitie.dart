import 'package:tractian_challenge/features/assets_view/domain/entities/result_asset.dart';
import 'package:tractian_challenge/features/assets_view/domain/entities/result_location.dart';

class LayerDTO {
  List<dynamic> firstLayer;
  List<dynamic> secondLayer;
  List<dynamic> thirdLayer;
  List<dynamic> fourthLayer;
  List<dynamic> fifthLayer;

  LayerDTO({
    required this.firstLayer,
    required this.secondLayer,
    required this.thirdLayer,
    required this.fourthLayer,
    required this.fifthLayer,
  });

  factory LayerDTO.init() {
    return LayerDTO(
      firstLayer: [],
      secondLayer: [],
      thirdLayer: [],
      fourthLayer: [],
      fifthLayer: [],
    );
  }
}

class DTO {
  final LocationsDTO locationsDTO;
  final AssetsDTO assetsDTO;
  final ComponentsDTO componentsDTO;

  DTO({required this.locationsDTO, required this.assetsDTO, required this.componentsDTO});

  factory DTO.init() {
    return DTO(
      locationsDTO: LocationsDTO(locations: [], sublocations: []),
      assetsDTO: AssetsDTO(assets: [], assetWhitoutLocation: [], subAssets: []),
      componentsDTO: ComponentsDTO(component: [], subComponent: [], subComponentWhitoutLocation: []),
    );
  }
}

class LocationsDTO {
  final List<ResultLocation> locations;
  final List<ResultLocation> sublocations;

  LocationsDTO({
    required this.locations,
    required this.sublocations,
  });
}

class AssetsDTO {
  final List<ResultAsset> assets;
  final List<ResultAsset> assetWhitoutLocation;
  final List<ResultAsset> subAssets;

  AssetsDTO({
    required this.assets,
    required this.assetWhitoutLocation,
    required this.subAssets,
  });
}

class ComponentsDTO {
  final List<ResultAsset> component;
  final List<ResultAsset> subComponent;
  final List<ResultAsset> subComponentWhitoutLocation;

  ComponentsDTO({
    required this.component,
    required this.subComponent,
    required this.subComponentWhitoutLocation,
  });
}
