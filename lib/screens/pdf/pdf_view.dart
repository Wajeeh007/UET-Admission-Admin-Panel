import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_admission_web/screens/pdf/pdf_viewmodel.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  PdfView({super.key});

  final PdfViewModel viewModel = Get.put(PdfViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Stack(
          fit: StackFit.loose,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Obx(() => Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/2.5,
                    height: MediaQuery.of(context).size.height,
                    child: viewModel.docFetched.value ? SfPdfViewer.memory(viewModel.documentBytes[0]) : const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 7.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ) ,
              ),
            Positioned(
              top: 8,
              left: 15,
              child: IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.white,)
              ),
            )
          ],
        ),
        )
    );
  }
}
