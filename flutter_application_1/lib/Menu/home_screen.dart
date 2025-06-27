import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Menu/home_bottom_bar.dart';
import 'package:flutter_application_1/Menu/items_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> skinTypes = ["For you", "Dry", "Oily", "Normal", "Sensitive", "Combination"];
  String currentSkinType = "For you";
  bool isLoading = true; // Show loading spinner initially

  @override
  void initState() {
    _tabController = TabController(length: skinTypes.length, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    fetchProducts(currentSkinType); // Initial fetch for "For You" section
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        currentSkinType = skinTypes[_tabController.index];
        isLoading = true;
      });
      fetchProducts(currentSkinType); // Fetch products for the selected tab
    }
  }

  void fetchProducts(String skinType) async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      ItemsWidget.products = List.generate(
        6,
        (index) => Product(
          name: "$skinType Product $index",
          image: "moisturizer-dry1.jpeg", 
          description: "Description of $skinType Product $index",
          price: 15.0 + index,
        ),
      );
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Color
            Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image5.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Foreground Content
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: ListView(
                children: [
                  // Top Bar with Search and Notifications
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search products...',
                                prefixIcon: Icon(Icons.search, color: Color.fromRGBO(72, 52, 102, 1.0)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.notifications_none,
                            color: Color.fromRGBO(72, 52, 102, 1.0),
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Welcome Text
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Hello! Welcome back!",
                      style: TextStyle(
                        color: Color.fromRGBO(72, 52, 102, 1.0),
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Sale Banner
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(72, 52, 102, 1.0).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "🎉 Big Sale Alert!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Get up to 50% off on all skincare products this weekend.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Tabs
                  TabBar(
                    controller: _tabController,
                    labelColor: Color.fromRGBO(72, 52, 102, 1.0),
                    unselectedLabelColor: Colors.black.withOpacity(0.5),
                    isScrollable: true,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color.fromRGBO(72, 52, 102, 1.0),
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    tabs: skinTypes.map((type) => Tab(text: type)).toList(),
                  ),

                  SizedBox(height: 10),

                  // Product Grid
                  isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(72, 52, 102, 1.0),
                          ),
                        )
                      : ItemsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}