import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/categorymodel.dart';
import 'package:ecommerce/data/repositry/fetchcategorry_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final PageController pageController = PageController();
  Timer? _timer;
  final FetchCategorryRepository fetchCategorryRepository;
  CategoryModel? cachedCategoryModel;
  
  CategoryBloc({required this.fetchCategorryRepository}) : super(CategoryInitial()) {
    on<GetCategoryEvent>((event, emit) async {
      emit(CategoryLoding());
      try {
        cachedCategoryModel = await fetchCategorryRepository.getCategory();
        emit(CategoryLoded(categoryModel: cachedCategoryModel!));
      } catch (e) {
        emit(CategoryError(message: "Error to load data please try again later"));
      }
    });

    on<StartAutoScroll>((event, emit) {
      _startAutoScroll();
    });

    on<StopAutoScroll>((event, emit) {
      _stopAutoScroll();
    });
  }

  void _startAutoScroll() {
  _timer?.cancel();
  _timer = Timer.periodic(Duration(seconds: 3), (timer) {
    if (pageController.hasClients && pageController.page != null) {
      final nextPage = (pageController.page?.toInt() ?? 0) + 1;
      pageController.animateToPage(
        nextPage % 3, // Assuming 3 pages
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  });
}
  /*void _startAutoScroll() {
  _timer?.cancel();
  _timer = Timer.periodic(Duration(seconds: 3), (timer) {
    if (pageController.hasClients && pageController.page != null) {
      final nextPage = (pageController.page?.toInt() ?? 0) + 1;
      pageController.animateToPage(
        nextPage % 3, // Assuming 3 pages
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  });
}*/ 

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    _stopAutoScroll();
    return super.close();
  }
}
