import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oda_cagnotte/components/text_styles.dart';
import 'package:oda_cagnotte/helpers/app_constant.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color? fillColor;
  final int maxLines;
  final bool isPassword;
  final bool isCountryPicker;
  final bool isShowBorder;
  final bool isIcon;
  final bool isShowSuffixIcon;
  final bool isShowPrefixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  final Function(String text) onChanged;
  final VoidCallback? onSuffixTap;
  final String? suffixIconUrl;
  final String? prefixIconUrl;
  final bool isSearch;
  final Function onSubmit;
  final bool isEnabled;
  final TextCapitalization capitalization;
  final TextInputType? keyboardType;

  CustomTextField({
    this.hintText = 'Write something...',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSuffixTap,
    this.prefixIcon,
    this.fillColor,
    required this.onSubmit,
    required this.onChanged,
    this.capitalization = TextCapitalization.none,
    this.isCountryPicker = false,
    this.isShowBorder = false,
    this.isShowSuffixIcon = false,
    this.isShowPrefixIcon = false,
    this.onTap,
    this.isIcon = false,
    this.isPassword = false,
    this.suffixIconUrl,
    this.prefixIconUrl,
    this.isSearch = false,
    this.keyboardType,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: AppStyles.hintnormalText12(context),
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      cursorColor: Theme.of(context).hintColor,
      textCapitalization: widget.capitalization,
      enabled: widget.isEnabled,
      autofocus: false,
      //onChanged: widget.isSearch ? widget.languageProvider.searchLanguage : null,
      obscureText: widget.isPassword ? _obscureText : false,
      inputFormatters: widget.inputType == TextInputType.phone
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
            ]
          : null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(style: BorderStyle.none, width: 0),
        ),
        isDense: true,
        hintText: widget.hintText,
        fillColor: widget.fillColor != null
            ? widget.fillColor
            : Theme.of(context).cardColor,
        hintStyle: AppStyles.hintnormalText12(context),
        filled: true,
        prefixIcon: widget.isShowPrefixIcon
            ? Padding(
                padding: const EdgeInsets.only(
                    left: AppConstants.padding_size_large,
                    right: AppConstants.padding_size_small),
                child: Icon(
                  widget.prefixIcon,
                  size: 15,
                  color: Theme.of(context).hintColor,
                ))

            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: AppConstants.padding_size_large,
            //       right: AppConstants.padding_size_small),
            //   child: Image.asset(widget.prefixIconUrl.toString()),
            // )
            : SizedBox.shrink(),
        prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
        suffixIcon: widget.isShowSuffixIcon
            ? widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3)),
                    onPressed: _toggle)
                : widget.isIcon
                    ? IconButton(
                        onPressed: widget.onSuffixTap,
                        icon: Image.asset(
                          widget.suffixIconUrl.toString(),
                          width: 15,
                          height: 15,
                        ),
                      )
                    // IconButton(
                    //   onPressed: widget.onSuffixTap,
                    //   icon: Image.asset(
                    //     widget.suffixIconUrl.toString(),
                    //     width: 15,
                    //     height: 15,
                    //   ),
                    // )
                    : null
            : null,
      ),
      onTap: widget.onTap,
      onSubmitted: (text) => widget.nextFocus != null
          ? FocusScope.of(context).requestFocus(widget.nextFocus)
          : widget.onSubmit != null
              ? widget.onSubmit(text)
              : null,
      onChanged: (text) {
        widget.onChanged(text);
      },
    );
  }

  void _myprint() {
    print("");
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
