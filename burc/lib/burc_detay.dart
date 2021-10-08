import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({Key? key, required this.secilenBurc}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.amber;
  late PaletteGenerator _generator;
  @override
  void initState() {
    appbarRengiBul();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const BackButton(
              color: Colors.white,
            ),
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.secilenBurc.burcAdi + " Burcu ve Özellikleri",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              background: Image.asset(
                "assets/images/${widget.secilenBurc.burcBuyukResim}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appbarRengiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('assets/images/${widget.secilenBurc.burcBuyukResim}'));
    appbarRengi = _generator.dominantColor!.color;
    setState(() {});
  }
}
