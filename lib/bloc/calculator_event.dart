part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class AddNumber extends CalculatorEvent{
  final String number;
  AddNumber(this.number);
}

class ButtonC extends CalculatorEvent{

}
class ButtonOperation extends CalculatorEvent{
  final String operation;
  ButtonOperation(this.operation);

}

class ButtonResult extends CalculatorEvent{
  final String operation;
  ButtonResult(this.operation);
}
