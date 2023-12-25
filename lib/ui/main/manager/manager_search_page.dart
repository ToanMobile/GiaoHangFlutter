import 'package:app_giao_hang/data/api/models/province/province_item.dart';
import 'package:app_giao_hang/res/style.dart';
import 'package:flutter/material.dart';
import 'package:get/getes/style.dart';

import '../../../res/theme/theme_service.dart';
import '../../base/base_super_page.dart';
import '../../widgets/button/custom_button.dart';
import '../../widgets/button/touchable_opacity.dart';
import '../../widgets/search_bar_widget.dart';
import 'manager_controller_search.dart';

//ignore: must_be_immutable
class ManagerSearchPage extends BaseSuperPage<ManagerSearchController> {
  @override
  Widget buildContentView(BuildContext context, ManagerSearchController controller) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.hs),
            _buildSearchBar(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.ws, vertical: 16.hs),
              child: CustomButton(
                text: textLocalization('service.location.now'),
                onPressed: () => controller.getAddressLocationNow(),
                isEnable: true,
                width: double.infinity,
                textStyle: text14.bold.textColorWhite,
                height: 48.ws,
                radius: 5.rs,
              ),
            ),
            if (controller.stepLocation.value > 0) ...[
              _buildTimeline(controller.stepLocation.value),
            ],
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.ws, vertical: 15.hs),
              child: Text(getTitleAddress(controller.stepLocation.value), style: text14.textColorB2B2B2),
            ),
            Flexible(child: _buildSearchResult(context))
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.ws),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new, color: color141414),
        ),
        SizedBox(width: 8.ws),
        Visibility(
          visible: false,
          child: Expanded(
            child: SearchBarWidget(
              searchIcon: Icon(Icons.search, color: color141414),
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (text) {},
              autoFocus: false,
              controller: controller.tecSearch,
              hint: textLocalization('search'),
              onTextChanged: (text) async {},
            ),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Widget _buildSearchResult(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => TouchableOpacity(
        child: Container(
          color: colorWhite,
          padding: EdgeInsets.symmetric(horizontal: 24.ws, vertical: 9.ws),
          child: Text(
            getItem(controller.stepLocation.value, index).name ?? "",
            style: text14.textColor141414,
          ),
        ),
        onPressed: () => controller.pickLocationAddress(
          getItem(controller.stepLocation.value, index),
        ),
      ),
      separatorBuilder: (context, index) => Divider(
        indent: 24,
        endIndent: 24,
        height: 1,
        thickness: 0.5,
        color: getColor().textColor141414,
      ),
      itemCount: getSizeItem(controller.stepLocation.value),
    );
  }

  ProvinceItem getItem(int stepLocation, int index) {
    switch (stepLocation) {
      case 1:
        return controller.listDistrict[index];
      case 2:
        return controller.listWard[index];
      default:
        return controller.listProvince[index];
    }
  }

  int getSizeItem(int stepLocation) {
    switch (stepLocation) {
      case 1:
        return controller.listDistrict.length;
      case 2:
        return controller.listWard.length;
      default:
        return controller.listProvince.length;
    }
  }

  Widget _buildTimeline(int stepIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.ws),
      child: Column(
        children: [
          if (stepIndex == 1) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getTitleSearchAddress(stepIndex), style: text14.textColorB2B2B2),
                TouchableOpacity(onPressed: () => controller.resetLocation(), child: Text(textLocalization('service.manager.reset'), style: text14.textColorPrimary)),
              ],
            ),
            SizedBox(height: 10),
          ],
          Row(
            children: [
              if (stepIndex == 1) ...[
                Column(
                  children: [
                    Assets.icons.icBulletOval.svg(),
                    Container(width: 1, color: colorB2B2B2, height: 20.hs),
                    Assets.icons.icBullet.svg(),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getAddress(stepIndex) ?? "", style: text14.textColor141414),
                    SizedBox(height: 10.hs),
                    Text(getTitleSearchAddress(stepIndex), style: text14.textColor141414),
                  ],
                )
              ],
              if (stepIndex == 2) ...[
                Column(
                  children: [
                    Assets.icons.icBulletOval.svg(),
                    Container(width: 1, color: colorB2B2B2, height: 20.hs),
                    Assets.icons.icBulletOval.svg(),
                    Container(width: 1, color: colorB2B2B2, height: 20.hs),
                    Assets.icons.icBullet.svg(),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getAddress(1) ?? "", style: text14.textColor141414),
                    SizedBox(height: 10.hs),
                    Text(getAddress(2) ?? "", style: text14.textColor141414),
                    SizedBox(height: 10.hs),
                    Text(getTitleSearchAddress(stepIndex), style: text14.textColor141414),
                  ],
                )
              ],
            ],
          )
        ],
      ),
    );
  }

  String? getAddress(int index) {
    switch (index) {
      case 1:
        return controller.pickProvince.value.name;
      case 2:
        return controller.pickDistrict.value.name;
      case 3:
        return controller.pickWard.value.name;
      default:
        return "";
    }
  }

  String getTitleAddress(int index) {
    switch (index) {
      case 0:
        return textLocalization('service.location.pickProvince');
      case 1:
        return textLocalization('service.location.pick2');
      case 2:
        return textLocalization('service.location.pick4');
      default:
        return "";
    }
  }

  String getTitleSearchAddress(int index) {
    switch (index) {
      case 0:
        return textLocalization('service.location.pickProvince');
      case 1:
        return textLocalization('service.location.pick');
      case 2:
        return textLocalization('service.location.pick3');
      default:
        return "";
    }
  }
}
