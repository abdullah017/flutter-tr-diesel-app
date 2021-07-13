// To parse this JSON data, do
//
//     final citysDistricts = citysDistrictsFromJson(jsonString);

import 'dart:convert';

List<CitysDistricts> citysDistrictsFromJson(String str) =>
    List<CitysDistricts>.from(
        json.decode(str).map((x) => CitysDistricts.fromJson(x)));

String citysDistrictsToJson(List<CitysDistricts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CitysDistricts {
  CitysDistricts({
    this.ilAdi,
    this.plakaKodu,
    this.alanKodu,
    this.nufus,
    this.bolge,
    this.yuzolcumu,
    this.erkekNufusYuzde,
    this.erkekNufus,
    this.kadinNufusYuzde,
    this.kadinNufus,
    this.nufusYuzdesiGenel,
    this.ilceler,
    this.kisaBilgi,
  });

  String? ilAdi;
  String? plakaKodu;
  String? alanKodu;
  String? nufus;
  String? bolge;
  String? yuzolcumu;
  String? erkekNufusYuzde;
  String? erkekNufus;
  String? kadinNufusYuzde;
  String? kadinNufus;
  String? nufusYuzdesiGenel;
  List<Ilceler>? ilceler;
  String? kisaBilgi;

  factory CitysDistricts.fromJson(Map<String, dynamic> json) => CitysDistricts(
        ilAdi: json["il_adi"],
        plakaKodu: json["plaka_kodu"],
        alanKodu: json["alan_kodu"],
        nufus: json["nufus"],
        bolge: json["bolge"],
        yuzolcumu: json["yuzolcumu"],
        erkekNufusYuzde: json["erkek_nufus_yuzde"],
        erkekNufus: json["erkek_nufus"],
        kadinNufusYuzde: json["kadin_nufus_yuzde"],
        kadinNufus: json["kadin_nufus"],
        nufusYuzdesiGenel: json["nufus_yuzdesi_genel"],
        ilceler:
            List<Ilceler>.from(json["ilceler"].map((x) => Ilceler.fromJson(x))),
        kisaBilgi: json["kisa_bilgi"],
      );

  Map<String, dynamic> toJson() => {
        "il_adi": ilAdi,
        "plaka_kodu": plakaKodu,
        "alan_kodu": alanKodu,
        "nufus": nufus,
        "bolge": bolge,
        "yuzolcumu": yuzolcumu,
        "erkek_nufus_yuzde": erkekNufusYuzde,
        "erkek_nufus": erkekNufus,
        "kadin_nufus_yuzde": kadinNufusYuzde,
        "kadin_nufus": kadinNufus,
        "nufus_yuzdesi_genel": nufusYuzdesiGenel,
        "ilceler": List<dynamic>.from(ilceler!.map((x) => x.toJson())),
        "kisa_bilgi": kisaBilgi,
      };
}

class Ilceler {
  Ilceler({
    this.ilceAdi,
    this.nufus,
    this.erkekNufus,
    this.kadinNufus,
    this.yuzolcumu,
  });

  String? ilceAdi;
  String? nufus;
  String? erkekNufus;
  String? kadinNufus;
  String? yuzolcumu;

  factory Ilceler.fromJson(Map<String, dynamic> json) => Ilceler(
        ilceAdi: json["ilce_adi"],
        nufus: json["nufus"],
        erkekNufus: json["erkek_nufus"],
        kadinNufus: json["kadin_nufus"],
        yuzolcumu: json["yuzolcumu"],
      );

  Map<String, dynamic> toJson() => {
        "ilce_adi": ilceAdi,
        "nufus": nufus,
        "erkek_nufus": erkekNufus,
        "kadin_nufus": kadinNufus,
        "yuzolcumu": yuzolcumu,
      };
}
