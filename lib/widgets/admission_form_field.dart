import 'package:flutter/material.dart';

class AdmissionFormField extends StatelessWidget {
  const AdmissionFormField({super.key, this.fieldName = '', this.fieldData = '', this.fieldWidth});

  final String fieldName;
  final String fieldData;
  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          fieldName,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(67, 80, 96, 1)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12, left: 7),
          child: Container(
            height: 20,
            width: fieldWidth ?? MediaQuery.of(context).size.width/12,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(112, 112, 112, 1),
                  )
              ),
            ),
            child: Center(
              child: Text(
                fieldData,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(67, 80, 96, 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}