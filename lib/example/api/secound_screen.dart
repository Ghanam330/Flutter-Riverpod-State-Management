
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;





final dateProvider =FutureProvider.autoDispose<String>((ref)=>fetcData());

Future<String>fetcData()async {


  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response = await http.get(url);
  var date =await jsonDecode(response.body);

  print('Response body: '+date[0]['body']);
  return date[0] ["body"];

}



class SecondScreen extends ConsumerWidget {


  @override
  Widget build(BuildContext context,watch) {
    final date=watch(dateProvider);
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Container(
          child: date.when(
              data:(String value)=>Text(value),
              loading:()=>CircularProgressIndicator(),
              error:(error,stack)=>Text('error')),
        ),
      ),
    );
  }
}

// https://jsonplaceholder.typicode.com/posts
