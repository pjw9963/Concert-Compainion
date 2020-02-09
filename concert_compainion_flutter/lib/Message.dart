import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Concert Companion"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              Navigator.pushNamed(context, '/swipe');
            },
          ),
          // action button
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.pushNamed(context, '/message');
            },
          ),
        ],
      ),
      body: getListView(),
    );
  }

  List<String> getListElements() {
    var items = List<String>.generate(19, (counter) => "example@email.com $counter");
    return items;
  }

  Widget getListView() {
    var listItems = getListElements();
    var listview = ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.arrow_forward),
        title: Text(listItems[index]),
        onTap: () {
          debugPrint("clicked");
        },
      );
    },
    itemCount: listItems.length,);
    return listview;
  }
}
