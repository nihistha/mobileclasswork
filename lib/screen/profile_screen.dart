import 'package:flutter/material.dart';

import '../model/simple_interest_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final mykey = GlobalKey<FormState>();

  double? principle;

  double? rate;

  double? time;

  double simpleinterest =0;
  SimpleInterestModel? simpleInterestModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter first no';
                  }
                  return null;
                },
                onChanged: (value) {
                  principle = double.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter principle',
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
                  rate = double.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Second No',
                ),
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter first no';
                  }
                  return null;
                },
                onChanged: (value) {
                  time = double.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Second No',
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  if(mykey.currentState!.validate()){
                    setState(() {
                      simpleInterestModel = SimpleInterestModel(principle: principle, rate: rate, time: time);
                      simpleinterest = simpleInterestModel!.simpleInterest();
                    });
                  }
                },
                  child: const Text(
                      "Calculate",
                      style : TextStyle(
                        fontSize: 25,
                      )
                  ),
                ),
              ),
              Text(
                'Simple interest is : $simpleinterest',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ]
        ),

    );
  }
}
