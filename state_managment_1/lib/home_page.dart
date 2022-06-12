import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment_1/blocs/cubit/theme_cubit.dart';
import 'package:state_managment_1/constants/color_contants.dart';
import 'package:state_managment_1/constants/style_constants.dart';
import 'package:state_managment_1/post.dart';
import 'package:state_managment_1/story.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String foto =
      "https://cdn.pixabay.com/photo/2017/08/01/08/29/woman-2563491__340.jpg";
  final String text = "Günaydın,";
  final String name = "Selen Aktürk";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listView,
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomIcons(Icons.home_outlined),
            bottomIcons(Icons.search_outlined),
            bottomIcons(Icons.equalizer_outlined),
            avatar,
          ],
        ),
      ),
    );
  }

//BOTTOM BAR ICONS
  IconButton bottomIcons(IconData icon) {
    return IconButton(
      enableFeedback: true,
      onPressed: () {},
      icon: Icon(
        icon,
        color: ColorConstants.instance.grey,
        size: 35,
      ),
    );
  }

  Widget get _listView => ListView(
        padding: const EdgeInsets.only(top: 50, bottom: 10),
        children: [
          Wrap(
            runSpacing: 20,
            //spacing: 20,
            children: [_listViewCard, _storyColumn],
          )
        ],
      );
  Widget get _storyColumn => Column(
        children: [
          _storySizedBox,
          const PostCard(
              ppLink:
                  "https://cdn.pixabay.com/photo/2017/08/01/08/29/woman-2563491__340.jpg",
              isim: "Vişne",
              location: "Bakırköy",
              sendPicLink:
                  "https://cdn.pixabay.com/photo/2017/08/01/08/29/woman-2563491__340.jpg"),
          const PostCard(
              ppLink:
                  "https://cdn.pixabay.com/photo/2017/08/01/08/29/woman-2563491__340.jpg",
              isim: "Kader",
              location: "Bakırköy",
              sendPicLink:
                  "https://cdn.pixabay.com/photo/2017/08/01/08/29/woman-2563491__340.jpg"),
        ],
      );
/* -----------SizedBox --------------------------------------------------------- */
  Widget get _storySizedBox => SizedBox(
        //container
        width: double.infinity,
        height: 100,
        child: _storyListView,
      );
/*  -----------------------------Story -------------------------------------- */
  Widget get _storyListView => ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Story(
            url:
                'https://cdn.pixabay.com/photo/2018/01/29/17/01/woman-3116587__340.jpg',
          ),
          Story(
            url:
                'https://cdn.pixabay.com/photo/2017/06/10/22/58/composing-2391033__340.jpg',
          ),
          Story(
            url:
                'https://cdn.pixabay.com/photo/2020/04/23/19/15/face-5083690__340.jpg',
          ),
          Story(
            url:
                'https://cdn.pixabay.com/photo/2016/06/11/12/15/females-1450050__340.jpg',
          ),
          Story(
            url:
                'https://cdn.pixabay.com/photo/2017/02/04/12/25/man-2037255__340.jpg',
          ),
        ],
      );
/*  ------------------Kullanıcı profili----------------------- --------*/
  Widget get _listViewCard => ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          columnAndDoubleText(text, name),
          //here
          switche,
          _upIcons,
        ],
      ),
      leading: avatar);

  Widget columnAndDoubleText(String text, String name) => Column(
        children: [
          Text(
            text,
            style: StyleConstants.instance.lTitle,
          ),
          Text(name),
        ],
      );
/*  ---------------------    Üsteki ikonlar   ---------------------------      */
  Widget get _upIcons => Row(
        children: [
          Icon(Icons.notifications_outlined,
              color: ColorConstants.instance.black),
          const SizedBox(
            width: 5,
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(Icons.local_post_office_outlined,
                  color: ColorConstants.instance.black),
              Container(
                width: 9.0,
                height: 9.0,
                decoration: BoxDecoration(
                  color: ColorConstants.instance.red,
                  // border: Border.all(width: 2.0),
                  borderRadius: BorderRadius.circular(35.0),
                ),
              ),
            ],
          ),
        ],
      );
  Widget get avatar => CircleAvatar(
        radius: 22,
        backgroundImage: NetworkImage(foto),
      );
  Widget get switche => SizedBox(
      width: 10,
      height: 10,
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (BuildContext context, state) {
          return SwitchListTile(
            activeColor: ColorConstants.instance.red,
            value: state,
            onChanged: (value) {
              BlocProvider.of<ThemeCubit>(context).toggleTheme(value: value);
            },
          );
        },
      ));
}
