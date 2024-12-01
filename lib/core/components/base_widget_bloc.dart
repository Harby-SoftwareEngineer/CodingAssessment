import 'package:app/core/exceptions/empty_list_exception.dart';

import '../../src/main_index.dart';

abstract class BaseBlocWidget<T, B extends BlocBase<DataState>>
    extends BaseStatelessWidget {
  BuildContext? context =
      injector<ServicesLocator>().navigatorKey.currentContext;
  late B bloc = getBloc();

  B getBloc() {
    return injector.get<B>();
  }

  BaseBlocWidget({Key? key}) : super(key: key);

  @override
  ThemeData get theme => Theme.of(context!);

  @protected
  Widget buildWidget(BuildContext context, T state);

  void buildListener(BuildContext context, dynamic state) {
    if (state is LoadingStateListener) {
      showProgress();
    } else {
      dismissProgress();
    }

    if (state is FailureStateListener) {
      dismissProgress();
      onRequestFail();
      showErrorDialog(state.error, context);
    }
    if (state is SuccessStateListener<String>) {
      dismissProgress();
      onRequestSuccess(state.data);
    }

    if (state is SuccessStateListener) {
      dismissProgress();
      onRequestSuccess(state.data);
    }

    if (state is SuccessState) {
      dismissProgress();
      onSuccessDismissed();
    }
    if (state is NoActionState) {
      dismissProgress();
    }
  }

  showProgress() {
    progress.show();
  }

  dismissProgress() {
    progress.dismiss();
  }

  @protected
  void loadInitialData(BuildContext context) {}

  @protected
  String? title(BuildContext context) {
    return null;
  }

  @protected
  bool? isNotBack(BuildContext context) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    //onBuild(bloc);
    return mainFrame(body: buildConsumer(context));
  }

  Widget mainFrame({required Widget body, Widget? floatingActionButton}) {
    return AppScaffold(
      title: title(context!),
      isDrawer: isNotBack(context!),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }

  Widget handleUiState(DataState state, BuildContext context) {
    print('handleUiState $T == $state => ${state is T}');
    if (state is DataLoading) {
      return LoadingView();
    }
    if (state is T) {
      return buildWidget(context, state as T);
    }
    if (state is DataFailed) {
      return handleApiErrorPlaceHolder(state.error,
          onClickReload: onClickReload);
    }
    return onBuildUnInitWidget(context);
  }

  Widget onBuildUnInitWidget(BuildContext context) {
    return const Center();
  }

  Widget handleApiErrorPlaceHolder(error, {Function()? onClickReload}) {
    return error is EmptyListException
        ? handleEmptyDataPlaceHolder() ??
            ErrorPlaceHolderWidget(
              exception: error,
              onClickReload: onClickReload,
            )
        : ErrorPlaceHolderWidget(
            exception: error,
            onClickReload: onClickReload,
          );
  }

  @protected
  Widget? handleEmptyDataPlaceHolder() {
    return null;
  }

  void handleApiError(error,
      {required Function(String message, String code) onHandleMessage}) {
    final errorApi = injector<ServicesLocator>()
        .navigatorKey
        .currentContext!
        .handleApiError(exception: error);
    onHandleMessage(errorApi.code.toString(), "0");
  }

  void showErrorDialog(error, BuildContext context) {
    DialogsManager.showErrorDialog(
        context, context.handleApiErrorMessage(exception: error));
  }

  onClickReload() {
    loadInitialData(context!);
  }

  void onRequestFail() {}

  void onSuccessDismissed() {}

  void onRequestSuccess(String? message) {
    DialogsManager.showSuccessDialog(context!,
        message: message ?? 'Successfully', onClickOk: () {
      Navigator.pop(context!);
      onSuccessDismissed();
    });
  }

  BlocConsumer buildConsumer(BuildContext context) {
    bloc = injector.get<B>();
    this.context = context;
    loadInitialData(context);

    return BlocConsumer<B, DataState>(
        bloc: bloc,
        listenWhen: (state, current) => current is DataStateFListener,
        buildWhen: (state, current) => current is DataStateFBuilder,
        builder: (context, state) => handleUiState(state, context),
        listener: (context, state) => buildListener(context, state));
  }
}
