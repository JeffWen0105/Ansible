


#### 要練習 Ansible 並控制多臺機器(叢集)的環境，一般透過 VM 虛擬機來模擬多台機器，不過缺點是如果沒有一台資源（CPU、RAM）較多的電腦很難達成，且執行速度相對慢很多，那如果想要練習又不想額外花錢買好的電腦去練習怎麼辦呢？

#### 好佳在 HowHowWen 幫你打造了客制化 container （ 模擬 RH294 紅帽課程練習環境 )， 可以快速創建環境、重置環境及一口氣控制 7 台叢集機器（ 1 Cores， 1G 機器都可以使用)，還不快手刀來使用  ~~


### 基本要求:


```
1. 需具備 Dokcer 及 Docker-compose 能力，如果不知道請自下方連結快去安裝八。
2. 支援 AMD 64、Ppc64le 及 ARM 64 不同核心 (如使用樹梅派請用 ARM 64bit OS 才能使用)
3. 如開啟 selinux 功能需暫停使用
```


* [Docker 介紹及安裝請點我](https://jeffwen0105.com/dokcer-%e8%b2%a8%e6%ab%83%e5%ae%b9%e5%99%a8%e5%85%a9%e4%b8%89%e4%ba%8b/) ～～


### 操作方式:

```
1. 下載下方 Docker-compose.yml，並存放置任意資料夾( lab_example )
2. 執行 docker-compose up -d ， 確認叢集均正常啟動
~~3. 執行 ssh  student@10.10.10.10 (密碼： redhat ) ，登入 workstation 機器~~
3.  新登入方式，使用 start.sh 腳本，快速登入 workstation 機器。
4.  /home/student/playground/labs 下目錄有課程範例。
5.  /home/student/playground/example 目錄下有配置好所有機器的inventory及ansible.cfg，可以做驗證測試。
ps.  請務必在 /home/student/playground 下的子目錄執行，否則停止叢集，將重置資料。
```

[Docker-compose.yml 下載請點我](https://jeffwen0105.github.io/Ansible/init/docker-compose.yml)

[start.sh 下載請點我](https://jeffwen0105.github.io/Ansible/init/start.sh)

### 進階操作:

```
1. 可以透過下方 howhowwen 寫的 reset 腳本指定特定機器重置
2. 下載後賦予執行權限 chmod +x reset.sh
3. 執行 ./reset.sh servera serverb  ， 即可重置 servera 及 serverb
ps.  如全部機器都要重置，請直接執行 docker-compose down && docker-compose up -d，比較快～～
```




[reset.sh 腳本下載請點我](https://jeffwen0105.github.io/Ansible/init/reset.sh)


### 客制化自己的執行環境:

```
0. howhowwen 盡可能打造與虛擬機相同環境：
    擁有 systemctl 能力、 所有機器公鑰均同步、 sudo 不用密碼、 開啟 ssh daemon 等功能，所以需要使用privileged權限。
1. 透過下方下載howhow的 Dockerfile 可自行修改，並客制化自己的環境。
```

[Dockerfile 下載請點我](https://jeffwen0105.github.io/Ansible/init/Dockerfile)


### 開放原始碼:

[GitHub 請點我 ..](https://github.com/JeffWen0105/Ansible)

[DockerHub 請點我 ..](https://hub.docker.com/r/jeffwen0105/ansible_server)

### 示範DEMO:

0. 測試機器規格

![](https://i.imgur.com/OIli6WR.png)

1. 下載 Docker-compose.yml 及 reset腳本 （可選）至任意目錄

![](https://i.imgur.com/VHVdTjP.png)

2. 執行 docker-compose up -d 啟動叢集

![](https://i.imgur.com/QcAzY1c.png)

3. 待叢集都啟動完畢後，即可使用 student 身份登入 workstation
*  ```ssh student@10.10.10.10``` ，密碼為： redhat
*ps.如果啟動docker的作業系統非原生Linux（ 使用Mac或是Windows 因為是透過虛擬化技術啟動Docker），無法直接透過輸入IP登入，請使用 docker exec -it 機器名 進入機器內～*

![](https://i.imgur.com/CEeB2mk.png)

4. 至 /home/student/playground/example 內使用 Ansible 測試所有機器狀態

* ```ansible all -m ping```

![](https://i.imgur.com/HL06U61.png)

5. 重置 serverb 及 serverc 機器

![](https://i.imgur.com/cQkVOuu.png)

6. 停止所有機器

![](https://i.imgur.com/EcfqB4t.png)




### 操作上限制:

```
0. 囿於是容器化技術，故與虛擬機擁有實際OS還是有些區別
1. 容器化的機器無法透過 ansible 執行 reboot 
2. 容器化的機器無法透過 ansible 執行 selinux
```

---




[![](https://i.imgur.com/sgdmN00.png)](https://buymeacoffee.com/jeffwen0105)
如果覺得內容還不錯，請我喝杯咖啡吧～


