import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repos/repos_interface/products_repo.dart';
import 'package:ecommerce/model/productsmodel.dart';
import 'package:equatable/equatable.dart';


part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  int quantity=1;
  ProductsRepository productsRepository;
  ProductsBloc({required this.productsRepository}) : super(ProductsInitial()) {
     on<ProductsResetEvent>((event, emit) {
      // Emit the initial state to reset the bloc
      emit(ProductsInitial());
    });

    on<GetProductsEvent>((event, emit)async {
      print(event.Categoryid);
       emit(ProducdtsLoading());
      try {
        final productmodel=await productsRepository.getProducts(Categoryid: event.Categoryid);
     //   print("*************************${productmodel}**************************");
        emit(ProductsLoded(productsModel: productmodel!));
      } catch (e) {
        emit(ProductsError(message: "Error to load products"));
      }
    });
     on<IncreaseQuantity>((event,emit){
    
         quantity++;
         emit(QuantityChanged(newvalue: quantity));
  }
  

  );
   on<DecreaseQuantity>((event,emit){

        quantity!=1?quantity--:quantity==quantity;
         emit(QuantityChanged(newvalue: quantity));
  }
  

  );
  on<SizeChangeEvent>((event,emit){
    emit(SizeChangeState(index: event.index));
  });
  on<ColorChangeEvent>((event,emit){
    emit(ColorChangeState(index: event.index));
  });
  }
 

}
