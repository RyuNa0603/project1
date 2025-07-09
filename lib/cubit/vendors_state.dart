import 'package:project1/models/category_model.dart';
import 'package:project1/models/vendors_model.dart';

abstract class VendorsState {
  const VendorsState();
}

class VendorsInit extends VendorsState {
  const VendorsInit();
}

class VendorsLoading extends VendorsState {
  const VendorsLoading();
}

class VendorsError extends VendorsState {
  final String message;
  const VendorsError({required this.message});
}

class VCSuccess extends VendorsState {
  final List<CategoryModel> categories;
  const VCSuccess({required this.categories});
}


class VendorsSuccess extends VendorsState {
  final List<VendorModel> vendors;
  const VendorsSuccess({required this.vendors});
}