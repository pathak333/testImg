import 'dart:convert';
import 'dart:io';

import 'package:testimg/model/img_model.dart';

import '../constant.dart';
import 'package:http/http.dart';

class API {
  static List<Photo> allImg = [];

  static Future<List<Photo>?> getAPIres({page = 1}) async {
    var res = await get(Uri.parse(
        '${Constant.baseUrl}?method=flickr.photos.search&api_key=21c4da8517291d7ff0c41f4258006d93&format=json&callback=?&nojsoncallback=1&page=$page&per_page=10&tag=launch&text=food&content_type=4&media=photo&extras=url_m'));
    //  print(res);
    if (res.statusCode == 200) {
      //print(res.body);
      var body = jsonDecode(res.body);

      ImgModel img = ImgModel.fromJson(body);
      var d = img.photos?.photo ?? [];
      print(img.photos?.photo?.length);
      allImg.addAll(d);
      return allImg;
    } else {
      print(res.statusCode);
      return null;
    }
  }
}
