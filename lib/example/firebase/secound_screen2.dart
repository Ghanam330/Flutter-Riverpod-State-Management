import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_model.dart';


CollectionReference userDate = FirebaseFirestore.instance.collection('users');
final getUserDate = FutureProvider<QuerySnapshot>((ref) => userDate.get());

final getUserDate_streem = StreamProvider<QuerySnapshot>((ref) =>
  userDate.snapshots(),
);

class SecondScreen2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {


    return Scaffold(
      body: Container(
        child:  getUserDataStream(watch),
        // _getdata(watch),
      ),
    );
  }

 Widget _getdata(watch){
   final data = watch(getUserDate);
   return Center(
     child: data.when(data: (QuerySnapshot value) {
       UserModel userModel = UserModel.fromMap(value.docs[0].data());
       return Center(
         child: Column(
           children: [
             Text(userModel.name),
             Text(userModel.email),
           ],
         ),
       );
     }, loading: () {
       return CircularProgressIndicator();
     }, error: (value, stack) {
       return Text('error');
     }),
   );
  }


}

Widget getUserDataStream( watch) {
  final stream =watch(getUserDate_streem);
  return stream.when(
      data: (QuerySnapshot value) {
        UserModel userModel = UserModel.fromMap(value.docs[0].data());
        return Center(
          child: Column(
            children: [
              Text(userModel.name),
              Text(userModel.email),
            ],
          ),
        );
      },
       loading: () {
    return CircularProgressIndicator();
  }, error: (value, stack) {
    return Text('error');
  });
}
