import 'package:flutter/material.dart';

import '../../model/product.dart';

class ProductOverview extends StatelessWidget {
  const ProductOverview({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Productos"),
    ), 
    body: ListView(
      children: <Widget>[
          Flexible(
            child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: <Widget>[
                Opacity(
                  opacity: 0.4,
                  child:Image.network(
                    product.thumbnail!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 110),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 1,
                              blurRadius: 8 
                            )
                          ],                       
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            product.thumbnail!,
                            fit: BoxFit.cover,
                            height: 160,
                            width: 160,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(left: 40, top: 30),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10 
                              )
                            ],                       
                          ),
                          child: const  Icon(Icons.shopping_cart,
                              size: 40, 
                              color: Colors.black54),                       
                        ),
                        onTap: () {},
                      ), 
                    ], 
                  ), 
                ),    
                ]
              )     
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 25, top: 15),
                      child: Text(product.title!, 
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.
                            bold, fontSize: 30,
                            color: Colors.white
                        )
                      ),
                    )
                  ]
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25, bottom: 15, top: 10),
                  child: Row(
                    children: [
                      Text("USD ${product.price?.toDouble().toStringAsFixed(2)}", 
                          style: const TextStyle(fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.normal
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text("${product.discountPercentage}% OFF", 
                            style: const TextStyle(fontSize: 15,
                              color: Color.fromARGB(255, 32, 173, 93),
                              fontWeight: FontWeight.bold
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: const Color.fromARGB(255, 52, 51, 51),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text("\n${product.description}\n", 
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        )
                      ) 
                    )
                  ),
                ),   
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      const Text("   Category: ", style: TextStyle(color: Colors.white60)),
                      Text(product.category!, 
                            style: const TextStyle(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 15),
                  child: Row(
                    children: [
                      const Text("   Brand: ", style: TextStyle(color: Colors.white60)),
                      Text(product.brand!, 
                        style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 15),
                  child: Row(
                    children: [
                      const Text("   Stock: ", style: TextStyle(color: Colors.white60)),
                      Text("${product.stock}", 
                        style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 20),
                      Text(" ${product.rating}",  
                        style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                SizedBox(height: 150,)
              ],
            ),
          ),         
        ],
      ),
    );
  }
}