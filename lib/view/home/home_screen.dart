import 'package:flutter/material.dart';
import 'package:flutter_challenge/view/details/media_list.dart';
import 'package:flutter_challenge/view/details/media_list_overview.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    loadMovies();
  }
  void loadMovies()async {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Flutter Challenge 2023".text.make(),
      ),
      body: Column(
        children: [
          Flexible(child: Padding(padding: const EdgeInsets.all(10), child: _searchBar(),)),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(  
                child: MediaList(),
                onTap: () {
                  var router = MaterialPageRoute(
                  builder: (context) => MediaOverview());
                  Navigator.of(context).push(router);
                }
              ),
            ),
          )
          /*Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (!_isLoading) {
                return index == 0 ? _searchBar() :
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(  
                      child: MediaList(media: mediaDisplay[index - 1]),
                      onTap: () {
                        var router = MaterialPageRoute(
                        builder: (context) => MediaOverview(media: mediaDisplay[index - 1]));
                        Navigator.of(context).push(router);
                      }
                    )
                  );              
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.2,
                    ),
                    const Text('Loading ...', style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  ],
                );
              }
            },
            itemCount: mediaDisplay.length + 1,
            )
          )*/
        ],
      ) 
    );
  }
  _searchBar(){
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color:const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.search,
              color: Colors.black54,
              size: 30
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            margin: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black54),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search product",
                hintStyle: TextStyle(color: Colors.black54)
              ),
              onChanged: (String text) {
                text = text.toLowerCase();
                setState(() {
                  /*mediaDisplay = _media.where((u) {
                    var title = u.title.toLowerCase();
                    var generes = u.getGenres().toLowerCase();
                    return title.contains(text) || generes.contains(text);
                  }).toList();*/
                });
              }
            ),
          )
        ],
      ),             
    );
  }
}