// To parse this JSON data, do
//
//     final infoTambahan = infoTambahanFromJson(jsonString);

import 'dart:convert';

InfoTambahan infoTambahanFromJson(String str) => InfoTambahan.fromJson(json.decode(str));

String infoTambahanToJson(InfoTambahan data) => json.encode(data.toJson());

class InfoTambahan {
    InfoTambahan({
        this.status,
        this.message,
        this.data,
    });

    bool status;
    String message;
    List<InfoTambahanDatum> data;

    factory InfoTambahan.fromJson(Map<String, dynamic> json) => InfoTambahan(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : List<InfoTambahanDatum>.from(json["data"].map((x) => InfoTambahanDatum.fromJson(x))),
    );

    InfoTambahan.withError(String errorValue)
      : status = false,
        message = errorValue;

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class InfoTambahanDatum {
    InfoTambahanDatum({
        this.id,
        this.judul,
        this.deskripsi,
        this.ikon,
        this.infoTambahanDetail,
    });

    String id;
    String judul;
    String deskripsi;
    String ikon;
    List<InfoTambahanDetailDatum> infoTambahanDetail;

    factory InfoTambahanDatum.fromJson(Map<String, dynamic> json) => InfoTambahanDatum(
        id: json["id"] == null ? null : json["id"],
        judul: json["judul"] == null ? null : json["judul"],
        deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
        ikon: json["ikon"] == null ? null : json["ikon"],
        infoTambahanDetail: json["info_tambahan_detail"] == null ? null : List<InfoTambahanDetailDatum>.from(json["info_tambahan_detail"].map((x) => InfoTambahanDetailDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "judul": judul == null ? null : judul,
        "deskripsi": deskripsi == null ? null : deskripsi,
        "ikon": ikon == null ? null : ikon,
        "info_tambahan_detail": infoTambahanDetail == null ? null : List<dynamic>.from(infoTambahanDetail.map((x) => x.toJson())),
    };
}

class InfoTambahanDetailDatum {
    InfoTambahanDetailDatum({
        this.id,
        this.judul,
        this.deskripsi,
        this.ikon,
        this.infoTambahanDetail,
        this.idInfoTambahan,
    });

    String id;
    String judul;
    String deskripsi;
    String ikon;
    List<InfoTambahanDetailDatum> infoTambahanDetail;
    String idInfoTambahan;

    factory InfoTambahanDetailDatum.fromJson(Map<String, dynamic> json) => InfoTambahanDetailDatum(
        id: json["id"] == null ? null : json["id"],
        judul: json["judul"] == null ? null : json["judul"],
        deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
        ikon: json["ikon"] == null ? null : json["ikon"],
        infoTambahanDetail: json["info_tambahan_detail"] == null ? null : List<InfoTambahanDetailDatum>.from(json["info_tambahan_detail"].map((x) => InfoTambahanDetailDatum.fromJson(x))),
        idInfoTambahan: json["id_info_tambahan"] == null ? null : json["id_info_tambahan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "judul": judul == null ? null : judul,
        "deskripsi": deskripsi == null ? null : deskripsi,
        "ikon": ikon == null ? null : ikon,
        "info_tambahan_detail": infoTambahanDetail == null ? null : List<dynamic>.from(infoTambahanDetail.map((x) => x.toJson())),
        "id_info_tambahan": idInfoTambahan == null ? null : idInfoTambahan,
    };
}
