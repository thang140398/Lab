#  **MISP**

*MISP-Malware Information Sharing Platform là nền tảng chia sẽ mối đe dọa mã nguồn mở*

## 1. Tải xuống và cài đặt

*Tham khảo tại `https://www.misp-project.org/download/`*

### Dùng shell script AutoMISP

`https://github.com/da667/AutoMISP`

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

![alt]()

```
sudo apt-get install python3 python-dev python3-dev \
     build-essential libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev zlib1g-dev \
     python-pip
```


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

```
Login: admin@admin.test
Password: admin
```

MISP yêu cầu đổi mật khẩu ngay sau khi đăng nhập

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2019-15-49.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2019-16-15.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2019-24-27.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2019-24-35.png)

## 2. Demo

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2020-46-06.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2020-46-47.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2020-48-01.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2020-48-40.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2020-58-32.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2020-58-52.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-08-36.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-09-15.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-29-25.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-29-55.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-30-04.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-30-36.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-31-41.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-33-55.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-36-32.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-36-49.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-37-13.png)

![alt](https://github.com/thang140398/Lab/blob/master/MISP/Picture%20for%20MISP.md/Screenshot%20from%202020-09-04%2021-38-39.png)

