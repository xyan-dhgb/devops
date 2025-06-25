## **Tổng Quan về Điện Toán Đám Mây (Cloud Computing)**

### **Điện toán đám mây là gì?**

- Điện toán đám mây là việc sử dụng một mạng lưới các máy chủ từ xa được lưu trữ trên Internet để lưu trữ, quản lý và xử lý dữ liệu, thay vì sử dụng máy chủ cục bộ hoặc máy tính cá nhân.
- So với mô hình On-Premise (tự sở hữu), khi sử dụng nhà cung cấp đám mây (Cloud Provider), người khác sẽ sở hữu và thuê nhân sự IT, chúng ta chịu trách nhiệm cấu hình dịch vụ đám mây và mã nguồn, còn lại họ sẽ lo.

### **Sự Tiến Hóa của Cloud Hosting**

- Từ máy chủ vật lý riêng biệt (Dedicated Server) đến Máy chủ riêng ảo (VPS) giúp tận dụng tài nguyên tốt hơn, sau đó là Shared Hosting (chia sẻ máy vật lý giữa hàng trăm doanh nghiệp) với chi phí rẻ nhưng chức năng hạn chế.
- **Cloud Hosting** hiện nay sử dụng nhiều máy vật lý hoạt động như một hệ thống duy nhất, được trừu tượng hóa thành các dịch vụ đám mây. Nó mang lại tính **linh hoạt, khả năng mở rộng, bảo mật, hiệu quả chi phí và khả năng cấu hình cao**

### **Sự tiến Hóa của Điện Toán (Computing)**

- **Dedicated (Máy chủ chuyên dụng)**: Một máy chủ vật lý được sử dụng hoàn toàn bởi một khách hàng. Thường gây lãng phí tài nguyên và khó mở rộng.
- **VMs (Máy ảo)**: Chạy nhiều máy ảo trên một máy vật lý, được quản lý bởi **Hypervisor**. Chia sẻ máy vật lý giữa nhiều khách hàng, tận dụng tốt hơn.
- **Containers (Container)**: Một máy ảo chạy nhiều container. **Docker Daemon** là lớp phần mềm cho phép chạy các container. Container hiệu quả hơn máy ảo vì chia sẻ cùng hệ điều hành cơ bản, cho phép nhiều ứng dụng chạy cạnh nhau mà không xung đột.
- **Functions (Hàm/Serverless Compute)**: Các máy ảo được quản lý chạy các container được quản lý. Được gọi là **Serverless Compute**. Chúng ta chỉ cần tải một đoạn mã lên, chọn bộ nhớ và thời gian chạy. **Chỉ trả tiền cho thời gian mã chạy**, máy ảo chỉ chạy khi có mã để thực thi. Rất hiệu quả về chi phí.

### Các loại điện toán

- **SaaS (Software as a Service)**: Dành cho **Khách hàng.** Sản phẩm được quản lý bởi nhà cung cấp dịch vụ (ví dụ: Salesforce, Microsoft 365). chúng ta không cần lo lắng về việc bảo trì dịch vụ15.
- **PaaS (Platform as a Service)**: Dành cho **Nhà phát triển.** Tập trung vào triển khai và quản lý ứng dụng của chúng ta (ví dụ: Heroku, AWS Elastic Beanstalk). Không cần lo lắng về việc cung cấp, cấu hình phần cứng hoặc hệ điều hành.
- **IaaS (Infrastructure as a Service)**: Dành cho **Quản trị viên.** Cung cấp các khối xây dựng cơ bản cho IT đám mây, bao gồm quyền truy cập vào tính năng mạng, máy tính và không gian lưu trữ dữ liệu (ví dụ: Microsoft Azure, AWS, Oracle Cloud). chúng ta không cần lo lắng về nhân sự IT, trung tâm dữ liệu và phần cứng.

### **Amazon Web Services (AWS) là gì?**

- Amazon gọi dịch vụ nhà cung cấp đám mây của họ là **Amazon Web Services (AWS).**

### **Nhà Cung Cấp Dịch Vụ Đám Mây (CSP) là gì?**

- Một CSP (Cloud Service Provider) là công ty cung cấp nhiều dịch vụ đám mây (hàng chục đến hàng trăm), có thể kết nối với nhau để tạo kiến trúc đám mây.
- Các dịch vụ này có thể truy cập qua API thống nhất (ví dụ: AWS API) và sử dụng **thanh toán theo giờ hoặc giây (metered billing).**
- CSP cung cấp **Infrastructure as a Service (IaaS)** và các dịch vụ tự động hóa thông qua **Infrastructure as Code (IaC).**
- Cảnh Quan các CSP:
    - **Tier-1 (Top Tier)**: Các nhà cung cấp đi đầu thị trường, cung cấp rộng rãi, tích hợp mạnh mẽ giữa các dịch vụ và được công nhận rộng rãi trong ngành, bao gồm **AWS, Microsoft Azure, Google Cloud Platform (GCP), và Alibaba Cloud.**
        - AWS là một **người dẫn đầu** trong Gartner Magic Quadrant cho Cloud Infrastructure and Platform Services tính đến tháng 7 năm 2021.

