import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubits_&_states/state/vendors_state.dart';
import 'package:project1/repo/vendors_repo.dart';

class VendorsCubit extends Cubit<VendorsState> {
  VendorsCubit() : super(const VendorsInit());

  Future<void> getVendors({String? category}) async {
    emit(const VendorsLoading());
    try {
      final vendors = await VendorsRepo().getVendors(category: category);
      emit(VendorsSuccess(vendors: vendors));
    } catch (e) {
      emit(VendorsError(message: e.toString()));
    }
  }
}