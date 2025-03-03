import 'package:dio/dio.dart';
import 'package:sky_weather/core/constants/strings.dart';

class CheckUpdateApiProvider {
  Dio dio = Dio();

  //? call check updates api
  Future<dynamic> checkUpdateApi() async {
    //* send request
    Response response = await dio.get(checkUpdateApiUrl);

    //* return data
    return response;
  }
}