### **Các Dịch Vụ Đám Mây Phổ Biến**

- Một nhà cung cấp dịch vụ đám mây có thể có hàng trăm dịch vụ.
- Bốn loại dịch vụ đám mây cốt lõi (4 core cloud service offerings) cho Infrastructure as a Service (IaaS) là:
    - **Compute (Máy tính ảo)**
    - **Storage (Ổ cứng ảo)**
    - **Databases (Cơ sở dữ liệu ảo)**
    - **Networking (Mạng ảo)**

### **Mô Hình Triển Khai Điện Toán Đám Mây**

- **Public Cloud**: Mọi thứ được xây dựng trên CSP (ví dụ: Dropbox, Slack). Có thể được hiểu là **Cloud-Native** hoặc **Cloud First**
- **Private Cloud (On-Premise)**: Mọi thứ được xây dựng trong các trung tâm dữ liệu của công ty.
- **Hybrid Cloud**: Kết hợp cả On-Premise và Cloud Service Provider (ví dụ: Deloitte, CIBC, CPP Investment Board).
- **Cross-Cloud (Multi-cloud)**: Sử dụng nhiều nhà cung cấp đám mây (ví dụ: Amazon EKS, Azure Arc, GCP Kubernetes Engine)
- 

### **Lợi Ích của Đám Mây**

- **Agility (Nhanh nhẹn)**: Tăng tốc độ và sự linh hoạt, khởi chạy tài nguyên trong vài phút.
- **Pay-as-you-go pricing (Thanh toán theo mức sử dụng)**: Không có chi phí trả trước, chỉ trả tiền cho những gì chúng ta tiêu thụ theo giờ, phút hoặc giây.
- **Economy of scale (Kinh tế theo quy mô)**: Hàng nghìn khách hàng chia sẻ chi phí để tiết kiệm lớn.
- **Global Reach (Phạm vi toàn cầu)**: Triển khai ứng dụng trên toàn thế giới trong vài phút, giảm độ trễ.
- **Security (Bảo mật)**: Nhà cung cấp đám mây chịu trách nhiệm về bảo mật vật lý; dịch vụ đám mây an toàn theo mặc định.
- **Reliability (Độ tin cậy)**: Sao lưu dữ liệu, khôi phục sau thảm họa, sao chép dữ liệu, và khả năng chịu lỗi.
- **High Availability (Tính sẵn sàng cao)**: Đảm bảo dịch vụ luôn khả dụng (không có điểm lỗi đơn lẻ).
- **Scalability (Khả năng mở rộng)**: Tăng hoặc giảm tài nguyên và dịch vụ dựa trên nhu cầu.
- **Elasticity (Độ co giãn)**: Tự động điều chỉnh quy mô trong các đợt tăng và giảm nhu cầu.

## **Cơ Sở Hạ Tầng Toàn Cầu của AWS**

### **AWS Global Infrastructure là gì**

- Cơ sở hạ tầng toàn cầu của AWS là phần cứng và trung tâm dữ liệu được **phân phối toàn cầu và được kết nối vật lý với nhau** để hoạt động như một tài nguyên lớn cho người dùng cuối.
- Bao gồm: 25 Vùng (Regions) đã ra mắt, 81 Vùng sẵn sàng (Availability Zones), 108 Địa điểm kết nối trực tiếp (Direct Connection Locations), hơn 275 Điểm hiện diện (Points of Presence), 11 Vùng cục bộ (Local Zone), 17 Vùng bước sóng (Wavelength Zones).

### **Vùng (Regions)**

- Các Vùng là các **vị trí địa lý riêng biệt** bao gồm một hoặc nhiều Vùng sẵn sàng.
- Mỗi Vùng được **cô lập vật lý** và độc lập với các Vùng khác về vị trí, điện năng và cấp nước.
- Khi chọn Vùng, cần xem xét: Quy định tuân thủ, chi phí dịch vụ, dịch vụ AWS có sẵn và khoảng cách/độ trễ đến người dùng cuối.
- 

### **Vùng Sẵn Sàng (Availability Zones - AZs)**

- Mỗi Vùng có nhiều Vùng sẵn sàng.
- Một AZ được tạo thành từ **một hoặc nhiều trung tâm dữ liệu**
- Tất cả các AZ trong một Vùng AWS được kết nối với nhau thông qua mạng có băng thông cao, độ trễ thấp, dư thừa hoàn toàn, cáp quang metro chuyên dụng
- Tất cả lưu lượng truy cập giữa các AZ **đều được mã hóa**
- Các AZ cách nhau trong phạm vi **100 km (60 dặm)**
- Khi chúng ta chạy workload trên nhiều AZ, ứng dụng của chúng ta sẽ **được cô lập và bảo vệ tốt** hơn khỏi các sự cố như mất điện, sét đánh, lốc xoáy, động đất, v.v.

### **Khả năng Chịu Lỗi (Fault Tolerance)**

