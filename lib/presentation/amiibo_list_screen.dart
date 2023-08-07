import 'package:amiibo_app_flutter/presentation/component/amiibo_item.dart';
import 'package:amiibo_app_flutter/presentation/component/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'amiibo_list_viewmodel.dart';

class AmiiboListScreen extends StatefulWidget {
  const AmiiboListScreen({super.key});

  @override
  State<AmiiboListScreen> createState() => _AmiiboListState();
}

class _AmiiboListState extends State<AmiiboListScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<AmiiboListViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Amiibo List"),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.screenData.categories.length,
                  itemBuilder: (context, index) {
                    var category = viewModel.screenData.categories[index];
                    return CategoryItem(
                      value: category,
                      isSelected:
                          category == viewModel.screenData.selectedCategory,
                      onClick: (category) async {
                        viewModel.updateSelectedCategory(category);
                      },
                    );
                  }),
            ),
            Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: viewModel.screenData.amiiboList.length,
                  itemBuilder: (context, index) {
                    var amiibo = viewModel.screenData.amiiboList[index];
                    return AmiiboItem(
                      amiibo: amiibo,
                      onClick: () {
                        _launchURL(amiibo.image);
                      },
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 22
                  ),
                )
            )
          ],
        ));
  }

  void _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }
}
