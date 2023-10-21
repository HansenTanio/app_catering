import 'package:flutter/material.dart';
import '../../backend/data/Menu.dart';

class KotakMenu1 extends StatefulWidget {
  final Menu menu;
  const KotakMenu1({super.key, required this.menu});

  @override
  State<KotakMenu1> createState() => _KotakMenu1State();
}

class _KotakMenu1State extends State<KotakMenu1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 240,
        width: 160,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10.0), // Atur radius sesuai keinginan Anda
          color: Colors.green,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0), // Radius sudut atas kiri
                topRight: Radius.circular(10.0), // Radius sudut atas kanan
              ),
              child: Image.asset(
                'assets/images/kotak_extra.png',
                // 'images/menu/${widget.menu.gambar}',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 5, left: 8, right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.menu.nama}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Komposisi : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '${widget.menu.komposisi.join(", ")}',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Jumlah porsi : ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: '1 , ${widget.menu.satuan}',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