- **Fault Domain (Miền lỗi)**: Là **một phần của mạng dễ bị tổn thương** nếu một thiết bị hoặc hệ thống quan trọng bị lỗi. Mục đích là để l**ỗi không lan truyền ra ngoài miền đó, giới hạn thiệt hại.**
- Mỗi Vùng Amazon được thiết kế để **cô lập hoàn toàn** khỏi các Vùng Amazon khác để đạt được khả năng chịu lỗi và ổn định cao nhất.
- Mỗi AZ được cô lập và được thiết kế như một **khu vực lỗi độc lập** (independent failure zone)

### **Mạng lưới Toàn Cầu của AWS (AWS Global Network)**

- Đại diện cho sự kết nối giữa các thành phần của AWS Global Infrastructure. Nó giống như một đường cao tốc riêng, nơi mọi thứ có thể di chuyển rất nhanh giữa các trung tâm dữ liệu

### **Điểm Hiện Diện (Point of Presence - PoP)**

- Là một vị trí trung gian giữa Vùng AWS và người dùng cuối, thường là trung tâm dữ liệu hoặc tập hợp phần cứng do AWS hoặc đối tác tin cậy sở hữu, được sử dụng để **phân phối nội dung hoặc tải lên nhanh chóng (Edge Locations** và **Regional Edge Caches**)**.**
- **Edge Locations** là các **trung tâm dữ liệu lưu trữ bản sao đã lưu vào bộ nhớ cache** của các tệp phổ biến nhất (ví dụ: trang web, hình ảnh, video) để giảm khoảng cách phân phối đến người dùng cuối
- Các dịch vụ AWS sử dụng PoP cho phân phối nội dung hoặc tải lên nhanh chóng bao gồm **Amazon CloudFront (CDN), Amazon S3 Transfer Acceleration và AWS Global Accelerator**

### **AWS Direct Connect**

- Là một **kết nối riêng/chuyên dụng** giữa trung tâm dữ liệu, văn phòng, địa điểm co-location của chúng ta và AWS.
- Giúp giảm chi phí mạng và tăng băng thông, cung cấp trải nghiệm mạng ổn định hơn so với kết nối Internet thông thường


### **Vùng cục bộ (Local Zones)**

- Các trung tâm dữ liệu nằm **rất gần khu vực đông dân cư** để cung cấp hiệu suất độ trễ thấp (ví dụ: 7ms) cho khu vực đó
- Mục đích là hỗ trợ các ứng dụng đòi hỏi cao và nhạy cảm với độ trễ (ví dụ: Media & Entertainment, Electronic Design Automation, Ad-Tech, Machine Learning)

### **Vùng bước sóng (Wavelength Zones)**

- Cho phép **điện toán biên (edge-computing) trên mạng 5G.** Các ứng dụng sẽ có độ trễ cực thấp vì chúng nằm gần người dùng nhất có thể.

### **Tính bền vững (Sustainability)**

- Mục tiêu bền vững của AWS Cloud tập trung vào năng lượng tái tạo, hiệu quả đám mây, và quản lý nước**41**.

### **AWS Outposts**

- Là một dịch vụ được quản lý hoàn toàn cung cấp **cùng cơ sở hạ tầng, dịch vụ, API và công cụ AWS tới trung tâm dữ liệu**, không gian co-location hoặc cơ sở tại chỗ của chúng ta, mang lại trải nghiệm hybrid nhất quán.
- Về cơ bản, AWS Outposts là một **giá máy chủ vật lý chạy cơ sở hạ tầng AWS tại vị trí vật lý của chúng ta**, cho phép dữ liệu của chúng ta lưu trú ở nơi Outpost vật lý nằm

## **Thuật Ngữ Kiến Trúc Đám Mây và Tính Liên Tục Kinh Doanh**

### **Kiến trúc sư đám mây (Cloud Architect)**

- Là một kiến trúc sư giải pháp tập trung vào việc thiết kế các giải pháp kỹ thuật sử dụng dịch vụ đám mây
- Cần hiểu và tính toán các thuật ngữ sau trong kiến trúc: **Tính sẵn sàng (Availability), Khả năng mở rộng (Scalability), Độ co giãn (Elasticity), Khả năng chịu lỗi (Fault Tolerance), Khôi phục sau thảm họa (Disaster Recovery)**

### **Tính sẵn sàng cao (High Availability)**

- Khả năng dịch vụ của chúng ta duy trì hoạt động bằng cách đảm bảo **không có điểm lỗi đơn lẻ** và/hoặc đảm bảo một mức hiệu suất nhất định
- Chạy workload của chúng ta trên nhiều **Vùng sẵn sàng** đảm bảo rằng nếu 1 hoặc 2 AZ không khả dụng, dịch vụ/ứng dụng của chúng ta vẫn hoạt động

### **Khả năng mở rộng cao (High Scalability)**

- Khả năng tăng dung lượng của chúng ta dựa trên nhu cầu tăng về lưu lượng truy cập, bộ nhớ và sức mạnh tính toán
- **Vertical Scaling (Scaling Up)**: Nâng cấp lên máy chủ lớn hơn
- **Horizontal Scaling (Scaling Out)**: Thêm nhiều máy chủ cùng kích thước

### **Độ co giãn cao (High Elasticity)**

- Khả năng **tự động tăng hoặc giảm** dung lượng của chúng ta dựa trên **nhu cầu hiện tại về lưu lượng truy cập, bộ nhớ và sức mạnh tính toán**

