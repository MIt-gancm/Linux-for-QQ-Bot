#!/bin/bash
python=$(python3 --version)
NODE=$(node -v)
QDZL=$(ls ./gancm/QDZL)
KWJ=$(ls ./gancm/KWJ)
##软件版本
RED='\e[1;31m' # 红
GREEN='\e[1;32m' # 绿
YELLOW='\e[1;33m' # 黄
BLUE='\e[1;34m' # 蓝
PINK='\e[1;35m' # 粉红
RES='\e[0m' # 清除颜色
##字体颜色
release_num=$(lsb_release -r --short)
release_os=$(lsb_release -i --short)
yingpan=$(free -mh)
os_start=$(date -d "$(awk -F. '{print $1}' /proc/uptime) second ago" +"%Y-%m-%d %H:%M:%S")
 ##信息定义
 if [ -d gancm ]; then
          echo -e "${GREEN}成功匹配到默认配置文件夹${RES}"
 else
          echo -e ${RED}未成功匹配到默认文件夹  尝试创建${RES}
          mkdir ./gancm
          mkdir ./gancm/KWJ
      if [ -d gancm ]; then
          echo -e "${GREEN}成功匹配到默认配置文件夹${RES}"
      else
           echo -e "${GREEN}创建失败${RES}"
      fi
 fi    
 
  if [ -d gancm/KWJ ]; then
          echo -e "${GREEN}成功匹配到默认空文件夹${RES}"
 else
          echo -e ${RED}未成功匹配到文件夹标准  尝试创建${RES}
          mkdir ./gancm/KWJ
      if [ -d gancm/KWJ ]; then
          echo -e "${GREEN}成功匹配到默认配置文件夹${RES}"
      else
           echo -e "${GREEN}创建失败${RES}"
      fi
 fi    
 
 if [ -d gancm/QDZL ]; then
          echo -e "${GREEN}成功匹配到默认启动指令文件夹${RES}"
 else
          echo -e ${RED}未成功匹配到文件夹标准  尝试创建${RES}
          mkdir ./gancm/QDZL
      if [ -d gancm/QDZL ]; then
          echo -e "${GREEN}成功匹配到默认配置文件夹${RES}"
      else
           echo -e "${GREEN}创建失败${RES}"
      fi
 fi    
 
 neofetch
 echo -e "
 
 
 
 
 
 
${YELLOW}####################################################################################${RES}

${GREEN}当前是${YELLOW}${release_os}${GREEN}系统版本号为：${YELLOW}${release_num}  ${GREEN}系统运行时间:${YELLOW}${os_start}${RES}  

硬盘占用信息:
${RED}${yingpan}${RES}
                                             -By MIt_gancm

${RED}即将开始运行${RES}
                                                        
${YELLOW}####################################################################################${RES}
 "
 sleep 2s
 ##系统信息
 echo 安装必要依赖 无论之前是否安装
 apt install neofetch whiptail -y
