// To parse this JSON data, do
//
//     final ipAddress = ipAddressFromJson(jsonString);

import 'dart:convert';

IpAddress ipAddressFromJson(String str) => IpAddress.fromJson(json.decode(str));

String ipAddressToJson(IpAddress data) => json.encode(data.toJson());

class IpAddress {
    int rs;
    int code;
    String address;
    String ip;
    int isDomain;

    IpAddress({
        required this.rs,
        required this.code,
        required this.address,
        required this.ip,
        required this.isDomain,
    });

    factory IpAddress.fromJson(Map<String, dynamic> json) => IpAddress(
        rs: json["rs"],
        code: json["code"],
        address: json["address"],
        ip: json["ip"],
        isDomain: json["isDomain"],
    );

    Map<String, dynamic> toJson() => {
        "rs": rs,
        "code": code,
        "address": address,
        "ip": ip,
        "isDomain": isDomain,
    };
}