### **Auto Scaling Groups (ASG)**

- Là một tính năng của AWS sẽ **tự động thêm hoặc xóa máy chủ dựa trên các quy tắc mở rộng** chúng ta xác định**24**.
- 

### **Khả năng chịu lỗi cao (Highly Fault Tolerant)**

- Khả năng dịch vụ của chúng ta đảm bảo **không có điểm lỗi đơn lẻ**, ngăn chặn khả năng thất bại
- **Fail-over** là khi chúng ta có kế hoạch chuyển đổi lưu lượng truy cập **sang hệ thống dự phòng** trong trường hợp hệ thống chính bị lỗi

### **Độ bền cao (High Durability)**

- **Khả năng khôi phục sau thảm họa** và **ngăn chặn mất dữ liệu**
- Các giải pháp khôi phục sau thảm họa được gọi là **Disaster Recovery (DR)**

### **Kế hoạch liên tục kinh doanh (Business Continuity Plan - BCP)**

- Là một tài liệu phác thảo cách doanh nghiệp sẽ tiếp tục hoạt động trong thời gian gián đoạn dịch vụ không theo kế hoạch
    - **Recovery Point Objective (RPO)**: Lượng dữ liệu **tối đa chấp nhận được bị mất** sau một sự cố mất dữ liệu ngoài kế hoạch, được biểu thị bằng một khoảng thời gian.
    - **Recovery Time Objective (RTO)**: **Thời gian ngừng hoạt động tối đa** mà doanh nghiệp của chúng ta có thể chịu đựng mà không gây ra tổn thất tài chính đáng kể
- Có nhiều tùy chọn khôi phục với **sự đánh đổi giữa chi phí và thời gian khôi phục** (Backup & Restore, Pilot Light, Warm Standby, Multi-site Active/active)

## **Quản Lý và Vận Hành AWS**

- **API (Application Programming Interface):** Là phần mềm cho phép hai ứng dụng/dịch vụ giao tiếp với nhau
    - Chúng ta có thể tương tác với AWS API bằng cách gửi yêu cầu HTTP/S, hoặc sử dụng các công cụ dành cho nhà phát triển như **AWS Management Console (giao diện web), AWS SDK (kit phát triển phần mềm), và AWS CLI (giao diện dòng lệnh)**

### **AWS Management Console**

- Là một **bảng điều khiển thống nhất dựa trên web** để xây dựng, quản lý và giám sát mọi thứ từ triển khai đám mây đơn giản đến phức tạp
- Cho phép khởi chạy và cấu hình tài nguyên AWS thủ công bằng cách nhấp và chọn (ClickOps)

### **AWS Command Line Interface (CLI)**

- Cho phép người dùng tương tác với AWS API một cách lập trình bằng cách nhập các lệnh đơn hoặc đa dòng vào một shell hoặc terminal

### **AWS Software Development Kit (SDK)**

- Là một bộ công cụ phát triển phần mềm trong một gói có thể cài đặt
- Chúng ta có thể sử dụng AWS SDK để lập trình tạo, sửa đổi, xóa hoặc tương tác với tài nguyên AWS

### **Infrastructure as Code (IaC)**

- Chúng ta viết một script cấu hình để **tự động hóa việc tạo, cập nhật hoặc hủy bỏ cơ sở hạ tầng đám mây**
- IaC là một bản thiết kế của cơ sở hạ tầng của chúng ta, cho phép chúng ta dễ dàng chia sẻ, quản lý phiên bản hoặc kiểm kê cơ sở hạ tầng đám mây của mình
- AWS có hai công cụ chính cho IaC: **AWS CloudFormation (công cụ IaC khai báo)** và **AWS Cloud Development Kit (CDK) (công cụ IaC mệnh lệnh)**

### **Access Keys**

- Là một cặp **khóa và bí mật** cần thiết để có quyền truy cập lập trình vào tài nguyên AWS khi tương tác với AWS API bên ngoài AWS Management Console
- Không bao giờ chia sẻ access keys vào codebase

### **Mô Hình Trách Nhiệm Chia Sẻ (Shared Responsibility Model)**

- Là một **khung bảo mật đám mây** định nghĩa các nghĩa vụ bảo mật của khách hàng so với Nhà cung cấp dịch vụ đám mây (CSP) AWS
- **AWS chịu trách nhiệm về "Bảo mật CỦA đám mây" (Security OF the Cloud)**: Bao gồm phần cứng, hoạt động của các dịch vụ được quản lý, cơ sở hạ tầng toàn cầu (Vùng, AZs, Edge Locations, Bảo mật vật lý).
- **Khách hàng chịu trách nhiệm về "Bảo mật TRONG đám mây" (Security IN the Cloud)**: Bao gồm dữ liệu, cấu hình (nền tảng, ứng dụng, quản lý danh tính và quyền truy cập), hệ điều hành, mạng và cấu hình tường lửa
- Mức độ trách nhiệm của khách hàng **thay đổi tùy thuộc vào loại dịch vụ đám mây**

## **Các Dịch Vụ Chính của AWS**

### **Dịch vụ tính toán (Computing Services)**

