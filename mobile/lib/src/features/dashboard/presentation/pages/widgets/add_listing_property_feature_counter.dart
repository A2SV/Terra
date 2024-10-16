import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/custom_extensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void decrement() => emit((state - 1) >= 0 ? state - 1 : 0);

  void increment() => emit(state + 1);
}

class AddListingPropertyFeatureCounter extends StatelessWidget {
  final String label;
  const AddListingPropertyFeatureCounter({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            decoration: BoxDecoration(
              color: AppCommonColors.reviewCard,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: context.textTheme.displaySmall!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    _buildButton(
                      context,
                      color: state == 0 ?AppCommonColors.fieldBorderColor :AppCommonColors.mainBlueButton,
                      icon: Icons.remove,
                      onTap: () =>
                          BlocProvider.of<CounterCubit>(context).decrement(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        state.toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    _buildButton(
                      context,
                      icon: Icons.add,
                      onTap: () =>
                          BlocProvider.of<CounterCubit>(context).increment(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  GestureDetector _buildButton(
      BuildContext context, {
        void Function()? onTap,
        IconData? icon,
        Color? color = AppCommonColors.mainBlueButton,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30.0,
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 14.sp,
        ),
      ),
    );
  }
}
