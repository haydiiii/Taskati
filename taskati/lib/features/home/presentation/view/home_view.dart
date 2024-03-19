import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/constants/iamge_assets.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widgets/custom_elev_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user');
    String? path = box.get('Image');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Hello ,${box.get('name')}',
                        style: getTitleStyle(),
                      ),
                      Text(
                        'Have a Nice Day ',
                        style: getBodyStyle(),
                      )
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: path != null
                        ? FileImage(File(path)) as ImageProvider
                        : AssetImage(ImagesAssets.image1),
                  )
                ],
              ),
              custom_elev_button(
                onPressed: () {},
                text: ('+ Add Task'),
                width: 125,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
