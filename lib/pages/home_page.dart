import 'package:flutter/material.dart';
import 'package:the_cat_api_paramonov/services/auth.dart';
import 'package:the_cat_api_paramonov/services/cat_api_provider.dart';
import 'package:the_cat_api_paramonov/wigets/cats_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(child: Text('Reload'), onPressed: _signOut),
          FlatButton(child: Text('Log out'), onPressed: _signOut),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<CatsModel>>(
          future: getCatData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CatsModel> cats = snapshot.data;
              return CatsListView(cats);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
