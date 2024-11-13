import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '/utils/extensions/build_context_ext.dart';

enum _VinchestaTextFieldViewType {
  commonBorder,
  noBorder,
  underlineBorder;
}

class VinchestaTextField extends StatefulWidget {
  final _VinchestaTextFieldViewType _viewStatus;
  final String name;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final bool readOnly;
  final ValueChanged<String?>? onChanged;
  final ValueTransformer<String?>? valueTransformer;
  final bool enabled;
  final FormFieldSetter<String>? onSaved;
  final AutovalidateMode autovalidateMode;
  final VoidCallback? onReset;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool? showCursor;
  final bool isFieldDropdown;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String?>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final double cursorWidth;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final DragStartBehavior dragStartBehavior;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;
  final TextStyle? style;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? helperStyle;
  final InputBorder? border;

  const VinchestaTextField({
    super.key,
    required this.name,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.maxLengthEnforcement,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.autocorrect = true,
    this.isFieldDropdown = false,
    this.cursorWidth = 2.0,
    this.labelText,
    this.hintText,
    this.prefix,
    this.suffix,
    this.padding = const EdgeInsets.all(16),
    this.focusNode,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.valueTransformer,
    this.onSaved,
    this.onReset,
    this.keyboardType,
    this.textInputAction,
    this.strutStyle,
    this.textDirection,
    this.maxLength,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.buildCounter,
    this.expands = false,
    this.minLines,
    this.showCursor,
    this.onTap,
    this.enableSuggestions = false,
    this.textAlignVertical,
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrollController,
    this.scrollPhysics,
    this.smartDashesType,
    this.smartQuotesType,
    this.autofillHints,
    this.obscuringCharacter = '•',
    this.mouseCursor,
    this.helperText,
    this.controller,
    this.style,
    this.fillColor,
    this.hintStyle,
    this.labelStyle,
    this.helperStyle,
    this.border,
  }) : _viewStatus = _VinchestaTextFieldViewType.commonBorder;

  const VinchestaTextField.underline({
    super.key,
    required this.name,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.maxLengthEnforcement,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.autocorrect = true,
    this.isFieldDropdown = false,
    this.cursorWidth = 2.0,
    this.labelText,
    this.hintText,
    this.prefix,
    this.suffix,
    this.padding = const EdgeInsets.all(16),
    this.focusNode,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.valueTransformer,
    this.onSaved,
    this.onReset,
    this.keyboardType,
    this.textInputAction,
    this.strutStyle,
    this.textDirection,
    this.maxLength,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.buildCounter,
    this.expands = false,
    this.minLines,
    this.showCursor,
    this.onTap,
    this.enableSuggestions = false,
    this.textAlignVertical,
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrollController,
    this.scrollPhysics,
    this.smartDashesType,
    this.smartQuotesType,
    this.autofillHints,
    this.obscuringCharacter = '•',
    this.mouseCursor,
    this.helperText,
    this.controller,
    this.style,
    this.fillColor,
    this.hintStyle,
    this.labelStyle,
    this.helperStyle,
    this.border,
  }) : _viewStatus = _VinchestaTextFieldViewType.underlineBorder;

  const VinchestaTextField.noBorder({
    super.key,
    required this.name,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.maxLengthEnforcement,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.autocorrect = true,
    this.cursorWidth = 2.0,
    this.isFieldDropdown = false,
    this.labelText,
    this.hintText,
    this.prefix,
    this.suffix,
    this.padding = const EdgeInsets.all(16),
    this.focusNode,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.valueTransformer,
    this.onSaved,
    this.onReset,
    this.keyboardType,
    this.textInputAction,
    this.strutStyle,
    this.textDirection,
    this.maxLength,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.buildCounter,
    this.expands = false,
    this.minLines,
    this.showCursor,
    this.onTap,
    this.enableSuggestions = false,
    this.textAlignVertical,
    this.dragStartBehavior = DragStartBehavior.start,
    this.scrollController,
    this.scrollPhysics,
    this.smartDashesType,
    this.smartQuotesType,
    this.autofillHints,
    this.obscuringCharacter = '•',
    this.mouseCursor,
    this.helperText,
    this.controller,
    this.style,
    this.fillColor,
    this.hintStyle,
    this.labelStyle,
    this.helperStyle,
    this.border,
  }) : _viewStatus = _VinchestaTextFieldViewType.noBorder;

