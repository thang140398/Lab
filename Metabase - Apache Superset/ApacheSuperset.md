# **Apache Superset**
___
*Ubuntu server 20.04 (máy ảo)*
# 1. Cài đặt
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

# 2. Một số tính năng cơ bản

Ấn vào Sources > Databases. Tất cả database hiện có sẽ hiện ra. Chức năng thêm database ở ![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2013-06-38.png) góc trên bên phải. Hiện tại chỉ có một database là example

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2011-37-53.png)

Ấn vào Sources > Tables. Tất cả các table thuộc các database hiện có sẽ hiện ra.  Chức năng thêm bảng ở ![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2013-06-38.png) góc trên bên phải.

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2011-44-34.png)

Ấn vào table "enegy_usage" để tương tác với dữ liệu trong table đó. Hiện tại nó đang chạy truy vấn tính tổng số row của table và hiện kết quả là 85

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2011-47-55.png)

Ấn vào biểu tượng như sau và chọn View samples để xem toàn bộ dữ liệu trong bảng. Bảng này thể hiện các nguồn năng lượng (source), đối tượng, mục đích sử dụng (target) và giá trị (value)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2011-53-47.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2011-54-00.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2011-55-23.png)

Sửa truy vấn để xem nguồn năng lượng nào được dùng nhiều nhất và giá trị là bao nhiêu: sửa ở bên trái
- METRICS chọn SUM(VALUE)
- GROUP BY chọn source

Ấn RUN QUEQUE ở giữa hoặc RUN ở góc trên bên trái để chạy

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-16-35.png) 

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-17-38.png)

Chỉ lấy 20 nguồn có giá trị lớn nhất: ROW LIMITE điền 20

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-19-03.png)

Chỉ lấy những đối tượng có value nằm trong khoảng 10 đến 20: ở FINTER chọn SUM(value), điền >10, SAVE, tương tự với < 20, và chạy

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-21-36.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-22-57.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-24-46.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-25-17.png)

Chọn cách thể hiện kết quả khác ở VISUALIZATION TYPE, chọn kiểu mong muốn. Ở đây chọn BAR CHART, và chạy:

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-26-10.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-27-44.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-28-25.png)

Tab Customize có thể sửa đổi các mục để hiển thị như mong muốn:

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-32-42.png)

Ấn vào View queue để xem truy vấn đã được thực hiện

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-33-35.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-33-46.png)

Ấn Download as image để tải xuống kết quả dưới dạng ảnh

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-35-28.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-35-04.png)

Có thể lưu lại queue. Trong Superset, mỗi queue được lưu gọi là Slice

Ấn SAVE để lưu queue. Đặt tên và chọn dashboard để lưu vào. Ở đây tạo mới Dashboard 1

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-40-57.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-41-21.png)

Ấn Dashboard, chọn Dashboard 1 vừa tạo, để xem lại queue vừa lưu 

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-43-05.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-43-34.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-43-49.png)

Ấn vào ![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-58-40.png) để chỉnh sửa dashboard theo ý muốn

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-58-13.png)

Để cung cấp Dashboard 1 cho những người dùng khác, bấm vào Draft, nó sẽ chuyển thành Published

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-53-32.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Apache%20Superset%202/Screenshot%20from%202020-08-23%2012-53-39.png)



