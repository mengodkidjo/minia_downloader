import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minia_downloader/enum/thumbnail_enum.dart';
import 'package:minia_downloader/helpers/helper.dart';
import 'package:minia_downloader/models/ytb_reponse_model.dart';
import 'package:minia_downloader/styles/app_theme.dart';
import 'package:minia_downloader/styles/vertical_space.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.ytbResponseModel,
      required this.showTitle,
      required this.showDetails,
      required this.quality,
      required this.isLight,
      required this.cursorPosition,
      required this.showProgress});
  final YtbResponseModel? ytbResponseModel;
  final bool showTitle;
  final bool showDetails;
  final ThumbnailEnum quality;
  final bool isLight;
  final int cursorPosition;
  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    String chooseQuality = "";
    if (quality == ThumbnailEnum.dft) {
      chooseQuality = ytbResponseModel?.snippet.thumbnails.dft.url ?? "";
    } else if (quality == ThumbnailEnum.high) {
      chooseQuality = ytbResponseModel?.snippet.thumbnails.high.url ?? "";
    } else if (quality == ThumbnailEnum.standar) {
      chooseQuality = ytbResponseModel?.snippet.thumbnails.standard.url ?? "";
    } else if (quality == ThumbnailEnum.medium) {
      chooseQuality = ytbResponseModel?.snippet.thumbnails.medium.url ?? "";
    } else if (quality == ThumbnailEnum.maxres) {
      chooseQuality = ytbResponseModel?.snippet.thumbnails.maxres.url ?? "";
    }

    return Container(
      width: 350,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: isLight ? Colors.white : Colors.black87,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
                color: !isLight
                    ? const Color.fromRGBO(255, 255, 255, 0.05)
                    : const Color.fromRGBO(0, 0, 0, 0.05),
                offset: const Offset(2, 2),
                blurRadius: 16,
                spreadRadius: 1)
          ]),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: 300,
            height: 250,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.grey[200],
              image: DecorationImage(
                image: MemoryImage(
                  base64Decode(chooseQuality),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: showProgress
                    ? [
                        if (cursorPosition == 100)
                          Container(
                            width: 48,
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 0.8),
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Text(
                              Helper.formatDuration(
                                  ytbResponseModel?.duration ?? ""),
                              style: AppTheme.dark.textTheme.bodySmall,
                            ),
                          ),
                        LinearProgressIndicator(
                          value: cursorPosition / 100,
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.red,
                        ),
                      ]
                    : [],
              ),
            ),
          ),
          if (showTitle) VerticalSpace.vSpace8,
          if (showTitle)
            Container(
              width: 300,
              margin: const EdgeInsets.only(left: 8.0),
              child: Text(
                ytbResponseModel?.snippet.title ?? "",
                textAlign: TextAlign.left,
                maxLines: 2,
                style: isLight
                    ? AppTheme.light.textTheme.titleSmall
                    : AppTheme.dark.textTheme.titleSmall,
              ),
            ),
          if (showDetails) VerticalSpace.vSpace8,
          if (showDetails)
            Container(
              width: 300,
              margin: const EdgeInsets.only(left: 8.0),
              child: Text(
                "${Helper.viewCountStr(ytbResponseModel?.viewCount ?? "0")} • ${Helper.dateConverterStr(ytbResponseModel?.snippet.publishedAt ?? "")}",
                textAlign: TextAlign.left,
                maxLines: 1,
                style: isLight
                    ? AppTheme.light.textTheme.bodySmall
                    : AppTheme.light.textTheme.bodySmall,
              ),
            )
        ],
      ),
    );
  }
}
