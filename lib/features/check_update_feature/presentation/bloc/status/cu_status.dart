import 'package:sky_weather/features/check_update_feature/domain/entities/check_update_entity.dart';

abstract class CuStatus {}

class CuLoading extends CuStatus {}

class CuCompleted extends CuStatus {
  CheckUpdateEntity checkUpdateEntity;

  CuCompleted(this.checkUpdateEntity);
}

class CuError extends CuStatus {
  String message;

  CuError(this.message);
}
