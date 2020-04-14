import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  //#438506 , #529312, #8FDE02, #7DC800
                  gradient: LinearGradient(colors: [
                    Color(0xFF438506),
                    Color(0xFF529312),
                    Color(0xFF8FDE02),
                    Color(0xFF7DC800),
                  ]),
                  //color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(100.0),
                      child: Image.asset(
                        "assets/guitar.png",
//                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          color: Colors.yellowAccent,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Material(
                              elevation: 5.0,
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30.0),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                },
                                minWidth: 100.0,
                                height: 40.0,
                                child: Text(
                                  'Lets rock',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Subtype {
  shows,
  repertorium,
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Subtype selectedSubType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSubType = Subtype.shows;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          color: selectedSubType == Subtype.shows
                              ? Colors.red
                              : Colors.lightGreen,
                          child: Center(
                            child: Text(
                              'Shows',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSubType = Subtype.repertorium;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          color: selectedSubType == Subtype.repertorium
                              ? Colors.red
                              : Colors.lightGreen,
                          child: Center(
                            child: Text(
                              'Repertorium',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  child: Card(
                    elevation: 15,
                    color: Colors.yellow,
                    child: selectedSubType == Subtype.shows
                        ? Image.asset(
                            "assets/musicians.png",
                            color: Colors.red,
                          )
                        : Image.asset(
                            "assets/monster.png",
                          ),
                  ),
                ),
              ),
              Column(
                children: selectedSubType == Subtype.shows
                    ? <Widget>[
                        ShowCard(),
                        ShowCard(),
                        ShowCard(),
                        ShowCard(),
                        ShowCard(),
                        ShowCard(),
                        ShowCard(),
                        ShowCard(),
                        ShowCard(),
                        ShowCard(),
                        ShowCard(),
                      ]
                    : <Widget>[
                        RepertoriumCard(),
                        RepertoriumCard(),
                        RepertoriumCard(),
                        RepertoriumCard(),
                        RepertoriumCard(),
                        RepertoriumCard(),
                        RepertoriumCard(),
                        RepertoriumCard(),
                        RepertoriumCard(),
                        RepertoriumCard(),
                      ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RepertoriumCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[100],
      child: ListTile(
        subtitle: Text('subtitle'),
        leading: Text('Band Name'),
        title: Text('Track Name'),
      ),
    );
  }
}

class ShowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellowAccent[100],
      child: ListTile(
        subtitle: Text('Date'),
        leading: Text('Place'),
        title: Text('Adress'),
      ),
    );
  }
}
