part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionFailed extends TransactionState {
  final String e;

  const TransactionFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transactions;

  const TransactionSuccess(this.transactions);

  @override
  List<Object> get props => [transactions];
}
