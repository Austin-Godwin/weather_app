import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  final TextEditingController searchController;
  final Function() searchFunction;
  final Function() cancelFunction;
  const SearchDialog({
    Key? key,
    required this.searchController,
    required this.searchFunction,
    required this.cancelFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF343434),
                  title: const Text(
                    "please enter a valid location",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  content: Container(
                    width: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.2),
                      // boxShadow: const [
                      //   BoxShadow(offset: Offset(2, 2))
                      // ],
                    ),
                    child: TextFormField(
                      controller: searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      maxLines: 2,
                      // maxLength: 34,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: searchFunction(),
                      child: const Text(
                        "SEARCH",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    TextButton(
                      onPressed: cancelFunction(),
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    ),
                  ],
                ));
      },
      icon: const Icon(
        Icons.search,
        color: Colors.white,
      ),
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      iconSize: 30.0,
    );
  }
}
