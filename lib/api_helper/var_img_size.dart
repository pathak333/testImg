class VarImgSize {
  VarImgSize({required this.imgUrl, required this.size});
  String imgUrl;
  String size;
  String change() {
    var data = imgUrl.split('.jpg');

    return imgUrl == ""
        ? "https://lh3.googleusercontent.com/proxy/WlQtOqE061Kw-Ix6-BU3Sse9i0XavgkVGYLxCNqCQGI1fBYUdp88DaoJcQgQEjekpLvh-Mn0_dcymg7DmcRbOtXEI37EQ0IoeuuVrIO-bSkJqt59z1THlsc84D35s213QQ"
        : '${data[0]}_$size.jpg';
  }
}
