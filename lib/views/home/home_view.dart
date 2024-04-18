import 'package:flutter/material.dart';
import 'package:minia_downloader/api/ytb_api.dart';
import 'package:minia_downloader/models/ytb_reponse_model.dart';
import 'package:minia_downloader/styles/horizontal_space.dart';
import 'package:minia_downloader/styles/vertical_space.dart';
import 'package:minia_downloader/views/home/widgets/result_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static String homeRoute = "/";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController ytbLinkController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  bool searching = false;
  YtbResponseModel? ytbResponseModel;
  Toastification toastification = Toastification();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => Center(
        child: Container(
          width: constraints.maxWidth <= 600
              ? constraints.maxWidth * 0.9
              : constraints.maxWidth * 0.55,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            color: Theme.of(context).cardColor,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.image_rounded,
                    color: Colors.deepPurple,
                  ),
                  label: Text(
                    "Minia Downloader",
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              const VerticalDivider(),
              VerticalSpace.vSpace32,
              Form(
                  key: formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextFormField(
                        controller: ytbLinkController,
                        style: Theme.of(context).textTheme.labelSmall,
                        decoration: const InputDecoration(
                          hintText: "https://www.youtube.com/watch?v=video_id",
                        ),
                      )),
                      HorizontalSpace.hSpace16,
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              searching = true;
                            });
                          },
                          child: const Text("Get Minia"))
                    ],
                  )),
              VerticalSpace.vSpace32,
              if (searching)
                FutureBuilder(
                  future:
                      YtbAPi.getVidInfoFromUrl(ytbLinkController.text.trim()),
                  builder: (context, snapshot) {
                    searching = false;
                    if (snapshot.hasData) {
                      ytbResponseModel = snapshot.data;

                      return ResultWidget(
                        ytbResponseModel: ytbResponseModel,
                      );
                    } else if (snapshot.hasError) {
                      // toastification.show(
                      //     context: context,
                      //     title: const Text(
                      //         "An error occur, please verify your youtube link"),
                      //     closeOnClick: true,
                      //     type: ToastificationType.error);
                      return const SizedBox(
                        child: Text("Something goes wrong"),
                      );
                    } else {
                      return SizedBox(
                        width: 50.w,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                )
            ],
          ),
        ),
      ),
    ));
  }
}
