import 'package:flutter/material.dart';
import 'package:theme/constants/color_contants.dart';
import 'package:theme/constants/style_constants.dart';
import 'package:theme/home_page.dart';

import 'constants/padding_constants.dart';

class PostCard extends StatefulWidget {
  final String ppLink;
  final String isim;
  final String location;
  final String sendPicLink;

  const PostCard({
    Key? key,
    required this.ppLink,
    required this.isim,
    required this.location,
    required this.sendPicLink,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final String person = "Ayşe Yılmaz";

  final String count = "21.125";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.instance.paddingAll8,
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        
        child: Container(
          padding: PaddingConstants.instance.paddingAll15,
          width: double.infinity,
          height: 380,
          decoration: boxDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _avatarAndTitle,
                  _kmText
                  //neden
                ],
              ),
              _sizedBox,
              _postPicture,
              _sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _favoriteAndLikes,
                  _iconBookmark,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: ColorConstants.instance.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 0.5).scale(0, 15))
      ]);

  Widget get _kmText => Text(
        "2km ",
        style: StyleConstants.instance.mTitle,
      );

  // AVATAR VE İSİM
  Widget get _avatarAndTitle => Row(
        children: [
          const HomePage().avatar,
          Padding(
            padding: PaddingConstants.instance.paddingAll8,
            child: const HomePage()
                .columnAndDoubleText(widget.isim, widget.location),
          ),
        ],
      );

//KALP VE BEĞENİLER
  Widget get _favoriteAndLikes => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.favorite,
            color: ColorConstants.instance.red,
            size: 35,
          ),
          Text(
            person,
            style: StyleConstants.instance.sbTitle,
          ),
          const Text(
            " ve ",
          ),
          Text(
            count,
            style: StyleConstants.instance.sbTitle,
          ),
          const Text(
            " Kişi Beğendi",
          ),
        ],
      );

  ///IconBookMark
  Widget get _iconBookmark => const Icon(
        Icons.bookmark_border,
        size: 35,
      );

  // Gönderi resmi
  Widget get _postPicture => Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.indigo,
          image: DecorationImage(
              image: NetworkImage(
                widget.sendPicLink,
              ),
              fit: BoxFit.cover),
        ),
      );

  Widget get _sizedBox => const SizedBox(
        height: 15,
      );
}
