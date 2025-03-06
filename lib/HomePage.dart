import 'dart:math';

import 'package:cubit_practice/CountCubit.dart';
import 'package:cubit_practice/List/list_cubit.dart';
import 'package:cubit_practice/List/list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit"),
      ),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (ctx, state) {
          return state.mData.isEmpty
              ? Center(child: Text("data not found"))
              : ListView.builder(
                  itemCount: state.mData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      title: Text(state.mData[index]['name']),
                      subtitle: Text(state.mData[index]['desc']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                ctx.read<ListCubit>().updateList(
                                    {'name': 'Aas ', 'desc': 'ok'}, index);
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                ctx.read<ListCubit>().deleteList(index);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    );
                  });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ListCubit>()
              .addList({"name": 'Aas WebTech', 'desc': 'Flutter Developer'});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
