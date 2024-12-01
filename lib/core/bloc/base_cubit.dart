import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../exceptions/empty_list_exception.dart';
import '../network/api_response.dart';
import '../resources/data_state.dart';

abstract class BaseCubit extends Cubit<DataState> {
  BaseCubit() : super(UnInitState());

  executeSuccess<T>(Future<T> Function() invoke) async {
    try {
      emit(DataLoading());
      final response = await invoke();
      emit(DataSuccess<T>(response));
      if(response == null || response is List && response.isEmpty || response is Map && response.isEmpty || response is String && response.isEmpty){
        print('invoke response $response');
        throw EmptyListException();
      } else {
        print('response  sscc $response');
        emit(DataSuccess<T>(response));
      }
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }


  executeDoubleSuccess<T>(
      Future<T> Function() invoke1, Future<T> Function() invoke2) async {
    try {
      emit(DataLoading());
      final response1 = await invoke1();
      final response2 = await invoke2();
      emit(DoubleDataSuccess(data1: response1, data2: response2));
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }
  executeSuccessNotLoading<T>(Future<T> Function() invoke) async {
    try {
      // emit(DataLoading());
      final response = await invoke();
      emit(DataSuccess<T>(response));
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }

  executeBuilder<T>(Future<T> Function() invoke,
      {bool isRefresh = true,
      required ValueChanged<T> onSuccess,
      ValueChanged? onError}) async {
    try {
      if (isRefresh) {
        emit(DataLoading());
      }
      final response = await invoke();
      onSuccess(response);
    } catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        emit(DataFailed(e));
      }
      rethrow;
    }
  }

  executeListener<T>(Future<T> Function() invoke,
      {required ValueChanged<T> onSuccess}) async {
    try {
      emit(LoadingStateListener());
      final response = await invoke();
      onSuccess(response);
    } catch (e) {
      print(e);
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  executeSuccessState<T>(Future<dynamic> Function() invoke,
      {ValueChanged<T>? onSuccess}) {
    executeListener(() => invoke(), onSuccess: (v) {
      onSuccess?.call(v);
      emit((SuccessState()));
    });
  }
  executeSuccessNoActionState<T>(Future<T> Function() invoke,
      {ValueChanged<T>? onSuccess}) {
    executeListener(() => invoke(), onSuccess: (v) {
      onSuccess?.call(v);
      emit((NoActionState()));
    });
  }

  executeEmitterListener(Future<dynamic> Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit((SuccessStateListener(v.toString())));
    });
  }

  executeEmitterData(Future<ApiResponse> Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit(DataSuccess(v));
    });
  }
}
