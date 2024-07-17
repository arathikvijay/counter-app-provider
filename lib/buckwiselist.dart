import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class bucklist extends StatefulWidget {
  const bucklist({super.key});

  @override
  State<bucklist> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<bucklist> {
  bool isApiResponseloading=false;
  String randumBucketList="Randum BucketList";
  Future<void>FetchRandomBucketList() async{
  setState(() {
    isApiResponseloading=false;
  });
  var apiUrl=Uri.parse("https://api.api-ninjas.com/v1/bucketlist");
  var header={"X-Api-Key":"BWxsxZGtCFrsdh/W91+cQg==YCYH4g6FVY6DcheZ"};
  isApiResponseloading=false;
  final response=await http.get(apiUrl,headers:header);
  if(response.statusCode==200)
  {
    print(response.body);
  }
  setState(() {
    final json=jsonDecode(response.body);
    randumBucketList = json["item"];
      isApiResponseloading = false;
  });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Randum BucketList"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          isApiResponseloading==true?
          CircularProgressIndicator()
          :Text('''" $randumBucketList "''',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
         SizedBox(
          height:30
        ),
        ElevatedButton(onPressed: (){
          FetchRandomBucketList();
          
        }, 
        
        child: Text("OK"))
        ],
      ),
    );
  }
}