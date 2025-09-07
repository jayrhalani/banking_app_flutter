import 'package:banking_app_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:banking_app_flutter/models/card_model.dart';
import 'package:banking_app_flutter/resources/asset_res.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  int _selectedCardIndex = 0;

  final List<CardModel> _cards = [
    const CardModel(
      isPrimary: true,
      type: 'Debit card',
      numberSuffix: '4568',
      logoColorValue: 0xFF000000,
      logoAsset: AssetRes.icMasterCard,
      backgroundImageAsset: AssetRes.imageMasterCardBg,
    ),
    const CardModel(
      isPrimary: false,
      type: 'Credit card',
      numberSuffix: '2478',
      logoColorValue: 0xFFC6F253,
      logoAsset: AssetRes.icVisaCard,
      backgroundImageAsset: AssetRes.imageVisaCardBg,
    ),
    const CardModel(
      isPrimary: false,
      type: 'Bank',
      numberSuffix: '1234',
      logoColorValue: 0xFFFFFFFF,
      logoAsset: AssetRes.icVisaCard,
      backgroundImageAsset: null,
    ),
  ];

  final List<Map<String, dynamic>> _addMoneyOptions = [
    {
      'title': 'Move your direct deposit',
      'icon': Icons.account_balance,
      'description': 'Set up recurring deposits from your employer',
    },
    {
      'title': 'Transfer from other banks',
      'icon': Icons.swap_horiz,
      'description': 'Move money from your existing bank accounts',
    },
    {
      'title': 'Apple Pay',
      'icon': Icons.apple,
      'description': 'Add money using Apple Pay',
    },
    {
      'title': 'Debit / Credit Card',
      'icon': Icons.credit_card,
      'description': 'Add money using another card',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Add money',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Select card section
            _buildSelectCardSection(),

            // Add money to Neobank section
            _buildAddMoneySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectCardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Select card',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _cards.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              final card = _cards[index];

              return AspectRatio(
                aspectRatio: 1, // Ensures width = height
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCardIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _selectedCardIndex == index
                            ? Colors.black
                            : Colors.transparent,
                        width: 4,
                      ),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: card.backgroundImageAsset == null
                            ? const Color(0xFF2B2B2B)
                            : null,
                        image: card.backgroundImageAsset != null
                            ? DecorationImage(
                          image: AssetImage(card.backgroundImageAsset!),
                          fit: BoxFit.cover,
                        )
                            : null,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12), // Reduced from 16
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SelectedIndicator(
                                  isSelected: _selectedCardIndex == index,
                                ),
                                Image.asset(card.logoAsset, height: 28),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              card.type,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '.... ${card.numberSuffix}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        ),
      ],
    );
  }

  Widget _buildAddMoneySection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add money to Neobank',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          ..._addMoneyOptions.map((option) => _buildAddMoneyOption(option)),
        ],
      ),
    );
  }

  Widget _buildAddMoneyOption(Map<String, dynamic> option) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: const Color(0xFFF2F4F5),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _handleOptionSelection(option['title']),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(option['icon'], color: Colors.grey[700], size: 24),
            ),
            title: Text(
              option['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }

  void _handleOptionSelection(String option) {
    // Handle different add money options
    switch (option) {
      case 'Move your direct deposit':
        // Navigate to direct deposit setup
        break;
      case 'Transfer from other banks':
        // Navigate to bank transfer
        break;
      case 'Apple Pay':
        // Handle Apple Pay
        break;
      case 'Debit / Credit Card':
        // Navigate to card input
        break;
    }
  }
}

/// Extracted widget for the small circle indicator
class SelectedIndicator extends StatelessWidget {
  final bool isSelected;

  const SelectedIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Color(0XFFFF9800) : Colors.white,
        border: isSelected
            ? Border.all(width: 2, color: Color(0XFFFF9800))
            : Border.all(width: 1, color: Colors.white),
      ),
      child: isSelected
          ? const Padding(
              padding: EdgeInsets.all(2),
              child: CircleAvatar(backgroundColor: Colors.white),
            )
          : null,
    );
  }
}

class CardPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const text = 'NEO';
    const fontSize = 10.0;

    for (int i = 0; i < 15; i++) {
      for (int j = 0; j < 10; j++) {
        final x = i * 25.0;
        final y = j * 20.0;

        final textPainter = TextPainter(
          text: const TextSpan(
            text: text,
            style: TextStyle(
              color: Colors.green,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(x, y));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
