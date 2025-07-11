
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/core/colors_app.dart';
import 'package:project1/cubits_&_states/cubits/v_c_cubit.dart';
import 'package:project1/cubits_&_states/cubits/vendors_cubit.dart';
import 'package:project1/cubits_&_states/state/vendors_state.dart';
import 'package:project1/functions/appBarr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VendorsPage extends StatefulWidget {
  const VendorsPage({super.key});

  @override
  State<VendorsPage> createState() => _VendorsPageState();
}

class _VendorsPageState extends State<VendorsPage> {
  final controller = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<VCCubit>().getVendorCategories();
    context.read<VendorsCubit>().getVendors();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Appbarr(title: 'Vendors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our vendors',
              style: TextStyle(
                color: ColorsApp.greyscale500,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              'Vendors',
              style: TextStyle(
                color: ColorsApp.primary500,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            BlocBuilder<VCCubit, VendorsState>(
              builder: (context, state) {
                if (state is VendorsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is VendorsError) {
                  return Center(child: Text(state.message));
                } else if (state is VCSuccess) {
                  return SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(width: 20.0),
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return StatefulBuilder(
                          builder: (context, builderSetState) {
                            return InkWell(
                              onTap: () {
                                builderSetState(() {
                                  selectedIndex = index;
                                });
                                context.read<VendorsCubit>().getVendors(
                                      category: category.id.toString(),
                                    );
                              },
                              child: Text(
                                category.name,
                                style: TextStyle(
                                  color: ColorsApp.greyscale900,
                                  fontWeight: selectedIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<VendorsCubit, VendorsState>(
                builder: (context, state) {
                  if (state is VendorsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is VendorsError) {
                    return Center(child: Text(state.message));
                  } else if (state is VendorsSuccess) {
                    if (state.vendors.isEmpty) {
                      return const Center(
                        child: Text('?'),
                      );
                    } else {
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: state.vendors.length,
                        itemBuilder: (context, index) {
                          final vendor = state.vendors[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  color: ColorsApp.primary100,
                                ),
                              ),
                              Text(vendor.name),
                              Row(
                                children: List.generate(
                                  5,
                                  (i) => Icon(
                                    Icons.star,
                                    size: 20.0,
                                    color: i < vendor.rating
                                        ? ColorsApp.yellow
                                        : ColorsApp.greyscale900,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
