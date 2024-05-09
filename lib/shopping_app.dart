import 'package:flutter/material.dart';

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ShoppingListItem(
              product: const Product(name: 'Shirt'),
              inCart: false,
              onCartChange: (product, inCart) {
                print('$product.name is inCart: $inCart');
              }),
        ),
      ),
    );
  }
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShoppingList(
        products: [
          Product(name: 'Apple'),
          Product(name: 'Mango'),
          Product(name: 'Banana'),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  const Product({required this.name});
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key, required this.products});
  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChange: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChange;

  const ShoppingListItem(
      {super.key,
      required this.product,
      required this.inCart,
      required this.onCartChange});

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return const TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChange(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
