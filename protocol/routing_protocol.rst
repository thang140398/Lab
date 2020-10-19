RIP (Routing Information Protocol)
==============================

Routing Information Protocol (RIP) là giao thức định tuyến vector khoảng cách (Distance Vector Protocol). RIP được sử dụng rộng rãi do tính chất đơn giản và tiện dụng của nó. RIP là giao thức định tuyến vector khoảng cách điển hình, là nó đều đặn gửi toàn bộ routing table ra các Router hàng xóm và các Router này sẽ phát tán ra tất cả Router bên cạnh đều đặn theo chu kỳ là 30 giây. RIP chỉ sử dụng metric là hop-count để tính ra tuyến đường tốt nhất tới mạng đích. Thuật toán mà RIP sử dụng để xây dựng nên routing table là Bellman-Ford.

RIP sử dụng hop-count như một thước đo định tuyến để tìm kiếm đường đi tốt nhất giữa hai điểm. Hop-count là số lượng Router mà một packet phải đi qua cho đến khi đến được địa chỉ đích. Để tránh tình trạng Lop vô tận thì RIP giới hạn Hop-count tối đa là 16. Khi một Router nhận được một thông tin láng giềng Router sẽ tăng chỉ số Hop lên 1 vì Router cũng xem nó là 1 Hop trên đường đi, nếu sau khi tăng chỉ số Hop lên 1 mà chỉ số này lớn hơn 15 thì Router xem như không tồn tại mạng đích trên tuyến đường này. 

**Giao thức RIP sử dụng một số timer sau:**

- RIP time Route update timer: là thời gian trao đổi thông tin định tuyến của Router với tất cả các active interface. Thông tin ở đây là toàn bộ bảng định tuyến và thởi gian định kỳ là 30s. 

- Routing invalid Timer: là khoảng thời gian xác định một tuyến đường invalid. Được bắt đầu nếu hết thời gian Hold time mà không nhận được update, sau khoảng thời gian đó Router sẽ gửi một update tới tất cả các Interface là tuyến đường đó đã invalid.

- Holddown timer: giá trị này được sử dụng khi có thông tin định tuyến bị thay đổi. Sau khi nhận thông tin thay đổi, Router đặt tuyến đường đó vào trạng thái hold-down. Điều này có nghĩa là Router không gửi quảng bá cũng như không nhận quảng bá về thông tin đó trong khoảng thời gian Hold down timer. Sau khoảng thời gian này Router mới nhận và gửi thông tin về tuyến đường đó. Điều này làm giảm thông tin sai mà Router học được. Giá trị mặc định là 180 giây. 

- Route flush timer: là khoảng thời gian được tính từ khi tuyến đường ở trạng thái không hợp lệ đến khi tuyến bị xoá khỏi bảng định tuyến. Giá trị Route invalid timer phải nhỏ hơn giá trị Route flush timer vì Router cần thông báo tới các Router bên cạnh của nó về trạng thái invalid của tuyến đường đó trước khi local routing được update. 

RIP có 2 phiên bản là, RIPv1 và RIPv2, RIPv2 thừa hưởng tất cả các ưu điểm của RIPv1 và khắc phục được những yếu điểm của RIPv1. Vì vậy,RIPv2 được sử dụng rộng rãi hơn RIPv1.

**RIPv1**

RIPv1 là giao thức định tuyến theo lớp địa chỉ. Khi RIP router nhận thông tin về một mạng nào đó từ một cổng, trong thông tin định tuyến không có thông tin về subnet mask đi kèm. Do đó, router sẽ lấy subnet mask của cổng để áp dụng cho địa chỉ mạng mà nó nhận được từ cổng này. Nếu subnet mask này không phù hợp thì nó sẽ lấy subnet mask mặc định theo lớp địa chỉ để áp dụng cho địa chỉ mạng mà nó nhận được.

RIPv1 yêu cầu tất cả các thiết bị trên mạng sử dụng cùng subnet mask, vì nó không chứa thông tin subnet mask trong các cập nhật định tuyến. Điều này được xem như Classful Routing.

**RIPv2**

RIPv2 cung cấp định tuyến cố định, truyền thông tin cố định và truyền thông tin subnet mask trong các cập nhật định tuyến. Điều này được gọi là Classless Routing. Với các giao thức định tuyến Classless, các mạng con khác nhau trong cùng một mạng có thể có các subnet mask khác nhau, điều này được gọi là thao tác subnet mask có chiều dài thay đổi VLSM (Variable-Length Subnet Masking).

Với phiên bản RIPv2 thì RIP đã trở thành giao thức định tuyến không theo lớp địa chỉ.

RIPv2 có hỗ trợ việc xác minh thông tin định tuyến. Chúng ta có thể cấu hình cho RIPv2 gửi và nhận thông tin xác minh trên cổng giao tiếp của router bằng mã hóa MD5 hay không mã hóa.

**So sánh**

RIPv1

- Định tuyến theo lớp địa chỉ

- Không gửi thông tin về subnet-mask trong thông tin định tuyến

- Không hỗ trợ VLSM, vì vậy tất cả các mạng trong hệ thống RIPv1 phải cùng subnet-mask

- Không có cơ chế xác minh thông tin định tuyến

- Gửi quảng bá theo địa chỉ 255.255.255.255

RIPv2

- Định tuyến không theo lớp địa chỉ

- Có gửi thông tin vế subnet-mask trong thông tin định tuyến

- Có hỗ trợ VLSM, nên các mạng trong hệ thống RIPv2 có thể có chiều dài subnet-mask khác nhau

- Có cơ chế xác minh thông tin định tuyến

- Gửi quảng bá theo địa chỉ 224.0.0.9 nên hiệu quả h
RIPv2

