// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project1/models/book_model.dart';
// import 'package:project1/models/cart_model.dart';
// import 'package:project1/repo/cart_repo.dart';
// import 'package:project1/cubits_&_states/state/cart_state.dart';

// class CartCubit extends Cubit<CartState> {
//   final CartRepo cartRepo;

//   CartCubit({required this.cartRepo}) : super(CartInit());

//   Future<void> loadCart() async {
//     emit(CartLoading());
//     try {
//       final items = await cartRepo.getCartItems();
//       emit(CartSuccess(data:items as List<CartItemModel> ));
//     } catch (e) {
//       emit(CartError(message: e.toString()));
//     }
//   }

//   Future<void> add(int bookId , int quantity) async {
//     try {
//       await cartRepo.addToCart( quantity: quantity, bookId: bookId);
//       await loadCart(); // cartni qaytadan yuklash
//     } catch (e) {
//       emit(CartError(message: e.toString()));
//     }
//   }

//   Future<void> remove(int bookId) async {
//     try {
//       await cartRepo.removeFromCart(bookId);
//       await loadCart(); // cartni qaytadan yuklash
//     } catch (e) {
//       emit(CartError(message: e.toString()));
//     }
//   }
// }

// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:project1/models/book_model.dart';
// // import 'package:project1/repo/cart_repo.dart';
// // import 'package:project1/cubits_&_states/state/cart_state.dart';

// // class CartCubit extends Cubit<CartState> {
// //   CartCubit() : super(CartInit());

// //   Future<void> loadCart() async {
// //     emit(CartLoading());
// //     try {
// //       final items = await CartRepo().getCartItems();
// //       emit(CartSuccess(data: items));
// //     } catch (e) {
// //       emit(CartError(message: e.toString()));
// //     }
// //   }

// //   Future<void> add(int bookId) async {
// //     emit(CartLoading());
// //     try {
// //       await CartRepo().addToCart(bookId);
// //       final updated = await CartRepo().getCartItems();
// //       emit(CartSuccess(data: updated));
// //     } catch (e) {
// //       emit(CartError(message: e.toString()));
// //     }
// //   }

// //   Future<void> remove(int bookId) async {
// //     emit(CartLoading());
// //     try {
// //       await CartRepo().removeFromCart(bookId);
// //       final updated = await CartRepo().getCartItems();
// //       emit(CartSuccess(data: updated));
// //     } catch (e) {
// //       emit(CartError(message: e.toString()));
// //     }
// //   }
// // }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/models/cart_model.dart';
import 'package:project1/cubits_&_states/state/cart_state.dart';
import 'package:project1/repo/cart_repo.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInit());

  Future<void> loadCart() async {
    emit(CartLoading());
    try {
      final items = await CartRepo().getCartItems();
      emit(CartSuccess(data: items as List<CartItemModel>));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> add(int bookId, int quantity) async {
    try {
      await CartRepo().addToCart(bookId: bookId, quantity: quantity);
      await loadCart();
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> remove(int bookId) async {
    try {
      await CartRepo().removeFromCart(bookId);
      await loadCart();
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> getCart() async {
    emit(CartLoading());
    try {
      final result = await CartRepo().getCart();
      emit(CartSuccess(result));
    } catch (e) {
      emit(CartError( message: e.toString(),));
    }
  }
}
