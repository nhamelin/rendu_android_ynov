import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:airbnb_ynov_flutter/bo/city.dart';
import 'package:airbnb_ynov_flutter/routes.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late StreamController<List<City>> _streamControllerListCities;
  late Stream<List<City>> _streamCities;

  @override
  void initState() {
    super.initState();

    _streamControllerListCities = StreamController<List<City>>();
    _streamCities = _streamControllerListCities.stream;

    fetchCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _buildList())
        ]
      ),
    );
  }

  StreamBuilder<List<City>> _buildList() {
    return StreamBuilder<List<City>>(
        stream: _streamCities,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return const Center(child:  Icon(Icons.error));
          }
          if(!snapshot.hasData) {
            return const Center(child: const CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder:
                  (BuildContext context, int index) => const Divider(thickness: 1.5,),
              itemBuilder: (context, index) =>
                InkWell(
                  onTap: () => goToHousing(snapshot.data![index].name),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data![index].name),
                        Column(
                          children:[
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network("https://flutter-learning.mooo.com" + snapshot.data![index].pic)
                            )
                          ]
                        )
                      ]
                    )
                  ),
                )
            );
          }
        }
    );
  }

  void fetchCities() {
    Future<Response> resCities = get(
        Uri.parse("https://flutter-learning.mooo.com/villes")
    );
    resCities.then((value) {
          if(value.statusCode == 200) {

            String jsonBody = value.body;
            List<City> lsCities = List.empty(growable: true);

            log("https://flutter-learning.mooo.com/");

            for(Map<String,dynamic> city in jsonDecode(jsonBody)) {
              lsCities.add(City.fromJson(city));
            }

            _streamControllerListCities.sink.add(lsCities);
          }
        },
        onError: (_, err) => log("Erreur lors du chargement des villes : " + err.toString())
    );
  }

  void goToHousing(String content) {
    String cityName = content.toString();

    Navigator.of(context).pushNamed(ROUTE_HOUSING, arguments:cityName);
  }

  @override
  void dispose() {
    _streamControllerListCities.close();
  }

}


