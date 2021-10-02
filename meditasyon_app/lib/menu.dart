import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuState();
}

class MenuState extends State<Menu> {
  late List<CollapsibleItem> _items;
  late String _headLine;
  final NetworkImage _avatarImage = const NetworkImage(
      "https://avatars.githubusercontent.com/u/63172521?s=96&v=4");
  List<CollapsibleItem> get _generetaItems {
    return [
      CollapsibleItem(
          text: "Profil",
          icon: Icons.person,
          onPressed: () => setState(() => _headLine = 'Profil'),
          isSelected: true),
      CollapsibleItem(
          text: "Listeler",
          icon: Icons.format_list_bulleted,
          onPressed: () => setState(() => _headLine = 'Listeler')),
      CollapsibleItem(
          text: "Arama",
          icon: Icons.search,
          onPressed: () => setState(() => _headLine = 'Arama')),
      CollapsibleItem(
          text: 'Konum',
          icon: Icons.location_on_outlined,
          onPressed: () => setState(() => _headLine = 'Konum')),
    ];
  }

  @override
  void initState() {
    _items = _generetaItems;
    _headLine = _items.firstWhere((element) => element.isSelected).text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CollapsibleSidebar(
        items: _items,
        avatarImg: _avatarImage,
        title: "Menü",
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.purple[100],
            child: Center(
              child: Text(
                _headLine,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        selectedTextColor: Colors.black,
        toggleTitle: "",
      )),
    );
  }
}
