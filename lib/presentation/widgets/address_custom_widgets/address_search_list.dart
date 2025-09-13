import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/address_result_model.dart';
import '../../../logic/cubit/address_service_cubit.dart';

class AddressSearchList extends StatelessWidget {
  const AddressSearchList({super.key, required this.addressDetails});

  final void Function(AddressResultModel) addressDetails;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressServiceCubit, AddressServiceState>(
      builder: (context, state) {
        if (state is AddressServiceLoaded) {
          final addressesList = state.addressesList;
          return SliverList.builder(
            itemCount: addressesList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                addressDetails(addressesList[index]);
                context.pop();
              },
              child: Text(
                addressesList[index].displayName,
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w500, fontSize: 16),
              ).paddingOnly(right: 12, left: 12, bottom: 16, top: 16),
            ),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text("No Data Found"),
            ),
          );
        }
      },
    );
  }
}
