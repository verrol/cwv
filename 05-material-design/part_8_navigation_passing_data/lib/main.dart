import 'package:flutter/material.dart';
import 'package:material_design/data.dart';

import 'item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Widget App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title = 'Awesome Shoppe';

  @override
  Widget build(BuildContext context) {
    final _items = getItems();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ItemSummary(_items),
            Expanded(child: Inventory(_items)),
          ],
        ),
      ),
    );
  }
}

class Inventory extends StatelessWidget {
  final List<Item> _items;

  Inventory(this._items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, idx) {
        final Item item = _items[idx];

        return ListTile(
          title: Text(item.name),
          subtitle: Text('Price: \$${item.price}'),
          trailing: Text('In stock: ${item.inStock ? "YES" : "NO"}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetails(),
                settings: RouteSettings(arguments: item),
              ),
            );
          },
        );
      },
    );
  }
}

class ItemSummary extends StatelessWidget {
  final List<Item> _items;

  ItemSummary(this._items);

  @override
  Widget build(BuildContext context) {
    var countInStock =
        _items.fold(0, (prev, item) => item.inStock ? 1 + prev : prev);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('${_items.length} items total'),
        Text('$countInStock in stock'),
      ],
    );
  }
}

class ItemDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Name: ${item.name}'),
          Text('Price: \$${item.price}'),
          Text('Desc: \$${item.desc}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text('< BACK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                child: Text('BUY'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
