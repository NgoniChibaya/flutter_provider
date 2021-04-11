import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Library()),
    ],
      child: MyApp()));
}

class Library with ChangeNotifier{
   List<Song> _library = [Song(title: "Mangoma",artist: "ngoni",album: "Nsoft" )];

   List<Song> get count => _library;

   int get itemCount => _library.length;

  void add(Song song){
    _library.add(song);
    notifyListeners();
  }




}

class Song {
  String title;
  String artist;
  String album;

  Song({this.title,this.artist,this.album});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: context.watch<Library>()._library.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: Icon(
                Icons.play_arrow,
                color: Colors.blue,
                size: 32,
              ),
              title: Text(context.watch<Library>()._library[index].title),
              subtitle: Text(context.watch<Library>()._library[index].artist),
              trailing:Icon(
                Icons.equalizer,
                color: Colors.blue,
                size: 32,
              ),


            );
          },
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Library>().add(Song(title: "Mangoma",artist: "chibaya",album: "Nsoft" )),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
