import 'Source.dart';


class SourcesResponse {
  SourcesResponse({
      this.status, 
      this.sources,
      this.message,
      this.code,
  });

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json["message"];
    code = json["code"];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
  String? status;
  List<Source>? sources;
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map["code"] = code;
    map["message"] = message;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}