import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_page_event.dart';
part 'product_page_state.dart';

class ProductPageBloc extends Bloc<ProductPageEvent, ProductPageState> {
  ProductPageBloc() : super(ProductPageInitial()) {
    on<ProductPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
