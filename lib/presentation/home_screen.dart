import 'dart:developer';

import 'package:cis_example/presentation/second_screen.dart';
import 'package:cis_example/presentation/widgets/outlined_button.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titles = ['Chairs', 'Sofa', 'Tables'];
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CIS Example'),
      ),
      body: Column(
        children: [
          //
          const SizedBox(
            height: 10,
          ),
          Row(
              children: List.generate(titles.length, (index) {
            return Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DefaultOutlinedButton(
                    backgroundColor:
                        index == currentIndex ? Colors.teal : Colors.white,
                    foregroundColor:
                        index == currentIndex ? Colors.white : Colors.teal,
                    onPressed: () {
                      setState(() {
                        currentIndex = index; //1
                        log('$index');
                      });
                    },
                    title: titles[index],
                  )),
            );
          })),
          SizedBox(
            height: 350,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 3
                        )
                        ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondScreen(
                                        categoryModel:
                                            categoryModels[index], //0
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(categoryModels[index].title),
                                const SizedBox(height: 10),
                                Text('${categoryModels[index].price}'),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      categoryModels[index].images.first,
                                      height: 200,
                                      width: double.maxFinite,
                                      fit: BoxFit.cover,
                                    ))
                              ]),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: categoryModels.length,
            ),
          )
        ],
      ),
    );
  }
}
