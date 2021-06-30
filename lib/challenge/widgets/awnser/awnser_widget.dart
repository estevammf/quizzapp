
import 'package:flutter/material.dart';
import 'package:quizapp/shared/layout/layout.dart';
import 'package:quizapp/shared/models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {

  final AwnserModel? awnser;
  final bool isSelect;
  final ValueChanged<bool>? onTap;
  final bool isConfirm;

  const AwnserWidget({Key? key, this.awnser, this.isSelect = false, this.onTap, this.isConfirm = false}) : super(key: key);

  Color get _selectedColorRight =>
        awnser!.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      awnser!.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      awnser!.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      awnser!.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      awnser!.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => awnser!.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
          onTap: !isConfirm ? () { onTap!(awnser!.isRight); } : null,
          child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelect ? (isConfirm ? _selectedColorCardRight : AppColors.white) : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(color: isSelect ? (isConfirm ? _selectedBorderCardRight : AppColors.border) : AppColors.border))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(awnser!.title!, style: isSelect ? (isConfirm ? _selectedTextStyleRight : AppTextStyles.body) : AppTextStyles.body)),
              Container(
                width:24,
                height:24,
                decoration: BoxDecoration(
                  color: isSelect ? (isConfirm ? _selectedColorRight : AppColors.lightGrey) : AppColors.white,
                  borderRadius: BorderRadius.circular(500),
                  border: Border.fromBorderSide(BorderSide(color: isSelect ? (isConfirm ? _selectedBorderRight : AppColors.border) : AppColors.border))
                ),
                child: isSelect ? Icon(_selectedIconRight, size: 16, color: Colors.white,) : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}