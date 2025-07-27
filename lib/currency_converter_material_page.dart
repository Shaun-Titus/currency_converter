import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  Widget build(BuildContext context){
    final border =OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  );
    return  Scaffold(
      backgroundColor: Colors.blueAccent,
          body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("0" , 
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // padding
              // container

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Please enter amount in USD",
                    hintStyle: const TextStyle(
                      color: Colors.black,
                          ),
                    prefixIcon: const Icon(Icons.monetization_on_outlined),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                   ),
                   keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                   )
                 ),
              ),
              ], // children
            ), 
          ),
    );
  }

}
