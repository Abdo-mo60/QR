import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Widget? suffix;
  final String labelText;
  final bool? isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.labelText,
    this.isPassword = false,
    this.suffix,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
   
    isVisible = widget.isPassword ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword == true ? isVisible : false,
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorStyle: const TextStyle( 
            color: Colors.red,
            fontSize: 13,
          ),
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : widget.suffix,
        ),
        validator: widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return ' Please enter ${widget.labelText}';
              }
              return null; 
            },
      ),
    );
  }
}
