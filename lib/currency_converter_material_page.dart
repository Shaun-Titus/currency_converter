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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2, // Adjust the width of the border
                    ),
                  ),
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