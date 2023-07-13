import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoutePage extends StatelessWidget {
  RoutePage({super.key});

  List<Image> places = [
    Image.asset('images/bo.png'),
    Image.asset('images/erbe.png'),
    Image.asset('images/orto.png'),
    Image.asset('images/pratodellavalle.png'),
    Image.asset('images/scrovegni.png'),
    Image.asset('images/villapisani.png'),
    Image.asset('images/collieuganei.png')
  ];

  List<String> address = [
    'DEI - Palazzo Bo',
    'DEI - Piazza delle Erbe',
    'DEI - Orto Botanico',
    'DEI - Prato della Valle',
    'DEI - Cappella degli Scrovegni',
    'DEI - Villa Pisani',
    'DEI - Parco dei Colli Euganei'
  ];

  List<String> info = [
    '1,7 Km [21 min]',
    '1,8 Km [22 min]',
    '2,6 Km [8 min]',
    '2,8 Km [9 min]',
    '1,5 Km [19 min]',
    '10,3 Km [33  min]',
    '24,8 Km [1 h 47 min]'
  ];

  List<Icon> icone = [
    const Icon(Icons.directions_walk),
    const Icon(Icons.directions_walk),
    const Icon(Icons.directions_bike),
    const Icon(Icons.directions_bike),
    const Icon(Icons.directions_walk),
    const Icon(Icons.directions_bike),
    const Icon(Icons.directions_bike),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        title: const Text(
          'DISCOVER',
          style: TextStyle(fontFamily: "Poppins"),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          for (var i = 0; i < 7; i++)
            SizedBox(
              height: 330,
              child: Card(
                margin: const EdgeInsets.only(bottom: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  children: [
                    places[i],
                    ListTile(
                      iconColor: Colors.blueGrey,
                      title: Text(
                        address[i],
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(info[i]),
                      trailing: icone[i],
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
