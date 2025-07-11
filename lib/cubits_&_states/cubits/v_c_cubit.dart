import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubits_&_states/state/vendors_state.dart';
import 'package:project1/repo/vendors_repo.dart';

class VCCubit extends Cubit<VendorsState> {
  VCCubit() : super(const VendorsInit());

  Future<void> getVendorCategories() async {
    emit(const VendorsLoading());

    try {
      final categories = await VendorsRepo().getVendorCategories();
      emit(VCSuccess(categories: categories));
    } catch (e) {
      emit(VendorsError(message: e.toString()));
    }
  }
}