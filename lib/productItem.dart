import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  final String img;
  final String name;
  final String brand;
  final String price;

  Product({Key key, this.img, this.name, this.price, this.brand})
      : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/" + widget.img + ".jpg",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.brand,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    widget.price,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade300,
                  ),
                  width: 30,
                  height: 30,
                  child: IconButton(
                      iconSize: 17,
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          num = num + 1;
                        });
                      }),
                ),
                Text('$num'),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade300,
                  ),
                  width: 30,
                  height: 30,
                  child: IconButton(
                      iconSize: 17,
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (num > 1) {
                          setState(() {
                            num = num - 1;
                          });
                        }
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
