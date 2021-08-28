#!/bin/bash

#  powered by howhowwen

getLists=$@

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

function docker_check() {
  docker ps >/dev/null
  [[ "$?" != "0" ]] && exit_exception '請先檢查 Docker 是否安裝及正常啟用 ...'
  docker-compose --help >/dev/null
  [[ "$?" != "0" ]] && exit_exception '請先檢查 Docker-Compose 是否安裝及正常啟用 ...'
}

function stop_node() {
  [[ -z "$getLists" ]] && exit_exception '至少輸入一臺機器...'
  for node in ${getLists[@]}; do
    log_info "執行 $node 機器重置，請稍等 .."
    docker-compose stop $node 1>/dev/null
    [[ "$?" != "0" ]] && exit_exception '程序錯誤!!!! 請檢查 docker-compose.yml 檔案是否存在及內容是否正確 ...'
  done
  rm_node
}

function rm_node() {
  docker-compose rm -f 1>/dev/null
  [[ "$?" != "0" ]] && exit_exception '程序錯誤!!!! 請檢查 docker-compose.yml 檔案是否存在及內容是否正確 ...'
  restart_node
}

function restart_node() {
  docker-compose up -d 1>/dev/null
  [[ "$?" != "0" ]] && exit_exceptiou '程序錯誤!!!! 請檢查 docker-compose.yml 檔案是否存在及內容是否正確 ...'
  log_info "機器重置執行完畢"
}

docker_check
stop_node
