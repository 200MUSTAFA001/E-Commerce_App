import 'package:api_app/app_router.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/address_model.dart';
import '../../../logic/cubit/address_cubit.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.addressItem});

  final AddressModel addressItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Text(
              addressItem.addressType.name.capitalize(),
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
            Text(
              addressItem.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              addressItem.streetDetails,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                MaterialButton(
                  onPressed: () {
                    context.push(AppRouter.editAddressPage, extra: addressItem);
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 6,
                    children: [
                      Icon(FontAwesomeIcons.penToSquare,
                          size: 20, color: Colors.blue),
                      Text(
                        "Edit",
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    context
                        .read<AddressCubit>()
                        .removeAddress(addressItem.addressID!);
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 6,
                    children: [
                      Icon(FontAwesomeIcons.trashCan,
                          size: 20, color: Colors.red),
                      Text(
                        "Remove",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
