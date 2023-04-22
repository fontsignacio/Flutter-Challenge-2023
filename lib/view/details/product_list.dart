import 'package:flutter/material.dart';
import '../../model/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const  BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white38,
                spreadRadius: 1,
                blurRadius: 5,
              )
            ],                       
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Expanded(
              child: Card(
                shadowColor: Colors.white,
                color: const  Color.fromARGB(255, 217, 217, 217),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[  
                    Container(
                      padding: const  EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network (
                          product.thumbnail!,
                          fit: BoxFit.cover,
                          height: 160,
                          width: 160,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              product.title!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "${product.discountPercentage}% OFF", 
                              style:const  TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 32, 173, 93),
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),                  
                          ),
                          Text(
                            product.price?.toDouble().toStringAsFixed(2) ?? 'N/A', 
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),       
                          Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow.shade600, size: 23),
                                Text(" ${product.rating}",  
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const  EdgeInsets.only(top: 25.0),
                            child: Text(
                              "Stock: ${product.stock}", 
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),      
                  ],
                ),
              ),
            ),
          ),
        ),      
      ],
    );
  }
}