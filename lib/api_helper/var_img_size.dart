class VarImgSize {
  VarImgSize({required this.imgUrl, required this.size});
  String imgUrl;
  String size;
  String change() {
    var data = imgUrl.split('.jpg');
    print(data);
    print('${data[0]}_$size.jpg');
    return '${data[0]}_$size.jpg';
  }
}
