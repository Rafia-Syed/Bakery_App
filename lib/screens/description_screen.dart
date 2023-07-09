import 'package:flutter/material.dart';
import 'package:bakery_app/commons/labelled_counter.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  int item = 1;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  height: size.height,
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                          alignment: Alignment.topCenter,
                          child: Image(
                              height: 300,
                              width: 300,
                              image: AssetImage('cake.png')
                              )),
                      Center(
                        child: Container(
                          height: size.height * 0.06,
                          width: size.width * 0.36,
                          decoration: const BoxDecoration(
                              color: Color(0xffF88456),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )),
                          child: LabelledCounter(
                              onDecrementPressed: () {
                                setState(() {
                                  if (item >= 1) {
                                    item--;
                                  }
                                });
                              },
                              value: item,
                              onIncrementPressed: () {
                                setState(() {
                                  item++;
                                });
                              }),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Birthday Cake",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                height: size.height * 0.4,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color(0xffF88456),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        "Description: Strawberry cake is a cake that uses strawberry as a primary ingredient. a strawberry filling in between the layers of a layer cake. Fresh or frozen strawberries may be used. Some may utilize strawberry-flavored gelatin as an ingredient, it's decorated with donuts, grapes, macaron , chocolate needle and happy birthday words",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Flavor: Strawberry",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    const SizedBox(
                      height: 60,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.06,
                            width: size.width * 0.35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                )),
                              ),
                              onPressed: () {},
                              child: const Center(
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      fontSize: 19, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: size.height * 0.06,
                            width: size.width * 0.32,
                            decoration: const BoxDecoration(
                                color: Color(0xffF59C6C),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                )),
                            child: const Center(
                                child: Text(
                              "\$250.90",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
