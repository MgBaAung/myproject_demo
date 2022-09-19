import 'package:flutter/material.dart';

class ViewDetailScreen extends StatefulWidget {
  const ViewDetailScreen({super.key});

  @override
  State<ViewDetailScreen> createState() => _ViewDetailScreenState();
}

class _ViewDetailScreenState extends State<ViewDetailScreen>
    with SingleTickerProviderStateMixin {
  // final bodyGlobalKey = GlobalKey();
  // final List<Widget> myTabs = [
  //   Tab(text: 'Description'),
  //   Tab(text: 'Customer Review'),
  // ];
  // late TabController _tabController;
  // late ScrollController _scrollController;
  // late bool fixedScroll;

  // Widget _buildCarousel() {
  //   return Stack(
  //     children: <Widget>[
  //       Placeholder(fallbackHeight: 100),
  //       Positioned.fill(child: Align(alignment: Alignment.center, child: Text('Slider'))),
  //     ],
  //   );
  // }

  // @override
  // void initState() {
  //   _scrollController = ScrollController();
  //   _scrollController.addListener(_scrollListener);
  //   _tabController = TabController(length: 3, vsync: this);
  //   _tabController.addListener(_smoothScrollToTop);

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  // _scrollListener() {
  //   if (fixedScroll) {
  //     _scrollController.jumpTo(0);
  //   }
  // }

  // _smoothScrollToTop() {
  //   _scrollController.animateTo(
  //     0,
  //     duration: Duration(microseconds: 300),
  //     curve: Curves.ease,
  //   );

  //   setState(() {
  //     fixedScroll = _tabController.index == 2;
  //   });
  // }

  // _buildTabContext(int lineCount) => Container(
  //       child: ListView.builder(
  //         physics: const ClampingScrollPhysics(),
  //         itemCount: lineCount,
  //         itemBuilder: (BuildContext context, int index) {
  //           return Text('some content');
  //         },
  //       ),
  //     );

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: NestedScrollView(
  //       controller: _scrollController,
  //       headerSliverBuilder: (context, value) {
  //         return [
  //           SliverToBoxAdapter(
  //             child: Image.asset('assets/images/image.jpg')
  //           ),
  //           SliverToBoxAdapter(
  //             child: Padding(
  //               padding: EdgeInsets.symmetric(vertical: 32,
  //               horizontal: 16,

  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                 Text('Womman Shoe'),
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: 8),
  //                   color: Colors.blue,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text('-'),
  //                       Text('1'),
  //                       Text('+')
  //                     ],
  //                   ),
  //                 )
  //               ]),
  //             ),
  //           ),
  //           SliverToBoxAdapter(
  //             child: TabBar(

  //               controller: _tabController,
  //               labelColor: Colors.redAccent,
  //               isScrollable: true,
  //               tabs: myTabs,
  //             ),
  //           ),
  //         ];
  //       },
  //       body: Center(
  //         child: Container(
  //           child: TabBarView(
  //             controller: _tabController,
  //             children: [_buildTabContext(2), _buildTabContext(200), _buildTabContext(2)],
  //           ),
  //         ),
  //       ),

  //     ),

  //   );
  // }

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              color: Colors.blue,
              child: const Center(
                child: Text("Profile"),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Womman Shoe'),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [Text('-'), Text('1'), Text('+')],
                        ),
                      )
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.red,
                tabs: const [
                  Tab(
                    child: Text('Description'),
                  ),
                  Tab(
                    icon: Text('Customer Review'),
                  )
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBarView(
                  controller: _tabController,
                  children: const [Text('people'), Text('Person')],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: const Text('10000'),
            ),
            Container(
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
