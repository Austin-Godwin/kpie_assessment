import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpie_assessment/core/constants/constants.dart';
import 'package:kpie_assessment/utils/color.dart';
import 'package:kpie_assessment/widgets/app_button.dart';
import 'package:kpie_assessment/widgets/clickable_text.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        children: [
          const SizedBox(height: 62.0),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.menu_rounded,
                  size: 40.0,
                ),
              ),
              const Spacer(),
              ClickableText(
                text: 'Log out',
                onTap: () {},
                fontSize: 22.0,
                textColor: AppColors.kWarning,
              ),
            ],
          ),
          const SizedBox(height: 37.0),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Text(
                'James Idowu',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Positioned(
                right: 0.0,
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.red),
                  child: CachedNetworkImage(
                    imageUrl: Constants.profilePhotoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -95.0,
                child: Row(
                  children: [
                    ShortAppButton(
                      text: 'Edit profile',
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 114.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.kBlue),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.kLightBlue,
                  radius: 30,
                  child: Icon(
                    Icons.link_rounded,
                    color: AppColors.kBlue,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Text(
                      'Refer and earn',
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w400,
                          fontSize: 24.0,
                          fontStyle: FontStyle.italic,
                          color: AppColors.kWhite),
                    ),
                    Text(
                      'ronvest.com/@mosodi',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 15.0,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 56.26),
                const Icon(
                  Icons.share_rounded,
                  color: AppColors.kLightBlue,
                  size: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            'APP SETTINGS',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: AppColors.kAsh,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Enable Dark mode', style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400, fontSize: 18),),

            ],
          ),
          const SizedBox(height: 14.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Notifications', style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400, fontSize: 18),),

            ],
          )
        ],
      ),
    );
  }
}
