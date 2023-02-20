part of 'operator_card_bloc.dart';

abstract class OperatorCardState extends Equatable {
  const OperatorCardState();

  @override
  List<Object> get props => [];
}

class OperatorCardInitial extends OperatorCardState {}

class OperatorCardLoading extends OperatorCardState {}

class OperatorCardFailed extends OperatorCardState {
  final String e;

  const OperatorCardFailed(this.e);

  @override
  List<Object> get props => [e];
}

class OperatorCardSuccess extends OperatorCardState {
  final List<OperatorCardModel> operatorCards;

  const OperatorCardSuccess(this.operatorCards);

  @override
  List<Object> get props => [operatorCards];
}
