import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';
import '../common/feature_card.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.gridColumns(context);

    return Container(
      padding: Responsive.sectionPadding(context),
      color: AppConstants.lightBg,
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Column(
            children: [
              const SectionTitle(
                title: 'LMS Features',
                subtitle:
                    'Powerful tools to enhance your learning experience',
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: columns == 1 ? 2.0 : 1.1,
                ),
                itemCount: AppConstants.lmsFeatures.length,
                itemBuilder: (context, index) {
                  final feature = AppConstants.lmsFeatures[index];
                  return FeatureCard(
                    title: feature['title'] as String,
                    description: feature['desc'] as String,
                    icon: feature['icon'] as IconData,
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
