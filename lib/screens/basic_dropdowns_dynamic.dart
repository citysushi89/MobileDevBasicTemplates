import 'package:flutter/material.dart';

class CartItem {
  String productType;
  String itemName;
  String flavor;

  CartItem({
    required this.productType,
    required this.itemName,
    required this.flavor,
  });
}

class Pizza extends StatefulWidget {
  CartItem cartItem;

  Pizza({required this.cartItem});
  @override
  State<Pizza> createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  String _value = '';

  @override
  void initState() {
    super.initState();
    _value = widget.cartItem.itemName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        value: _value,
        items: const [
          DropdownMenuItem(
            child: Text("Pizza 1"),
            value: "Pizza 1",
          ),
          DropdownMenuItem(
            child: Text("Pizza 2"),
            value: "Pizza 2",
          ),
          DropdownMenuItem(
            child: Text("Pizza 3"),
            value: "Pizza 3",
          ),
          DropdownMenuItem(
            child: Text("Pizza 4"),
            value: "Pizza 4",
          ),
        ],
        onChanged: (value) {
          setState(() {
            _value = value!;
            widget.cartItem.itemName = value;
          });
        },
      ),
    );
  }
}

class CartWidget extends StatefulWidget {
  List<CartItem> cart;
  int index;
  VoidCallback callback;

  CartWidget({
    required this.cart,
    required this.index,
    required this.callback,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Pizza(
      cartItem: widget.cart[widget.index],
    ));
  }
}

// Items in the cart

// Current Page home Widget
class BasicDropdownDynamic extends StatefulWidget {
  const BasicDropdownDynamic({Key? key}) : super(key: key);

  static const id = 'basic_dropdown_dynamic';

  @override
  State<BasicDropdownDynamic> createState() => _BasicDropdownDynamicState();
}

class _BasicDropdownDynamicState extends State<BasicDropdownDynamic> {
  List<CartItem> cart = [
    CartItem(productType: 'Pizza', itemName: 'Pizza 1', flavor: 'cheese'),
    CartItem(productType: 'Pizza', itemName: 'Pizza 3', flavor: 'cheese'),
  ];

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Very Basic Dropdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                  key: UniqueKey(),
                  itemCount: cart.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CartWidget(
                        cart: cart, index: index, callback: refresh);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
