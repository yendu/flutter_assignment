import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state_model.freezed.dart';

@freezed
abstract class AppStateModel with _$AppStateModel {
  const factory AppStateModel({
    required int index,
    required bool isLoading,
    required String searchedText,
    String? errorMessage,

  }) = _AppStateModel;
}
