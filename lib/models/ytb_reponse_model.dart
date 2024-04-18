// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:minia_downloader/models/snippet_model.dart';

class YtbResponseModel {
  final String id;
  SnippetModel snippet;
  final String viewCount;
  final String duration;

  YtbResponseModel(
      {required this.id,
      required this.snippet,
      required this.viewCount,
      required this.duration});

  YtbResponseModel copyWith({
    String? id,
    SnippetModel? snippet,
    String? viewCount,
    String? duration,
  }) {
    return YtbResponseModel(
        id: id ?? this.id,
        snippet: snippet ?? this.snippet,
        viewCount: viewCount ?? this.viewCount,
        duration: duration ?? this.duration);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'snippet': snippet.toMap(),
      'viewCount': viewCount
    };
  }

  factory YtbResponseModel.fromMap(Map<String, dynamic> map) {
    return YtbResponseModel(
        id: map['id'] as String,
        snippet: SnippetModel.fromMap(map['snippet'] as Map<String, dynamic>),
        viewCount: map['statistics']['viewCount'],
        duration: map["contentDetails"]["duration"]);
  }

  String toJson() => json.encode(toMap());

  factory YtbResponseModel.fromJson(String source) =>
      YtbResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'YtbResponseModel(id: $id, snippet: $snippet)';

  @override
  bool operator ==(covariant YtbResponseModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.snippet == snippet;
  }

  @override
  int get hashCode => id.hashCode ^ snippet.hashCode;
}
