import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/font_size.dart';
import '../../../../core/constants/font_styles.dart';
import '../../../../core/constants/text.dart';
import '../../../registration/presentation/components/register_new_animating_text.dart';
import '../components/card_name_text_field.dart';
import '../components/card_text_field.dart';
import '../components/expire_date_text_field.dart';
import '../components/payment_credit_widget.dart';
import '../components/pin_text_field.dart';
class CreditCardScreen extends StatefulWidget {
  final ValueChanged<String?>? onCardNumberChanged;
  final ValueChanged<String>? onCardNameChanged;
  final ValueChanged<int?>? onPinChanged;
  final ValueChanged<String?>? onExpDateChanged;

  const CreditCardScreen({
    super.key,
    this.onCardNumberChanged,
    this.onCardNameChanged,
    this.onPinChanged,
    this.onExpDateChanged,
  });

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  int? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RegisterNewAnimatingText(
                color: Colors.green,
                text: AppText.paymentText,
              ),
              WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                  duration: const Duration(seconds: 1),
                ),
                atRestEffect: WidgetRestingEffects.none(),
                child: Text(
                  AppText.total,
                  style: AppStyles.styleBold18(context: context),
                ),
              ),
              WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                  duration: const Duration(seconds: 1),
                ),
                atRestEffect: WidgetRestingEffects.none(),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: getResponsiveFontSize(context, fontSize: 15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green, width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(' ${AppText.derham} 56  '),
                            Text(
                              ':${AppText.total}',
                              style: AppStyles.styleBold16(context: context),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 10,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              PaymentCreditWidget(
                value: 1,
                groupValue: _selectedPaymentMethod,
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedPaymentMethod = _selectedPaymentMethod == newValue ? 0 : newValue;
                  });
                },
              ),
              const SizedBox(height: 10,),
              if (_selectedPaymentMethod == 1)
                Column(
                  children: [
                    CardTextField(
                      onChanged: (value) {
                        widget.onCardNumberChanged?.call(value);
                      },
                    ),
                    const SizedBox(height: 10,),
                    ExpiryDateTextField(
                      onChanged: (value) {
                        widget.onExpDateChanged?.call(value);
                      },
                    ),
                    const SizedBox(height: 10,),
                    PinTextField(
                      onChanged: (value) {
                        widget.onPinChanged?.call(int.tryParse(value));
                      },
                    ),
                    const SizedBox(height: 10,),
                    CardNameTextField(
                      onChanged: (value) {
                        widget.onCardNameChanged?.call(value);
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
