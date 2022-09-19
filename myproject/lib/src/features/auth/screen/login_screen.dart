
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  // Create a global key that uniquely identifies the Form widget  
  // and allows validation of the form.  
  final _formKey = GlobalKey<FormState>(); 

  //use to change password behavior
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
            Text(
              'Welcom!'
            ),
            const SizedBox(height: 61,),
            TextFormField(  
              autofocus: true,
              decoration: const InputDecoration(  
                hintText: 'Enter Email',  
                labelText: 'Email',  
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
             ),     
            const SizedBox(height: 79,),
            const MaterialButton(  
              color: Colors.blue,
              onPressed: null,  
              child: Text('Submit'),  
            ),  
          ],  
        ),  
        ),
      ),
    );
 
  }
}

