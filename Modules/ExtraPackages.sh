# AutoBuild Script Module by Hyy2001

ExtraPackages() {
Update=2020.09.13
Module_Version=V4.7.4

ExtraPackages_mkdir
while :
do
	cd $PKG_Dir
	clear
	Say="Extra Packages Script $Module_Version\n" && Color_B
	echo "1.SmartDNS"
	echo "2.AdGuardHome"
	echo "3.OpenClash"
	echo "4.Clash"
	echo "5.OpenAppFilter"
	echo "6.Passwall"
	echo "7.[依赖包]Passwall"
	echo "8.MentoHust"
	Say="w.Li2nOnline's Packages Source" && Color_B
	echo -e "\nq.返回\n"
	read -p '请从上方选择一个软件包:' Choose
	echo " "
	case $Choose in
	q)
		break
	;;
	w)
		SRC_NAME=lienol
		SRC_URL=https://github.com/xiaorouji/openwrt-package
		ExtraPackages_src-git
	;;
	1)
		grep "git.openwrt.org/project/luci.git" $Home/Projects/$Project/feeds.conf.default > /dev/null
		if [ $? -ne 0 ]; then
			PKG_NAME=smartdns
			PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/smartdns
			ExtraPackages_svn
			PKG_NAME=luci-app-smartdns
			if [ $Project == Lede ];then
				PKG_URL="-b lede https://github.com/pymumu/luci-app-smartdns"
			else
				PKG_URL="https://github.com/pymumu/luci-app-smartdns"
			fi
			ExtraPackages_git
			rm -rf $Home/Projects/$Project/tmp
		else
			Say="无法添加 SmartDNS" && Color_R
			sleep 2
		fi
	;;
	2)
		PKG_NAME=luci-app-adguardhome
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-app-adguardhome
		ExtraPackages_svn
	;;
	3)
		SRC_NAME=OpenClash
		SRC_URL="https://github.com/vernesong/OpenClash;master"
		ExtraPackages_src-git
	;;
	4)
		PKG_NAME=luci-app-clash
		PKG_URL=https://github.com/frainzy1477/luci-app-clash
		ExtraPackages_git
	;;
	5)
		PKG_NAME=OpenAppFilter
		PKG_URL=https://github.com/Lienol/openwrt-OpenAppFilter
		ExtraPackages_git
	;;
	6)
		PKG_NAME=luci-app-passwall
		PKG_URL=https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall
		ExtraPackages_svn
	;;
	7)
		clear
		for PD in `cat  $Home/Additional/Passwall_Dependency`
		do
			PKG_NAME=$PD
			PKG_URL=https://github.com/xiaorouji/openwrt-package/trunk/package/$PD
			ExtraPackages_svn
		done
	;;
	8)
		PKG_NAME=luci-app-mentohust
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-app-mentohust
		ExtraPackages_svn
		PKG_NAME=mentohust
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/mentohust
		ExtraPackages_svn
	;;
	esac
done
}

ExtraThemes() {
ExtraPackages_mkdir

while :
do
	cd $PKG_Dir
	clear
	echo -e "${Blue}添加第三方主题包 Page-1${White}\n"
	echo "1.luci-theme-argon"
	echo "2.luci-theme-argon-mc"
	echo "3.luci-theme-argon-dark-mod"
	echo "4.luci-theme-argon-light-mod"
	echo "5.luci-theme-bootstrap-mod"
	echo "6.luci-theme-rosy"
	echo "7.luci-theme-atmaterial"
	echo "8.luci-theme-darkmatter"
	echo "9.luci-theme-opentomcat"
	echo -e "\n${Blue}n.下一页$White"
	echo -e "\nq.返回\n"
	read -p '请从上方选择一个主题包:' Choose
	echo " "
	case $Choose in
	q)
		break
	;;
	n)
		ExtraThemes_P2
	;;
	1)
		PKG_NAME=luci-theme-argon
		if [ $Project == Lede ];then
			if [ -d $PKG_Home/lean/luci-theme-argon ];then
				rm -rf $PKG_Home/lean/luci-theme-argon
			fi
			PKG_URL=" -b 18.06 https://github.com/jerrykuku/luci-theme-argon"
			ExtraPackages_git
			mv $PKG_Dir/luci-theme-argon $PKG_Home/lean/luci-theme-argon
		else
			PKG_URL="https://github.com/jerrykuku/luci-theme-argon"
			ExtraPackages_git
		fi
	;;
	2)
		PKG_NAME=luci-theme-argon-mc
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-argon-mc
		ExtraPackages_svn
	;;
	3)
		PKG_NAME=luci-theme-argon-dark-mod
		PKG_URL=https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-theme-argon-dark-mod
		ExtraPackages_svn
	;;
	4)
		PKG_NAME=luci-theme-argon-light-mod
		PKG_URL=https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-theme-argon-light-mod
		ExtraPackages_svn
	;;
	5)
		PKG_NAME=luci-theme-bootstrap-mod
		PKG_URL=https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-theme-bootstrap-mod
		ExtraPackages_svn
	;;
	6)
		PKG_NAME=luci-theme-rosy
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-rosy
		ExtraPackages_svn
	;;
	7)
		PKG_NAME=luci-theme-atmaterial
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-atmaterial
		ExtraPackages_git
	;;
	8)
		PKG_NAME=luci-theme-darkmatter
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-darkmatter
		ExtraPackages_svn
	;;
	9)
		PKG_NAME=luci-theme-opentomcat
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-opentomcat
		ExtraPackages_svn
	;;
	esac
