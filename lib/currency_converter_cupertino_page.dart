import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() => _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState 
extends State<CurrencyConverterCupertinoPage> {

    double result = 0;
    final TextEditingController textEditingController = TextEditingController();

    void convert() {
                      setState(() {
                        result = double.parse(textEditingController.text)*86.69;
                      });           
                  }



  @override
  Widget build(BuildContext context) {
   
    return  CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeBlue,
          navigationBar: const CupertinoNavigationBar(
            backgroundColor: CupertinoColors.activeBlue,
            middle: Text("Currency Converter", 
            style: TextStyle(color: CupertinoColors.black),
            ),
            
            ),
          child: Center(
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
                    color: CupertinoColors.black,
                  ),
                ),
                // padding
                // container
              
                CupertinoTextField(
                  controller: textEditingController,
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  placeholder: "Please enter amount in USD",
                  prefix: const Icon(CupertinoIcons.money_dollar),
                   keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                   )  
                 ),
                // time for button
                const SizedBox(height: 10),
                CupertinoButton(
                  onPressed: convert,
                  color: CupertinoColors.black,
                   
                   child: const Text("Convert")
                   )
                ], // children
              ),
            ), 
          ),
    );
  }
}