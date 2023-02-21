part of 'tip_bloc.dart';

abstract class TipState extends Equatable {
  const TipState();

  @override
  List<Object> get props => [];
}

class TipInitial extends TipState {}

class TipLoading extends TipState {}

class TipFailed extends TipState {
  final String e;

  const TipFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TipSuccess extends TipState {
  final List<TipModel> tips;

  const TipSuccess(this.tips);

  @override
  List<Object> get props => [tips];
}