##if1
     OPTION=$(whiptail --title "选择安装" --menu "选择你要安装的机器人" 15 60 4 \
     "1" "小派蒙--Bot NB2" \
     "2" "Yunzai-Bot" \
     "0" "其他设置" 3>&1 1>&2 2>&3)
 
     exitstatus=$?
     if [ $OPTION = 1 ]; then
         echo $OPTION
             if [ -f /usr/bin/python3 ]; then
               echo -e "${YELLOW} $python ${RES} ${RED} \n 我们需要python大于3.8到3.10的版本 请仔细核对 五秒后开始继续安装${RES}"
               ##拥有Python
               pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
                   if (whiptail --title "Yes/No 安装方式" --yes-button "pipx" --no-button "pip"  --yesno "几乎没有什么区别-pipx安装失败请更换pip" 10 60) then
                   apt update && apt upgrade  
                   ##更新系统
                   apt install pipx  -y
                   # 安装pipx
                   pipx ensurepath  
                   # 把pipx添加到环境变量
                   pipx install nb-cli
                   nb self install nb-cli-plugin-littlepaimon  
                   # 安装小派蒙脚手架插件
                   nb paimon create  
                   # 创建小派蒙项目
                   cd LittlePaimon  
                   # LittlePaimon为你刚刚填写的项目目录名
                   nb paimon res  
                   # 给出的两次选择均保持默认(回车两次)
                   nb paimon run playwright install chromium --with-deps  
                   # 安装playwright相关依赖
                   else
                   apt update && apt upgrade  
                   # 更新系统
                   pip install nb-cli
                   nb self install nb-cli-plugin-littlepaimon  
                   # 安装小派蒙脚手架插件
                   nb paimon create  
                   # 创建小派蒙项目
                   cd LittlePaimon  
                   # LittlePaimon为你刚刚填写的项目目录名
                   nb paimon res  
                   # 给出的两次选择均保持默认(回车两次)
                   nb paimon run playwright install chromium --with-deps  
                   # 安装playwright相关依赖
                   fi                  
             else
               echo -e "${YELLOW}你貌似没有安装或正确安装python 正在为您安装 ${RES}"
               apt install python3 -y
               apt install python3-pip -y
               ##安装完成Python
               pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
                   if (whiptail --title "Yes/No 安装方式" --yes-button "pipx" --no-button "pip"  --yesno "几乎没有什么区别-pipx安装失败请更换pip" 10 60) then
                   sudo -i  
                   # 获取root权限，如果本来就以root权限登录，那可以跳过
                   apt update && apt upgrade  
                   # 更新系统
                   apt install pipx  -y
                   # 安装pipx
                   pipx ensurepath  
                   # 把pipx添加到环境变量
                   pipx install nb-cli
                   nb self install nb-cli-plugin-littlepaimon  
                   # 安装小派蒙脚手架插件
                   nb paimon create  
                   # 创建小派蒙项目
                   cd LittlePaimon  
                   # LittlePaimon为你刚刚填写的项目目录名
                   nb paimon res  
                   # 给出的两次选择均保持默认(回车两次)
                   nb paimon run playwright install chromium --with-deps  
                   # 安装playwright相关依赖
                   else
                   sudo -i  
                   # 获取root权限，如果本来就以root权限登录，那可以跳过
                   apt update && apt upgrade  
                   # 更新系统
                   pip install nb-cli
                   nb self install nb-cli-plugin-littlepaimon  
                   # 安装小派蒙脚手架插件
                   nb paimon create  
                   # 创建小派蒙项目
                   cd LittlePaimon  
                   # LittlePaimon为你刚刚填写的项目目录名
                   nb paimon res  
                   # 给出的两次选择均保持默认(回车两次)
                   nb paimon run playwright install chromium --with-deps  
                   # 安装playwright相关依赖
                   fi                  
             fi
      elif [ $OPTION = 2 ]; then
      if [ -f /usr/bin/npm ]; then
         if (whiptail --title "Yes/No 安装方式" --yes-button "github" --no-button "gitee"  --yesno "国外优先考虑github 国内优先考虑gitee" 10 60) then
         echo -e "${RED}Node.js（版本至少v16以上） Redis 请仔细核对 三秒后开始继续安装${RES}"
         sleep 3s
         echo -e "${GREEN}正在拉取gitee中Yunzai-Bot仓库${RES}"
         git clone --depth=1 -b main https://github.com/Le-niao/Yunzai-Bot.git
         sudo apt-get install chromium-browser
         cd Yunzai-Bot
         npm install pnpm -g
         pnpm install -P
         echo -e "${YELLOW}正在安装redis${RES}"
         echo -e "${GREEN}安装已完成 在Yunzai目录下使用node app 启动 ${RES}"
         else
         echo -e "${YELLOW}${NOD}}${RES}"
         echo -e "${RED}Node.js（版本至少v16以上） Redis 请仔细核对 三秒后开始继续安装${RES}"
         sleep 3s
         echo -e "${GREEN}正在拉取gitee中Yunzai-Bot仓库${RES}"
         git clone --depth=1 -b main https://gitee.com/Le-niao/Yunzai-Bot.git
         sudo apt-get install chromium-browser
         cd Yunzai-Bot
         npm install pnpm -g
         pnpm install -P
         echo -e "${YELLOW}正在安装redis${RES}"
         echo -e "${GREEN}安装已完成 在Yunzai目录下使用node app 启动 ${RES}"       
         fi
      else 
        echo -e "${RED}你貌似没有安装npm 正在为您安装${RES}"
         apt install npm -y
         npm config set registry https://registry.npm.taobao.org/
         npm install n -g
         n 16
         echo -e "${YELLOW}重启终端来完成安装 重启完成后重新运行脚本 ${RES}"     
      fi
      elif [ $OPTION = 0 ]; then
      if [ -d ./gancm/QDZL ]; then
          echo -e "${GREEN}成功匹配到默认启动配置文件${RES}"
      else
          mkdir ./gancm/QDZL
      fi
      echo 执行成功
      OPTIONQT=$(whiptail --title "选择" --menu "选择功能" 15 60 4 \
     "1" "增加脚本启动命令"  3>&1 1>&2 2>&3)
        if [ $OPTIONQT = 1  ]; then
             if [ "${QDZL}" = "${KWJ}" ]; then
          echo -e "${GREEN}这是第一次设置启动命令 故不删除${RES}"
     else
          rm -rfv /usr/bin/${QDZL}
          rm -rfv ./gancm/QDZL/*
     fi
     read -p "输入默认启动名:" cj
     cp ${0} /usr/bin/${cj}
     chmod 777 /usr/bin/${cj}
     touch ./gancm/QDZL/${cj}
     echo -e "接下来你可以通过使用${GREEN}${cj}${RES}来启动本脚本 \n 如果需要删除，请手动执行 ${RED}rm -rfv /usr/bin/${cj}${RES}"
        else
            echo 返回值为假 设置命令结束
        fi
 
     exitstatus=$?
      else
         echo 返回值为否
      echo 选项值为$OPTION
     fi
##fi1

