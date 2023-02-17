import 'dart:developer';

import 'package:cis_example/model/model.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const SecondScreen({super.key, required this.categoryModel});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Color> colors = [Colors.red, Colors.green, Colors.yellow, Colors.teal];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.categoryModel.title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            '${widget.categoryModel.price}',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(widget.categoryModel.images[currentIndex],
                  height: 300, width: double.infinity, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: List.generate(colors.length, (index) {
              return MaterialButton(
                height: 35,
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentIndex = index;
                  });
                  log('$currentIndex');
                },
                shape: const CircleBorder(
                    side: BorderSide(color: Colors.white, width: 2)),
                color: colors[index],
              );
            }),
          )
        ],
      ),
    );
  }
}
