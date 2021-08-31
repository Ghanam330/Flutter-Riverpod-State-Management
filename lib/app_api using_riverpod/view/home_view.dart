import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/app_api%20using_riverpod/controler/date_controler.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final viewModel = watch(getDataFuture);

    return Scaffold(
      appBar: AppBar(
        title: Text("APi"),
      ),
      body: viewModel.list_data.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: viewModel.list_data.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    title: Text(
                      viewModel.list_data[index].title,
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      viewModel.list_data[index].body,
                      style: TextStyle(fontSize: 12),
                    ),
                    leading: Container(

                      width:30 ,
                      height: 30,
                      decoration:BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20)
                      ) ,
                      child: Center(
                        child: Text(
                            viewModel.list_data[index].id.toString()
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
