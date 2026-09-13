import 'package:flutter/material.dart';
import 'package:login_tutorial/domain/entities/bike_product.dart';
import 'package:login_tutorial/presentation/widgets/subtitle.dart';

class EBikes extends StatefulWidget {
  const EBikes({super.key});

  @override
  State<EBikes> createState() => _EBikesState();
}

class _EBikesState extends State<EBikes> {
  final List<BikeProduct> bikes = [
    BikeProduct('Kontax', 'assets/kontax.png', 3500),
    BikeProduct('Greyp E-500', 'assets/ebike5.png', 3900),
    BikeProduct('Totguard-E', 'assets/totguard.png', 1700),
    BikeProduct('E-Bike DE', 'assets/ebike_de.png', 3200),
    BikeProduct('Ado-A20', 'assets/ado_a20.png', 1500),
    BikeProduct('Samebike', 'assets/samebike.png', 1600),
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
                Subtitle(
                  text: "Bicicletas Eléctricas",
                  colorText: Colors.white,
                ),
                Subtitle(
                  text: "E-Bikes",
                  colorText: Colors.white,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.78),
                      itemCount: bikes.length,
                      itemBuilder: (context, index) {
                        final bike = bikes[index];

                        return _productBikeCard(bike);
                      }),
                ),
              ],
            )),
      ),
    );
  }

  Widget _productBikeCard(BikeProduct bike) {
    return GestureDetector(
      onTap: () {
        // debugPrint('ON CLICK');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EBikes()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        // height: 115,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 27, 27, 28),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  bike.image,
                  // height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              bike.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            Text(
              '${bike.price} Bs',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
