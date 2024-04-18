import 'dart:convert';
import 'dart:developer';

import 'package:minia_downloader/constants/constante.dart';
import 'package:minia_downloader/constants/sensitive_data.dart';
import 'package:minia_downloader/helpers/helper.dart';
import 'package:http/http.dart' as http;
import 'package:minia_downloader/models/snippet_model.dart';
import 'package:minia_downloader/models/thumbnails_model.dart';
import 'package:minia_downloader/models/ytb_reponse_model.dart';

class YtbAPi {
  static Future<YtbResponseModel> getVidInfoFromUrl(String url) async {
    String apiUrl =
        "https://www.googleapis.com/youtube/v3/videos?id=${Helper.extractIdFromUrl(url)}&key=${SentisitveData.apiKey}&fields=items(id,snippet(title,description,thumbnails,publishedAt),contentDetails(duration),statistics(viewCount))&part=snippet,statistics,contentDetails";
    Uri uri = Uri.parse(apiUrl);

    http.Response response = await http.get(uri);
    // print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> tmpResultat = jsonDecode(response.body);
      log("message");
      // print(tmpResultat["items"][0]);

      // print(snippetModel);
      YtbResponseModel ytbResponseModel =
          YtbResponseModel.fromMap(tmpResultat["items"][0]);

      String backendApi = "${Constante.backendBaseApi}api/v1/get_info";
      try {
        http.Response imagesResponse =
            await http.post(Uri.parse(backendApi), body: {
          'dft': ytbResponseModel.snippet.thumbnails.dft.url,
          'medium': ytbResponseModel.snippet.thumbnails.medium.url,
          'high': ytbResponseModel.snippet.thumbnails.high.url,
          'standard': ytbResponseModel.snippet.thumbnails.standard.url,
          'maxres': ytbResponseModel.snippet.thumbnails.maxres.url,
        });

        if (imagesResponse.statusCode == 200) {
          Map<String, dynamic> res = jsonDecode(imagesResponse.body);
          // print(res);
          ThumbnailsModel thumbnailsModel = ThumbnailsModel(
              dft: ytbResponseModel.snippet.thumbnails.dft
                  .copyWith(url: res['dft']),
              medium: ytbResponseModel.snippet.thumbnails.dft
                  .copyWith(url: res['medium']),
              high: ytbResponseModel.snippet.thumbnails.dft
                  .copyWith(url: res['high']),
              standard: ytbResponseModel.snippet.thumbnails.dft
                  .copyWith(url: res['standard']),
              maxres: ytbResponseModel.snippet.thumbnails.dft
                  .copyWith(url: res['maxres']));
          SnippetModel snippetModel =
              ytbResponseModel.snippet.copyWith(thumbnails: thumbnailsModel);
          YtbResponseModel ytbResponse =
              ytbResponseModel.copyWith(snippet: snippetModel);
          return ytbResponse;
        }
      } catch (e) {
        log(e.toString());
        throw Exception(
            "An Error occur with status: ${response.statusCode} and body:  ${jsonDecode(response.body)}");
      }

      throw Exception(
          "An Error occur with status: ${response.statusCode} and body:  ${jsonDecode(response.body)}");
    } else {
      log("An Error occur with status: ${response.statusCode} and body:  ${jsonDecode(response.body)}");
      throw Exception(
          "An Error occur with status: ${response.statusCode} and body:  ${jsonDecode(response.body)}");
    }
  }

  static Future<String> getThumbnailBase64(String url) async {
    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return base64Encode(response.bodyBytes);
    }

    log("An Error occur with status: ${response.statusCode} and body:  ${jsonDecode(response.body)}");
    throw Exception(
        "An Error occur with status: ${response.statusCode} and body:  ${jsonDecode(response.body)}");
  }
}
