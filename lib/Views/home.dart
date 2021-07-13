import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turkish_gasoline_and_diesel_price_app/Models/city_district_model.dart';
import 'package:turkish_gasoline_and_diesel_price_app/Views/ilceler.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Ilceler>? ilceler;

  Future<List<CitysDistricts>> readJsonData() async {
    final jsondata =
        await rootBundle.loadString('assets/jsons/city_district.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => CitysDistricts.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    readJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: readJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<CitysDistricts>;
          return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Text(items[index].plakaKodu.toString()),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(
                                      items[index].ilAdi.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Text(items[index].ilAdi.toString()),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              print("${items[index].ilAdi.toString()}");
                              var secilen = items[index].ilceler;
                              setState(() {
                                ilceler = items[index].ilceler;
                              });
                              print("BENİ SEÇTİN: ****$secilen");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IlcelerView(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
