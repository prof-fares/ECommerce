import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/whilshitmodel.dart';
import 'package:ecommerce/data/repositry/wishlistrepo.dart';
import 'package:equatable/equatable.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishlistRepository wishlistRepository;
  List listid = [];
  bool? loading=false;


  WishListBloc({required this.wishlistRepository}) : super(WishListInitial()) {
    on<Getwishlist>((event, emit) async {
      emit(WshlistLoading());
      
      try {
        final wishlistmodel =
            await wishlistRepository.favoriteCartitems(event.token);
            for(int i=0;i<wishlistmodel!.data!.length;i++){
              listid.add(wishlistmodel.data![i].sId);
            }
        emit(WishListGetted(wishlist: wishlistmodel,wishlistid: listid));
        

      } catch (e) {
        emit(WshlistError(message: "Error to load wishlist"));
      }
    });
    on<Addwishlist>((event, emit) async {
     // emit(WshlistLoading());
     loading=true;
      try {
        final wishlistmodel = await wishlistRepository.AddfavoriteItem(
            event.productid, event.token);
           
           
          emit(WishListGetted(wishlistid:wishlistmodel!.data! ,wishlist:event.wishlistmodel));
          loading=false;
      } catch (e) {
        ///  emit(WshlistError(message: "Error to load wishlist"));
        print(e);
      }
    });
    on<Removewishlist>((event, emit) async {
    // emit(WshlistLoading());
    loading=true;
      try {
        final wishlistmodel = await wishlistRepository.removeWishlistItem(
            event.productid, event.token);
        //  print("********************${wishlistmodel!.data}=*****************");
        //listid=wishlistmodel.data!;
         emit(WishListGetted(wishlist: event.wishlistmodel,wishlistid: wishlistmodel!.data!));
        loading=false;
      } catch (e) {
        print("==========$e==============");
        emit(WshlistError(message: "Error to load wishlist"));
      }
    });
    on<ToggleFavEvent>((event, emit) async {

        
    for (int i = 0; i < event.wishlistmodel.data!.length;) {
      if (event.wishlistmodel.data![i].sId == event.productid) {
     emit(ToggleFavState(isFav: true));
     break;
      }  
      if(event.wishlistmodel.data!.length-i==1){
        emit(ToggleFavState(isFav: false));
        break;
      } 
       i++;
    }

  

    });
  }
}
