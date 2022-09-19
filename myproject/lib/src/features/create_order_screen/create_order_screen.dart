import 'package:flutter/material.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('YOUR ORDER CREATE'),
          Container(),
          const Text('Thank For Ordering.'),
          const Text('Rating for your order'),
          Image.asset('assets/images/image2.jpg'),
          Row(
            children: [
              const Icon(Icons.star_border_purple500_outlined),
              const Icon(Icons.star_border_purple500_outlined),
              const Icon(Icons.star_border_purple500_outlined),
              const Icon(Icons.star_border_purple500_outlined),
              const Icon(Icons.star_border_purple500_outlined),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 96),
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: const Text('Check'),
              )
            ],
          )
        ],
      ),
    );
  }
}
