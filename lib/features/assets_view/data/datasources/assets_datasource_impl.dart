import 'package:dio/dio.dart';
import 'package:tractian_challenge/features/assets_view/data/datasources/assets_datasource.dart';
import 'package:tractian_challenge/features/assets_view/data/models/result_assets_model.dart';
import 'package:tractian_challenge/features/assets_view/data/models/result_locations_model.dart';

class AssetsDatasourceImpl implements AssetsDatasource {
  final Dio dio;
  static const url = 'https://fake-api.tractian.com/companies';

  AssetsDatasourceImpl(this.dio);

  @override
  Future<List<ResultAssetsModel>> getAssetsByCompanyId(String id) async {
    final response = await dio.get('$url/$id/assets');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((e) => ResultAssetsModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load assets');
    }
  }

  @override
  Future<List<ResultLocationsModel>> getLocationsByCompanyId(String id) async {
    final response = await dio.get('$url/$id/locations');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((e) => ResultLocationsModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
