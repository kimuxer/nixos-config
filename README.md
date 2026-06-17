# nixos-config

这是一个基于 Nix Flakes 的个人 NixOS 配置仓库，使用 Home Manager 管理用户环境，并同时维护桌面主机和软路由两套配置。

## 项目目标

- 用声明式配置管理 NixOS 系统
- 统一管理桌面环境、终端、开发工具和常用软件
- 通过 Home Manager 管理用户级配置
- 使用 Flake 轻松切换不同主机配置

## 当前包含的配置

- 桌面主机：`nixdevbox`
- 软路由：`router`

## 目录说明

- [flake.nix](flake.nix) ：Flake 入口，定义所有主机配置
- [modules/desktop](modules/desktop) ：桌面主机配置
- [modules/router](modules/router) ：软路由主机配置
- [modules/home](modules/home) ：Home Manager 用户级模块
- [modules/shared](modules/shared) ：跨机器共享配置
- [secrets/secrets.yaml](secrets/secrets.yaml) ：SOPS 加密文件
- [scripts](scripts) ：辅助脚本

## 常用命令

### 重建桌面系统

```bash
sudo nixos-rebuild switch --flake .#nixdevbox
```

### 重建软路由

```bash
sudo nixos-rebuild switch --flake .#router --target-host root@192.168.10.1
```

### 更新 Flake 依赖

```bash
nix flake update
```

## 说明

这个仓库适合用于长期维护一套可复现、可版本控制的个人系统配置。你可以根据自己的机器和需求继续扩展 [modules](modules) 里的内容。
