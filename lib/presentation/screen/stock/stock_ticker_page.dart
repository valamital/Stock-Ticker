import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utiles/name_constant.dart';
import '../../widget/appbar/custom_app_bar.dart';
import 'controller/stock_controller.dart';

class StockTickerPage extends StatelessWidget {
  final StockTickerController controller = Get.find();
  final TextEditingController textController = TextEditingController();

  StockTickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSearchField(),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: _buildPriceInfo(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///build search field
  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: NameConstant.STOCK_SEARCH_HINT,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              if (textController.text.isNotEmpty) {
                controller.addSymbolToStream(textController.text);
              }
              if (FocusManager.instance.primaryFocus?.hasFocus == true) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (symbol) {},
      ),
    );
  }

  ///build price widget
  Widget _buildPriceInfo() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.currentPrice.value != 0.0) {
        return _buildLoadedUI(controller: controller);
      } else {
        return const Center(child: Text("Noting to show"));
      }
    });
  }
}

///build loaded widget
class _buildLoadedUI extends StatelessWidget {
  const _buildLoadedUI({
    super.key,
    required this.controller,
  });

  final StockTickerController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          NameConstant.PRICE_TITLE,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '${controller.currentPrice.value}',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 10),
        Text(
          NameConstant.CHANGE_TITLE,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '${controller.change.value}',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 10),
        Text(
          NameConstant.PER_CHANGE_TITLE,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '${controller.percentageChange.value}%',
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