  @override
  State<VinchestaTextField> createState() => _VinchestaTextFieldState();
}

class _VinchestaTextFieldState extends State<VinchestaTextField> {
  @override
  Widget build(BuildContext context) {
    switch (widget._viewStatus) {
      case _VinchestaTextFieldViewType.commonBorder:
        return _buildCommonField(context);
      case _VinchestaTextFieldViewType.underlineBorder:
        return _buildUnderlineField(context);
      case _VinchestaTextFieldViewType.noBorder:
        return _buildNoBorderField(context);
    }
  }

  Widget _buildCommonField(BuildContext context) {
    return _buildTextField(
      context: context,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: context.color.textFieldDisabledBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 2,
          color: context.color.textFieldEnabledBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 2,
          color: context.color.textFieldFocusedBorder,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 1,
          color: context.color.textFieldErrorBorder,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 2,
          color: context.color.textFieldFocusedErrorBorder,
        ),
      ),
    );
  }

  Widget _buildUnderlineField(BuildContext context) {
    return _buildTextField(
      context: context,
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: context.color.textFieldDisabledBorder,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: context.color.textFieldEnabledBorder,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: context.color.textFieldFocusedBorder,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: context.color.textFieldErrorBorder,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 2,
          color: context.color.textFieldFocusedErrorBorder,
        ),
      ),
    );
  }

  Widget _buildNoBorderField(BuildContext context) {
    return _buildTextField(
      context: context,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          width: 0.0,
          color: Colors.transparent,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          width: 0.0,
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          width: 0.0,
          color: Colors.transparent,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 1.0,
          color: context.color.textNoBorderFieldErrorBorder,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          width: 2,
          color: context.color.textNoBorderFieldFocusedErrorBorder,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
  }) {
    return _buildField(
      context: context,
      disabledBorder: disabledBorder,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusedErrorBorder,
    );
  }

  Widget _buildField({
    required BuildContext context,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
  }) {
    return FormBuilderTextField(
      name: widget.name,
      controller: widget.controller,
      style: widget.style,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      textCapitalization: widget.textCapitalization,
      autofocus: widget.autofocus,
      showCursor: widget.showCursor,
      obscureText: widget.obscureText,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      maxLength: widget.maxLength,
      onTap: widget.onTap,
      onEditingComplete: widget.onEditingComplete,
      inputFormatters: widget.inputFormatters,
      cursorWidth: widget.cursorWidth,
      cursorRadius: widget.cursorRadius,
      cursorColor: widget.cursorColor,
      scrollPadding: widget.scrollPadding,
      keyboardAppearance: widget.keyboardAppearance,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      buildCounter: widget.buildCounter,
      dragStartBehavior: widget.dragStartBehavior,
      scrollController: widget.scrollController,
      scrollPhysics: widget.scrollPhysics,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      mouseCursor: widget.mouseCursor,
      obscuringCharacter: widget.obscuringCharacter,
      autofillHints: widget.autofillHints,
      decoration: InputDecoration(
        labelText: widget.labelText,
        filled: true,
        floatingLabelStyle: context.text.floatingLabelTextStyle,
        fillColor: widget.fillColor ?? Colors.transparent,
        contentPadding: widget.padding,
        suffixIcon: widget.suffix,
        prefixIcon: widget.prefix,
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorMaxLines: widget.obscureText ? 1 : 3,
        helperMaxLines: 10,
        hintStyle: widget.hintStyle ?? context.text.floatingInactiveLabelText,
        labelStyle: widget.labelStyle ?? context.text.primaryFieldText,
        helperStyle: widget.helperStyle ?? context.text.labelUnselected,
        border: widget.border,
        disabledBorder: disabledBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
    );
  }
}
