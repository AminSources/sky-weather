import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/features/check_update_feature/domain/entities/check_update_entity.dart';

abstract class CheckUpdateRepository {
  //? fetch check update data
  Future<DataState<CheckUpdateEntity>> fetchCheckUpdateData();
}
