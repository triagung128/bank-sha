import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/models/data_plan_form_model.dart';
import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCard;

  const DataPackagePage({
    super.key,
    required this.operatorCard,
  });

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');

  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is DataPlanSuccess) {
            if (context.mounted) {
              context.read<AuthBloc>().add(
                    AuthUpdateBalance(selectedDataPlan!.price! * -1),
                  );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/data-success', (_) => false);
            }
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Paket Data'),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 30),
                Text(
                  'Phone Number',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 14),
                CustomFormField(
                  title: '+628',
                  isShowTitle: false,
                  controller: phoneController,
                ),
                const SizedBox(height: 40),
                Text(
                  'Select Package',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 17,
                  runSpacing: 17,
                  children: widget.operatorCard.dataPlans!
                      .map((dataPlan) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDataPlan = dataPlan;
                              });
                            },
                            child: PackageItem(
                              dataPlan: dataPlan,
                              isSelected: dataPlan.id == selectedDataPlan?.id,
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 57),
              ],
            ),
            floatingActionButton: (selectedDataPlan != null &&
                    phoneController.text.isNotEmpty)
                ? Container(
                    margin: const EdgeInsets.all(24),
                    child: CustomFilledButton(
                      title: 'Continue',
                      onPressed: () async {
                        final result =
                            await Navigator.pushNamed(context, '/pin');

                        if (result == true) {
                          if (context.mounted) {
                            final authState = context.read<AuthBloc>().state;

                            String pin = '';

                            if (authState is AuthSuccess) {
                              pin = authState.user.pin!;
                            }

                            context.read<DataPlanBloc>().add(
                                  DataPlanPost(
                                    DataPlanFormModel(
                                      dataPlanId: selectedDataPlan!.id,
                                      phoneNumber: phoneController.text,
                                      pin: pin,
                                    ),
                                  ),
                                );
                          }
                        }
                      },
                    ),
                  )
                : Container(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
