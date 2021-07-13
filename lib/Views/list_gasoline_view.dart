import 'package:flutter/material.dart';
import 'package:turkish_gasoline_and_diesel_price_app/Models/turkey_diesel.dart';
import 'package:turkish_gasoline_and_diesel_price_app/Services/list_diesel.dart';

class ListDieselView extends StatefulWidget {
  const ListDieselView({Key? key}) : super(key: key);

  @override
  _ListDieselViewState createState() => _ListDieselViewState();
}

class _ListDieselViewState extends State<ListDieselView> {
  DieselService service = DieselService();

  late Future<List<ResultClass>> dieselPrice;

  @override
  void initState() {
    super.initState();
    dieselPrice = service.getDieselPrice();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<ResultClass>>(
            future: dieselPrice,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data!;
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        title: Text(item.marka),
                        subtitle: Text(item.benzin.toString() +
                            " ve " +
                            item.katkili.toString()),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
