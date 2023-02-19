part of 'transfer_bloc.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class TransferPost extends TransferEvent {
  final TransferFormModel data;

  const TransferPost(this.data);

  @override
  List<Object> get props => [data];
}
