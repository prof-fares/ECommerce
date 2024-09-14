import 'package:bloc/bloc.dart';
import 'package:ecommerce/constant/sharedpref.dart';
import 'package:ecommerce/data/repos/repos_interface/curd_repo.dart';
import 'package:ecommerce/data/repos/repos_interface/regestration_repo.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/model/usermodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'updateuser_event.dart';
part 'updateuser_state.dart';

class UpdateuserBloc extends Bloc<UpdateuserEvent, UpdateuserState> {
  CurdReposatory curdreposatory;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  
  UpdateuserBloc({required this.curdreposatory}) : super(UpdateuserInitial()) {
     on<UpdateResetEvent>((event, emit) {
      // Emit the initial state to reset the bloc
      emit(UpdateuserInitial());
    });

    on<OnEditData>((event, emit) async {

      emit(UpdateLoading());
      try {
        final response = await curdreposatory.ChangeLoggeduserdata(
            nameUpdate: event.nameUpdate,
            NewUpdate: event.NewUpdate,
            );
          if(event.nameUpdate=="name")
          {
            await NameManger.saveName(event.NewUpdate);
          }
          else{
            await MailManger.saveEmail(event.NewUpdate);
          }
       
        emit(Updated(updateValue: response!.user!));
      } catch (e) {
        emit(UpdateError(message: "Error : $e"));
      }
    });
    on<GetLoggedUserData>((event,emit)async{
     emit(UpdateLoading());
     try {

       final name =await NameManger.getName();
       final email=await MailManger.getEmail();
       emit(LoggedUserDateGetted(name: name!, email: email!));
     } catch (e) {
       
     }

    });

    on<OnEditPass>((event, emit) async {
      emit(UpdateLoading());
      try {
        final response = await curdreposatory.ChangeLoggedpass(
            currentPass: event.currentPass,
            newPass: event.newPass,
            confirmNewpass: event.confirmNewpass,
           );
        emit(Updated(updateValue: response!.user!));
      } catch (e) {
        emit(UpdateError(message: "Error : $e"));
      }
    });
  }
}
