part of 'data_plan_bloc.dart';

abstract class DataPlanState extends Equatable {
  const DataPlanState();

  @override
  List<Object> get props => [];
}

class DataPlanInitial extends DataPlanState {}

class DataPlanLoading extends DataPlanState {}

class DataPlanFailed extends DataPlanState {
  final String e;

  const DataPlanFailed(this.e);

  @override
  List<Object> get props => [e];
}

class DataPlanSuccess extends DataPlanState {}
