import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Deliver to')),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: const Text('Home'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('NO-17, Mayyingone, Yangon'),
                      Text('Edit')
                    ],
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: const Text('Your Order'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('NO-17, Mayyingone, Yangon'),
                      Text('Edit')
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    _orderCard(),
                    _orderCard(),
                    _orderCard(),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  child: Divider(
                    thickness: 1,
                  )),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total'),
                    Text('24,0000'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 144, left: 40, right: 40),
                padding: const EdgeInsets.symmetric(vertical: 11),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(
                    child: Text(
                  'Check out',
                  style: TextStyle(fontSize: 18),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderCard() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: ListTile(
        leading: Container(
          color: Colors.black,
          height: 70,
          width: 60,
          child: Image.asset(
            'assets/images/image.jpg',
            fit: BoxFit.cover,
          ),
        ),
        title: const Text('Product Code : 199292'),
        subtitle: const Text(
          '1 X Adidas Originals Trefoil Overhead',
          maxLines: 2,
        ),
        trailing: const Text('100'),
      ),
    );
  }
}
