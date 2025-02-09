import 'package:flutter/material.dart';
import 'package:saviour_flutter_app/screens/mapscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saviour_flutter_app/screens/navigationScreen.dart';
import 'package:saviour_flutter_app/screens/signinscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.redAccent[200],
        iconTheme: IconThemeData(opacity: 3.0),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignInPage();
                }));
              },
              icon: Icon(Icons.person))
        ],
      ),
      drawer: Drawer(
        child: NavigationPage()
      ),
      body: Homebody(),
    );
  }
}

class Homebody extends StatefulWidget {
  const Homebody({Key? key}) : super(key: key);

  @override
  _HomebodyState createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 1, children: [
      Cards(),
      Cards(),
      Cards(),
      Cards(),
      Cards(),
      Cards(),
      Cards(),
      Cards(),
    ]);
  }
}

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
        elevation: 10.0,
        color: Colors.redAccent[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Want some Help? Let's try",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GoogleMapScreen();
                  }));
                },
                child: Text("Click here to get help"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent[100],
                ),
              )
            ],
          ),
        ));
  }
}