- **Elastic Compute Cloud (EC2)**: Máy chủ ảo có thể cấu hình cao (instance). Là **xương sống của AWS** vì hầu hết các dịch vụ AWS sử dụng EC2 làm máy chủ cơ bản của chúng.
- **Amazon Machine Image (AMI)**: Một cấu hình được định nghĩa trước cho Máy ảo
- **Amazon Lightsail**: Dịch vụ máy chủ ảo được quản lý
- **Elastic Container Service (ECS)**: Dịch vụ điều phối container hỗ trợ Docker containers
- **ECS Fargate**: Dịch vụ điều phối container serverless
- **Elastic Kubernetes Service (EKS)**: Dịch vụ Kubernetes được quản lý hoàn toàn
- **AWS Lambda**: Dịch vụ hàm serverless. chúng ta chỉ cần tải lên các đoạn mã nhỏ
- **AWS Outposts**: Các giá máy chủ vật lý chúng ta có thể đặt trong trung tâm dữ liệu của mình, cho phép chúng ta sử dụng AWS API và Dịch vụ như EC2 ngay trong trung tâm dữ liệu của chúng ta
- **AWS Wavelength**: Cho phép chúng ta xây dựng và khởi chạy ứng dụng của mình trong trung tâm dữ liệu viễn thông để có **độ trễ cực thấp trên mạng 5G**
- **AWS Local Zones**: Các trung tâm dữ liệu biên nằm ngoài Vùng AWS để có tốc độ tính toán, lưu trữ và cơ sở dữ liệu nhanh hơn ở các khu vực đông dân cư.
- **EC2 Pricing Models**:
    - **On-Demand**: Mô hình Pay-As-You-Go (PAYG). Không trả trước, không cam kết dài hạn. Tính phí theo giây (tối thiểu 60 giây) hoặc giờ. Phù hợp cho workload ngắn hạn, không dự đoán được
    - **Reserved Instances (RI)**: **Tiết kiệm tới 75%**. Dành cho ứng dụng có trạng thái ổn định, sử dụng có thể dự đoán. Cam kết sử dụng EC2 trong **1 hoặc 3 năm**
        - **Regional RI**: Giảm giá áp dụng cho việc sử dụng instance **trong bất kỳ AZ nào trong Vùng**
        - **Zonal RI**: Dự trữ dung lượng trong **AZ được chỉ định**
        - **Standard RI**: Có thể **sửa đổi thuộc tính RI** (AZ, kích thước instance)
        - **Convertible RI**: Có thể **trao đổi trong thời hạn** để lấy RI Convertible khác với các thuộc tính RI mới
        - Có thể bán RI Standard không sử dụng trên RI Marketplace
    - **Spot Instances**: **Tiết kiệm tới 90%**. Sử dụng dung lượng tính toán dự phòng. Có thể bị AWS chấm dứt bất cứ lúc nào. Dành cho workload linh hoạt, có thời gian bắt đầu và kết thúc linh hoạt hoặc chỉ khả thi với chi phí tính toán rất thấp
    - **Dedicated Instances/Hosts**: **Đắt nhất.** Được thiết kế để đáp ứng các yêu cầu quy định nghiêm ngặt hoặc cấp phép ràng buộc máy chủ không hỗ trợ triển khai đa đối tượng. Cung cấp phần cứng chuyên dụng/cô lập vật lý
    - **AWS Savings Plans**: Cung cấp mức giảm giá tương tự như RI nhưng **đơn giản hóa quy trình mua**. Có 3 loại:
        - Compute Savings Plans
        - EC2 Instance Savings Plans
        - SageMaker Savings Plan

### **Dịch vụ lưu trữ (Storage Services)**

- **Elastic Block Store (EBS)**: **Lưu trữ khối (block storage)** liên tục, đính kèm vào EC2 instances như một ổ cứng ảo
- **Elastic File Storage (EFS)**: Dịch vụ hệ thống tệp NFS (network file system) gốc đám mây, cho phép nhiều người dùng hoặc máy ảo truy cập cùng một ổ đĩa
- **Amazon Simple Storage Service (S3)**: **Dịch vụ lưu trữ đối tượng (object storage)** serverless. chúng ta có thể tải lên các tệp rất lớn và không giới hạn dung lượng
    - **S3 Object**: Các đối tượng chứa dữ liệu của chúng ta, có thể từ 0 Byte đến 5 Terabyte.
    - **S3 Bucket**: Nơi lưu trữ các đối tượng. Tên bucket phải là **duy nhất toàn cầu**
    - **S3 Storage Classes**: Cung cấp nhiều lựa chọn với sự đánh đổi về thời gian truy xuất, khả năng truy cập và độ bền để có chi phí lưu trữ rẻ hơn **(Standard, Intelligent Tiering, Standard-IA, One-Zone-IA, Glacier, Glacier Deep Archive)**
