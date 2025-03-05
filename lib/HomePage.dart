import 'package:cubit_practice/CountCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cubit"),),
      body: BlocBuilder<CountCubit,int>(
          builder: (ctx,state){
            return Center(child: Text("$state",style: TextStyle(fontSize: 25),));
          },),
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<CountCubit>().increment();
        
      },child: Icon(Icons.add),),
    );
    
  }
}
