import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = StateProvider<String>((ref) => 'Country 1');
final weatherProvider = StateProvider<String>((ref) {
  final city = ref.watch(cityProvider);

  return city.state == 'Country 1'
      ? '24'
      : city.state == 'Country 2 '
      ? '40'
      : '30' ;
}
);

class SecondView extends ConsumerWidget {
  @override
  Widget build(BuildContext context,watch) {
    final city =watch(cityProvider);
    final weather =watch(weatherProvider);
    
    return Scaffold(
    body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              items: [
              DropdownMenuItem(
                child: Text("Country 1"),
                value: "Country 1",
              ),
              DropdownMenuItem(
                child: Text("Country 2"),
                value: "Country 2",
              ),
              DropdownMenuItem(
                child: Text("Country 3"),
                value: "Country 3",
              )
            ],
              value: city.state,
              onChanged:(value){
                city.state=value;
              } ,
            ),
            Text(weather.state,style: TextStyle(
              fontSize: 40
            ),)
          ],
        )
      ),
    ),
    );
  }
}
