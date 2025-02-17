class WeatherQualityModel {
  final Data? data;

  WeatherQualityModel({
    this.data,
  });

  factory WeatherQualityModel.fromJson(Map<String, dynamic> json) {
    return WeatherQualityModel(
      data: (json['data'] as Map<String, dynamic>?) != null
          ? Data.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {'data': data?.toJson()};
}

class Data {
  final int? aqi;
  final int? idx;
  final String? dominentpol;
  final Time? time;

  Data({
    this.aqi,
    this.idx,
    this.dominentpol,
    this.time,
  });

  Data.fromJson(Map<String, dynamic> json)
      : aqi = json['aqi'] as int?,
        idx = json['idx'] as int?,
        dominentpol = json['dominentpol'] as String?,
        time = (json['time'] as Map<String, dynamic>?) != null
            ? Time.fromJson(json['time'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'aqi': aqi,
        'idx': idx,
        'dominentpol': dominentpol,
        'time': time?.toJson(),
      };
}

class Time {
  final String? s;
  final String? tz;
  final int? v;
  final String? iso;

  Time({
    this.s,
    this.tz,
    this.v,
    this.iso,
  });

  Time.fromJson(Map<String, dynamic> json)
      : s = json['s'] as String?,
        tz = json['tz'] as String?,
        v = json['v'] as int?,
        iso = json['iso'] as String?;

  Map<String, dynamic> toJson() => {'s': s, 'tz': tz, 'v': v, 'iso': iso};
}
