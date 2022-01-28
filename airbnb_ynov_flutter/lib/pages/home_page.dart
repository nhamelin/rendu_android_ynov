import 'package:flutter/material.dart';

import 'package:airbnb_ynov_flutter/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                    width: 300,
                    child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Rechercher"
                        )
                    )
                ),
                ElevatedButton(
                  onPressed: () => _searchCity(),
                  child: const Icon(Icons.search)
                )
              ],
            )
          ]
        )
      )
    );
  }

  void _searchCity() {
    Navigator.of(context).pushReplacementNamed(ROUTE_CITY);
  }
}
