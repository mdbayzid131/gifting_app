import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_appbar.dart';

class TotalSubmitPage extends StatefulWidget {
  const TotalSubmitPage({super.key});

  @override
  State<TotalSubmitPage> createState() => _TotalSubmitPageState();
}

class _TotalSubmitPageState extends State<TotalSubmitPage>
    with TickerProviderStateMixin {
  late TabController mainTabController;
  late TabController subTabController;

  @override
  void initState() {
    super.initState();
    mainTabController = TabController(length: 2, vsync: this);
    subTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    mainTabController.dispose();
    subTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: 'Total Submit'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),

            /// MAIN TAB
            Container(
              height: 33.h,
              width: 221.w,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: const Color(0xffD6ECF0),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TabBar(
                controller: mainTabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: const Color(0xffE2C1F3),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                labelColor: const Color(0xff474545),
                unselectedLabelColor: const Color(0xff474545),
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: 'All Item'),
                  Tab(text: 'Transaction'),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            SizedBox(
              height: 420.h,
              child: TabBarView(
                controller: mainTabController,
                children: [
                  _allItemContent(),
                  _transactionContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _allItemContent() {
    return const Center(
      child: Text('All Item Content'),
    );
  }

  Widget _transactionContent() {
    return Column(
      children: [
        /// SUB TAB PILL
        Container(
          height: 44.h,
          width: double.infinity,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: const Color(0xffE6E6E6),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: TabBar(
            controller: subTabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: const Color(0xff5C6CFF),
              borderRadius: BorderRadius.circular(20.r),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: const Color(0xff333333),
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Reward Fund'),
              Tab(text: 'Support Fund'),
              Tab(text: 'Wishlist Fund'),
            ],
          ),
        ),

        SizedBox(height: 14.h),

        Expanded(
          child: TabBarView(
            controller: subTabController,
            children: const [
              Center(child: Text('Reward Fund List')),
              Center(child: Text('Support Fund List')),
              Center(child: Text('Wishlist Fund List')),
            ],
          ),
        ),
      ],
    );
  }
}
