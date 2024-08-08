import 'dart:async';

enum Event {
  AddItem,
  RemoveItem,
  RemoveAll,
}

class Item {
  String name;
  String description;
  double price;

  Item({this.name, this.description, this.price});
  @override
  String toString() {
    return 'Item: ${this.name}';
  }
}

class ShoppingCartBloc {
  List<Item> state;
  StreamController<List<Item>> streamController;

  ShoppingCartBloc() {
    state = <Item>[];
    streamController = StreamController.broadcast();
  }

  Stream<List<Item>> getStream() {
    return streamController.stream;
  }

  void AddItem(Item item) {
    _on(Event.AddItem, item);
  }

  void RemoveItem(Item item) {
    _on(Event.RemoveItem, item);
  }

  void RemoveAll() {
    _on(Event.RemoveAll);
  }

  void _on(Event event, [Item item]) {
    switch (event) {
      case Event.AddItem:
        state.add(item);
        break;
      case Event.RemoveItem:
        state.remove(item);
        break;
      case Event.RemoveAll:
        state.clear();
        break;
      default:
    }

    streamController.add(state.toList());
  }
}

void main() {
  var sm = ShoppingCartBloc();

  sm.getStream().listen((onData) {
    print("Number of items: ${onData.length}");
  });

  sm.getStream().listen((onData) {
    print("Cart Items:");

    for (var i = 0; i < onData.length; i++) {
      print("\t[$i] - ${onData[i]}");
    }
  });

  var milk = Item(name: 'Milk', description: 'a box of milk', price: 4.95);

  sm.AddItem(milk);
  sm.AddItem(Item(name: 'Eggs', description: 'a dozen', price: 6.31));
  sm.AddItem(Item(name: 'Sugar', description: '2 lbs', price: 2.56));
  sm.AddItem(Item(name: 'Bread', description: 'whole wheat', price: 4.80));

  sm.RemoveItem(milk);

  sm.RemoveAll();
}
