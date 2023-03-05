import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpie_assessment/utils/color.dart';

class UserInput extends StatefulWidget {
  final String text;
  final bool isPassword;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autoCorrect;
  final TextInputType? textInputType;
  const UserInput({
    Key? key,
    required this.text,
    this.isPassword = false,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autoCorrect = false,
    this.textInputType,
  }) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {

  final FocusNode _textFormFieldFocus = FocusNode();
  Color focusColor = AppColors.kLightGrey;

  @override
  void initState() {
    _textFormFieldFocus.addListener(() {
      if (_textFormFieldFocus.hasFocus) {
        setState(() {
          focusColor = AppColors.kLightBlue.withOpacity(0.15);
        });
      } else {
        setState(() {
          focusColor = AppColors.kLightGrey;
        });
      }
    });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _textFormFieldFocus,
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText,
      autocorrect: widget.autoCorrect,
      enableSuggestions: widget.enableSuggestions,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 16.0),
        filled: true,
        fillColor: focusColor,
        focusColor: AppColors.kLightBlue,
        hoverColor: AppColors.kLightBlue,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kLightBlue),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: widget.text,
        hintStyle: GoogleFonts.aBeeZee(
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
