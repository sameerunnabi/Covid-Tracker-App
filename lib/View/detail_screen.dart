// import 'dart:ffi';

import 'package:covid_tracker/View/world_states.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String image;
  String name;

  int? totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailScreen({
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.totalRecovered,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    // bottom: MediaQuery.of(context).size.height * 0.67,
                    top: MediaQuery.of(context).size.height * 0.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      ReusableRow(
                          title: "Cases", value: widget.totalCases.toString()),
                      ReusableRow(
                          title: "Deaths",
                          value: widget.totalDeaths.toString()),
                      ReusableRow(
                          title: "Recovered",
                          value: widget.totalRecovered.toString()),
                      ReusableRow(
                          title: "Critical", value: widget.critical.toString()),
                      ReusableRow(
                          title: "Today Recovered",
                          value: widget.todayRecovered.toString()),
                      ReusableRow(
                          title: "Active", value: widget.active.toString()),
                      ReusableRow(title: "Test", value: widget.test.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
