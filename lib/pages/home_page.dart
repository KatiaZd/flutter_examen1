import 'package:flutter/material.dart';
import 'package:flutter_examen1/components/menu.dart';
import 'package:flutter_examen1/components/video_hero.dart';
import 'package:flutter_examen1/pages/regions_page.dart';

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
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),                    
            ),
          
          Expanded(
            child: Stack(
              children: [
                VideoHero(),
                Center(
                  child: Text(
                    'France Data Atlas des données de France', 
                    style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegionPage(title: "Region Page")),
              );
            },
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(250, 40)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search),
                SizedBox(width: 5),
                Text("Rechercher Par Région"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
