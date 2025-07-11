// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project1/Lists/cart_list.dart';
// import 'package:project1/cubits_&_states/state/cart_state.dart';
// import 'package:project1/settings/settings.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Cart"),
//         centerTitle: true,
//         actions: [
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const Settings(),
//                 ),
//               );
//             },
//             child: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Icon(Icons.notifications_none),
//             ),
//           ),
//         ],
//       ),
//       body: CartList.isEmpty
//     ? Center(child: Text("There is no products"))
//     : SingleChildScrollView(
//       child:BlocBuilder<CartCubit, CartState>(
//           builder: (context, state) {
//             if (state is CartLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is CartSuccess) {
//               if (state.data.isEmpty) {
//                 return const Center(child: Text("Savatcha bo‘sh"));
//               }
//               return ListView.builder(
//                 itemCount: state.data.length,
//                 itemBuilder: (context, index) {
//                   final book = state.data[index];
//                   return ListTile(
//                     title: Text(book.title),
//                     subtitle: Text('\$${book.price}'),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () {
//                         context.read<CartCubit>().remove(book.id);
//                       },
//                     ),
//                   );
//                 },
//               );
//             } else if (state is CartError) {
//               return Center(child: Text("Xatolik: ${state.message}"));
//             }
//             return const SizedBox();
//           },
//         ),
//       ),
//     );
//     ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project1/cubits_&_states/cubits/cart_cubit.dart';
// import 'package:project1/cubits_&_states/state/cart_state.dart';
// import 'package:project1/settings/settings.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Cart"),
//         centerTitle: true,
//         actions: [
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const Settings(),
//                 ),
//               );
//             },
//             child: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Icon(Icons.notifications_none),
//             ),
//           ),
//         ],
//       ),
//       body: BlocBuilder<CartCubit, CartState>(
//         builder: (context, state) {
//           if (state is CartLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is CartSuccess) {
//             if (state.data.isEmpty) {
//               return const Center(child: Text("Savatcha bo‘sh"));
//             }
//             return ListView.builder(
//               itemCount: state.data.length,
//               itemBuilder: (context, index) {
//                 final book = state.data[index];
//                 return ListTile(
//                   title: Text(book.title),
//                   subtitle: Text('\$${book.price}'),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed: () {
//                       context.read<CartCubit>().remove(book.id);
//                     },
//                   ),
//                 );
//               },
//             );
//           } else if (state is CartError) {
//             return Center(child: Text("Xatolik: ${state.message}"));
//           }
//           return const SizedBox(); // CartInitial holati
//         },
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubits_&_states/cubits/cart_cubit.dart';
import 'package:project1/cubits_&_states/state/cart_state.dart';
import 'package:project1/settings/settings.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Settings(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.notifications_none),
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartSuccess) {
            if (state.data.isEmpty) {
              return const Center(child: Text("Savatcha bo‘sh"));
            }

            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final item = state.data[index]; // 👈 CartItemModel
                return ListTile(
                  leading: Image.network(
                    item.book.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.book.title),
                  subtitle: Text('\$${item.book.price} • Soni: ${item.quantity}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<CartCubit>().remove(item.book.id);
                    },
                  ),
                );
              },
            );
          } else if (state is CartError) {
            return Center(child: Text("Xatolik: ${state.message}"));
          }
          return const SizedBox(); // CartInitial holati
        },
      ),
    );
  }
}
