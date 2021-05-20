import 'package:flutter/material.dart';
import 'package:the_cat_api_paramonov/pages/detail_page.dart';
import 'package:the_cat_api_paramonov/services/cat_api_provider.dart';

class CatsListView extends StatelessWidget {
  final List<CatsModel> cats;

  CatsListView(this.cats);

  Widget build(context) {
    return ListView.builder(
      itemCount: cats.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(cats[currentIndex], context);
      },
    );
  }

  Widget createViewItem(CatsModel cat, BuildContext context) {
    return ListTile(
        title: Card(
          elevation: 5.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(cat.caturl),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
                // Text('${cat.catqfact}'),
                Row(children: <Widget>[]),
              ],
            ),
          ),
        ),
        onTap: () {
          var route = MaterialPageRoute(
            builder: (BuildContext context) => DetailPage(value: cat),
          );

          Navigator.of(context).push(route);
        });
  }
}
