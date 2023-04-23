import 'package:flutter/material.dart';
import 'package:flutter_challenge/model/product.dart';
import 'package:flutter_challenge/model/user_model.dart';
import 'package:flutter_challenge/view/details/product_list.dart';
import 'package:flutter_challenge/view_model/home/search_view_model.dart';
import '../../view_model/home/product_view_model.dart';

enum MenuItem {item1, item2}

class Home extends StatefulWidget {
  const Home({super.key, required this.user});
  final UserModel user;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  final List<Product> _product = [];
  bool _isLoading = true;
  bool _noFinded = false;
  String textSearch = '';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Challenge 2023"),
        automaticallyImplyLeading: false,
        actions: [
          userIcon()
        ],
      ),
      body: Column(
        children: [
          _searchBar(),
          !_noFinded? _buildProductDetails(context) :
          _buildNoResultsWidget(textSearch)
        ],
      )    
    );
  }

  Widget userIcon(){
    return Padding(      
      padding: const EdgeInsets.only(right: 10),
      child: PopupMenuButton <MenuItem> (
        onSelected: (value) => {
          if(value == MenuItem.item2) Navigator.of(context).pop()
        },
        iconSize: 45,
        color: const Color(0xff292b37),
        icon: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.amber, 
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), 
            child: Image.network (
              widget.user.image!,
              fit: BoxFit.cover,
              height: 160,
              width: 160,
            ),
          ),
        ),
        itemBuilder: (context) =>  [
          PopupMenuItem(
            value:  MenuItem.item1,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10),                          
                  child: CircleAvatar(  
                  radius: 60,           
                  backgroundColor: Colors.amber,     
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100), 
                    child: Image.network (
                      widget.user.image!,
                      fit: BoxFit.cover,
                      height: 160,
                      width: 160,
                    ),
                  ),
                ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 140, bottom: 20),
                  child: Text(widget.user.email!, 
                    style: const TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
              ],
            )
          ),      
          PopupMenuItem(
            value:  MenuItem.item2,
            child: Row(
              children: const [
                Icon(Icons.logout, size: 20,),
                Text("    Logout",
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
              ],
            )
          ),
        ]  
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
              onChanged: (String text) async{           
                text = text.toLowerCase();
                var search = await HttpSearch.fetchSearch(text);
                setState(() {
                  _product.clear();
                  _product.addAll(search);
                  if(search.isEmpty){
                    _noFinded = true; 
                    textSearch = text;
                  }else{
                    _noFinded = false;
                  }
                });
              }
            ),
          )
        ],
      ),             
    );
  }

  Widget _buildProductDetails(BuildContext context){
    return Expanded(
      child: ListView.builder(             
        itemCount: _product.length,
        itemBuilder: (context, index) {
          if (!_isLoading) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(  
                child: ProductList(product: _product[index]),
                onTap: () {
                  Navigator.pushNamed(context, '/product_overview',
                  arguments: {
                    'product': _product[index],
                  });
                }
              )
            );              
          } 
          else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                ),
                const CircularProgressIndicator(),
              ],
            );
          }
        },
      )
    );
  }
  
  Widget _buildNoResultsWidget(String text){
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.7,
        height: 60,
        child: Center(
          child: Text(
            "No se encontraron resultados para ''$text'' ",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    );
  }


}