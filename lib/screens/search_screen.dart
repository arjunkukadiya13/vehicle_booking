// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_booking/theme/color.dart';
import 'package:vehicle_booking/utils/data.dart';
import 'package:vehicle_booking/widgets/feature_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _searchclicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Increase the height as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          title: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.blue, // Adjust the color as needed
                    width: 2.0, // Adjust the width as needed
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search,
                          color: Colors.blue), // Adjust the color as needed
                      onPressed: () {
                        // Handle search functionality here

                        setState(() {
                          FocusScope.of(context).unfocus();
                          _searchclicked = true;
                        });
                        // print('Searching for: ${_searchController.text}');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: _searchclicked == false
          ? Container()
          : Container(
              child: _buildBody(_searchController.text.trim().toLowerCase())),
    );
  }

  _buildBody(String searchkey) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Text(
              "Related your search",
              style: TextStyle(
                color: AppColor.labelColor,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Trucks",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
          ),
          _buildFeatured(searchkey),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  _buildFeatured(String searchkey) {
    List searchadata = _searchedItemsData(features, searchkey);
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        searchadata.length,
        (index) => FeatureItem(
          data: searchadata[index],
        ),
      ),
    );
  }

  _searchedItemsData(List dataOfFeature, String searchkey) {
    List sortedData = [];
    int index = 0;
    int index1 = 0;
    while (index < dataOfFeature.length) {
      if (dataOfFeature[index]["type"]
          .trim()
          .toLowerCase()
          .contains(searchkey)) {
        sortedData.insert(index1, dataOfFeature[index]);
        index1++;
      }
      index++;
    }
    return sortedData;
  }
}
