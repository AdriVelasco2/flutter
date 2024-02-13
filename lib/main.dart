// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.indigo,
                accentColor: Colors.green,
                backgroundColor: Colors.amberAccent)
            .copyWith(secondary: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) _counter -= 2;
    });
  }

  void _aCero() {
    setState(() {
      _counter = 0;
    });
  }

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
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.primary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Center(
            child: Text(
              'Hola Jorge',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
  
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.

          children: <Widget>[
            Image.asset(
              '../assets/imagen.png',
            ),
            const Text(
              'Victorias de Fernando Alonso:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              MaterialButton(
                  onPressed: _aCero, 
                  child: Icon(Icons.restart_alt)
                  ),
                  SizedBox(width: 10),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  ),
                  onPressed: _launchURL,
                  child: Text('EL NANO'),
                  color: Colors.green),
                  
                  
            ])
          ],
        ),
      ),
     
      floatingActionButton: Stack(
        children: [
          GestureDetector(
            onLongPress: (){
              _removeOverlay();
              // Create the overlay with secondary buttons
              final overlayEntry = OverlayEntry(
                builder: (context) => Positioned(
                  bottom: 120.0, // Adjust position as needed
                  right: 16.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            
           
                            // Handle action for button 1
                            _removeOverlay();
                            // ... your action
                          },
                          child: Text('Button 1'),
                        ),
                        MaterialButton(
                          onPressed: () {
                            // Handle action for button 2
                            _removeOverlay();
                            // ... your action
                          },
                          child: Text('Button 2'),
                        ),
                        MaterialButton(
                          onPressed: () {
                            // Handle action for button 3
                            _removeOverlay();
                            // ... your action
                          },
                          child: Text('Button 3'),
                        ),
                      ],
                    ),
                  ),
                ),
              );

              // Insert the overlay into the Overlay widget using setState
              Overlay.of(context)?.insert(overlayEntry);
              _overlayEntries.add(overlayEntry); // Keep track of overlays
            },
          ),
          Positioned(
            bottom: 80.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              child: Icon(Icons.add),
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
      
    );
  }

  _launchURL() async {
    const url =
        'https://www.youtube.com/watch?v=oq9HlVE86OA&pp=ygUHRUwgTkFOTw%3D%3D';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  final List<OverlayEntry> _overlayEntries = [];

void _removeOverlay() {
  for (final entry in _overlayEntries) {
    entry.remove(); // Remove each overlay entry
  }
  _overlayEntries.clear(); // Clear the list
}
}
