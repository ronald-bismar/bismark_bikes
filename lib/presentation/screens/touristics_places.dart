import 'package:flutter/material.dart';
import 'package:login_tutorial/domain/entities/touristic_place.dart';
import 'package:login_tutorial/presentation/widgets/subtitle.dart';

class TouristicsPlaces extends StatefulWidget {
  const TouristicsPlaces({super.key});

  @override
  State<TouristicsPlaces> createState() => _TouristicsPlacesState();
}

class _TouristicsPlacesState extends State<TouristicsPlaces> {
  final List<TouristicPlace> touristicPlaces = [
    TouristicPlace(image: 'assets/tiwanaku.png', name: 'Tiwanaku'),
    TouristicPlace(image: 'assets/guaqui.png', name: 'Puerto Guaqui'),
    TouristicPlace(image: 'assets/huayna_potosi.png', name: 'Huayna Potosi')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                  padding:
                      const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
                  child: Text(
                    'LUGARES TURISTICOS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Subtitle(
                  text: 'La Aventura Te Espera',
                  colorText: Colors.white,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: touristicPlaces.length,
                      itemBuilder: (context, index) {
                        final touristicPlace = touristicPlaces[index];
                        return _touristicPlaceCard(touristicPlace);
                      }),
                ),
              ],
            )));
  }

  Widget _touristicPlaceCard(TouristicPlace place) {
    return GestureDetector(
      onTap: () {
        debugPrint('ON CLICK TOURISTIC PLACE');
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => EBikes()));
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
                  place.image,
                  height: 200,
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
                  place.name,
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
