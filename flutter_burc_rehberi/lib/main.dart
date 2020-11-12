import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_detay.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:flutter_burc_rehberi/testlib.dart';

main() => runApp(MyApps());

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      initialRoute: "/burcListesi",
      routes: {
        "/" : (context) => BurcListesi(),
        "/burcListesi" : (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/"); // burcDetay/1
        if (pathElemanlari[1] == "burcDetay"){
          return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}
