import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/cartitemmodel.dart';
import 'package:ecommerce/data/repositry/cartreposatory.dart';
import 'package:ecommerce/data/web_services/cart_web_service.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepository cartRepository;

  int quantity = 0;
  CartBloc({required this.cartRepository}) : super(CartInitial()) {
    on<GetItemsEvent>((event, emit) async {
      try {
        print("==================================================");
        final cartmodel = await cartRepository.getaCartItems(event.token);
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
            event.productid, event.token, event.count);
        emit(ItemsLoaded(cartItem: cartitem!));
      } catch (e) {
        print("=================$e===================");
      }
    });
    on<AddItemEvent>((event, emit) async {
      emit(ItemsLoading());
      try {
        final cartitem =
            await cartRepository.AddCartItems(event.productid, event.token);
     
          add(UbdateItemEvent(
              productid: event.productid,
              token: event.token,
              count: event.count));
      
      } catch (e) {
        print("=================$e===================");
      }
    });
    on<RemoveItemEvent>((event, emit) async {
      emit(ItemsLoading());
      try {
        final response =
            await cartRepository.RemoveCartItems(event.productid, event.token);
        emit(ItemsLoaded(cartItem: response!));
      } catch (e) {
        print("=================$e===================");
      }
    });
  }
}
