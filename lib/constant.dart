import 'package:flutter/material.dart';

Size size(context) => MediaQuery.of(context).size;

class Constant {
  static String baseUrl =
      "https://www.flickr.com/services/rest/"; //   https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=21c4da8517291d7ff0c41f4258006d93&format=json&callback=?&nojsoncallback=1&page=1&per_page=10&tag=launch&text=food&content_type=4&media=photo&extras=url_m
  static String imgBaseUrl =
      "https://live.staticflickr.com/"; // https://live.staticflickr.com/server/id_secret.jpg
}
