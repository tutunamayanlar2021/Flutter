import 'package:burc/burc_detay.dart';
import 'package:flutter/material.dart';

import 'burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listenelenecekBurc;

  const BurcItem({Key? key, required this.listenelenecekBurc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        BurcDetay(secilenBurc: listenelenecekBurc)));
              },
              leading: Image.asset(
                "assets/images/${listenelenecekBurc.burcKucukResim}",
              ),
              title: Text(listenelenecekBurc.burcAdi),
              subtitle: Text(listenelenecekBurc.burcTarihi),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.amber,
              ),
            ),
          )),
    );
  }
}
