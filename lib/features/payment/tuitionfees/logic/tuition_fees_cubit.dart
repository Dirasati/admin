import 'package:dirasaty_admin/core/di/locator.dart';
import 'package:dirasaty_admin/core/network/models/api_response.model.dart';
import 'package:dirasaty_admin/core/network/types/pagination_result.dart';
import 'package:dirasaty_admin/core/shared/dto/pagination/pagination.dto.dart';
import 'package:dirasaty_admin/core/types/cubitstate/error.state.dart';
import 'package:dirasaty_admin/features/payment/data/dto/payment_dto.dart';
import 'package:dirasaty_admin/features/payment/data/models/tuition_fee_model.dart';
import 'package:dirasaty_admin/features/payment/data/repository/payment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tuition_fees_state.dart';

class TuitionFeesCubit extends Cubit<TuitionFeesState> {
  final _repository = locator<PaymentRepo>();
  final _paginationDto = PaginationDto();

  TuitionFeesCubit() : super(TuitionFeesState.initial());

  List<TuitionFeeModel> get fees => state._result?.data ?? [];

  Pagination get pagination =>
      state._result?.pagination ?? const Pagination();

  bool get isLoading => state._status == _TuitionFeesStatus.loading;

  PaginationDto get filter => _paginationDto;

  void firstPage() {
    _paginationDto.firstPage();
    state._result?.clear();
    fetchTuitionFees();
  }

  void nextPage() {
    if (pagination.next != null) {
      _paginationDto.nextPage();
      fetchTuitionFees();
    }
  }

  void previousPage() {
    if (pagination.prev != null) {
      _paginationDto.prevPage();
      fetchTuitionFees();
    }
  }

  void fetchTuitionFees() async {
    emit(state._loading());

    final response = await _repository.getTuitionFees(_paginationDto);

    response.when(
      success: (result) {
        emit(state._loaded(result));
      },
      error: (error) => emit(state._error(error.message)),
    );
  }

  void payFee(PaymentDto dto) async {
    if (state.isFeeLoading(dto.tuitionFeeController.value!)) return;

    emit(state._loadingFee(dto.tuitionFeeController.value!));

    final response = await _repository.createPayment(dto);

    response.when(
      success: (fee) => emit(state._replaceFee(fee)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
