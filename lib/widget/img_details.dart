import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testimg/api_helper/var_img_size.dart';
import 'package:testimg/constant.dart';
import 'package:testimg/model/img_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ImgDetail extends StatefulWidget {
  const ImgDetail({Key? key, required this.imgData}) : super(key: key);
  final Photo imgData;
  @override
  _ImgDetailState createState() => _ImgDetailState();
}

class _ImgDetailState extends State<ImgDetail> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController remark = TextEditingController();

  @override
  void dispose() {
    fullName.dispose();
    remark.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            // borderRadius: BorderRadius.only(bottomRight: Radius.circular(90)),
            child: CachedNetworkImage(
              alignment: Alignment.topCenter,
              placeholder: (context, url) => Transform.scale(
                scale: 0.5,
                child: CircularProgressIndicator(),
              ),
              imageUrl:
                  VarImgSize(imgUrl: widget.imgData.urlM, size: 'c').change(),
              height: size(context).height / 1.8,
              width: size(context).width,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              height: size(context).height / 2,
              width: size(context).width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  TextFormField(
                    controller: fullName,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Full name required';
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.grey[350],
                      filled: true,
                      hintText: 'Enter your full name',
                      hintStyle: const TextStyle(
                          color: Color(0xFF818194), fontSize: 14),
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: (Colors.grey[400])!),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: (Colors.grey[400])!)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: (Colors.grey[400])!),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      //filled: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: remark,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Full name required';
                        }
                      },
                      maxLines: 5,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[350],
                        filled: true,
                        hintText: 'Enter your full name',
                        hintStyle: const TextStyle(
                            color: Color(0xFF818194), fontSize: 14),
                        isDense: false,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 13, 10, 13),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: (Colors.grey[400])!),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: (Colors.grey[400])!)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: (Colors.grey[400])!),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        //filled: true,
                      ),
                    ),
                  ),
                  RatingBar.builder(
                      initialRating: 3.2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 60,
                      // itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                      onRatingUpdate: (rating) {}),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    // color: Color(0xFFFF3636),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}