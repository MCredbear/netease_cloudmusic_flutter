import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netease CloudMusic Flutter',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Netease CloudMusic"),
        actions: <Widget>[
          IconButton(
              splashRadius: 24,
              onPressed: () {},
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          //height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: TextButton(onPressed: () {}, child: Text('')),
                    ),

                    Positioned(
                      top: 50,
                      left: 50,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg'),
                      ),
                    ),
                    //Text('MCredbear')
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Divider(
                  thickness: 1,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Card(
                    child: Text('114514'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
