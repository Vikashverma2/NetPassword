import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            IconsAssets.search,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                  filled: false,
                  hintText: "Search your credentials",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
