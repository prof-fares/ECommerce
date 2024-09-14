part of 'bnb_bloc.dart';

sealed class BnbEvent extends Equatable {
  const BnbEvent();

  @override
  List<Object> get props => [];
}
class TabChangedEvent extends BnbEvent{
 final int navIndex;
  TabChangedEvent({required this.navIndex});
  @override
  List<Object> get props => [navIndex];

}
class BNBResetEvent extends BnbEvent {}