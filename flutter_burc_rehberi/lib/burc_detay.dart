import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:flutter_burc_rehberi/models/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;


  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;
  @override
  void initState() {
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
  }
  void baskinRengiBul(){
    Future<PaletteGenerator> fPaletteGenerator = PaletteGenerator.fromImageProvider(AssetImage("images/${secilenBurc.burcBuyukResim}"));
    fPaletteGenerator.then((value) {
      paletteGenerator = value;

      debugPrint("Seçilen renk : " + paletteGenerator.dominantColor.color.toString());
      setState(() {
        baskinRenk = paletteGenerator.vibrantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: CustomScrollView(
        primary: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/" + secilenBurc.burcBuyukResim, fit: BoxFit.cover,),
              centerTitle: true,
              title: Text("${secilenBurc.burcAdi} Burcu ve Özellikleri",),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(secilenBurc.burcDetay, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
