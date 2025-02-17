import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final FocusNode focusNode;
  final Function()? onTap;
  final TextEditingController controller;
  const SearchWidget({
    super.key,
    required this.focusNode,
    this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // widget tree
    return Row(
      children: [
        //* text field
        Expanded(
          child: GestureDetector(
            onTap: () => focusNode.unfocus(),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(hintText: "Search city"),
                onSubmitted: (city) {},
              ),
            ),
          ),
        ),

        // space
        SizedBox(width: 10),

        //* search button
        SizedBox(
          width: 50,
          height: 50,
          child: IconButton(onPressed: onTap, icon: Icon(Icons.search_rounded)),
        ),
      ],
    );
  }
}
