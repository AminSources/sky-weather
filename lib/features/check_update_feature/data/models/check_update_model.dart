import 'package:sky_weather/features/check_update_feature/domain/entities/check_update_entity.dart';

class CheckUpdateModel extends CheckUpdateEntity {
  const CheckUpdateModel({super.id, super.app, super.version});

  factory CheckUpdateModel.fromJson(Map<String, dynamic> json) {
    return CheckUpdateModel(
      id: json['id'] as int?,
      app: json['app'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'app': app, 'version': version};
}
