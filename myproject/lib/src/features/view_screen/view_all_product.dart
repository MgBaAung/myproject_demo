import 'package:flutter/material.dart';

class ViewAllProduct extends StatelessWidget {
  const ViewAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: const []),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                  'Hello Kanate, What fruit salad combo do you want today'),
              Container(
                color: const Color.fromARGB(255, 197, 180, 128),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    Text('Search fruit salad combos'),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Recommended Combo'),
                  SizedBox(
                    child: GridView.count(
                      childAspectRatio: .8,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      //  primary: false,
                      //padding: const EdgeInsets.all(16),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 14,
                          ),
                          color: Colors.blue,
                          child: SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const InkWell(
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Icon(Icons.favorite_outline))),
                                Container(
                                  child: Image.asset(
                                    'assets/images/image.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  child: const Text('Heoyn product'),
                                ),
                                Container(
                                  child: Row(
                                    children: const [Text('100000'), Text('+')],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 14,
                          ),
                          color: Colors.blue,
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const InkWell(
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(Icons.favorite_outline))),
                                Container(
                                  child: Image.asset(
                                    'assets/images/image.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  child: const Text('Heoyn product'),
                                ),
                                Container(
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('100000'),
                                      Container(
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 146, 75, 70),
                                              shape: BoxShape.circle),
                                          child: const Icon(Icons.add))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
