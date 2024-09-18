import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/features/assets_view/domain/entities/result_asset.dart';
import 'package:tractian_challenge/features/assets_view/domain/entities/result_location.dart';

abstract class AssetsRepository {
  Future<Either<Exception, List<ResultLocation>>> getLocationsByCompanyId(String companyId);
  Future<Either<Exception, List<ResultAsset>>> getAssetsByCompanyId(String companyId);
}
