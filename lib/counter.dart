import 'package:api/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class counter extends StatelessWidget {
  const counter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context,counter,child) {
            return Text(
              counter.count.toString(),style: TextStyle(fontSize:50,color: Colors.black),
            );
          }
        ),

      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: ()
          {
            Provider.of<CounterProvider>(context,listen: false).increment();
          },
          child: Icon(Icons.add)),
           FloatingActionButton(onPressed: ()
          {
            Provider.of<CounterProvider>(context,listen: false).decrement();
          },
          child: Icon(Icons.minimize)),
        ],
      ),
    );
  }
}