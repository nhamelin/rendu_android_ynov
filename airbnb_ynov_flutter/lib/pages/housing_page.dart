import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:airbnb_ynov_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:airbnb_ynov_flutter/bo/city.dart';
import 'package:airbnb_ynov_flutter/bo/housing.dart';
import 'package:airbnb_ynov_flutter/routes.dart';

class HousingPage extends StatefulWidget {
  final String place;
  const HousingPage(this.place, {Key? key}) : super(key: key);

  @override
  _HousingPageState createState() => _HousingPageState();
}

class _HousingPageState extends State<HousingPage> {
  late StreamController<List<Housing>> _streamControllerListHousing;
  late Stream<List<Housing>> _streamHousing;

  @override
  void initState() {
    super.initState();

    _streamControllerListHousing = StreamController<List<Housing>>();
    _streamHousing = _streamControllerListHousing.stream;

    fetchHousing(widget.place);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Expanded(child: _buildList())
        ]
      ),
    );
  }

  StreamBuilder<List<Housing>> _buildList() {
    return StreamBuilder<List<Housing>>(
      stream: _streamHousing,
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
                onTap: () => goToDetails(),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(snapshot.data![index].place.name.toString()),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Text(snapshot.data![index].title)
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

  void fetchHousing(String place) {
    Future<Response> resCities = get(
        Uri.parse("https://flutter-learning.mooo.com/logements?place.name=" + place)
    );
    resCities.then((value) {
      if(value.statusCode == 200) {

        String jsonBody = value.body;
        List<Housing> lsHousing = List.empty(growable: true);

        for(Map<String,dynamic> housing in jsonDecode(jsonBody)) {
          lsHousing.add(Housing.fromJson(housing));
        }

        _streamControllerListHousing.sink.add(lsHousing);
      }
    },
        onError: (_, err) => log("Erreur lors du chargement des logements : " + err.toString())
    );
  }

  void goToDetails() {
    Navigator.of(context).pushReplacementNamed(ROUTE_DETAILS);
  }

  @override
  void dispose() {
    _streamControllerListHousing.close();
  }
}

