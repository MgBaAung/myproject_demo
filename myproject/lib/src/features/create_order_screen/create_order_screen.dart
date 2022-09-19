
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
          Text('YOUR ORDER CREATE'),
          Container(),
          Text('Thank For Ordering.'),
          Text('Rating for your order'),
          Container(
            child: Image.asset('assets/images/image2.jpg'),
          ),
          Row(
            children: [
              Icon(Icons.star_border_purple500_outlined),
               Icon(Icons.star_border_purple500_outlined),
                Icon(Icons.star_border_purple500_outlined),
                 Icon(Icons.star_border_purple500_outlined),
                  Icon(Icons.star_border_purple500_outlined),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 96),
                width: MediaQuery.of(context).size.width,
                child:const Text('Check'),
                color: Colors.blue,
              )  
            ],
          )
        ],
      ),
    );
  }
}