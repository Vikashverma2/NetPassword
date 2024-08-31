import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Center(
                  child: Image.asset(
                'assets/images/lock.png',
                width: 300,
              )),
              Text(
                "Save your all password in one place",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),

              Container(
                child: Center(child: Text("Continue",style: TextStyle(),)),
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
