
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:restaurant/common/entities/entities.dart';
import 'package:restaurant/pages/home/sales/index.dart';

class SearchDialog extends GetView<SalesController> {
  const SearchDialog({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Container(
        padding: EdgeInsets.all(10.w),
        alignment: Alignment.topCenter,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child:Scrollable(
              viewportBuilder: (BuildContext context, ViewportOffset position) =>TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _controller,
                  textInputAction: TextInputAction.search,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: 'search_location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide(style: BorderStyle.none, width: 0),
                    ),
                    hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).disabledColor,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                  ),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).textTheme.labelSmall?.color,
                      fontSize: 14.sp
                  ),
                ),
                // as we type, it gives us sugestion
                suggestionsCallback: (String pattern) async {
                  return await controller.searchProducts();
                },

                itemBuilder: (context, ProductModel suggestion) {
                  return Padding(
                    padding: EdgeInsets.all(10.h),
                    child: Row(children: [
                      Icon(Icons.location_on),
                      Expanded(
                        child: Text(suggestion.description!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).textTheme.labelSmall?.color, fontSize: 14.sp,
                            )),
                      ),
                    ]),
                  );
                },

                onSuggestionSelected: (ProductModel suggestion) {
                  print("My location is "+suggestion.description!);
                  //Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
                  Get.back();
                },

              ),
            ),
          ),
        )
    );
  }
}
