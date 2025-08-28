import 'package:api_app/app_router.dart';
import 'package:api_app/data/models/address_model.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/address_cubit.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAddressesPage extends StatelessWidget {
  const UserAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AddressPageAppBar(),
          SliverPadding(
            padding: EdgeInsets.only(left: 0),
            sliver: SliverToBoxAdapter(
              child: Card(
                child: Text(
                  "Default Address",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ).allPadding(padding: 10),
              ),
            ),
          ),
          BlocBuilder<AddressCubit, AddressState>(builder: (context, state) {
            if (state is AddressLoaded) {
              final addressesList = state.userAddressesList;
              final defaultAddressesList = addressesList
                  .where((address) => address.defaultAddress == true)
                  .toList();
              return SliverToBoxAdapter(
                child: AddressCard(
                        addressItem: defaultAddressesList.isNotEmpty
                            ? defaultAddressesList.last
                            : addressesList.last) // to avoid bad state
                    .onlyPadding(bottom: 14),
              );
            } else {
              return const SliverFillRemaining(
                child: Text("no data"),
              );
            }
          }),
          SliverPadding(
            padding: const EdgeInsets.only(left: 0),
            sliver: SliverToBoxAdapter(
              child: Card(
                child: const Text(
                  "Other Addresses",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ).allPadding(padding: 10),
              ),
            ),
          ),
          BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              if (state is AddressLoaded) {
                final addressesList = state.userAddressesList;
                return SliverList.builder(
                  itemCount:
                      addressesList.isNotEmpty ? addressesList.length : 0,
                  itemBuilder: (context, index) => AddressCard(
                    addressItem: addressesList[index],
                  ).onlyPadding(bottom: 10),
                );
              } else {
                return const SliverFillRemaining(
                  child: Text("no data"),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

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
                  onPressed: () {},
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

class AddressPageAppBar extends StatelessWidget {
  const AddressPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: context.height * 0.1,
      title: Text(
        "Addresses",
        style: GoogleFonts.oswald(letterSpacing: 1, fontSize: 26),
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            context.push(AppRouter.addNewAddressPage);
          },
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              side: const BorderSide(color: Colors.deepOrangeAccent, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Colors.deepOrangeAccent, size: 16),
              Text(
                "New Address",
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 16),
              ),
            ],
          ),
        ).onlyPadding(right: 10),
      ],
    );
  }
}
