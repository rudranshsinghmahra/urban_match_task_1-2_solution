import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:urban_match_task_1_assignment/model/CommitModel.dart';
import 'package:http/http.dart' as http;

class HomeScreenSecond extends StatefulWidget {
  const HomeScreenSecond({Key? key}) : super(key: key);

  @override
  State<HomeScreenSecond> createState() => _HomeScreenSecondState();
}

class _HomeScreenSecondState extends State<HomeScreenSecond> {
  // List<CommitModel> myList = [];

  Future<List<dynamic>> getLastCommitData() async {
    var data;
    String url =
        "https://api.github.com/repos/freeCodeCamp/1Aug2015GameDev/commits";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error Occurred");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffea841),
        title: const Text("UrbanMatch Task 2 Solution"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getLastCommitData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
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
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              "Author : ${snapshot.data?[index]['commit']['author']['name'].toString()}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Committer : ${snapshot.data?[index]['commit']['committer']['name'].toString()}",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Message : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${snapshot.data?[index]['commit']['message']}",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