- **AWS Snow Family**: Các thiết bị lưu trữ và tính toán được sử dụng để **di chuyển vật lý dữ liệu** vào hoặc ra khỏi đám mây khi việc di chuyển qua Internet hoặc kết nối riêng quá chậm, khó khăn hoặc tốn kém. Bao gồm Snowcone, Snowball Edge, Snowmobile.
- **AWS Backup**: Dịch vụ sao lưu được quản lý hoàn toàn giúp tập trung hóa và tự động hóa sao lưu dữ liệu trên nhiều dịch vụ AWS
- **CloudEndure Disaster Recovery**: Liên tục sao chép máy của chúng ta vào một khu vực staging chi phí thấp trong tài khoản AWS và Vùng ưu tiên của chúng ta, cho phép khôi phục nhanh chóng và đáng tin cậy trong trường hợp lỗi trung tâm dữ liệu**86**.

### **Dịch vụ cơ sở dữ liệu (Database Services)**

- **Database (Cơ sở dữ liệu)**: Kho dữ liệu lưu trữ dữ liệu bán cấu trúc và có cấu trúc. Yêu cầu kỹ thuật thiết kế và mô hình hóa chính thức
    - **Cơ sở dữ liệu quan hệ (Relational databases)**: Dữ liệu có cấu trúc (bảng, hàng, cột), thường là row-oriented hoặc columnar-oriented
    - **Cơ sở dữ liệu phi quan hệ (Non-relational databases/NoSQL)**: Dữ liệu bán cấu trúc hoặc không có cấu trúc
- **Data Warehouse (Kho dữ liệu)**: Một kho dữ liệu quan hệ được thiết kế cho workload phân tích, thường là **columnar-oriented.** Tối ưu hóa để trả về truy vấn rất nhanh ngay cả với lượng dữ liệu khổng lồ. **Amazon Redshift** là một ví dụ về data warehouse
- **Key/Value Store**: Loại cơ sở dữ liệu NoSQL sử dụng phương pháp khóa-giá trị đơn giản để lưu trữ dữ liệu (ví dụ: **DynamoDB**)
- **Document Store**: Loại cơ sở dữ liệu NoSQL lưu trữ tài liệu (thường là JSON hoặc JSON-Like) làm cấu trúc dữ liệu chính (ví dụ: **DocumentDB**)
- **DynamoDB**: Dịch vụ cơ sở dữ liệu key/value và document serverless NoSQL hàng đầu của AWS, được thiết kế để mở rộng quy mô đến hàng tỷ bản ghi với dữ liệu nhất quán được đảm bảo trong vòng chưa đầy một giây
- **Relational Database Service (RDS)**: Dịch vụ cơ sở dữ liệu quan hệ hỗ trợ nhiều công cụ SQL (MySQL, MariaDB, Postgres, Oracle, SQL Server, Aurora)
    - **Aurora**: Cơ sở dữ liệu được quản lý hoàn toàn của MySQL (nhanh hơn 5 lần) hoặc PSQL (nhanh hơn 3 lần)
    - **Aurora Serverless**: Phiên bản Aurora theo yêu cầu serverless
- **Database Migration Service (DMS)**: Dịch vụ di chuyển cơ sở dữ liệu, cho phép di chuyển từ **on-premise lên AWS**, giữa các tài khoản AWS, hoặc từ S**QL sang NoSQL**

### **Dịch vụ mạng (Networking Services)**

- **Virtual Private Cloud (VPC)**: Một phần **cô lập logic của Mạng AWS** nơi chúng ta có thể khởi chạy tài nguyên AWS
- **Subnet**: Một phân vùng logic của mạng IP thành các phân đoạn mạng nhỏ hơn. Có **Public Subnet** (có thể truy cập Internet) và **Private Subnet** (không thể truy cập Internet)
- **Security Groups (SG)**: Hoạt động như một **tường lửa ảo ở cấp instance**. Cho phép tạo quy tắc cho phép. Tường lửa mặc định từ chối tất cả lưu lượng
- **Network Access Control Lists (NACLs)**: Hoạt động như một **tường lửa ảo ở cấp subnet**. Cho phép tạo quy tắc cho phép và từ chối. Từ chối tất cả lưu lượng truy cập ngầm định
- **Internet Gateway (IGW)**: Cho phép truy cập Internet
- **DirectConnect**: **Kết nối gigabit** chuyên dụng từ trung tâm dữ liệu **on-premise đến AWS** (kết nối rất nhanh)
- **AWS Virtual Private Network (VPN)**: Kết nối an toàn giữa các văn phòng tại chỗ, văn phòng từ xa, nhân viên di động

### **Dịch vụ tích hợp ứng dụng (Application Integration Services)**

