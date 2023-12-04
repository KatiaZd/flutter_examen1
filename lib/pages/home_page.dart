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
        margin: EdgeInsets.zero, // Définir la marge au dessus de la video à zéro
        child: const VideoHero(),
      ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                
                Container(
                  color: Colors.blue,
                  // height: 550, // Définissez la hauteur souhaitée
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text( 
                      "I. Nos régions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      )
                    )
                   ), // Ajoutez d'autres composants ici, si nécessaire
                ),
                
                const Text(
                  "Poudre gummi ours beignet sucette pudding réglisse sucre prune. Gâteau aux jujubes gummi ours caramels pudding gâteau à l'avoine biscuit croissant à la guimauve. Bonbons cannes de bonbon glaçage gâteau aux carottes gummi ours gâteau au chocolat. Gâteau gâteau à l'avoine barbe à papa gelée muffin réglisse rouleau sucré sucré. Tarte au chocolat en poudre tiramisu gummies gâteau aux fruits halva gaufrette guimauve. Tarte aux pommes bonbon tootsie roll gaufrette sablé pain d'épice gâteau à l'avoine",
                  style: TextStyle(color: Colors.black),
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