import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_refresh);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,

        hintStyle: const TextStyle(
          color: Colors.grey,
        ),

        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xff015254),
        ),

        suffixIcon: widget.controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  widget.controller.clear();
                  widget.onChanged?.call('');
                },
              )
            : null,

        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Color(0xffFACC15),
            width: 2,
          ),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}