- **Queueing (Hệ thống xếp hàng)**: Cung cấp giao tiếp không đồng bộ và tách rời các quy trình thông qua tin nhắn/sự kiện. **Simple Queue Service (SQS)** là dịch vụ **xếp hàng** được quản lý hoàn toàn giúp tách rời và mở rộng quy mô microservices, hệ thống phân tán và ứng dụng serverless
- **Streaming (Luồng dữ liệu)**: Nhiều người tiêu dùng có thể phản ứng với các sự kiện (tin nhắn) theo **thời gian thực**. **Amazon Kinesis** là giải pháp được quản lý hoàn toàn của AWS để thu thập, xử lý và phân tích dữ liệu streaming trong đám mây
- **Pub/Sub (Publish-Subscribe)**: Hệ thống nhắn tin nơi người gửi (publishers) không gửi tin nhắn trực tiếp đến người nhận. Họ gửi tin nhắn đến một **event bus**, và người nhận (subscribers) sẽ nhận tin nhắn khi chúng xuất hiện trong đăng ký của họ **Simple Notification Service (SNS)** là một hệ thống nhắn tin pub-sub có tính sẵn sàng cao, bền bỉ, an toàn, được quản lý hoàn toàn
- **API Gateway**: Giải pháp để **tạo API an toàn** trong môi trường đám mây của chúng ta ở mọi quy mô. Tạo API hoạt động như một giao diện cho ứng dụng truy cập dữ liệu, logic nghiệp vụ hoặc chức năng từ các **dịch vụ backend**
- **State Machines**: Mô hình trừu tượng quyết định cách **một trạng thái chuyển sang trạng thái khác dựa trên một loạt các điều kiện.** **AWS Step Functions** phối hợp nhiều dịch vụ AWS thành một **workflow serverless**
- **Event Bus**: **Nhận sự kiện từ một nguồn và định tuyến sự kiện đến một đích dựa trên các quy tắc.** **EventBridge** là dịch vụ event bus serverless dùng để tích hợp ứng dụng bằng cách streaming dữ liệu thời gian thực đến ứng dụng của chúng ta**100...**.

### Dịch vụ kiểm soát quyền truy cập

- IAM (Identity and Access Management) là một thành phần cốt lõi của AWS cho phép chúng ta **kiểm soát quyền truy cập vào các dịch vụ và tài nguyên AWS một cách an toàn. IAM cho phép chúng ta xác định ai có thể truy cập tài nguyên nào và trong những điều kiện nào.**
- Cụ thể, IAM là một dịch vụ giúp bạn **tạo và quản lý người dùng (users) và nhóm (groups) AWS, đồng thời thiết lập quyền để cho phép hoặc từ chối họ truy cập vào các tài nguyên AWS**
- Các thành phần cơ bản của IAM
    - **IAM Users (Người dùng IAM)**: Đây là những người dùng cuối cần tương tác với AWS, bằng cách đăng nhập vào AWS Management Console (Bảng điều khiển quản lý AWS) hoặc thông qua các API (Giao diện lập trình ứng dụng)
    - **IAM Groups (Nhóm IAM)**: Bạn có thể tổ chức các IAM Users vào các nhóm, cho phép tất cả người dùng trong một nhóm kế thừa cùng một bộ quyền (permissions)**1**. Các ví dụ phổ biến bao gồm "Administrators" (Quản trị viên), "Developers" (Nhà phát triển), và "Auditors" (Kiểm toán viên)
    - **IAM Roles (Vai trò IAM)**: Các vai trò được thiết kế để cấp quyền truy cập API AWS cụ thể cho các tài nguyên AWS, thay vì cho từng người dùng riêng lẻ. Các chính sách (policies) được gắn vào một vai trò, sau đó vai trò đó được gán cho một tài nguyên AWS.
    - **IAM Policies (Chính sách IAM)**: Đây là các **tài liệu JSON định nghĩa các quyền** cho người dùng, nhóm hoặc vai trò. Chúng chỉ định những hành động API nào được phép (allowed) hoặc bị từ chối (denied)
- **Nguyên tắc đặc quyền tối thiểu (Principle of Least Privilege - PoLP):**
    - **Just-Enough-Access (JEA)** có nghĩa là chỉ cho phép các hành động **chính xác cần thiết** cho một nhiệm vụ
    - **Just-In-Time (JIT)** có nghĩa là **cho phép truy cập trong khoảng thời gian ngắn nhất** cần thiết
    - Các nguồn tin chỉ ra rằng AWS **hiện không có các chính sách thích ứng dựa trên rủi ro** (risk-based adaptive policies) được tích hợp sẵn trong IAM
- **AWS Single-Sign On (SSO) và Nhà cung cấp danh tính (Identity Providers)**
    - **AWS Single Sign-On (SSO)**: Dịch vụ này cho phép bạn **tạo hoặc kết nối các danh tính lực lượng lao động của mình trong AWS một lần** và quản lý tập trung quyền truy cập trên toàn bộ tổ chức AWS
    - **Identity Providers (IdPs - Nhà cung cấp danh tính)**: Một IdP là một hệ thống tạo, duy trì và quản lý thông tin danh tính, cung cấp dịch vụ xác thực trên một mạng liên kết hoặc phân tán
- **Zero-Trust: Mô hình Zero Trust** dựa trên nguyên tắc "**không tin tưởng bất kỳ ai, xác minh mọi thứ**", trong đó **danh tính trở thành ranh giới bảo mật chính**, bổ sung cho các cách tiếp cận bảo mật truyền thống tập trung vào mạng

### **Microservices và Containers**

