import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('启用通知'),
            value: true, // 假设你从状态中获取的通知启用状态
            onChanged: (bool value) {
              // 更新状态
            },
          ),
          ListTile(
            title: Text('地图样式'),
            subtitle: Text('选择地图显示样式'),
            onTap: () {
              // 打开地图样式选择器
            },
          ),
          ListTile(
            title: Text('语言'),
            subtitle: Text('简体中文'),
            onTap: () {
              // 打开语言选择器
            },
          ),
          Divider(),
          ListTile(
            title: Text('退出登录'),
            onTap: () {
              context.read<AuthProvider>().logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
