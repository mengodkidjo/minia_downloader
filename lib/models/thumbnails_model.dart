import 'package:minia_downloader/models/thumbnail_model.dart';

class ThumbnailsModel {
  final ThumbnailModel dft;
  final ThumbnailModel medium;
  final ThumbnailModel high;
  final ThumbnailModel standard;
  final ThumbnailModel maxres;

  ThumbnailsModel(
      {required this.dft,
      required this.medium,
      required this.high,
      required this.standard,
      required this.maxres});
}
