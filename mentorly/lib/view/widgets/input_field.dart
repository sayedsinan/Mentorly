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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        
        keyboardType: widget.isPassword ? TextInputType.visiblePassword : TextInputType.text,
        obscureText: widget.isPassword ? _obscureText : false,
        controller: widget.controller,
        decoration: InputDecoration(
          
          prefixIcon: (widget.isIconNeeded && widget.icon != null)
              ? Icon(widget.icon, color: Colors.grey)
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
              
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        ),
      ),
    );
  }
}

