Định tuyến
===============


Các kiểu định tuyến
-------------------

**Thuật toán vector** 
(distance-vector routing protocols)

Dùng thuật toán Bellman-Ford. Chỉ định một con số, gọi là chi phí (hay trọng số), cho mỗi một liên kết giữa các node trong mạng. Chọn đường đi có tổng chi phí thấp nhất (là tổng các chi phí của các kết nối giữa các node được dùng).

Khi một node khởi động lần đầu, nó chỉ biết các node kề trực tiếp với nó, và chi phí trực tiếp để đi đến đó (thông tin này, danh sách của các đích, tổng chi phí của từng node, và bước kế tiếp để gửi dữ liệu đến đó tạo nên bảng định tuyến, hay bảng khoảng cách). Mỗi node, trong một tiến trình, gửi đến từng "hàng xóm" tổng chi phí của nó để đi đến các đích mà nó biết. Các node "hàng xóm" phân tích thông tin này, và so sánh với những thông tin mà chúng đang "biết"; bất kỳ điều gì cải thiện được những thông tin chúng đang có sẽ được đưa vào các bảng định tuyến của những "hàng xóm" này. Đến khi kết thúc, tất cả node trên mạng sẽ tìm ra bước truyền kế tiếp tối ưu đến tất cả mọi đích, và tổng chi phí tốt nhất.

Khi một trong các node gặp vấn đề, những node khác có sử dụng node hỏng này trong lộ trình của mình sẽ loại bỏ những lộ trình đó, và tạo nên thông tin mới của bảng định tuyến. Sau đó chúng chuyển thông tin này đến tất cả node gần kề và lặp lại quá trình trên. Cuối cùng, tất cả node trên mạng nhận được thông tin cập nhật, và sau đó sẽ tìm đường đi mới đến tất cả các đích mà chúng còn tới được.

**Thuật toán trạng thái kết nối**
(Link-state routing protocols)

Khi áp dụng các thuật toán trạng thái kết nối, mỗi node sử dụng dữ liệu cơ sở của nó như là một bản đồ của mạng với dạng một đồ thị. Để làm điều này, mỗi node phát đi tới tổng thể mạng những thông tin về các node khác mà nó có thể kết nối được, và từng node góp thông tin một cách độc lập vào bản đồ. Sử dụng bản đồ này, mỗi router sau đó sẽ quyết định về tuyến đường tốt nhất từ nó đến mọi node khác.

Thuật toán đã làm theo cách này là Dijkstra, bằng cách xây dựng cấu trúc dữ liệu khác, dạng cây, trong đó node hiện tại là gốc, và chứa mọi noded khác trong mạng. Bắt đầu với một cây ban đầu chỉ chứa chính nó. Sau đó lần lượt từ tập các node chưa được thêm vào cây, nó sẽ thêm node có chi phí thấp nhất để đến một node đã có trên cây. Tiếp tục quá trình đến khi mọi node đều được thêm.

Cây này sau đó phục vụ để xây dựng bảng định tuyến, đưa ra bước truyền kế tiếp tốt ưu, … để từ một node đến bất kỳ node khác trên mạng.

**So sánh**

Các giao thức định tuyến với thuật toán vector tỏ ra đơn giản và hiệu quả trong các mạng nhỏ, và đòi hỏi ít (nếu có) sự giám sát. Tuy nhiên, chúng không làm việc tốt, và có tài nguyên tập hợp ít ỏi, dẫn đến sự phát triển của các thuật toán trạng thái kết nối tuy phức tạp hơn nhưng tốt hơn để dùng trong các mạng lớn. Giao thức vector kém hơn với rắc rối về đếm đến vô tận.

Ưu điểm chính của định tuyến bằng trạng thái kết nối là phản ứng nhanh nhạy hơn, và trong một khoảng thời gian có hạn, đối với sự thay đổi kết nối. Ngoài ra, những gói được gửi qua mạng trong định tuyến bằng trạng thái kết nối thì nhỏ hơn những gói dùng trong định tuyến bằng vector. Định tuyến bằng vector đòi hỏi bảng định tuyến đầy đủ phải được truyền đi, trong khi định tuyến bằng trạng thái kết nối thì chỉ có thông tin về "hàng xóm" của node được truyền đi. Vì vậy, các gói này dùng tài nguyên mạng ở mức không đáng kể. Khuyết điểm chính của định tuyến bằng trạng thái kết nối là nó đòi hỏi nhiều sự lưu trữ và tính toán để chạy hơn định tuyến bằng vector.

Giao thức được định tuyến và giao thức định tuyến
--------------------------------------

*Sự nhầm lẫn thường xảy ra giữa "giao thức được định tuyến" và "giao thức định tuyến" ("routed protocols" và "routing protocols")*

**Giao thức được định tuyến** (routed protocols hay routable protocols)

Một giao thức đã được định tuyến là bất kỳ một giao thức mạng nào cung cấp đầy đủ thông tin trong địa chỉ tầng mạng của nó để cho phép một gói tin được truyền đi từ một máy chủ (host) đến máy chủ khác dựa trên sự sắp xếp về địa chỉ, không cần biết đến đường đi tổng thể từ nguồn đến đích. Giao thức đã được định tuyến định nghĩa khuôn dạng và mục đích của các trường có trong một gói. Các gói thông thường được vận chuyển từ hệ thống cuối đến một hệ thống cuối khác. Hầu như tất cả giao thức ở tầng 3 các giao thức khác ở các tầng trên đều có thể được định tuyến, IP là một ví dụ. Nghĩa là gói tin đã được định hướng (có địa chỉ rõ ràng)giống như lá thư đã được ghi địa chỉ rõ chỉ còn chờ routing (tìm đường đi đến địa chỉ đó)

Các giao thức ở tầng 2 như Ethernet là những giao thức không định tuyến được, vì chúng chỉ chứa địa chỉ tầng liên kết, không đủ để định tuyến: một số giao thức ở tầng cao dựa trực tiếp vào đây mà không có thêm địa chỉ tầng mạng, như NetBIOS, cũng không định tuyến được.

**Giao thức định tuyến** (routing protocols)

Giao thức định tuyến được dùng trong khi thi hành thuật toán định tuyến để thuận tiện cho việc trao đổi thông tin giữa các mạng, cho phép các router xây dựng bảng định tuyến một cách linh hoạt. Trong một số trường hợp, giao thức định tuyến có thể tự chạy đè lên giao thức đã được định tuyến: ví dụ, BGP chạy đè trên TCP: cần chú ý là trong quá trình thi hành hệ thống không tạo ra sự lệ thuộc giữa giao thức định tuyến và đã được định tuyến.

**Danh sách các giao thức định tuyến**

1. Giao thức định tuyến trong

- Router Information Protocol (RIP)

- Open Shortest Path First (OSPF)

- Intermediate System to Intermediate System (IS-IS)

*Hai giao thức sau đây thuộc sở hữu của Cisco, và được hỗ trợ bởi các router Cisco hay những router của những nhà cung cấp mà Cisco đã đăng ký công nghệ:*

- Interior Gateway Routing Protocol (IGRP)

- Enhanced IGRP (EIGRP)

2. Giao thức định tuyến ngoài

- Exterior Gateway Protocol (EGP)

- Border Gateway Protocol (BGP)

- Constrained Shortest Path First (CSPF)
