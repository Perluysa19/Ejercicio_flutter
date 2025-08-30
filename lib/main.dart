import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = 'Demo Drawer';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      color: Colors.deepPurple,
      home:  MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =TextStyle(
    fontSize: 30, 
    fontWeight: FontWeight.bold
    );
static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Dashboard', style: optionStyle,),
    Text('Index 1: Lista ', style: optionStyle,),
    Text('Index 2: Tarjetas', style: optionStyle,),
];

 void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder (
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
           ),
      ),

      body: Center(child: _widgetOptions [_selectedIndex]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                image: DecorationImage(
                 image: AssetImage ('assets/img/logo.png'),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                )
              ),
              
              child: Text('Menú de Navegación'),
            ),

            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Lista de Lenguajes'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.view_agenda),
              title: const Text('Vista con Cards'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}  
        