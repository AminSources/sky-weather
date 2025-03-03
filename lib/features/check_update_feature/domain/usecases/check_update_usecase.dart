import 'package:sky_weather/core/params/no_param.dart';
import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/core/usecase/usecase.dart';
import 'package:sky_weather/features/check_update_feature/domain/entities/check_update_entity.dart';
import 'package:sky_weather/features/check_update_feature/domain/repositories/check_update_repository.dart';

class CheckUpdateUsecase
    extends Usecase<DataState<CheckUpdateEntity>, NoParam> {
  CheckUpdateRepository checkUpdateRepository;

  CheckUpdateUsecase(this.checkUpdateRepository);

  //? get check update use case
  @override
  Future<DataState<CheckUpdateEntity>> call(NoParam params) {
    return checkUpdateRepository.fetchCheckUpdateData();
  }
}
