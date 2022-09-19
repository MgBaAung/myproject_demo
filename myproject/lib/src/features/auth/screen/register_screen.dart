
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  final _formKey = GlobalKey<FormState>(); 

  //used to change password's icon behavior
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 40),
        child: Form(  
        key: _formKey,  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.center,  
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[  
            const Text(
              'Welcom!'
            ),
            const SizedBox(height: 61,),
            TextFormField(  
              autofocus: true,
              decoration: const InputDecoration(  
                hintText: 'Enter Name',  
                labelText: 'Name',  
              ),  
            ), 
            const SizedBox(
              height: 50,
            ),
             TextFormField(
                              obscureText: _obscured,
                              decoration: InputDecoration(
                                label:const Text('Password'),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _obscured = !_obscured;
                                  },
                                  icon: Icon(
                                    _obscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                hintText: 'Enter Password ',
                                
                              ),
             ),     
            const SizedBox(height: 79,),
            const MaterialButton(  
              color: Colors.blue,
              onPressed: null,  
              child: Text('Sig Up'),  
            ),  
          ],  
        ),  
        ),
      ),
    );
   }
}