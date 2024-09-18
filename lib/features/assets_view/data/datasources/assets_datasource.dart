import 'package:tractian_challenge/features/assets_view/data/models/result_assets_model.dart';
import 'package:tractian_challenge/features/assets_view/data/models/result_locations_model.dart';

abstract class AssetsDatasource {
  Future<List<ResultAssetsModel>> getAssetsByCompanyId(String id);
  Future<List<ResultLocationsModel>> getLocationsByCompanyId(String id);
}
