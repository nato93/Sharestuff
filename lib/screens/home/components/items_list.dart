import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class ItemsList extends StatefulWidget {
  //final List<ItemsList> items;
  //const ItemsList({Key key, this.items}) : super(key: key);
  final String username;
  ItemsList(this.username);

  @override
    _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  List<String> dbItems = new List();

  @override
  void initState() {
    getItems();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.username}'),
      ),
        body: dbItems.length != 0 ? ListView.builder(
          itemCount: dbItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dbItems[index]),
              onTap: () => itemPress(dbItems[index]),
            );
          }) : Center(child: CircularProgressIndicator(),),
        );
  }

  getItems() async {
    await Future.delayed(Duration(seconds: 1));
    List<String> fetchedList = ['First item', 'Second item'];
    setState((){
      dbItems.addAll(fetchedList);

    });
  }

  itemPress (String item){
    print(item);
  }

}



