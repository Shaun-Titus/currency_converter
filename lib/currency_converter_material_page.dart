import 'package:flutter/material.dart';


class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => 
      _CurrencyConverterMaterialPageState(); 
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage>{

    double result = 0;
    final TextEditingController textEditingController = TextEditingController();

    void convert() {
                      setState(() {
                        result = double.parse(textEditingController.text)*86.69;
                      });           
                  }

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
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            elevation: 0,
            title: Text("Currency Converter", 
            style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              
            ],
            ),
          body: Center(
            child:Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text( 
                   "INR ${result !=0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}", 
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // padding
                // container
              
                TextField(
                  controller: textEditingController,
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
                // time for button
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: convert,
                   style:TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                   ),
                   child: const Text("Convert")
                   )
                ], // children
              ),
            ), 
          ),
    );
  }
}

  


