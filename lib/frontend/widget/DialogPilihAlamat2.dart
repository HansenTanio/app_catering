import 'package:flutter/material.dart';
// import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class DialogPilihAlamat2 extends StatefulWidget {
  const DialogPilihAlamat2({super.key});

  @override
  State<DialogPilihAlamat2> createState() => _DialogPilihAlamat2State();
}

class _DialogPilihAlamat2State extends State<DialogPilihAlamat2> {
  String pilihAlamat = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 80,
            //   child: Center(
            //     child: Text(address),
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height - 5,
            //   child: OpenStreetMapSearchAndPick(
            //       center: LatLong(23, 89),
            //       buttonColor: Colors.blue,
            //       buttonText: 'Set Current Location',
            //       onPicked: (pickedData) {
            //         setState(() {
            //           pilihAlamat = pickedData.addressName;
            //         });
            //         print(pickedData.latLong.latitude);
            //         print(pickedData.latLong.longitude);
            //         print(pickedData.address);
            //       }),
            // )
          ],
        ),
      )),
    );
  }
}
