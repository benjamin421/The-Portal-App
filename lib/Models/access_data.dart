import 'dart:convert';

class AccessData {
    AccessData({
        this.penroseToken,
        this.decodedData,
    });

    String penroseToken;
    DecodedData decodedData;

    AccessData copyWith({
        String penroseToken,
        DecodedData decodedData,
    }) => 
        AccessData(
            penroseToken: penroseToken ?? this.penroseToken,
            decodedData: decodedData ?? this.decodedData,
        );

    factory AccessData.fromJson(String str) => AccessData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AccessData.fromMap(Map<String, dynamic> json) => AccessData(
        penroseToken: json["penroseToken"] == null ? null : json["penroseToken"],
        decodedData: json["decodedData"] == null ? null : DecodedData.fromMap(json["decodedData"]),
    );

    Map<String, dynamic> toMap() => {
        "penroseToken": penroseToken == null ? null : penroseToken,
        "decodedData": decodedData == null ? null : decodedData.toMap(),
    };
}

class DecodedData {
    DecodedData({
        this.id,
        this.iat,
        this.exp,
    });

    String id;
    String iat;
    int exp;

    DecodedData copyWith({
        String id,
        String iat,
        int exp,
    }) => 
        DecodedData(
            id: id ?? this.id,
            iat: iat ?? this.iat,
            exp: exp ?? this.exp,
        );

    factory DecodedData.fromJson(String str) => DecodedData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DecodedData.fromMap(Map<String, dynamic> json) => DecodedData(
        id: json["id"] == null ? null : json["id"],
        iat: json["iat"] == null ? null : json["iat"],
        exp: json["exp"] == null ? null : json["exp"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "iat": iat == null ? null : iat,
        "exp": exp == null ? null : exp,
    };
}
