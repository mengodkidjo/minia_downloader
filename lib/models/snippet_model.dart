// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:minia_downloader/models/thumbnail_model.dart';
import 'package:minia_downloader/models/thumbnails_model.dart';

class SnippetModel {
  final String title;
  final String description;
  final String publishedAt;
  final ThumbnailsModel thumbnails;
  SnippetModel({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.thumbnails,
  });

  SnippetModel copyWith(
      {String? title,
      String? description,
      String? publishedAt,
      ThumbnailsModel? thumbnails,
      String? viewCount}) {
    return SnippetModel(
      title: title ?? this.title,
      description: description ?? this.description,
      publishedAt: publishedAt ?? this.publishedAt,
      thumbnails: thumbnails ?? this.thumbnails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'publishedAt': publishedAt,
      'thumbnails': thumbnails,
    };
  }

  factory SnippetModel.fromMap(Map<String, dynamic> map) {
    // Map<String, dynamic> thumbnails = (map["thumbnails"]);
    log("Hahahah");

    // print(map["thumbnails"]["default"]);
    ThumbnailsModel thumbnailsModel = ThumbnailsModel(
        dft: ThumbnailModel.fromMap((map["thumbnails"]["default"])),
        medium: ThumbnailModel.fromMap((map["thumbnails"]["medium"])),
        high: ThumbnailModel.fromMap((map["thumbnails"]["high"])),
        standard: ThumbnailModel.fromMap((map["thumbnails"]["standard"])),
        maxres: ThumbnailModel.fromMap((map["thumbnails"]["maxres"])));
    // print(thumbnailsModel);
    return SnippetModel(
      title: map['title'] as String,
      description: map['description'] as String,
      publishedAt: map['publishedAt'] as String,
      thumbnails: thumbnailsModel,
    );
  }

  String toJson() => json.encode(toMap());

  factory SnippetModel.fromJson(String source) =>
      SnippetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SnippetModel(title: $title, description: $description, publishedAt: $publishedAt, thumbnails: $thumbnails)';
  }

  @override
  bool operator ==(covariant SnippetModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.publishedAt == publishedAt;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        publishedAt.hashCode ^
        thumbnails.hashCode;
  }
}