- **Microservices Architecture**: Nhiều ứng dụng nhỏ hơn, mỗi ứng dụng chịu trách nhiệm về một chức năng cô lập và không trạng thái, trái ngược với Monolithic Architecture (một ứng dụng lớn chịu trách nhiệm cho mọi thứ, chức năng gắn kết chặt chẽ)
- **Kubernetes**: Một hệ thống điều phối container mã nguồn mở để **tự động hóa việc triển khai, mở rộng quy mô và quản lý container**
- **Docker**: Một tập hợp các sản phẩm **Platform as a Service (PaaS)** sử dụng ảo hóa cấp hệ điều hành để phân phối phần mềm trong các gói gọi là container

### **Các dịch vụ Serverless**

- Serverless là kiến trúc nơi **các máy chủ, cơ sở hạ tầng và Hệ điều hành được quản lý bởi Nhà cung cấp dịch vụ đám mây (CSP)**
- Đặc điểm: **Độ co giãn và khả năng mở rộng cao, tính sẵn sàng cao, độ bền cao, an toàn theo mặc định**
- **Scale-to-Zero**: Dịch vụ serverless có thể giảm quy mô về 0, nghĩa là khi không sử dụng, tài nguyên serverless không tốn phí, chúng ta **trả tiền theo giá trị sử dụng** **(Pay-for-Value)**, không phải cho các máy chủ không hoạt động

### **Dịch vụ ghi nhật ký (Logging Services)**

- **CloudTrail**: Ghi nhật ký tất cả các **cuộc gọi API (SDK, CLI)** giữa các dịch vụ AWS. Dùng để theo dõi hoạt động tài khoản AWS, giúp xác định ai đã thực hiện cuộc gọi, từ đâu, khi nào, và hành động gì
- **CloudWatch**: Tập hợp nhiều dịch vụ:
    - **CloudWatch Logs**: Nơi tập trung để **lưu trữ nhật ký dịch vụ đám mây hoặc nhật ký ứng dụng**.
    - **CloudWatch Logs Insights** cho phép tìm kiếm và phân tích dữ liệu nhật ký CloudWatch một cách tương tác
    - **CloudWatch Metrics**: Đại diện cho một tập hợp các **điểm dữ liệu được sắp xếp theo thời gian**, một biến được theo dõi theo thời gian
    - **CloudWatch Alarms**: Theo dõi CloudWatch Metric dựa trên ngưỡng đã xác định và **kích hoạt hành động khi ngưỡng bị vi phạm**
- **AWS X-Ray**: Hệ thống theo dõi phân tán (distributed tracing system)**113**.

### **Dịch vụ Machine Learning và AI**

- **Amazon SageMaker**: Dịch vụ được **quản lý hoàn toàn để xây dựng, đào tạo và triển khai mô hình học máy ở quy mô**
- Các dịch vụ khác bao gồm: Amazon Lex (chatbot), Amazon Polly (text-to-speech), Amazon Rekognition (nhận diện hình ảnh và video), Amazon Transcribe (speech-to-text), Amazon Translate (dịch máy), Amazon Comprehend (NLP), Amazon Forecast (dự báo chuỗi thời gian

### **Dịch vụ Big Data và Analytics**

- **BigData**: Dữ liệu có cấu trúc/không cấu trúc với khối lượng lớn, khó di chuyển và xử lý bằng kỹ thuật cơ sở dữ liệu và phần mềm truyền thống
- **Amazon Athena**: Dịch vụ truy vấn **tương tác serverless,** cho phép chúng ta truy vấn các tệp CSV hoặc JSON trong **S3 bucket**
- **Amazon QuickSight**: Bảng điều khiển Business Intelligence (BI) cho phép chúng ta nhanh chóng trực quan hóa dữ liệu kinh doanh
- **AWS Glue**: Dịch vụ Extract, Transform, Load (ETL)
- **AWS Lake Formation**: Kho lưu trữ tập trung, được quản lý và bảo mật lưu trữ tất cả dữ liệu của chúng ta, một data lake

### **Khung Kiến Trúc Tốt của AWS (AWS Well-Architected Framework)**

- **AWS Well-Architected Framework:** Là một Whitepaper do AWS tạo ra để giúp khách hàng xây dựng các giải pháp sử dụng các phương pháp hay nhất được định nghĩa bởi AWS
- Được chia thành 5 trụ cột (pillars) giải quyết các khía cạnh khác nhau của workload đám mây
    - **Operational Excellence (Hoạt động xuất sắc)**: Vận hành và giám sát hệ thống
    - **Security (Bảo mật)**: Bảo vệ dữ liệu và hệ thống, giảm thiểu rủi ro
    - **Reliability (Độ tin cậy)**: Giảm thiểu và phục hồi khỏi các gián đoạn
    - **Performance Efficiency (Hiệu suất hiệu quả)**: Sử dụng tài nguyên tính toán hiệu quả
    - **Cost Optimization (Tối ưu hóa chi phí)**: Đạt được mức giá thấp nhất
- **Nguyên tắc thiết kế chung (General Design Principles)**
    - Ngừng đoán nhu cầu dung lượng của chúng ta
    - Thử nghiệm hệ thống ở quy mô sản xuất
    - Tự động hóa để dễ dàng thử nghiệm kiến trúc
    - Cho phép kiến trúc tiến hóa
    - Định hướng kiến trúc bằng dữ liệu
    - Cải thiện thông qua "game days" (ngày diễn tập)