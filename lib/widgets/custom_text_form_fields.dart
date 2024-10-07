import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.title,
    this.isPassword = false,
    this.minLines = 1,
    required this.controller,
    this.onChanged,
    this.isReadOnly = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.suffix,
    this.margin = 12,
    this.borderColor,
    this.prefix,
  });

  final String hintText;
  final String? title;
  final bool isPassword, isReadOnly;
  final int minLines;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Widget? suffix, prefix;
  final double margin;
  final Color? borderColor;

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(
              widget.title!,
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
          if (widget.title != null) const SizedBox(height: 4),
          widget.isPassword
              ? TextFormField(
                  controller: widget.controller,
                  obscureText: obscure,
                  onChanged: widget.onChanged,
                  validator: widget.validator,
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    filled: true,
                    focusColor: kWhiteColor,
                    fillColor: kWhiteColor,
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                      borderSide: BorderSide(
                          color: widget.borderColor ??
                              Colors.transparent), // No border
                    ),
                    hintText: widget.hintText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (obscure == false) {
                          obscure = true;
                        } else {
                          obscure = false;
                        }
                        setState(() {});
                      },
                      child: obscure
                          ? Icon(Icons.visibility_off_outlined,
                              color: kBlackColor)
                          : Icon(Icons.visibility_outlined, color: kBlackColor),
                    ),
                    hintStyle: midGreyTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                )
              : TextFormField(
                  controller: widget.controller,
                  obscureText: widget.isPassword,
                  readOnly: widget.isReadOnly,
                  onChanged: widget.onChanged,
                  validator: widget.validator,
                  style:
                      blackTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                  decoration: InputDecoration(
                    prefixIcon: widget.prefix,
                    suffixIcon: widget.suffix,
                    hintText: widget.hintText,
                    hintStyle: midGreyTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.normal),
                    isDense: false,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    filled: true,
                    focusColor: kWhiteColor,
                    fillColor: kWhiteColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.transparent,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.transparent,
                      ),
                    ),
                  ),
                  maxLines: widget.minLines,
                  keyboardType: widget.textInputType,
                ),
        ],
      ),
    );
  }
}
