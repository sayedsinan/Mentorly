import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final double height;
  final double width;
  final IconData? icon;
  final bool isIconNeeded;
  final bool isPassword;
  final double borderRadius;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.height,
    required this.width,
    required this.borderRadius,
    this.icon,
    this.isIconNeeded = true,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.all(widget.borderRadius),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.isPassword ? TextInputType.visiblePassword : TextInputType.text,
        obscureText: widget.isPassword ? _obscureText : false,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: (widget.isIconNeeded && widget.icon != null)
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, right: 12),
                  child: Icon(
                    widget.icon,
                    color: Colors.grey,
                    size: 20,
                  ),
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          suffixIcon: widget.isPassword
              ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
            top: (widget.height - 24) / 2,
            bottom: (widget.height - 24) / 2,
            left: (widget.isIconNeeded && widget.icon != null) ? 0 : 16,
            right: widget.isPassword ? 0 : 16,
          ),
          isDense: true,
        ),
      ),
    );
  }
}