done
}

ExtraThemes_P2() {
while :
do
	clear
	echo -e "${Blue}添加第三方主题包 Page-2${White}\n"
	echo "1.luci-theme-opentomato"
	echo "2.luci-theme-Butterfly"
	echo "3.luci-theme-Butterfly-dark"
	echo "4.luci-theme-netgearv2"
	echo "5.luci-theme-edge"
	echo "6.luci-theme-argonv2"
	echo "7.luci-theme-argonv3"
	echo "8.luci-theme-infinityfreedom"
	echo -e "\nq.返回\n"
	read -p '请从上方选择一个主题包:' Choose
	echo " "
	case $Choose in
	q)
		break
	;;
	1)
		PKG_NAME=luci-theme-opentomato
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-opentomato
		ExtraPackages_svn
	;;
	2)
		PKG_NAME=luci-theme-Butterfly
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-Butterfly
		ExtraPackages_svn
	;;
	3)
		PKG_NAME=luci-theme-Butterfly-dark
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-Butterfly-dark
		ExtraPackages_svn
	;;
	4)
		PKG_NAME=luci-theme-netgearv2
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-netgearv2
		ExtraPackages_svn
	;;
	5)
		PKG_NAME=luci-theme-edge
		if [ $Project == Lede ];then
			PKG_URL=" -b 18.06 https://github.com/garypang13/luci-theme-edge"
		else
			PKG_URL=https://github.com/garypang13/luci-theme-edge
		fi
		ExtraPackages_git
	;;
	6)
		PKG_NAME=luci-theme-argonv2
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-argonv2
		ExtraPackages_svn
	;;
	7)
		PKG_NAME=luci-theme-argonv3
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-argonv3
		ExtraPackages_svn
	;;
	8)
		PKG_NAME=luci-theme-infinityfreedom
		PKG_URL=https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-theme-infinityfreedom
		ExtraPackages_svn
	;;
	esac
done
}

ExtraPackages_git() {
if [ -d $PKG_Dir/$PKG_NAME ];then
	rm -rf $PKG_Dir/$PKG_NAME
fi
git clone $PKG_URL $PKG_NAME > /dev/null 2>&1
if [ -f $PKG_Dir/$PKG_NAME/Makefile ] || [ -f $PKG_Dir/$PKG_NAME/README.md ];then
	Say="已添加 $PKG_NAME" && Color_Y
	rm -rf $PKG_Dir/$PKG_NAME/.git
else
	Say="未添加 $PKG_NAME" && Color_R
fi
sleep 2
}

ExtraPackages_svn() {
if [ -d $PKG_Dir/$PKG_NAME ];then
	rm -rf $PKG_Dir/$PKG_NAME
fi
svn checkout $PKG_URL $PKG_NAME > /dev/null 2>&1
if [ -f $PKG_Dir/$PKG_NAME/Makefile ] || [ -f $PKG_Dir/$PKG_NAME/README.md ];then
	Say="已添加 $PKG_NAME" && Color_Y
	rm -rf ./$PKG_NAME/.svn
else
	Say="未添加 $PKG_NAME" && Color_R
fi
sleep 2
}

ExtraPackages_src-git() {
grep "$SRC_NAME" $Home/Projects/$Project/feeds.conf.default > /dev/null
if [ $? -ne 0 ]; then
	cd $Home/Projects/$Project
	clear
	echo "src-git $SRC_NAME $SRC_URL" >> feeds.conf.default
	./scripts/feeds update $SRC_NAME
	./scripts/feeds install -a
	Enter
else
	Say="添加失败,无法重复添加!" && Color_R
	sleep 2
fi
}

ExtraPackages_mkdir() {
PKG_Home=$Home/Projects/$Project/package
if [ ! -d $PKG_Home/ExtraPackages ];then
		mkdir -p $PKG_Home/ExtraPackages
fi
PKG_Dir=$PKG_Home/ExtraPackages
}
