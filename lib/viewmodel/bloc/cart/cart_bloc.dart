import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repos/repos_interface/cart_repo.dart';
import 'package:ecommerce/model/cartitemmodel.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepository cartRepository;

  int quantity = 0;
  CartBloc({required this.cartRepository}) : super(CartInitial()) {
     on<CartResetEvent>((event, emit) {
      // Emit the initial state to reset the bloc
      emit(CartInitial());
    });

    on<GetItemsEvent>((event, emit) async {
      try {
        print("==================================================");
        final cartmodel = await cartRepository.getaCartItems();
        print("=====================${cartmodel}=============================");
        emit(ItemsLoaded(cartItem: cartmodel!));
      } catch (e) {
        print("$e===");
        emit(ItemsError(message: "Error to load cart"));
      }
    });
    on<UbdateItemEvent>((event, emit) async {
      emit(ItemsLoading());
      try {
        final cartitem = await cartRepository.UbdateCartItems(
            event.productid, event.count);
        emit(ItemsLoaded(cartItem: cartitem!));
      } catch (e) {
        print("=================$e===================");
      }
    });
    on<AddItemEvent>((event, emit) async {
      emit(ItemsLoading());
      try {
     
            await cartRepository.AddCartItems(event.productid);
     
          add(UbdateItemEvent(
              productid: event.productid,
             
              count: event.count));
      
      } catch (e) {
        print("=================$e===================");
      }
    });
    on<RemoveItemEvent>((event, emit) async {
      emit(ItemsLoading());
      try {
        final response =
            await cartRepository.RemoveCartItems(event.productid);
        emit(ItemsLoaded(cartItem: response!));
      } catch (e) {
        print("=================$e===================");
      }
    });
  }
}
