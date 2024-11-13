import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:test_task/utils/extensions/build_context_ext.dart';
import 'package:test_task/views/fileds/vinchesta_text_filed.dart';

import '../../config/di/locator.dart';
import '../../config/router/vinchesta_router.dart';
import '../../cubit/main_page_cubit/main_page_cubit.dart';

enum _MainPageFields {
  searchUrl;
}

@RoutePage()
class MainPage extends StatefulWidget implements AutoRouteWrapper {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator.get<MainPageCubit>(),
      child: this,
    );
  }
}

class _MainPageState extends State<MainPage> {
  final _fbKey = GlobalKey<FormBuilderState>();
  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};
  MainPageCubit get _cubit => context.read<MainPageCubit>();

  void _onStateChanged(
    BuildContext context,
    MainPageState state,
  ) async {
    switch (state.status) {
      case MainPageStatus.resultsSended:
        context.toasts.showSuccess(
          message: context.strings.dataSentSuccessfully,
        );
        break;
      case MainPageStatus.error:
        context.toasts.showError(
          message: state.errorMessage,
        );
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainPageCubit, MainPageState>(
      listener: _onStateChanged,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: context.color.blueRegular,
            leading: state.status == MainPageStatus.resultsSended
                ? IconButton(
                    onPressed: () {
                      _cubit.resetPage();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: context.color.textNoBorderFieldDisabledBorder,
                    ),
                  )
                : const SizedBox.shrink(),
            title: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                context.strings.homeScreen,
                style: context.text.appBarTitle,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: FormBuilder(
              key: _fbKey,
              child: _buildBody(state),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(MainPageState state) {
    switch (state.status) {
      case MainPageStatus.error:
      case MainPageStatus.idle:
        return _buildInitialScreen();
      case MainPageStatus.loading:
        return Center(
          child: CircularProgressIndicator(
            color: context.color.blueRegular,
          ),
        );
      case MainPageStatus.loadingData:
        return Center(child: _buildProgressIndicator(state));

      case MainPageStatus.success:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.strings.successCalculations,
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 4),
            _buildProgressIndicator(state),
          ],
        );
      case MainPageStatus.resultsSended:
        return _buildListRoutes(state);

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildProgressIndicator(MainPageState state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${state.loadingPercent} %'),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                color: context.color.blueRegular,
                value: state.loadingPercent.toDouble() / 100,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: _buildSendOnServerButton(state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSendOnServerButton(MainPageState state) {
    return ElevatedButton(
      onPressed: state.status == MainPageStatus.loadingData
          ? null
          : () {
              if (_fbState?.saveAndValidate() ?? false) {
                _cubit.postMap(
                  _fbValues[_MainPageFields.searchUrl.name],
                );
              }
            },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          state.status == MainPageStatus.loadingData
              ? context.color.disable
              : context.color.button,
        ),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(
            color: state.status == MainPageStatus.loadingData
                ? context.color.disableBorder
                : context.color.blueRegular,
            width: 2.0,
          ),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          context.strings.sendResultsOnServer,
          style: context.text.primaryFieldText,
        ),
      ),
    );
  }

  Widget _buildListRoutes(MainPageState state) {
    return ListView.builder(
      itemCount: state.mapWithRoute.length,
      itemBuilder: (context, index) {
        final coordinateList = state.mapWithRoute.values.toList()[index];
        final map = state.mapWithRoute.keys.toList()[index].field;
        return GestureDetector(
            onTap: () {
              router.pushMapPage(
                map: map,
                coordinates: coordinateList,
              );
            },
            child: Column(
              children: [
                Wrap(
                    children: coordinateList.mapIndexed(
                  (index, coordinate) {
                    return Text(
                      (index != coordinateList.length - 1)
                          ? '( x-${coordinate.x}, y-${coordinate.y} ) -> '
                          : '( x-${coordinate.x}, y-${coordinate.y} )',
                    );
                  },
                ).toList()),
                const Divider(),
              ],
            ));
      },
    );
  }

  Widget _buildInitialScreen() {
    return Column(
      children: [
        Text(context.strings.description),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.sync_alt,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: VinchestaTextField.underline(
                name: _MainPageFields.searchUrl.name,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: _buildCalculatePathButton(),
        ),
      ],
    );
  }

  Widget _buildCalculatePathButton() {
    return ElevatedButton(
      onPressed: () {
        if (_fbState?.saveAndValidate() ?? false) {
          _cubit.getMap(
            _fbValues[_MainPageFields.searchUrl.name],
          );
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          context.color.button,
        ),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(
            color: context.color.blueRegular,
            width: 2.0,
          ),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          context.strings.startCountingProcess,
          style: context.text.primaryFieldText,
        ),
      ),
    );
  }
}
