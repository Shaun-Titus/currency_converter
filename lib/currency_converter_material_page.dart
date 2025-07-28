import 'package:flutter/material.dart';


class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() {
     return _CurrencyConverterMaterialPageState();
  }
}

class _CurrencyConverterMaterialPageState 
            extends State<CurrencyConverterMaterialPage>{
     @override
  Widget build(BuildContext context){
print("build fn");
    double result = 0;
    final TextEditingController textEditingController = TextEditingController();

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
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text( 
                  result.toString(), 
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // padding
              // container

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
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
              ),
              // time for button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(onPressed: () {
                      result = double.parse(textEditingController.text)*86;           
                  },
                   style:TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                   ),
                   child: const Text("Convert")
                   ),
              )
              ], // children
            ), 
          ),
    );
  }

}
  


