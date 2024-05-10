import 'package:flutter/material.dart';

import '../model/arithmetic_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mykey = GlobalKey<FormState>();
// Delcare variables
  int? first;
  int? second;
  int? result ;
  ArithmeticModel?  arithmeticModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Form(
        key: mykey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return 'Enter first no';
                }
                return null;
              },
              onChanged: (value) {
                first = int.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter First No',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return 'Enter first no';
                }
                return null;
              },
              onChanged: (value) {
                second = int.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Second No',
              ),
            ),
            const SizedBox(height: 8),
            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                if(mykey.currentState!.validate()){
                  setState(() {
                    arithmeticModel = ArithmeticModel(first: first,second: second);
                    result = arithmeticModel?.subtract();
                  });
                }
              },
                child: const Text(
                    "Substract",
                    style : TextStyle(
                      fontSize: 25,
                    )
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(mykey.currentState!.validate()){
                    setState(() {
                      arithmeticModel = ArithmeticModel(first: first, second: second);
                      result = arithmeticModel?.add();
                    });
                  }
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Display informatuion
            Text(
              'Sum is : $result',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


