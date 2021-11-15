import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testimg/api_helper/flickr_api.dart';
import 'package:testimg/api_helper/var_img_size.dart';

import 'package:testimg/model/img_model.dart';

import '../constant.dart';
import 'img_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  int _index = 0;
  int page = 1;
  List allBackData = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: API.getAPIres(page: page),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // List<Photo> data = snapshot.connectionState == ConnectionState.done
            //     ? snapshot.data.photo
            //     : [];
            List<Photo> data = snapshot.data ?? [];
            return snapshot.connectionState == ConnectionState.waiting
                ? Text('....Lodding')
                : snapshot.connectionState == ConnectionState.done
                    ? Container(
                        width: size(context).width,
                        height: size(context).height / 2.5,
                        child: PageView.builder(
                            padEnds: false,
                            controller: PageController(viewportFraction: 0.7),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            onPageChanged: (i) => {
                                  data.length - 3 == i
                                      ? setState(() {
                                          page = page++;
                                          print("next page");
                                        })
                                      : print('else $i')
                                },
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () async {
                                  var backdata = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ImgDetail(
                                                imgData: data[i],
                                                imgindex: i,
                                              )));
                                  print(backdata);
                                  setState(() {
                                    data[i].remark = backdata["remark"];
                                    data[i].name = backdata["fullName"];
                                    data[i].rating = backdata["rating"];
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            (Transform.scale(
                                          scale: 0.5,
                                          child: CircularProgressIndicator(),
                                        )),
                                        imageUrl: VarImgSize(
                                                imgUrl: data[i].urlM, size: 'm')
                                            .change(),
                                        // height: size(context).height / 3,
                                        // width: size(context).width,
                                        fit: BoxFit.fill,
                                      ),
                                      Text("${data[i].name}"),
                                      data[i].rating > 1
                                          ? RatingBar.builder(
                                              initialRating: data[i].rating,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 20,
                                              // itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                              itemBuilder: (context, _) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                );
                                              },
                                              onRatingUpdate: (e) {})
                                          : Container(),
                                      Text("${data[i].remark}"),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    : Text('Done EveryThing ');
          },
        ),
      ),
    );
  }
}
