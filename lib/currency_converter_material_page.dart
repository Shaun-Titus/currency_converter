import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
          body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("0" , 
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please enter amount in USD",
                  hintStyle: TextStyle(
                    color: Colors.black,
                        ),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                 ),
               ),
              ], // children
            ), 
          ),
    );
  }

}
// This is a simple currency converter page using Material design.
// It features a centered text displaying "0" and a text field for user input.    
// The text field has a hint for entering an amount in USD, with a prefix icon for monetization.
// The background color is set to blue accent, and the text is styled with a large,
// bold, white font. The text field has a white fill color and a black prefix icon.
// The focused border of the text field is outlined in white with a width of 2.0.
// This page is designed to be simple and user-friendly, making it easy for users to enter