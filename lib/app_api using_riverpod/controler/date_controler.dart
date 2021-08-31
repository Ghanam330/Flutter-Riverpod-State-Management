import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_statemanagement/app_api%20using_riverpod/model/date_model.dart';

final getDataFuture =ChangeNotifierProvider((ref)=> GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  List<DataModel>list_data=[];

GetDataFromApi(){
  list_data=[];
  getData();
}
  Future getData() async{
  list_data=[];
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data =jsonDecode(response.body);

    for(int i =0; i< data.length; i++){
list_data.add(DataModel.fromMap(data[i]));
    }
    notifyListeners();
}

}