# ** Apache Superset **
___
*Ubuntu server 20.04 (máy ảo)*

### Python virtualenv
Cài môi trường ảo:
```
pip3 install virtualenv
```
Nếu chưa có pip3 thì cài đặt pip3 bằng lệnh
```
sudo apt update
sudo apt install python3-pip
```
Kiểm tra
```
pip3 --version
```
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset/Screenshot%20from%202020-08-22%2023-15-03.png)

Tiếp tục cài và kích hoạt môi trường ảo:
```
python3 -m venv venv
. venv/bin/activate
```
Nếu có lỗi thì có thể phải cài đặt:
```
sudo apt-get install python3-venv
```

### Setuptools và pip 
Nâng lên thư viện pip và setuptools mới nhất:
```
pip install --upgrade setuptools pip
```
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset/Screenshot%20from%202020-08-22%2023-24-56.png)

### Cài đặt và khởi tạo Superset
1. Cài đặt superset
```
pip install apache-superset
```
2. Khởi tạo database
```
superset db upgrade
```
3. Tạo tài khoản admin
```
export FLASK_APP=superset
superset fab create-admin
```
Ở đây tạo tài khoản tên `admin`, mật khẩu `admin`
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset/Screenshot%20from%202020-08-22%2023-34-14.png)

4. Tải dữ liệu example
```
superset load_examples
```
5. Tạo roles và permissions
```
superset init
```
6. Chạy webserver với interface và port mong muốn
```
superset run -h 0.0.0.0 -p 8088 --with-threads --reload --debugger
```
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset/Screenshot%20from%202020-08-23%2000-34-48.png)

Nếu không có tham số -h thì server chỉ cho phép truy cập từ localhost. Khi muốn tắt thì Ctrl+C

Từ trình duyệt máy thật truy cập vào 
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset/Screenshot%20from%202020-08-23%2000-36-15.png)

Đăng nhập bằng tài khoản admin vừa tạo ở trên
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset/Screenshot%20from%202020-08-23%2000-36-24.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset/Screenshot%20from%202020-08-23%2000-36-42.png)
 


## Cài Apache Superset bằng cách dùng Docker
```
git clone https://github.com/apache/incubator-superset/
cd incubator-superset
docker-compose up
```
Vậy là có thể truy cập vào database qua port 8088 với tài khoản `admin` mật khẩu `admin`
Khi muốn tắt
```
docker-compose stop
```
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset/Screenshot%20from%202020-08-23%2001-32-53.png)

Lần sau muốn bật lại thì chỉ cần dùng lệnh
```
docker-compose start
```
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset/Screenshot%20from%202020-08-23%2001-27-56.png)

