import 'package:flutter/material.dart';
import 'package:login_tutorial/domain/entities/bike_catalog.dart';
import 'package:login_tutorial/presentation/screens/ebikes.dart';

class BikeCatalogs extends StatefulWidget {
  const BikeCatalogs({super.key});

  @override
  State<BikeCatalogs> createState() => _BikeCatalogsState();
}

class _BikeCatalogsState extends State<BikeCatalogs> {
  final List<BikeCatalog> catalogs = [
    BikeCatalog(name: 'E-Bikes', imagen: 'assets/ebike.png'),
    BikeCatalog(name: 'Montaña', imagen: 'assets/mountain_bike.png'),
    BikeCatalog(name: 'De Ruta', imagen: 'assets/route_bike.png'),
    BikeCatalog(name: 'Gravel', imagen: 'assets/gravel_bike.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF292A2B).withAlpha(200),
              Color(0xFF292A2B),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10),
                  child: Image.asset(
                    'assets/text_logo.png',
                    width: 300,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: catalogs.length,
                      itemBuilder: (context, index) {
                        final catalog = catalogs[index];
                        return _catalogCard(catalog);
                      }),
                ),
              ],
            )),
      ),
    );
  }

  Widget _catalogCard(BikeCatalog catalog) {
    return GestureDetector(
      onTap: () {
        // debugPrint('ON CLICK');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EBikes()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        // height: 115,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 27, 27, 28),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, right: 10, left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  catalog.imagen,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  catalog.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
