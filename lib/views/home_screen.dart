import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:urban_match_task_1_assignment/model/GithubModel.dart';
import 'package:http/http.dart' as http;
import 'package:urban_match_task_1_assignment/views/home_screen_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GithubModel> myList = [];
  Future<List<GithubModel>> getDataFromRepository() async {
    var response = await http
        .get(Uri.parse("https://api.github.com/users/freeCodeCamp/repos"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      for (Map i in data) {
        myList.add(GithubModel.fromJson(i));
      }
      return myList;
    } else {
      return myList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffea841),
        title: const Text("UrbanMatch Task 1 Solution"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getDataFromRepository(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreenSecond()));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: ClipOval(
                              child: SizedBox(
                                child: Image.network(
                                  myList[index].owner!.avatarUrl.toString(),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                "${myList[index].name.toString()} - Id: ${myList[index].id.toString()}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                myList[index].description.toString(),
                              ),
                            ),
                            trailing: Column(
                              children: [
                                const Icon(Icons.remove_red_eye),
                                Text(
                                  myList[index].watchersCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
