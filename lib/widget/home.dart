import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ImgDetail(
                                                imgData: data[i],
                                              )));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: CachedNetworkImage(
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
