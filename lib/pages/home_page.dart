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
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.zero,
            child: const VideoHero(),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text("I. Nos Régions",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ))),
          ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: const Text(
                    "Poudre gummi ours beignet sucette pudding réglisse sucre prune. Gâteau aux jujubes gummi ours caramels pudding gâteau à l'avoine biscuit croissant à la guimauve. Bonbons cannes de bonbon glaçage gâteau aux carottes gummi ours gâteau au chocolat. Gâteau gâteau à l'avoine barbe à papa gelée muffin réglisse rouleau sucré sucré. Tarte au chocolat en poudre tiramisu gummies gâteau aux fruits halva gaufrette guimauve. Tarte aux pommes bonbon tootsie roll gaufrette sablé pain d'épice gâteau à l'avoine et à la guimauve à la framboise.",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegionPage(title: "Recherche par Region")),
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
                      Text("Rechercher Par Région",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                        "Croissant garniture muffin poudre beignet caramels beignet dessert. Muffin cannes de bonbon pain d'épice réglisse chocolat gâteau danois sablé. Gâteau aux fruits dessert glace bonbon gâteau au chocolat. Gâteau aux carottes, glace au caramel, gâteau à la réglisse. Tootsie roll cheesecake gâteau aux carottes griffe d'ours garniture tootsie roll sucre prune. Guimauve, réglisse.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}