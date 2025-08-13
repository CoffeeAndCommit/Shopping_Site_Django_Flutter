import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/email_textfield.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/search/controllers/search_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(
          onTap: () {
            context.read<SearchNotifiers>().clearResults();
            context.pop();
          },
        ),
        title: ReusableText(
          text: AppText.kSearch,
          style: appStyle(
            15,
            MColors.kPrimary,
            FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: Padding(
              padding: EdgeInsets.all(14.w),
              child: EmailTextField(
                controller: _searchController,
                radius: 30,
                hintText: AppText.kSearch,
                prefixIcon: GestureDetector(
                  onTap: () {
                    if (_searchController.text.isNotEmpty) {
                      context
                          .read<SearchNotifiers>()
                          .searchFunction(_searchController.text);
                    } else {
                      print("Search Key Is Empty");
                    }
                  },
                  child: const Icon(
                    AntDesign.search1,
                    color: MColors.kPrimary,
                  ),
                ),
              )),
        ),
      ),
      body:
          Consumer<SearchNotifiers>(builder: (context, searchNotifier, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: ListView(
            children: [
              searchNotifier.results.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                            text: 'Search Results',
                            style:
                                appStyle(13, MColors.kPrimary, FontWeight.w600))
                      ],
                    )
                  : const SizedBox.shrink()
            ],
          ),
        );
      }),
    );
  }
}
