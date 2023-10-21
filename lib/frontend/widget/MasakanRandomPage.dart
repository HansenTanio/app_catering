import 'dart:convert';
import 'package:cateringapp/backend/data/models/MasakanRandom.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MasakanRandomPage extends StatefulWidget {
  const MasakanRandomPage({super.key});

  @override
  State<MasakanRandomPage> createState() => _MasakanRandomPageState();
}

class _MasakanRandomPageState extends State<MasakanRandomPage> {
  RandomMeal _randomMeal = RandomMeal(meals: []);
  Future<RandomMeal> fetch() async {
    try {
      var response = await http
          .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
      var jsonResponse = json.decode(response.body);
      RandomMeal randomMeal = RandomMeal.fromJson(jsonResponse);
      return randomMeal;
    } catch (e) {
      print(e);
      return RandomMeal(meals: []);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var tmp = await fetch();
    setState(() {
      _randomMeal = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetch(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return Column(
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //     print(snapshot.data!.meals[0]["strMeal"]);
              //   },
              //   child: Text("Tes"),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 550,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10.0), // Atur radius sesuai keinginan Anda
                    color: Colors.green,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(10.0), // Radius sudut atas kiri
                          topRight:
                              Radius.circular(10.0), // Radius sudut atas kanan
                        ),
                        child: Image.network(
                          snapshot.data!.meals[0]["strMealThumb"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              snapshot.data!.meals[0]["strMeal"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Country: ${snapshot.data!.meals[0]["strArea"]!}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Category: ${snapshot.data!.meals[0]["strCategory"]!}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Tags: ${snapshot.data!.meals[0]["strTags"] ?? "-"}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "YouTube Tutorial Link:",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "${snapshot.data!.meals[0]["strYoutube"]!}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return Text('Data tidak tersedia');
        }
      },
    );
  }
}
