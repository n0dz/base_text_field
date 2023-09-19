import 'package:flutter/material.dart';
import 'dimensions.dart';

/// A base text field class to that can be customised and used in flutter projects.
/// in pubspec.yaml of your project add base_text_field: as dependency and the corresponding path
class BaseTextField extends StatelessWidget {
  const BaseTextField(
      {Key? key,
      required this.validate,
      this.save,
      this.asset = "",
      this.hintText,
      this.onTap,
      this.controller,
      this.obscureText = false,
      this.text,
      this.initialValue = " ",
      this.label,
      this.imageColor,
      this.errorColor,
      this.textColor,
      this.fontFamily,
      required this.extras})
      : super(key: key);

  final String? asset;
  final String? hintText;
  final String? Function(String?) validate;
  final String? Function(String?)? save;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? text;
  final String? initialValue;
  final String? label;
  final Color? imageColor;
  final Color? errorColor;
  final Color? textColor;
  final String? fontFamily;
  final Map<String, dynamic> extras;

  /// save extra data using key value pair

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: padding24,
          height: padding24,
          padding: const EdgeInsets.only(left: padding8),
          child: asset!.isEmpty
              ? const Icon(Icons.person)
              : Image.asset(
                  asset!,
                  width: padding24,
                  height: padding24,
                  color: imageColor,
                ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: padding8),
            child: TextFormField(
              autocorrect: false,
              controller: controller,
              initialValue: controller != null ? null : initialValue,
              textCapitalization: TextCapitalization.none,
              enableSuggestions: false,
              obscureText: obscureText ?? false,
              key: ValueKey(hintText),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                  fontSize: padding16,
                  fontFamily: fontFamily,
                  color: Theme.of(context).textTheme.bodyMedium!.color!),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      top: padding4, bottom: padding2, left: 8),
                  border: const OutlineInputBorder(),
                  hintText: hintText,
                  labelText: label,
                  hintStyle: TextStyle(
                    fontSize: padding14,
                    color: textColor,
                    fontFamily: fontFamily,
                  ),
                  errorStyle: TextStyle(
                    color: errorColor,
                    fontFamily: fontFamily,
                  )),
              validator: validate,
              onSaved: save,
              onTap: onTap,
            ),
          ),
        )
      ],
    );
  }
}
