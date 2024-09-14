part of 'updateuser_bloc.dart';

sealed class UpdateuserEvent extends Equatable {
  const UpdateuserEvent();

  @override
  List<Object> get props => [];
}
class OnEditData extends UpdateuserEvent{
  final String nameUpdate;
  final  String NewUpdate;
  OnEditData({required this.nameUpdate,required this.NewUpdate,});
  @override
  List<Object> get props => [nameUpdate,NewUpdate,];
}
class GetLoggedUserData extends UpdateuserEvent{
 
  GetLoggedUserData();
  @override
  List<Object> get props => [];
}
class OnEditPass extends UpdateuserEvent{
  final String currentPass;
  final String newPass;
  final String confirmNewpass;

  OnEditPass({required this.currentPass,required this.newPass,required this.confirmNewpass,});

 @override
  List<Object> get props => [currentPass,newPass,confirmNewpass,];
}
class UpdateResetEvent extends UpdateuserEvent {}