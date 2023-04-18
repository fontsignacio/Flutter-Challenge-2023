import 'package:flutter/material.dart';

class MediaList extends StatelessWidget {
  const MediaList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white38,
                spreadRadius: 1,
                blurRadius: 5
              )
            ],                       
          ),
          child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Card(
            shadowColor: Colors.white,
            color: Color.fromARGB(255, 217, 217, 217),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[  
                Container(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network (
                      "https://i.dummyjson.com/data/products/1/3.jpg",
                      fit: BoxFit.cover,
                      height: 160,
                      width: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        //width: 250,
                          child: Text("iPhone 9", 
                            style: const TextStyle(fontSize: 17,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black
                          )
                        ),
                      ),
                      Container(
                        //width: 250,
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          children: [
                            Text("USD 590,00", 
                                style: const TextStyle(fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Text("12,96% OFF", 
                                  style: const TextStyle(fontSize: 12,
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
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow.shade600, size: 23),
                            Text(" 4.69",  
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black
                              )
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text("Stock: 94", 
                            style: const TextStyle(color: Colors.black54),
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
        )      
      ]
    );
  }
}