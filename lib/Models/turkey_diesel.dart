// To parse this JSON data, do
//
//     final turkeyGasoline = turkeyGasolineFromJson(jsonString);

import 'dart:convert';

TurkeyGasoline turkeyGasolineFromJson(String str) =>
    TurkeyGasoline.fromJson(json.decode(str));

String turkeyGasolineToJson(TurkeyGasoline data) => json.encode(data.toJson());

class TurkeyGasoline {
  TurkeyGasoline({
    required this.success,
    required this.result,
  });

  bool success;
  List<dynamic> result;

  factory TurkeyGasoline.fromJson(Map<String, dynamic> json) => TurkeyGasoline(
        success: json["success"],
        result: List<dynamic>.from(json["result"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x)),
      };
}

class ResultClass {
  ResultClass({
    required this.katkili,
    required this.benzin,
    required this.marka,
  });

  double katkili;
  double benzin;
  String marka;

  factory ResultClass.fromJson(Map<String, dynamic> json) => ResultClass(
        katkili: json["katkili"] is String ? 0.0 : json["katkili"],
        benzin: json["benzin"] is String ? 0.0 : json["benzin"],
        marka: json["marka"],
      );

  Map<String, dynamic> toJson() => {
        "katkili": katkili,
        "benzin": benzin,
        "marka": marka,
      };
}