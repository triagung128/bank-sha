part of 'operator_card_bloc.dart';

abstract class OperatorCardEvent extends Equatable {
  const OperatorCardEvent();

  @override
  List<Object> get props => [];
}

class OperatorCardGet extends OperatorCardEvent {}
