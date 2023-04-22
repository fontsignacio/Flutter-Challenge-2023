import 'package:flutter/material.dart';
import 'package:flutter_challenge/model/product.dart';
import 'package:flutter_challenge/view/details/product_list.dart';
import 'package:flutter_challenge/view/details/product_list_overview.dart';
import '../../view_model/home/product_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  final List<Product> _product = [];
  bool _isLoading = true;


  @override
  void initState(){
    super.initState();
    loadProduct();
  }
  void loadProduct()async {
    var products = await HttpHandler.fetchProducts();
    setState(() {
      _product.addAll(products);
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // handle back button press by doing nothing
      child:  Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Challenge 2023"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (!_isLoading) {
                return index == 0 ? _searchBar() :
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(  
                      child: ProductList(product: _product[index]),
                      onTap: () {
                        var router = MaterialPageRoute(
                        builder: (context) => ProductOverview(product: _product[index]));
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
              itemCount: _product.length,
              )
            )
          ],
        )    
      )
    );
  }
  _searchBar(){
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color:const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search,
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