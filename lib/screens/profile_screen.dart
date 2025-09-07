import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Picture Section
            _buildProfilePictureSection(),
            const SizedBox(height: 30),

            // Personal Info Section
            _buildPersonalInfoSection(),
            const SizedBox(height: 30),

            // Account Info Section
            _buildAccountInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePictureSection() {
    return Center(
      child: Stack(
        children: [
          // Profile Picture
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: Container(
                color: Colors.grey[300],
                child: Image.network(
                  'https://randomuser.me/api/portraits/men/78.jpg',
                  height: 60,
                  width: 60,
                ),
              ),
            ),
          ),

          // Edit Button
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  // Handle edit profile picture
                  _editProfilePicture();
                },
                icon: const Icon(Icons.edit, size: 20, color: Colors.black),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Container(
      width: double.infinity,
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
          // Header with Edit button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Personal info',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle edit personal info
                  _editPersonalInfo();
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Personal Info Fields
          _buildInfoField(
            icon: Icons.person_outline,
            label: 'Name',
            value: 'Terry Melton',
          ),
          const SizedBox(height: 16),

          _buildInfoField(
            icon: Icons.email_outlined,
            label: 'E-mail',
            value: 'melton89@gmail.com',
          ),
          const SizedBox(height: 16),

          _buildInfoField(
            icon: Icons.phone_outlined,
            label: 'Phone number',
            value: '+1 201 555-0123',
          ),
          const SizedBox(height: 16),

          _buildInfoField(
            icon: Icons.home_outlined,
            label: 'Home address',
            value: '70 Rainey Street, Apartment 146, Austin TX 78701',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoField({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.grey[700], size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: valueColor ?? Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAccountInfoSection() {
    return Container(
      width: double.infinity,
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
            'Account info',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),

          // Account ID
          _buildInfoField(
            icon: Icons.account_circle_outlined,
            label: 'Account ID',
            value: 'TM789456123',
          ),
          const SizedBox(height: 16),

          // Member Since
          _buildInfoField(
            icon: Icons.calendar_today_outlined,
            label: 'Member since',
            value: 'January 15, 2023',
          ),
          const SizedBox(height: 16),

          // Account Status
          _buildInfoField(
            icon: Icons.verified_outlined,
            label: 'Account status',
            value: 'Verified',
            valueColor: Colors.green[600],
          ),
          const SizedBox(height: 16),

          // Subscription Plan
          _buildInfoField(
            icon: Icons.workspace_premium_outlined,
            label: 'Subscription',
            value: 'Premium Plan',
            valueColor: Colors.blue[600],
          ),
          const SizedBox(height: 20),

          // Account Actions
          _buildAccountActions(),
        ],
      ),
    );
  }

  Widget _buildAccountActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account actions',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),

        // Security Settings
        _buildActionTile(
          icon: Icons.security_outlined,
          title: 'Security & Privacy',
          subtitle: 'Manage password, 2FA, and privacy settings',
          onTap: () => _openSecuritySettings(),
        ),
        const SizedBox(height: 12),

        // Billing & Subscription
        _buildActionTile(
          icon: Icons.payment_outlined,
          title: 'Billing & Subscription',
          subtitle: 'View billing history and manage subscription',
          onTap: () => _openBillingSettings(),
        ),
        const SizedBox(height: 12),

        // Notification Settings
        _buildActionTile(
          icon: Icons.notifications_outlined,
          title: 'Notifications',
          subtitle: 'Customize your notification preferences',
          onTap: () => _openNotificationSettings(),
        ),
        const SizedBox(height: 12),

        // Data & Privacy
        _buildActionTile(
          icon: Icons.privacy_tip_outlined,
          title: 'Data & Privacy',
          subtitle: 'Download data, manage privacy controls',
          onTap: () => _openDataPrivacySettings(),
        ),
        const SizedBox(height: 20),

        // Sign Out Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _signOut(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[50],
              foregroundColor: Colors.red[700],
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.red[200]!),
              ),
            ),
            child: const Text(
              'Sign Out',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.grey[700], size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 24),
          ],
        ),
      ),
    );
  }

  void _editProfilePicture() {
    // Handle edit profile picture functionality
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile Picture'),
          content: const Text(
            'Choose how you want to update your profile picture',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle camera option
              },
              child: const Text('Camera'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle gallery option
              },
              child: const Text('Gallery'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _editPersonalInfo() {
    // Handle edit personal info functionality
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Personal Info'),
          content: const Text(
            'Personal information editing will be implemented here',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Account Info Section Action Handlers
  void _openSecuritySettings() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Security & Privacy'),
          content: const Text(
            'Here you can:\n'
            '• Change your password\n'
            '• Enable two-factor authentication\n'
            '• Manage privacy settings\n'
            '• View login history',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _openBillingSettings() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Billing & Subscription'),
          content: const Text(
            'Subscription Details:\n'
            '• Plan: Premium Plan\n'
            '• Next billing: February 15, 2025\n'
            '• Amount: \$9.99/month\n'
            '• Payment method: •••• 4532',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Manage'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _openNotificationSettings() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification Settings'),
          content: const Text(
            'Customize which notifications you receive:\n'
            '• Push notifications\n'
            '• Email updates\n'
            '• SMS alerts\n'
            '• Marketing communications',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Configure'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _openDataPrivacySettings() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Data & Privacy'),
          content: const Text(
            'Manage your data:\n'
            '• Download your data\n'
            '• Delete account\n'
            '• Privacy preferences\n'
            '• Data sharing settings',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Manage'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _signOut() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text(
            'Are you sure you want to sign out of your account?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle sign out logic
                _handleSignOut();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red[700]),
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  void _handleSignOut() {
    // Implement actual sign out logic here
    // This could include:
    // - Clearing user session
    // - Navigating to login page
    // - Clearing stored data
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Signed out successfully'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
