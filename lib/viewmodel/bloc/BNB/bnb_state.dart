part of 'bnb_bloc.dart';

abstract class BnbState extends Equatable {
  final int navIndex;
  const BnbState({required this.navIndex});
  
  @override
  List<Object> get props => [];
}

 class BnbInitial extends BnbState {
  
 const BnbInitial({required super.navIndex});
  @override
  List<Object> get props => [navIndex];

}

