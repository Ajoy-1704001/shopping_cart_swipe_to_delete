import 'package:flutter/material.dart';
import 'package:shopping_cart_swipe_to_delete/customAppbar.dart';
import 'package:shopping_cart_swipe_to_delete/dataModel.dart';
import 'package:shopping_cart_swipe_to_delete/productItem.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Data> _list = [
    Data("p0", "Redmi 9", "Redmi", "\$400"),
    Data("p1", "Walton Primo", "Walton", "\$200"),
    Data("p2", "Lava Series", "Lava", "\$260")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBEAEF),
      appBar: CustomAppbar(),
      body: Column(
        children: [
          _list.length == 0
              ? Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Text(
                      "Cart is Empty",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    final item = _list[index].name;
                    return Dismissible(
                      key: Key(item),
                      direction: DismissDirection.endToStart,
                      background: Container(
                          color: Colors.redAccent,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      onDismissed: (direction) {
                        setState(() {
                          _list.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$item removed from cart')));
                      },
                      child: Product(
                        img: _list[index].img,
                        name: _list[index].name,
                        price: _list[index].price,
                        brand: _list[index].brand,
                      ),
                    );
                  }),
        ],
      ),
      bottomSheet: Container(
        color: Color(0xFFEBEAEF),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal"),
                    Text(
                      "\$300",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shipping"),
                    Text(
                      "\$20",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Grand Total"),
                    Text(
                      "\$320",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 40))),
                    onPressed: () {},
                    child: Text("Proceed To Checkout")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
