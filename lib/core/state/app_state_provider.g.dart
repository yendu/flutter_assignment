// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppState)
const appStateProvider = AppStateProvider._();

final class AppStateProvider
    extends $NotifierProvider<AppState, AppStateModel> {
  const AppStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStateHash();

  @$internal
  @override
  AppState create() => AppState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppStateModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppStateModel>(value),
    );
  }
}

String _$appStateHash() => r'05df9d8ded99c74a5dd5c577e1269e1c1e544748';

abstract class _$AppState extends $Notifier<AppStateModel> {
  AppStateModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppStateModel, AppStateModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppStateModel, AppStateModel>,
              AppStateModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
