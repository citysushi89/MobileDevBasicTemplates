import 'package:flutter/material.dart';
import 'screens/dropdown_menu_multiple_dymanic.dart';

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
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MyHomePage.id,
        routes: {
          MyHomePage.id: (context) => MyHomePage(),
          DropdownMenuMultipleDynamic.id: (context) =>
              DropdownMenuMultipleDynamic(title: 'Dropdown Menus')
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const id = 'home_page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Home'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    DropdownMenuMultipleDynamic.id,
                  );
                  print('pressed');
                },
                child: Text('Dropdown menu page'),
              )
            ],
          ),
        ));
  }
}
