# **METABASE**

---

*Thực hành trên máy ảo Ubuntu Serve 20.04*

## 1. Cài đặt
*Chọn cách cài đặt bằng file jar

#### Kiem tra phien ban java
Metabase yêu cầu phiên bản java 8 hoặc cao hơn. Dùng lệnh để xem phiên bản java trên máy:
 ```
 java -version
 ```
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2020-47-06.png)

Nếu version nhỏ hơn 1.8 thì cần cài phiên bản cao hơn. Có thể tham khảo [tại đây](http://openjdk.java.net/install/) hoặc dùng lệnh:
 ```
 sudo apt-get install openjdk-8-jre
 ```
 ![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2020-29-12.png)
 
 #### Tải về Metabase và cài đặt
 Dùng lệnh:
 ```
 wget https://downloads.metabase.com/v0.36.4/metabase.jar
 ```
 ![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2020-55-03.png)

Từ terminal, dùng lệnh:
```
java -jar metabase.jar
```
Khi quá trình cài đặt hoàn tất:
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2021-50-12.png)
## 2. Một vài tính năng cơ bản
Sau khi cài đặt, có thể truy cập và Metabase server qua port 3000

Từ trình duyệt ở máy thật truy cập vào máy ảo qua port 3000
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2021-29-38.png)

Chọn ngôn ngữ
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2021-30-28.png)

Điền thông tin và tạo tài khoản admin
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2021-51-35.png)

Có thể kết nối đến database qua bước này. Ở đây bỏ qua
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2021-52-00.png)

Có cho phép Metabase thu thập một số thông tin để hoàn thiện sản phẩm hay không
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2021-52-09.png)

Ấn vào Take me to Metabase. Homepase như sau:
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2021-53-14.png)

Metabase có đi kèm tập dữ liệu mẫu là Sample Dataset
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2021-59-31.png)

Click Add a question ở phía trên
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-00-57.png)

Chọn Simple question
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-01-42.png)

Chọn bảng Order sẽ hiện ra các dữ liệu trong bảng
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-02-19.png)

Ví dụ muốn xem bao nhiêu đơn hàng được đặt với subtotal lớn hơn 40$ thì tạo filter như sau:
Ấn vào Filter, chọn Subtotal
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-04-14.png)

Chọn Greater than và điền 40
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-05-53.png)

Ấn Done và xem kết quả
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-06-22.png)

Tính tổng những đơn hàng đó, ấn vào Summarize, Done
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-08-31.png)

![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-08-38.png)

Để xem những đơn hàng đó đặt vào ngày nào, Ấn vào Summarize, Create at:
 ![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-13-23.png)


![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-14-17.png)

Xem dạng bảng
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-15-56.png)

Đổi sang loại biểu đồ khác, ấn vào Visualization, chọn loại loại biểu đồ
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-17-51.png)


![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-19-32.png)


![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-29-20.png)

Lưu lại question, ấn vào Save, điền tên và chọn Save
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-31-14.png)


![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-32-24.png)

Chọn Yes, please
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-32-34.png)

Tạo mới Dashboard, ấn Create new dashboard
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-33-09.png)

Điền các thông tin và Save lại
![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-52-53.png)


![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-53-15.png)


![alt](https://github.com/thang140398/Lab/blob/master/Metabase%20-%20Apache%20Superset/Picture%20for%20Metabase/Screenshot%20from%202020-08-21%2022-53-44.png)



 

