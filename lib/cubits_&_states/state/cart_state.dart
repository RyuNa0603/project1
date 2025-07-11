import 'package:project1/models/book_model.dart';
import 'package:project1/models/cart_model.dart';

abstract class CartState {}

final class CartInit extends CartState {}

final class CartLoading extends CartState {}

final class CartError extends CartState {
  final String message;
  CartError( {required this.message});
}

final class CartSuccess extends CartState {
  final List<CartItemModel> data;
  CartSuccess(  {required this.data});
}
