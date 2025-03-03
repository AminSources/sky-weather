import 'package:dio/dio.dart';
import 'package:sky_weather/core/resources/data_state.dart';
import 'package:sky_weather/features/check_update_feature/data/data_source/remote/api_provider.dart';
import 'package:sky_weather/features/check_update_feature/data/models/check_update_model.dart';
import 'package:sky_weather/features/check_update_feature/domain/entities/check_update_entity.dart';
import 'package:sky_weather/features/check_update_feature/domain/repositories/check_update_repository.dart';

class CheckUpdateRepositoryImpl extends CheckUpdateRepository {
  final CheckUpdateApiProvider checkUpdateApiProvider;

  CheckUpdateRepositoryImpl(this.checkUpdateApiProvider);

  //? check update
  @override
  Future<DataState<CheckUpdateEntity>> fetchCheckUpdateData() async {
    try {
      //* call check update api
      Response response = await checkUpdateApiProvider.checkUpdateApi();

      //* status condition
      if (response.statusCode == 200) {
        //* convert data
        CheckUpdateEntity checkUpdateEntity = CheckUpdateModel.fromJson(
          response.data,
        );

        //* return data
        return DataSuccess(checkUpdateEntity);
      } else {
        //* return failed data
        return DataError("Something went wrong! (check update - status code)");
      }
    } catch (e) {
      //* return failed data
      return DataError("Something went wrong! (check update - try)");
    }
  }
}
