import "../constant.dart";

class ImgModel {
  Photos? photos;
  String? stat;

  ImgModel({this.photos, this.stat});

  ImgModel.fromJson(Map<String, dynamic> json) {
    photos = json['photos'] != null ? Photos.fromJson(json['photos']) : null;
    stat = json['stat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (photos != null) {
      data['photos'] = photos!.toJson();
    }
    data['stat'] = stat;
    return data;
  }
}

class Photos {
  int? page;
  int? pages;
  int? perpage;
  int? total;
  List<Photo>? photo;

  Photos({this.page, this.pages, this.perpage, this.total, this.photo});

  Photos.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pages = json['pages'];
    perpage = json['perpage'];
    total = json['total'];
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pages'] = pages;
    data['perpage'] = perpage;
    data['total'] = total;
    if (photo != null) {
      data['photo'] = photo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photo {
  String? id;
  String? owner;
  String? secret;
  String? server;
  int? farm;
  String? title;
  int? ispublic;
  int? isfriend;
  int? isfamily;
  String urlM = '';
  int? heightM;
  int? widthM;
  String? url;
  Photo(
      {this.id,
      this.owner,
      this.secret,
      this.server,
      this.farm,
      this.title,
      this.ispublic,
      this.isfriend,
      this.isfamily,
      required this.urlM,
      this.heightM,
      this.widthM});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    owner = json['owner'];
    secret = json['secret'];
    server = json['server'];
    farm = json['farm'];
    title = json['title'];
    ispublic = json['ispublic'];
    isfriend = json['isfriend'];
    isfamily = json['isfamily'];
    urlM = json['url_m'];
    heightM = json['height_m'];
    widthM = json['width_m'];
    url = '${Constant.imgBaseUrl}/$server/$id\_$secret.jpg';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['owner'] = owner;
    data['secret'] = secret;
    data['server'] = server;
    data['farm'] = farm;
    data['title'] = title;
    data['ispublic'] = ispublic;
    data['isfriend'] = isfriend;
    data['isfamily'] = isfamily;
    data['url_m'] = urlM;
    data['height_m'] = heightM;
    data['width_m'] = widthM;
    return data;
  }
}
