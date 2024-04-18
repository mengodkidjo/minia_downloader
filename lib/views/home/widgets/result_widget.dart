import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:minia_downloader/enum/thumbnail_enum.dart';
import 'package:minia_downloader/models/ytb_reponse_model.dart';
import 'package:minia_downloader/styles/horizontal_space.dart';
import 'package:minia_downloader/styles/vertical_space.dart';
import 'package:minia_downloader/views/home/widgets/card_widget.dart';
import 'package:minia_downloader/views/home/widgets/row_setting.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:screenshot/screenshot.dart';

import 'package:toastification/toastification.dart';

class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key, this.ytbResponseModel});
  final YtbResponseModel? ytbResponseModel;

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  bool showTitle = true;
  bool showDetails = true;
  int layout = 1;
  ThumbnailEnum quality = ThumbnailEnum.high;
  bool startDownload = false;
  GlobalKey repaintKey = GlobalKey();
  bool islight = true;
  int cursorPosition = 40;
  ScreenshotController controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 600) {
        return Column(
          children: [
            Screenshot(
                controller: controller,
                child: CardWidget(
                  ytbResponseModel: widget.ytbResponseModel,
                  quality: quality,
                  showDetails: showDetails,
                  showTitle: showTitle,
                  isLight: islight,
                  cursorPosition: cursorPosition,
                )),
            VerticalSpace.vSpace16,
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Parameters",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  VerticalSpace.vSpace16,
                  RowSetting(
                      isChecked: showTitle,
                      onClick: (value) {
                        setState(() {
                          showTitle = value;
                        });
                      },
                      title: "Show Tilte"),
                  VerticalSpace.vSpace8,
                  RowSetting(
                      isChecked: showDetails,
                      onClick: (value) {
                        setState(() {
                          showTitle = value;
                        });
                      },
                      title: "Show Details"),
                  VerticalSpace.vSpace8,
                  RowSetting(
                      isChecked: islight,
                      onClick: (value) {
                        setState(() {
                          islight = value;
                        });
                      },
                      title: islight ? "Light Mode" : "Dark Mode"),
                  VerticalSpace.vSpace8,
                  //choose quality
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      child: Text(
                        "Quality",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                        child: DropdownButton(
                            style: Theme.of(context).textTheme.labelSmall,
                            value: quality,
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(
                                value: ThumbnailEnum.dft,
                                child: Text("Default"),
                              ),
                              DropdownMenuItem(
                                value: ThumbnailEnum.standar,
                                child: Text("Standard"),
                              ),
                              DropdownMenuItem(
                                value: ThumbnailEnum.medium,
                                child: Text("Medium"),
                              ),
                              DropdownMenuItem(
                                value: ThumbnailEnum.high,
                                child: Text("High"),
                              ),
                              DropdownMenuItem(
                                value: ThumbnailEnum.maxres,
                                child: Text("Max Res"),
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                quality = value ?? ThumbnailEnum.high;
                              });
                            })),
                  ),
                  VerticalSpace.vSpace8,
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Progression",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  NumberPicker(
                    value: cursorPosition,
                    minValue: 0,
                    maxValue: 100,
                    axis: Axis.horizontal,
                    step: 10,
                    onChanged: (value) =>
                        {setState(() => cursorPosition = value)},
                  ),
                  VerticalSpace.vSpace8,
                  Center(
                    child: ElevatedButton.icon(
                        onPressed: () {
                          if (!startDownload) {
                            downloadMinia();
                            // setState(() {
                            //   startDownload = true;
                            // });
                          }
                        },
                        icon: startDownload
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Icon(Icons.download),
                        label: const Text("Download PNG")),
                  )
                ],
              ),
            )
          ],
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Screenshot(
                controller: controller,
                child: CardWidget(
                  ytbResponseModel: widget.ytbResponseModel,
                  quality: quality,
                  showDetails: showDetails,
                  showTitle: showTitle,
                  isLight: islight,
                  cursorPosition: cursorPosition,
                )),
            HorizontalSpace.hSpace16,
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Parameters",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  VerticalSpace.vSpace16,
                  RowSetting(
                      isChecked: showTitle,
                      onClick: (value) {
                        setState(() {
                          showTitle = value;
                        });
                      },
                      title: "Show Tilte"),
                  VerticalSpace.vSpace8,
                  RowSetting(
                      isChecked: showDetails,
                      onClick: (value) {
                        setState(() {
                          showTitle = value;
                        });
                      },
                      title: "Show Details"),
                  VerticalSpace.vSpace8,
                  RowSetting(
                      isChecked: islight,
                      onClick: (value) {
                        setState(() {
                          islight = value;
                        });
                      },
                      title: islight ? "Light Mode" : "Dark Mode"),
                  VerticalSpace.vSpace8,
                  //choose quality
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Quality",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: DropdownButton(
                        style: Theme.of(context).textTheme.labelSmall,
                        value: quality,
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: ThumbnailEnum.dft,
                            child: Text("Default"),
                          ),
                          DropdownMenuItem(
                            value: ThumbnailEnum.standar,
                            child: Text("Standard"),
                          ),
                          DropdownMenuItem(
                            value: ThumbnailEnum.medium,
                            child: Text("Medium"),
                          ),
                          DropdownMenuItem(
                            value: ThumbnailEnum.high,
                            child: Text("High"),
                          ),
                          DropdownMenuItem(
                            value: ThumbnailEnum.maxres,
                            child: Text("Max Res"),
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            quality = value ?? ThumbnailEnum.high;
                          });
                        }),
                  ),

                  VerticalSpace.vSpace8,
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Progression",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  NumberPicker(
                    value: cursorPosition,
                    minValue: 0,
                    maxValue: 100,
                    axis: Axis.horizontal,
                    onChanged: (value) =>
                        setState(() => cursorPosition = value),
                  ),
                  VerticalSpace.vSpace8,
                  ElevatedButton.icon(
                      onPressed: () {
                        if (!startDownload) {
                          downloadMinia();
                          // setState(() {
                          //   startDownload = true;
                          // });
                        }
                      },
                      icon: startDownload
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Icon(Icons.download),
                      label: const Text("Download PNG"))
                ],
              ),
            )
          ],
        );
      }
    });
  }

  void downloadMinia() async {
    // print(Helper.formatDuration(widget.ytbResponseModel?.duration ?? ""));
    try {
      Uint8List? bytes = await controller.capture();
      if (bytes != null) {
        await WebImageDownloader.downloadImageFromUInt8List(
            uInt8List: bytes,
            name: "${widget.ytbResponseModel?.snippet.title}_miniadownloader");
      } else {
        if (mounted) {
          toastification.show(
              context: context,
              title: Text(
                "Can't download this image",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              autoCloseDuration: const Duration(seconds: 2));
        }
      }
    } catch (e) {
      // print(e.toString());
      Toastification toastification = Toastification();
      if (mounted) {
        toastification.show(
            context: context,
            title: Text(
              "Can't download this image",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            autoCloseDuration: const Duration(seconds: 2));
      }
    }

    // js.context.callMethod('modifyWidget');

    setState(() {
      startDownload = false;
    });
  }
}
