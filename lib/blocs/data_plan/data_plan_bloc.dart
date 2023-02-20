import 'package:bank_sha/models/data_plan_form_model.dart';
import 'package:bank_sha/services/transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanEvent>((event, emit) async {
      if (event is DataPlanPost) {
        try {
          emit(DataPlanLoading());

          await TransactionService().dataPlan(event.data);

          emit(DataPlanSuccess());
        } catch (e) {
          emit(DataPlanFailed(e.toString()));
        }
      }
    });
  }
}
