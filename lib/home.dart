import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<home> {
  Future<void>fetchData()async{
    var baseurl=Uri.parse("https://dummy.restapiexample.com/api/v1/employees");
    final response=await http.get(baseurl);
    if(response.statusCode==200){
      print(response.body.toString());

    }
    else
    {
      print("Something Went Wrong");
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: ElevatedButton(onPressed: (){
    fetchData();
  }, child: Text("Hello World")),
),
    );
  }
}