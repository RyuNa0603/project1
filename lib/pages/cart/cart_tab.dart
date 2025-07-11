import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project1/core/colors_app.dart';
import 'package:project1/cubits_&_states/cubits/cart_cubit.dart';
import 'package:project1/cubits_&_states/state/cart_state.dart';
import 'package:project1/models/book_model.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is CartError) {
          return Center(child: Text(state.message));
        } else if (state is CartSuccess) {
          return GridView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: state.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 220,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              final BookModel book = state.data[index].book;
              return InkWell(
                onTap: () {},
                child: Column(
                  spacing: 5.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Text(
                      book.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.greyscale900,
                      ),
                    ),
                    Text(
                      state.data[index].quantity.toString(),
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.primary500,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}