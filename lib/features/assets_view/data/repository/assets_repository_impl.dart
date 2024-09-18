import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/features/assets_view/data/datasources/assets_datasource.dart';
import 'package:tractian_challenge/features/assets_view/domain/entities/result_asset.dart';
import 'package:tractian_challenge/features/assets_view/domain/entities/result_location.dart';
import 'package:tractian_challenge/features/assets_view/domain/repositories/assets_repository.dart';

class AssetsRepositoryImpl implements AssetsRepository {
  final AssetsDatasource datasource;

  AssetsRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, List<ResultLocation>>> getLocationsByCompanyId(String companyId) async {
    try {
      final result = await datasource.getLocationsByCompanyId(companyId);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<ResultAsset>>> getAssetsByCompanyId(String companyId) async {
    try {
      final result = await datasource.getAssetsByCompanyId(companyId);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
