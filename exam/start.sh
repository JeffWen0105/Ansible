#! /bin/bash

#  powered by howhowwen


function log_info() {
  DATE=$(date "+%Y-%m-%d %H:%M:%S")
  echo -e "\033[32m$DATE [INFO]: $1 \033[0m"

}

function log_err() {
  DATE=$(date "+%Y-%m-%d %H:%M:%S")
  echo -e "\033[31m$DATE [ERROR]: $1 \033[0m"
}


function exit_exception() {
  log_err "$1" && exit 1
}

function start_node() {
  docker-compose up -d 2>/dev/null
  [[ "$?" != "0" ]] && exit_exceptiou '程序錯誤!!!! 請檢查 docker-compose.yml 檔案是否存在及內容是否正確 ...'
  log_info "開機完畢...準備登入 Workstation 操作機" && into_node
}



function into_node() {
  info
  docker-compose exec  --user student -w /home/student/playground/example workstation /bin/bash
  [[ "$?" != "0" ]] && exit_exceptiou '程序錯誤!!!! 請檢查 docker-compose.yml 檔案是否存在及內容是否正確 ...'
  
}

function info(){
    log_info "小提醒!!\n          @@@@  請先執行 => ' ansible all -m ping '，檢視所有機器均正常  @@@@       \n"
    log_info "Let 's Play ~~~~~"
}


start_node
