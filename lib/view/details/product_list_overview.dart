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
          header(context),
          bodyDetails(context)
        ],
      ),
    );
  }

  Widget header(BuildContext context){
    return Expanded(
      child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/images',
                  arguments: {
                  'product': product,
                });
              },
              child: Opacity(
                opacity: 0.4,
                child:Image.network(
                  product.thumbnail!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                )
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 110),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/images',
                          arguments: {
                          'product': product,
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
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
                            product.images![0],
                            fit: BoxFit.fitHeight,
                            height: 160,
                            width: 160,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
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
                  ), 
                ], 
              ), 
            ),
          ),    
          ]
        )     
      ),
    );
  }


  Widget bodyDetails(BuildContext context){
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 73,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 25, top: 15),
            child: Text(
              product.title!,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Colors.white,
              ),
              maxLines: 2,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, bottom: 10, top: 10),
            child: Row(
              children: [
                Text("USD ${product.price?.toDouble().toStringAsFixed(2)}", 
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.normal
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text("${product.discountPercentage}% OFF", 
                      style: const TextStyle(
                        fontSize: 15,
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
          Container(
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
          Container(
            padding: const EdgeInsets.only(left: 25.0, top: 15, bottom: 15),
            child: Row(
              children: [
                const Flexible(
                  child: Text("Category:  ", 
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white60
                    )
                  ),
                ),
                Flexible(
                  child: Text(product.category!, 
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, bottom: 15),
            child: Row(
              children: [
                const Flexible(
                  child: Text("Brand: ", 
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white60
                    )
                  ),
                ),
                Flexible(
                  child: Text(product.brand!, 
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    )
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, bottom: 15),
            child: Row(
              children: [
                const Flexible(
                  child: Text("Stock: ", 
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white60
                    )
                  ),
                ),
                Flexible(
                  child: Text("${product.stock}", 
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    )
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, bottom: 15),
            child: Row(
              children: [
                const Flexible(child: Icon(Icons.star, color: Colors.yellow, size: 25)),
                Flexible(
                  child: Text(" ${product.rating}",  
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    )
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 200,)
        ],
      ),
    );
  }


}