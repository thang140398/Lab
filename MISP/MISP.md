#  **MISP**

*MISP-Malware Information Sharing Platform là nền tảng chia sẽ mối đe dọa mã nguồn mở*

## 1. Tải xuống và cài đặt

*Tham khảo tại `https://www.misp-project.org/download/`*

### Dùng shell script AutoMISP

`https://github.com/da667/AutoMISP`

*Ubuntu 18.04.5*

Lấy shell script từ địa chỉ trên về

```
wget https://raw.githubusercontent.com/da667/AutoMISP/master/auto-MISP-ubuntu.sh
```

Chạy
```
chmod +x auto-MISP-ubuntu.sh
./auto-MISP-ubuntu.sh
```

Trong quá trình cài đặt nếu lỗi thì check file log

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP%202/Screenshot%20from%202020-09-03%2019-16-14.png)

```
nano /var/log/misp_install.log
```

Một số lỗi có thể gặp và cách sửa

*error: command 'x86_64-linux-gnu-gcc' failed with exit status 1* 

*error: fuzzy.h: No such file or directory*

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP%202/Screenshot%20from%202020-09-03%2017-07-11.png)

```
sudo apt-get install python3 python-dev python3-dev \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python-pip
```

```
apt-get -y install libfuzzy-dev
```

*gnutls_handshake() failed: Error in the pull function*

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP%202/Screenshot%20from%202020-09-03%2017-24-46.png)

```
 apt-get -y install build-essential nghttp2 libnghttp2-dev libssl-dev

```

*The directory '/home/u/.cache/pip/http' or its parent directory is not owned by the current user and the cache has been disabled. Please check the permissions and owner of that directory. If executing pi$...*

*The directory '/home/u/.cache/pip' or its parent directory is not owned by the current user and caching wheels has been disabled. check the permissions and owner of that directory. If executing pip with $...*

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP%202/Screenshot%20from%202020-09-03%2021-23-25.png)

Đổi thành chạy bằng người dùng root và chạy lại script

```
sudo su -
bash auto-MISP-ubuntu.sh
```

*fatal: destination path 'misp-modules' already exists and is not an empty directory*

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP%202/Screenshot%20from%202020-09-06%2015-49-39.png)

Trường hợp này cần xóa folder misp-modules ở vị trí `/usr/local/src/misp-modules` 

Sau khi cài đặt vào trình duyệt truy cập địa chỉ ip của host cài đặt MISP


### Dùng Docker containers

*MISP docker container cung cấp bởi Ventz Petkov*


#### Build Docker container


```
git clone https://github.com/harvard-itsecurity/docker-misp.git
cd docker-misp
sudo ./build.sh
```

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2019-28-51.png)

#### Start container

```
docker run -it --rm \
    -v $docker-root/misp-db:/var/lib/mysql \
    harvarditsecurity/misp /init-db
```

Nếu bị lỗi như sau thì chạy thay `$docker-root` bằng `/$USER`

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2019-50-17.png)

```
docker run -it --rm \
    -v /$USER/misp-db:/var/lib/mysql \
    harvarditsecurity/misp /init-db
```

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2019-46-49.png)


Tùy theo ở trên chạy `$docker-root` hay `/$USER` để chạy một trong 2 lệnh sau (chỉ khác `$docker-root` và `/$USER`)

```
sudo docker run -it -d \
    -p 443:443 \
    -p 80:80 \
    -p 3306:3306 \
    -p 6666:6666 \
    -v $docker-root/misp-db:/var/lib/mysql \
    harvarditsecurity/misp
```

hoặc

```
sudo docker run -it -d \
    -p 443:443 \
    -p 80:80 \
    -p 3306:3306 \
    -p 6666:6666 \
    -v /$USER/misp-db:/var/lib/mysql \
    harvarditsecurity/misp
```

Nếu bị lỗi port đã được dùng bởi tiến trình khác như sau 

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2019-47-59.png)

Thì đổi port ở lệnh trên dòng thứ 2 port 443 (trước dấu : , đây là docker port) thành một port khác, ở đây đổi thành 445

```
sudo docker run -it -d \
    -p 445:443 \
    -p 80:80 \
    -p 3306:3306 \
    -p 6666:6666 \
    -v /$USER/misp-db:/var/lib/mysql \
    harvarditsecurity/misp
```

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2019-48-17.png)

#### Truy cập bằng trình duyệt web qua localhost theo port ở trên

```
https://localhost:445
```

## 2. Demo

Truy cập qua localhost hoặc địa chỉ của máy ảo cài đặt MISP
Đăng nhập với tài khoản và mật khẩu như sau

```
Login: admin@admin.test
Password: admin
```



![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2010-55-04.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2010-56-04.png)


MISP yêu cầu đổi mật khẩu ngay sau khi đăng nhập


![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2010-56-42.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2010-57-24.png)

Bấm tab Home là nơi tất cả Event được hiển thị

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2010-58-09.png)

Sync Actions > List Feeds để xem danh sách nguồn cung cấp dữ liệu

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-27-10.png)

Hiện có hai nguồn cung cấp dữ liệu đi kèm với MISP

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-27-20.png)

Ấn Load default feed metadata, có tới 60 nguồn cung cấp 

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-27-41.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-27-45.png)

Bật nguồn cung cấp dữ liệu để chúng hoạt động 


![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-27-53.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-27-58.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-28-04.png)

Ấn Fetch and store all feed data, quay lại Home

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-35-27.png)



![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-37-39.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2011-37-46.png)


Administration > Jobs 

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2013-02-22.png)

View Event 

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-17-02.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-17-11.png)

Add Event 

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-26-10.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-26-15.png)

Bấm vào  ![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-26-26.png) 

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-27-43.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-28-10.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-29-23.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-30-00.png)



Administration > Server Setting & Maintenance  

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-30-35.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-30-39.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP/Screenshot%20from%202020-09-07%2012-30-56.png)


