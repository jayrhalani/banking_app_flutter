import 'package:banking_app_flutter/resources/asset_res.dart';
import 'package:banking_app_flutter/screens/add_money_screen.dart';
import 'package:flutter/material.dart';
import 'package:banking_app_flutter/models/card_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isBalanceVisible = true;

  final List<CardModel> _cards = const [
    CardModel(
      isPrimary: true,
      type: 'Debit Card',
      numberSuffix: '4568',
      logoColorValue: 0xFF000000,
      logoAsset: AssetRes.icMasterCard,
      backgroundImageAsset: AssetRes.imageMasterCardBg,
    ),
    CardModel(
      isPrimary: false,
      type: 'Credit Card',
      numberSuffix: '7890',
      logoColorValue: 0xFFC6F253,
      logoAsset: AssetRes.icVisaCard,
      backgroundImageAsset: AssetRes.imageVisaCardBg,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F4F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    _buildHeaderSection(),

                    // Balance Section
                    _buildBalanceSection(),

                    // Cards Section
                    _buildCardsSection(),

                    // Transactions Section
                    _buildTransactionsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning, Terry',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Welcome to Neobank',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0XFFE6E7E9), width: 2),
            ),
            width: 48,
            height: 48,
            child: Stack(
              children: [
                Center(
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: 28,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 10,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0XFF9ACC03),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your balance',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _isBalanceVisible ? '\$3,200.00' : '••••••',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Color(0XFF202020),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isBalanceVisible = !_isBalanceVisible;
                  });
                },
                child: Icon(
                  _isBalanceVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Color(0XFF202020),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddMoneyScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF202020),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                'Add money',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your cards',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF202020),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  '+ New card',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF202020),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Horizontal scrollable cards
        SizedBox(
          height: 200, // match card height
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _cards.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              final card = _cards[index];
              return SizedBox(
                width: 320, // fixed width like real credit card
                child: _buildCard(card: card),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCard({required CardModel card}) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: card.backgroundImageAsset == null
            ? const Color(0xFF2B2B2B)
            : null,
        image: card.backgroundImageAsset != null
            ? DecorationImage(
                image: AssetImage(card.backgroundImageAsset!),
                fit: BoxFit.cover,
              )
            : null,
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'N.',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color(card.logoColorValue),
                  ),
                ),
                Image.asset(card.logoAsset, height: 40, width: 40),
                // Container(
                //   width: 40,
                //   height: 24,
                //   decoration: BoxDecoration(
                //     color: Colors.orange,
                //     borderRadius: BorderRadius.circular(4),
                //   ),
                //   child: const Center(
                //     child: Text(
                //       'MC',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 14,
                //         fontWeight: FontWeight.bold,
                //         fontStyle: FontStyle.normal,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      card.type,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(card.logoColorValue),
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '.... ${card.numberSuffix}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(card.logoColorValue),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFFFFFFFA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.visibility_outlined,
                        size: 22,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsSection() {
    final transactions = [
      {
        'icon': Icons.coffee,
        'merchantName': 'Starbucks Coffee',
        'date': 'October 17, 09:00 PM',
        'amount': '-\$44.80',
        'cashback': '+\$1.65',
        'iconColor': Colors.green,
      },
      {
        'icon': Icons.shopping_bag,
        'merchantName': 'Amazon',
        'date': 'October 16, 02:30 PM',
        'amount': '-\$89.99',
        'cashback': '+\$2.70',
        'iconColor': Colors.blue,
      },
      {
        'icon': Icons.local_gas_station,
        'merchantName': 'Shell Gas Station',
        'date': 'October 15, 11:45 AM',
        'amount': '-\$35.50',
        'cashback': '+\$1.07',
        'iconColor': Colors.orange,
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF202020),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF202020),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Separated list with dividers
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tx = transactions[index];
              return _buildTransactionItem(
                icon: tx['icon'] as IconData,
                merchantName: tx['merchantName'] as String,
                date: tx['date'] as String,
                amount: tx['amount'] as String,
                cashback: tx['cashback'] as String,
                iconColor: tx['iconColor'] as Color,
              );
            },
            separatorBuilder: (_, __) => const Divider(
              thickness: 1,
              height: 16,
              color: Color(0XFFE6E7E9),
              indent: 64, // aligns divider after icon
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String merchantName,
    required String date,
    required String amount,
    required String cashback,
    required Color iconColor,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0XFFE6E7E9), width: 1),
              ),
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: iconColor,
                child: Icon(icon, color: Colors.white, size: 24),
              ),
            ),
            const SizedBox(width: 16),

            // Text + amount
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    merchantName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFFC6F253),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    cashback,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
