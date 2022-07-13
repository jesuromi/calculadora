import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {

    on<CalculatorEvent>((event, emit) {
      if(event is ButtonC){
        emit(CalculatorState(firstNumber: '',secondNumber: '',operation: '',mathResult: ''));
      }
      if(event is AddNumber){
        var firstNumber = '';
        var secondNumber = '';
        var operation = '';
        var mathResult = '';

        firstNumber = state.firstNumber;
        secondNumber = state.secondNumber;
        operation = state.operation;
        mathResult = state.mathResult == '0' ? event.number : state.mathResult + event.number;

        if(state.operation == ''){

        }else{

        }
        emit(CalculatorState(
            firstNumber: firstNumber,
            secondNumber: secondNumber,
            operation: operation,
            mathResult: mathResult,
          )
        );
      }
      if(event is ButtonOperation){
        emit(
          CalculatorState(
            firstNumber: state.mathResult,
            secondNumber: '',
            operation: event.operation,
            mathResult: '0',
          )
        );
      }
      if(event is ButtonResult){
        double result = 0;
        if(state.operation == '+'){
            result =double.parse(state.firstNumber) + double.parse(state.mathResult);
        }
        if(state.operation == '-'){
          result =double.parse(state.firstNumber) - double.parse(state.mathResult);
        }
        if(state.operation == 'x'){
          result =double.parse(state.firstNumber) * double.parse(state.mathResult);
        }
        if(state.operation == '/'){
          result =double.parse(state.firstNumber) / double.parse(state.mathResult);
        }
        emit(
          CalculatorState(
            firstNumber: state.firstNumber,
            secondNumber: state.mathResult,
            operation: state.operation,
            mathResult:  result.toString(),

          )
        );
      }
    });
  }
}
