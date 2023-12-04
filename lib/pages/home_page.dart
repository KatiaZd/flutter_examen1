import 'package:flutter/material.dart';
import 'package:flutter_examen1/components/video_hero.dart';
import 'package:flutter_examen1/pages/regions_page.dart';
import 'package:flutter_examen1/components/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      body: Stack(
        children: <Widget> [
          Container(
        margin: EdgeInsets.zero, // Définir la marge à zéro
        child: const VideoHero(),
      ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                Container(
                  height: 550, // Définissez la hauteur souhaitée
                  child: const SizedBox
                      .shrink(), // Ajoutez d'autres composants ici, si nécessaire
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegionPage(title: "Region Page")),
                    );
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(250, 40)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: Colors.blueAccent),
                      SizedBox(width: 5),
                      Text("Rechercher Par Région", style: TextStyle(color: Colors.blueAccent)),
                  ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}