import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Flavor extends StatefulWidget {
  CartItem cartItem;

  Flavor({required this.cartItem});
  @override
  _FlavorState createState() => _FlavorState();
}

class _FlavorState extends State<Flavor> {
  String? _value = "Flavor 1";

  @override
  void initState() {
    super.initState();
    _value = widget.cartItem.flavor;
  }

  @override
  void didUpdateWidget(Flavor oldWidget) {
    if (oldWidget.cartItem.flavor != widget.cartItem.flavor) {
      _value = widget.cartItem.flavor;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
          value: _value,
          items: const [
            DropdownMenuItem(
              child: Text("Flavor 1"),
              value: "Flavor 1",
            ),
            DropdownMenuItem(
              child: Text("Flavor 2"),
              value: "Flavor 2",
            ),
            DropdownMenuItem(child: Text("Flavor 3"), value: "Flavor 3"),
            DropdownMenuItem(child: Text("Flavor 4"), value: "Flavor 4")
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
              if (_value == null) {
                _value = 'placeholder, was null';
              }

              // widget.cartItem.flavor = value;
            });
          }),
    );
  }
}

class Pizza extends StatefulWidget {
  CartItem cartItem;

  Pizza({required this.cartItem});
  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  String _value = "";

  @override
  void initState() {
    super.initState();
    _value = widget.cartItem.itemName;
  }

  @override
  void didUpdateWidget(Pizza oldWidget) {
    if (oldWidget.cartItem.itemName != widget.cartItem.itemName) {
      _value = widget.cartItem.itemName;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
          value: _value,
          items: [
            DropdownMenuItem(
              child: Text("Pizza 1"),
              value: "Pizza 1",
            ),
            DropdownMenuItem(
              child: Text("Pizza 2"),
              value: "Pizza 2",
            ),
            DropdownMenuItem(child: Text("Pizza 3"), value: "Pizza 3"),
            DropdownMenuItem(child: Text("Pizza 4"), value: "Pizza 4")
          ],
          onChanged: (value) {
            setState(() {
              _value = value!;
              widget.cartItem.itemName = value;
            });
          }),
    );
  }
}

class DropdownMenuMultipleDynamic extends StatefulWidget {
  DropdownMenuMultipleDynamic({Key? key, required this.title})
      : super(key: key);

  static const id = 'dropdown_menu_multiple_dynamic';

  final String title;

  @override
  _DropdownMenuMultipleDynamicState createState() =>
      _DropdownMenuMultipleDynamicState();
}

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
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Pizza(cartItem: widget.cart[widget.index])),
        Expanded(child: Flavor(cartItem: widget.cart[widget.index])),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                print(widget.index);
                widget.cart.removeAt(widget.index);
                widget.callback();
              });
            },
          ),
        )
      ],
    );
  }
}

class _DropdownMenuMultipleDynamicState
    extends State<DropdownMenuMultipleDynamic> {
  List<CartItem> cart = [];

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  key: UniqueKey(),
                  itemCount: cart.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CartWidget(
                        cart: cart, index: index, callback: refresh);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cart.add(CartItem(
                        productType: "pizza",
                        itemName: "Pizza 1",
                        flavor: "Flavor 1"));
                    setState(() {});
                  },
                  child: Text("add Pizza"),
                ),
                ElevatedButton(
                  onPressed: () {
                    for (int i = 0; i < cart.length; i++) {
                      print(cart[i].itemName);
                    }
                  },
                  child: Text("Print Pizza"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
