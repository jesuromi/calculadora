import 'package:calculadora/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(const AppState());

}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CalculatorBloc>(
              create: (_) => CalculatorBloc())
        ],
        child: MyApp()
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              height: 200,
              child: BlocBuilder<CalculatorBloc,CalculatorState>(
                builder: (context,state) {
                  return Column(
                    children: [
                      Text(state.firstNumber + state.operation + state.secondNumber,style: const TextStyle(fontSize: 35)),
                      Text(state.mathResult,style: const TextStyle(fontSize: 60)),
                    ],
                  );
                }
              ),
            ),
          Row(
            children: [
              const SizedBox(width: 10.0,),
              _customButton(context, label: "1"),
              const SizedBox(width: 10.0,),
              _customButton(context, label: "2"),
              const SizedBox(width: 10.0,),
              _customButton(context, label: "3"),
              const SizedBox(width: 10.0,),
              _operationButton(context, operation: '+',color: Colors.blue)

            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const SizedBox(width: 10.0,),
              _customButton(context, label: "4"),
              const SizedBox(width: 10.0,),
              _customButton(context, label: "5"),
              const SizedBox(width: 10.0,),
              _customButton(context, label: "6"),
              const SizedBox(width: 10.0,),
              _operationButton(context, operation: '-', color: Colors.blue)

            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const SizedBox(width: 10.0,),
              _customButton(context, label: "7"),
              const SizedBox(width: 10.0,),
              _customButton(context, label: "8"),
              const SizedBox(width: 10.0,),
              _customButton(context, label: "9"),
              const SizedBox(width: 10.0,),
              _operationButton(context, operation: 'x',color: Colors.blue)

            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const SizedBox(width: 10.0,),
              _operationButton(context,operation: 'c', color: Colors.purple),
              const SizedBox(width: 10.0,),
              _customButton(context, label: '0'),
              const SizedBox(width: 10.0,),
              _operationButton(context,operation: '=', color: Colors.purple),
              const SizedBox(width: 10.0,),
              _operationButton(context,operation: '/',color: Colors.blue)
            ],
          )
        ],
      ),

    );
  }
}
Widget _customButton(context, {required String label}){

  return ElevatedButton(
      onPressed: () => BlocProvider.of<CalculatorBloc>(context).add(AddNumber(label)),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(35),
        primary: Colors.grey,
      ),
      child:  Text(label, style: const TextStyle(fontSize: 24),),
  );
}

Widget _operationButton(context, {required String operation, required Color color}){

  return ElevatedButton(
    onPressed: () {

      if(operation == 'c'){
        BlocProvider.of<CalculatorBloc>(context).add(ButtonC());
      }else if(operation == '='){
        BlocProvider.of<CalculatorBloc>(context).add(ButtonResult(operation));
      }else{
        BlocProvider.of<CalculatorBloc>(context).add(ButtonOperation(operation));
      }


    },
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(35),
      primary: color,
    ),
    child:  Text(operation, style: const TextStyle(fontSize: 24),),
  );
}


Widget _containerRow ({required Color color1, required String label}){
  return Container(
    padding: const EdgeInsets.all(35),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(color: color1),
    child: Text(label,style: const TextStyle(color: Colors.white,fontSize: 24),),
  );
}



