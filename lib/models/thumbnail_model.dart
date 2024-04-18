// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ThumbnailModel {
  final String url;
  final int width;
  final int height;
  ThumbnailModel({
    required this.url,
    required this.width,
    required this.height,
  });

  ThumbnailModel copyWith({
    String? url,
    int? width,
    int? height,
  }) {
    return ThumbnailModel(
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
    };
  }

  factory ThumbnailModel.fromMap(Map<String, dynamic> map) {
    return ThumbnailModel(
      url: map['url'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThumbnailModel.fromJson(String source) =>
      ThumbnailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ThumbnailModel(url: $url, width: $width, height: $height)';

  @override
  bool operator ==(covariant ThumbnailModel other) {
    if (identical(this, other)) return true;

    return other.url == url && other.width == width && other.height == height;
  }

  @override
  int get hashCode => url.hashCode ^ width.hashCode ^ height.hashCode;
}
