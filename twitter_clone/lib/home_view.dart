import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.controller}) : super(key: key);
  final ScrollController controller;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _linkedlnFoto =
      "https://media-exp1.licdn.com/dms/image/C5603AQEZXKRbwfskKA/profile-displayphoto-shrink_100_100/0/1624288470446?e=1649894400&v=beta&t=hhY0_lHpp8OkjKI4_od5LEay629Xdov-gXAkYQo2sQM";

  final String _twit =
      "Bütün hayata karşı bir mide bulantısıyla uyandım. Yaşamak zorunda olmanın dehşeti yataktan benimle birlikte kalktı. Her şey gözüme boş göründü bir an ve içimden buz gibi bir ses, hiç bir derdin çaresi yoktur, dedi. / Fernando Pessoa";

  bool isHeaderClose = false;
  double lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    return _listView;
  }

  Widget get _listView => ListView.builder(
        controller: widget.controller,
        itemCount: 10,
        itemBuilder: ((context, index) {
          return _listViewCard;
        }),
      );
  // Widget get _expandedListView => Expanded(child: _listView);

  Widget get _listViewCard => Card(
        child: ListTile(
          title: Wrap(
            runSpacing: 10,
            children: [
              _listCardTitle("Hello"),
              Text(_twit),
              _placeHolderField,
              _footerBottumList
            ],
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_linkedlnFoto),
          ),
        ),
      );

  Widget _listCardTitle(String text) => Text(
        text,
        style: titleTextStyle,
      );
  Widget get _placeHolderField => SizedBox(
        height: 100,
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUZiWn33h5eX3KOwQPBW9zAFyL2jejKRAL6w&usqp=CAU",
          fit: BoxFit.cover,
        ),
      );
  Widget _iconLabel(String text, IconData icon) => Wrap(
        spacing: 5,
        children: [
          Icon(
            icon,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget _iconLabelButton(IconData icon, String text) => InkWell(
        child: _iconLabel(text, icon),
        onTap: () {},
      );

  Widget get _footerBottumList => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconLabelButton(Icons.mode_comment, "1"),
          _iconLabelButton(Icons.transform, ""),
          _iconLabelButton(Icons.favorite, ""),
          _iconLabelButton(Icons.share, ""),
        ],
      );
}

const titleTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black);

Color selectionColor = Colors.black;
/*  */ 