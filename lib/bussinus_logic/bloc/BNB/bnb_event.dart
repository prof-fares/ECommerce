part of 'bnb_bloc.dart';

sealed class BnbEvent extends Equatable {
  const BnbEvent();

  @override
  List<Object> get props => [];
}
class TabChangedEvent extends BnbEvent{
  int navIndex;
  TabChangedEvent({required this.navIndex});
}
