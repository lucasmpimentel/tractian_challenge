import 'package:tractian_challenge/features/assets_view/domain/entities/result_location.dart';

class ResultSublocation extends ResultLocation {
  @override
  final String parentId;

  ResultSublocation({
    required super.id,
    required super.name,
    required this.parentId,
  }) : super(parentId: parentId);
}
