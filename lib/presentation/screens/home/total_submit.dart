import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/common_table_widget.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),

            // Main tab bar
            Container(
              height: 40.h,
              width: 221.w,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: const Color(0xffD6ECF0),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: mainTabController,
                indicator: BoxDecoration(
                  color: const Color(0xffE2C1F3),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                dividerColor: Colors.transparent,
                labelColor: const Color(0xff474545),
                unselectedLabelColor: const Color(0xff474545),
                tabs: const [
                  Tab(text: 'All Item'),
                  Tab(text: 'Transaction'),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Full screen tab content
            Expanded(
              child: TabBarView(
                controller: mainTabController,
                children: [totalSubmitTable(), _transactionContent()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Transaction tab content
  Widget _transactionContent() {
    return Column(
      children: [
        Container(
          height: 44.h,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: const Color(0xffE6E6E6),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: subTabController,
            indicator: BoxDecoration(
              color: const Color(0xff5C6CFF),
              borderRadius: BorderRadius.circular(20.r),
            ),
            dividerColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: const Color(0xff333333),
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
            children: [
              rewardFundTable(),
              supportFundTable(),
              wishlistFundTable(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget totalSubmitTable() {
  // Dummy data
  final items = List.generate(
    20,
    (index) => {
      "relation": "Father",
      "name": "Jhon",
      "item": "Bear",
      "type": "Dream",
      "amount": "\$25.00",
    },
  );

  // Fund type color handler
  Color typeColor(String type) {
    if (type == "Reward") return Colors.cyan;
    if (type == "Wishlist") return Colors.purple;
    return Colors.amber;
  }

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      children: [
        // Table header
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: const BoxDecoration(
            color: Color(0xFFFF7A2F),
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: const Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Relation',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('Name', style: TextStyle(color: Colors.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Item Name',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Fund type',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('Amount', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),

        // Scrollable table body
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(child: Center(child: Text(item['relation']!))),
                    Expanded(child: Center(child: Text(item['name']!))),
                    Expanded(child: Center(child: Text(item['item']!))),
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: typeColor(item['type']!).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            item['type']!,
                            style: TextStyle(
                              color: typeColor(item['type']!),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Center(child: Text(item['amount']!))),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget rewardFundTable() {
  final items = List.generate(
    15,
    (index) => {"item": "Toy", "amount": "\$30.00"},
  );

  return commonTable(items: items, fundLabel: "Reward", fundColor: Colors.cyan);
}

Widget supportFundTable() {
  final items = List.generate(
    12,
    (index) => {"item": "Book", "amount": "\$40.00"},
  );

  return commonTable(
    items: items,
    fundLabel: "Support",
    fundColor: Colors.green,
  );
}

Widget wishlistFundTable() {
  final items = List.generate(
    18,
    (index) => {"item": "Dress", "amount": "\$55.00"},
  );

  return commonTable(
    items: items,
    fundLabel: "Wishlist",
    fundColor: Colors.purple,
  );
}
