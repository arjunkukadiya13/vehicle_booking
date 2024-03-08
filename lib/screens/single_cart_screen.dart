// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_booking/theme/color.dart';
import 'package:vehicle_booking/utils/data.dart';
import 'package:vehicle_booking/widgets/custom_image.dart';
import 'package:vehicle_booking/widgets/feature_item.dart';

class SingleCartScreen extends StatefulWidget {
  // final Map<String, dynamic> data;

  SingleCartScreen({
    Key? key,
    required this.data,
    this.height = 300,
  }) : super(key: key);
  final data;
  final double height;

  @override
  State<SingleCartScreen> createState() => _SingleCartScreenState();
}

class _SingleCartScreenState extends State<SingleCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildName(),
                    SizedBox(height: 5),
                    _buildInfo(),
                    SizedBox(height: 10),
                    _buildDescription(),
                    _buildBody(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      widget.data["name"] ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 18,
        color: AppColor.textColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data["type"] ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.labelColor,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.data["price"] ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage() {
    return CustomImage(
      widget.data["image"] ?? '',
      width: double.infinity,
      height: 190,
      radius: 15,
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.data["description"] ?? '',
      style: TextStyle(
        color: AppColor.textColor,
        fontSize: 14,
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Recommended",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          _buildFeatured(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  _buildFeatured() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        features.length,
        (index) => FeatureItem(
          data: features[index],
        ),
      ),
    );
  }
}
