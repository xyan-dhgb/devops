## **Quá Khứ và Hiện Tại của Triển Khai Ứng Dụng (The past and the present of Apps Deployment)**

- Lịch sử triển khai ứng dụng đã chứng kiến sự thay đổi đáng kể từ kiến trúc lớn, nguyên khối sang các hệ thống phân tán, và ngày nay là dựa trên container và được điều phối.

### **Kiến trúc Monolithic (Monolithic Architecture)**

- **Mô tả**: Đây là mô hình truyền thống nơi toàn bộ ứng dụng được xây dựng thành **một đơn vị duy nhất, không thể chia cắt**. Tất cả các thành phần được gắn kết chặt chẽ trong một codebase lớn.
- **Ưu điểm (Pros)**:
    - **Đơn giản để phát triển.**
    - **Đơn giản để triển khai** – chỉ là một tệp nhị phân duy nhất.
    - Dễ gỡ lỗi và truy vết lỗi.
    - Đơn giản để kiểm thử.
    - Ít tốn kém hơn.
- **Nhược điểm (Cons)**:
    - **Khó hiểu và khó sửa đổi** do sự gắn kết chặt chẽ.
    - Thời gian khởi động và tải ứng dụng **lâu hơn.**
    - Mỗi lần cập nhật yêu cầu **triển khai lại toàn bộ ứng dụng**, khiến việc triển khai liên tục (continuous deployment) trở nên khó khăn.
    - **Kém tin cậy**: Một lỗi nhỏ có thể làm sập toàn bộ ứng dụng.
    - **Khó mở rộng** (Scaling).
    - **Khó áp dụng công nghệ mới** và tiên tiến vì thay đổi framework hoặc ngôn ngữ sẽ ảnh hưởng đến toàn bộ ứng dụng.
    - Thay đổi ở một phần mã có thể gây ra tác động không lường trước đến phần còn lại.
    - Mỗi dịch vụ trong ứng dụng Monolithic có thể có các yêu cầu về dependency khác nhau, dẫn đến **thời gian cài đặt lâu** và môi trường phát triển/kiểm thử/sản xuất khác biệt.

### **Kiến trúc Microservices trên Máy ảo (Microservices Architecture on VMs)**

- Để khắc phục những hạn chế của kiến trúc Monolithic, ngành công nghiệp đã chuyển sang **Kiến trúc Microservices**. Một cách tiếp cận ban đầu phổ biến là chạy mỗi microservice trên một **Máy ảo (VM) riêng.**
    - **Hypervisor**: Là phần mềm tạo và chạy các máy ảo (còn gọi là guests). Nó **cô lập hệ điều hành và tài nguyên của máy chủ** khỏi các máy ảo, cho phép tạo và quản lý các VM. Hypervisor coi tài nguyên máy chủ (CPU, bộ nhớ, lưu trữ) như một vùng tài nguyên có thể phân bổ lại dễ dàng giữa các VM hiện có hoặc VM mới. Có hai loại:
        - **Type 1 ("bare metal")**: Chạy **trực tiếp trên phần cứng** của máy chủ (ví dụ: Microsoft Hyper-V, VMware ESXi).
        - **Type 2 ("hosted")**: Chạy dưới dạng **lớp phần mềm trên một hệ điều hành** (ví dụ: VirtualBox, VMware Player).
    
    
    - **Microservices trên VMs**:
        - Mỗi dịch vụ chạy với các **dependencies riêng biệt trong các VM riêng.**
        - Mỗi VM có **hệ điều hành (OS) riêng** và là nơi lưu trữ một Microservice.
        - Có sự **cô lập mạnh mẽ và kiểm soát tài nguyên** giữa các VM và máy chủ.
        - Các dịch vụ khác nhau trên các VM có thể có **các phiên bản dependency khác nhau**, giải quyết vấn đề "Matrix from hell problem".
- **Ưu điểm (Pros)**:
    - Các dịch vụ **ít phụ thuộc lẫn nhau (decoupled).**
    - Đảm bảo **triển khai và bàn giao liên tục** các ứng dụng lớn, phức tạp.
    - **Kiểm thử tốt hơn** vì các dịch vụ nhỏ hơn và kiểm thử nhanh hơn.
    - **Triển khai tốt hơn** – mỗi dịch vụ có thể được triển khai độc lập.
    - **Không cam kết lâu dài với công nghệ** – có thể sử dụng stack công nghệ mới cho dịch vụ mới**5**.
- **Nhược điểm (Cons)**:
    - **Thời gian khởi động VM chậm.**
    - **Tiêu thụ bộ nhớ tăng lên** do mỗi VM có dấu vết hệ điều hành riêng.
    - Chi phí ban đầu rất cao và đòi hỏi các nhà phát triển có kỹ năng cao.
    - **Kiểm thử khó khăn và tốn thời gian** do sự phức tạp bổ sung của hệ thống phân tán.
    - **Phức tạp trong triển khai** – có thêm sự phức tạp trong vận hành khi triển khai và quản lý một hệ thống chứa nhiều loại dịch vụ khác nhau.

## **Docker Containers**

- Docker xuất hiện như một giải pháp để khắc phục **chi phí overhead** và **vấn đề phụ thuộc gặp phải với VM và ứng dụng monolithic.**

### **Docker là gì**:

- Là một công cụ phát triển phần mềm và **công nghệ ảo hóa** giúp **dễ dàng phát triển, triển khai và quản lý ứng dụng bằng cách sử dụng các container**.
- Nó giải quyết vấn đề phổ biến ***"Nó hoạt động tốt trên hệ thống của tôi! Nó không hoạt động trên hệ thống của   chúng ta"*** bằng cách đảm bảo nhà phát triển và người kiểm thử chạy ứng dụng trong **cùng một môi trường Docker với các dependency giống hệt nhau**
- **Container**: Là một **gói phần mềm nhẹ, độc lập, có thể thực thi** bao gồm tất cả các **thư viện, tệp cấu hình, dependencies và các phần cần thiết khác** để vận hành ứng dụng. Ví dụ: "Ubuntu + Python + Dependencies".

### **So sánh VMs và Docker Containers:**

| Đặc điểm | Máy ảo (Virtual Machine) | Docker Container |
| --- | --- | --- |
| **Mức độ cô lập** | Cô lập ở cấp độ phần cứng (Hardware-level) **** | **Cô lập ở cấp độ hệ điều hành (OS-level)**  |
| **Hệ điều hành (OS)** | Mỗi VM có một OS riêng biệt **** | **Mỗi container có thể chia sẻ OS của máy chủ**  |
| **Thời gian khởi động** | Khởi động trong vài phút **** | **Khởi động trong vài giây**  |
| **Kích thước** | Vài GBs **** | **Nhẹ (KBs/MBs)**  |
| **Khả năng sẵn có** | Khó tìm VM làm sẵn **** | **Dễ dàng tìm thấy container Docker dựng sẵn**  |
| **Khả năng di chuyển** | Có thể di chuyển sang host mới dễ dàng **** | Bị hủy và tạo lại thay vì di chuyển **** |
| **Thời gian tạo** | Mất thời gian tương đối dài  **** | **Có thể tạo trong vài giây**   |
| **Sử dụng tài nguyên** | Sử dụng nhiều tài nguyên hơn  **** | **Sử dụng ít tài nguyên hơn**   |

## **Kiến trúc Docker:**

- Sử dụng kiến trúc client-server. **Docker client giao tiếp với Docker daemon**, nơi thực hiện các công việc nặng nhọc như xây dựng, chạy và phân phối các Docker container của chúng ta.

### **Docker Image**:

- Có thể so sánh với một **template dùng để tạo Docker container**. Chúng là các **template chỉ đọc (read-only)** chứa các binaries và dependencies của ứng dụng. Các Docker image được lưu trữ trong **Docker Registry.**

### **Docker Container**:

- Là một **instance đang chạy của Docker image.** Chúng được thiết kế để **chạy một tiến trình/ứng dụng cụ thể** và sẽ **chạy chừng nào tiến trình đó còn sống**.   chúng ta có thể chạy bất kỳ số lượng container nào dựa trên một image, và Docker đảm bảo mỗi container được tạo **có một tên duy nhất**.
- Thay đổi được thực hiện trong container sẽ **không được lưu vào image theo mặc định.**
- **Hệ thống tệp Union (Union File System) và Copy-on-Write (CoW)**: Một Docker image là một template chỉ đọc. Khi một container cần thay đổi một tệp từ image chỉ đọc, nó sẽ **sao chép tệp đó lên lớp đọc-ghi riêng (private read-write layer) của nó** trước khi thực hiện thay đổi. Điều này được gọi là cơ chế **copy-on-write (COW)**. Các tệp và thư mục mới hoặc được sửa đổi này được 'cam kết' (committed) dưới dạng một lớp mới.

### **Docker Registry**:

- Là hệ thống lưu trữ và phân phối các Docker image.
- Nó được tổ chức thành các Docker repository, nơi mỗi repository chứa tất cả các phiên bản của một image cụ thể.
- Mặc định, **Docker engine tương tác với DockerHub** (registry công cộng của Docker). Ngoài ra, có thể chạy các repository riêng tư tại chỗ (ví dụ: Harbor) hoặc sử dụng các repo của nhà cung cấp dịch vụ đám mây (ví dụ: Amazon ECR, Google Container Registry, Azure Container Registry).

## **Các lệnh Docker cơ bản quan trọng**:

- Tải image từ Docker Hub (hoặc repo riêng)

```docker
docker pull <image_name> 
```

- Liệt kê các image đã tải

```docker
docker images
```

- Chạy một container.

```docker
docker container run <image_name>
```

- Khi chạy, Docker tìm image cục bộ, nếu không có sẽ tải từ repo từ xa, tạo và khởi động container, gắn vào mạng và mở cổng.
    - Ví dụ: Tôi muốn chạy thử một web server Nginx.
    - Câu lệnh mẫu và quy trình:
    
    ```docker
    docker run -d -p 8080:80 nginx
    ```
    
    - Tìm image `nginx` trong máy (local) → Nếu chưa có, Docker sẽ:
        - Kết nối lên Docker Hub, tải image `nginx` về.
        - Tạo container mới từ image đó.
        - Khởi động container để web server chạy nền.
        - Gắn vào mạng mặc định của Docker.
        - Mở cổng 8080 trên máy bạn → ánh xạ vào cổng 80 trong container
            
            → Bạn có thể truy cập web qua **http://localhost:8080**
            

| **Tuỳ chọn** | **Ý nghĩa dễ hiểu** |
| --- | --- |
| `-d` hoặc `--detach` | Chạy container **ở chế độ nền**, không bị tắt khi bạn đóng terminal. |
| `-p <host_port>:<container_port>` | **Mở cổng**, ánh xạ từ máy thật → container. Dùng để truy cập ứng dụng trong container. |
| `--name <container_name>` | Đặt tên cho container để dễ quản lý. |
| `-it` | Chạy container ở chế độ **tương tác** + có terminal, dùng được như đang dùng máy thật. |
| `docker run -it ubuntu bash` | Ví dụ: Mở shell bash trong container Ubuntu. |
- Liệt kê tất cả các container đang chạy / tất cả các container (đang chạy và đã thoát).

```docker
docker ps / docker ps -a
```

- Cung cấp thông tin cấu hình và metadata của container.

```docker
docker container inspect <container-id>
```

- Dừng/khởi động/kill/xóa container1.

```docker
docker container stop/start/kill/rm <container_id/name>
```

- Xem logs của container.

```docker
docker container logs <container_name>
```

- Thực thi một lệnh bên trong một container đang chạy (ví dụ: docker exec -it centos bash để truy cập shell).

```docker
docker exec -it <container_name> <command>
```

- Lưu các thay đổi trong container thành một image mới. (Lưu ý: Thường **nên dùng Dockerfile để tái tạo hơn là docker commit**).

```docker
docker commit <container-id> <new-image-name>
```

- 

## **Docker Networking**

- Docker cung cấp 3 mạng mặc định: **bridge, none và host.**

### **Mạng Bridge (Bridge Network)**:

- **Mặc định khi chúng ta khởi động Docker,** một mạng bridge mặc định được tạo. Các container mới sẽ kết nối với nó trừ khi được chỉ định khác.
- Các container trong mạng bridge **mặc định có IP nội bộ riêng tư và được cô lập khỏi host**. Chúng chỉ có thể truy cập nhau bằng địa chỉ IP (trừ khi dùng --link đã lỗi thời).
- Chúng ta có thể tạo **mạng bridge tùy chỉnh do người dùng định nghĩa**. Trong mạng bridge do người dùng định nghĩa, các container có thể **phân giải lẫn nhau bằng tên hoặc alias (DNS).**

### **Mạng Host (Host Network)**:

- Các container kết nối trực tiếp với host. Nhiều container không thể chạy trên cùng một host vì xung đột cổng trên phía host.

### **Mạng None (None Network)**:

- **Cung cấp một ngăn xếp mạng cụ thể cho container mà không có giao diện mạng**. Các container chạy trong sự cô lập thuần túy, chỉ có giao diện loopback cục bộ.

## **Mạng Overlay (Overlay Network)**:

- Dùng để giao tiếp **giữa các container chạy trên các host Docker daemon khác nhau** (ví dụ: trong swarm).
- Mạng Overlay trải rộng trên toàn bộ cluster. Nếu không chỉ định mạng khi tạo dịch vụ swarm, chúng sẽ được kết nối với mạng ingress mặc định, cũng là loại overlay.

## **Docker Volumes**

- **Mục đích**: **Giữ lại dữ liệu khi container bị xóa** và **chia sẻ dữ liệu giữa hệ thống tệp của host và Docker container**. (Lưu ý: Khi xóa container, **lớp đọc-ghi** chứa các thay đổi sẽ bị **hủy và mất vĩnh viễn nếu không có volume**).
- Hai loại volume mounts:
    - **Named Volume**: Được quản lý **bởi Docker**, tạo bằng `docker volume create,` được mount từ vị trí volume mặc định `/var/lib/docker/volumes.`
    - **Bind Mount**: Được quản lý **bởi host,** có thể lưu trữ **ở bất kỳ đâu trên hệ thống tệp của host** (thường bắt đầu bằng '/').

### **Các lệnh volume**:

- Tạo một volume mới. Docker sẽ đặt tên tự động nếu bạn không chỉ định.

```docker
docker volume create
```

- Liệt kê tất cả các volume đang có trên hệ thống.

```docker
docker volume ls
```

- Xem **chi tiết** về một volume cụ thể (đường dẫn, container đang dùng,...).

```docker
docker volume inspect
```

- Xóa một volume (chỉ xóa được nếu không còn container nào đang dùng nó).

```docker
docker volume rm
```

- Xóa **tất cả** các volume **không còn sử dụng** nữa (dọn dẹp hệ thống).

```docker
docker volume prune
```

## **Xây dựng Images (Dockerfile)**

- **Lý do**: Để host một ứng dụng **yêu cầu nhiều dependencies mà base image không cung cấp.**
- **Dockerfile**: Là một tài liệu văn bản chứa **tất cả các lệnh mà người dùng có thể gọi trên dòng lệnh để “lắp ráp” image**. Nó cho phép tự động hóa quá trình xây dựng image. Tên tệp là Dockerfile (không có phần mở rộng).

### **Các lệnh quan trọng trong Dockerfile**:

- FROM: Xác định base image.
- COPY: Sao chép tệp từ Docker host vào image.
- EXPOSE: Mở một cổng cụ thể để cho phép kết nối mạng giữa container và bên ngoài.
- RUN: Chạy lệnh trong quá trình xây dựng image và lưu kết quả dưới dạng một layer mới.
- WORKDIR: Đặt thư mục làm việc mặc định cho container.
- CMD: Lệnh mặc định chạy khi container khởi động.
- ENTRYPOINT: Lệnh chạy khi container khởi động (thường kết hợp với CMD).
- **Lệnh Build**: (dấu . chỉ định Dockerfile trong thư mục hiện hành).

```docker
docker build -t <tag_image> .
```

- Ví dụ Dockerfile đơn giản:

```docker
# FROM: Dùng image Python làm base
FROM python:3.10-slim

# WORKDIR: Đặt thư mục làm việc mặc định trong container
WORKDIR /app

# COPY: Sao chép file từ máy host (local) vào container
COPY requirements.txt .
COPY app.py .

# RUN: Cài đặt các thư viện cần thiết (layer mới)
RUN pip install -r requirements.txt

# EXPOSE: Mở cổng 5000 để bên ngoài có thể truy cập (ví dụ Flask app)
EXPOSE 5000

# ENTRYPOINT: Cố định phần chạy chính, như `python app.py`
ENTRYPOINT ["python"]

# CMD: Đối số mặc định cho ENTRYPOINT
CMD ["app.py"]
```

## **Docker Compose**

- **Mục đích**: Được sử dụng để chạy **nhiều container như một dịch vụ duy nhất trên một máy chủ đơn (single host)**. Các dịch vụ được định nghĩa trong một tệp YAML.

- **Cú pháp tệp Compose**: Định nghĩa các services (containers), volumes, networks.
- Các phiên bản Docker Compose:
    - **Version 1**:
        - **Không hỗ trợ named volumes, user-defined networks, hoặc build arguments.** Tất cả container trên mạng **bridge mặc định**, cần links để khám phá dịch vụ (lỗi thời). **Không có phân giải DNS** bằng tên container.
    - **Version 2:**
        - Links bị loại bỏ. **Phân giải DNS thông qua tên container** hoạt động. Tất cả dịch vụ phải được **khai báo dưới khóa services.** Có thể khai báo **named volumes và networks.**
    - **Version 3**
        - Hỗ trợ Docker Swarm.

### **Các lệnh Compose**:

- Khởi động ứng dụng trong chế độ nền

```docker
docker-compose up -d
```

- Dừng và loại bỏ ứng dụng

```docker
docker-compose down
```

- Hiển thị trạng thái các tiến trình.

```docker
docker-compose ps
```

- Chỉ xây dựng các image.

```docker
docker-compose build
```

- **Lưu ý**: Docker Compose **phù hợp hơn cho các kịch bản phát triển và là giải pháp triển khai trên một máy chủ.**

## **Docker Swarm: Điều phối Container (Container Orchestration)**

- Khi microservices và container trở nên phổ biến, việc quản lý chúng trong các môi trường lớn, động trở nên phức tạp, dẫn đến nhu cầu về **điều phối container**.
- **Nhu cầu Điều phối Container (Need for Orchestration) được miêu tả như sau:**
    - Container có tính **ngắn ngủi (ephemeral).**
    - Chúng có thể dừng khi tiến trình bên trong kết thúc hoặc do lỗi.
    - Một container đơn lẻ có thể **không đủ để xử lý lưu lượng truy cập tăng trưởng.**
    - Các công cụ điều phối có thể tự động khởi động lại container đã dừng, tạo container mới để xử lý lưu lượng tăng, đảm bảo **cân bằng tải (Load balancing)** và **tính sẵn sàng cao (High availability)** của ứng dụng mọi lúc.
- **Docker Swarm**: Là **giải pháp điều phối container được tích hợp sẵn của Docker**, mục đích chính là quản lý các container **trong một cluster** (một tập hợp các máy được kết nối và làm việc cùng nhau).
- **Lợi ích**: Đạt được **tính sẵn sàng cao, cân bằng tải và truy cập phi tập trung** cho các ứng dụng của chúng ta. Nó được tích hợp sẵn trong Docker Engine, không cần cài đặt thêm.
- **Khả năng**:
    - Triển khai container mới để thay thế container bị lỗi.
    - **Mở rộng số lượng container** để cân bằng tải.
    - Thực hiện **cập nhật ứng dụng** giữa các container (rolling update).
    - **Rollback ứng dụng** về các phiên bản cũ hơn.
    - Hạ một node để bảo trì mà không làm gián đoạn ứng dụng (bằng cách di chuyển workloads).
    - Đảm bảo các container bị ảnh hưởng được tạo lại trên các node khả dụng nếu một node bị sập.

### Phân biệt Docker Swarm và Kubernetes

| Tiêu chí | **Docker** | **Kubernetes (K8s)** |
| --- | --- | --- |
| Chức năng chính | Đóng gói và chạy ứng dụng trong **container** | Quản lý và điều phối **nhiều container** ở quy mô lớn |
| Level hoạt động | Máy đơn (local, server đơn lẻ) | Cụm máy (cluster – nhiều node cùng hoạt động) |
| Quản lý container | Có – tạo, chạy, stop, xóa container | Không trực tiếp – dùng Docker (hoặc container runtime) |
| Tự động scale | Không | Có – tự scale, tự healing, tự restart nếu app crash |
| Load balancing | Không có sẵn | Có built-in load balancer |
| Kết nối giữa container | Thủ công (mạng bridge, port mapping...) | Tự động qua Service, DNS nội bộ, cluster IP |
| Cấu hình nâng cao | Bằng CLI hoặc Docker Compose | YAML config phức tạp hơn nhưng mạnh hơn nhiều |
| Use case chính | Chạy thử app, dev local, build image | Quản lý production system với nhiều service/phân tán |
- Khi nào dùng?

| **Tình huống** | **Dùng Docker hay K8s?** |
| --- | --- |
| Dev local, chạy nhanh 1-2 service | Docker |
| Làm project nhỏ, thử nghiệm | Docker |
| Production, cần auto scale, HA | Kubernetes |
| Microservices nhiều service liên kết | Kubernetes |

### **Kiến trúc Docker Swarm**

- Bao gồm các **Manager** (quản lý cluster, lên lịch container) và **Worker** (chạy các tác vụ được giao). Nó sử dụng một **Discovery service** và một **Store** (cơ sở dữ liệu key-value) để duy trì trạng thái cluster.

### Mạng Overlay trong Docker Swarm

- **Mạng (Overlay driver):** Mạng **bridge** áp dụng cho các container chạy trên cùng một **Docker daemon host**. Đối với giao tiếp giữa các container chạy trên các Docker daemon host khác nhau (như trong swarm), chúng ta phải sử dụng **mạng overlay.**
- Mạng overlay **trải rộng trên toàn bộ cluster swarm**, cho phép giao tiếp giữa các container trên nhiều node.

- Nếu chúng ta tạo dịch vụ swarm mà **không chỉ định mạng**, chúng sẽ được kết nối với **mạng ingress mặc định**, đây cũng là loại overlay.
- **Khởi tạo Cluster Swarm**:
    - **Manager**:
    
    ```docker
    docker swarm init --advertise-addr <IP_MANAGER>
    ```
    
    - **Worker**:
    
    ```docker
    docker swarm join --token <TOKEN> <IP_MANAGER>:<PORT>
    ```
    

### **Docker Service**:

- Để **triển khai một image ứng dụng khi Docker Engine ở chế độ swarm**, chúng ta tạo **một service.** Một service cần image container để sử dụng, cổng mà swarm sẽ cung cấp dịch vụ ra bên ngoài, một mạng overlay để service kết nối với các service khác trong swarm và số lượng replicas của image để chạy trong swarm.

- Các lệnh dịch vụ quan trọng:
    - **Quản lý dịch vụ:**
        - Tạo dịch vụ
        
        ```docker
        docker service create --replicas <số_lượng> -p <cổng_host>:<cổng_container> --name <tên_service> <image_name>
        ```
        
        - Liệt kê các dịch vụ
        
        ```docker
        docker service ls
        ```
        
        - Hiển thị các task (container) của một dịch vụ
        
        ```docker
        docker service ps <tên_service>:
        ```
        
        - Mở rộng số lượng replicas
        
        ```docker
        docker service scale <tên_service>=<số_lượng_mới>: 
        ```
        
    - **Cập nhật và Rollback**
        - Cập nhật dịch vụ (rolling update)
        
        ```docker
        docker service update --image <image_mới>:<version> <tên_service>
        ```
        
        - Rollback cập nhật
        
        ```docker
        docker service update --rollback <tên_service>: 
        ```
        
        - Đặt node vào **trạng thái drain** để di chuyển workloads cho mục đích bảo trì.
        
        ```docker
        docker node update --availability drain <tên_node>: 
        ```
        
    - **Quản lý Node trong Swarm**
        - Đặt node trở lại trạng thái active.
        
        ```docker
        docker node update --availability active <tên_node>: 
        ```
        
        - Buộc cluster **cân bằng lại tả**i giữa các node khả dụng sau khi node được kích hoạt lại.
        
        ```docker
        docker service update --force <tên_service>
        ```
        
    - **Xóa dịch vụ**
        
        ```docker
        docker service rm <tên_service>: 
        ```
        

## **Ingress Routing**:

- Đây là một tính năng quan trọng trong Swarm. Trong chế độ **non-swarm,**  chúng ta **không thể chạy nhiều container với cùng cổng host** được publish do xung đột cổng.
- Tuy nhiên, trong **chế độ Swarm**, **mạng ingress có một bộ cân bằng tải (load balancer) tích hợp** chuyển hướng lưu lượng từ cổng được publish trên host đến các cổng container được ánh xạ, cho phép nhiều container trên cùng một Docker host sử dụng cùng một cổng host mà không xung đột. 

- Routing mesh cho phép **mọi node trong cluster chấp nhận kết nối trên các cổng được publish cho bất kỳ dịch vụ nào đang chạy trong swarm**, ngay cả khi không có task nào chạy trên node cụ thể đó, bằng cách định tuyến các yêu cầu đến một container đang hoạt động ở nơi khác trong swarm.

## **Lưu trữ Persistent (Persistent Storage) trong Swarm**

- Để duy trì dữ liệu trên nhiều Docker host trong một cluster Swarm, cần có **hệ thống tệp phân tán (distributed file systems) hoặc hệ thống tệp mạng (network file systems)** (như NFS, GlusterFS, Ceph).

- Lý do là các chương trình chạy trên cluster **không được đảm bảo sẽ chạy trên một node cụ thể**. Nếu một chương trình cố gắng lưu dữ liệu vào một tệp nhưng sau đó được chuyển sang một node mới, tệp sẽ không còn ở nơi mà chương trình mong đợi nữa.
- Các giải pháp như **Named Mount hoặc Bind Mount chỉ hoạt động tốt cho các container trên một host duy nhất.**

## **Docker Stacks**

- **Mục đích**: Được sử dụng để **triển khai một stack ứng dụng hoàn chỉnh cho swarm**. Nó là phiên bản **"production grade" của docker-compose.**
    - **Stack** = Tập hợp nhiều **Service** (được mô tả bằng Docker Compose).
- Sử dụng cùng cú pháp tệp **docker-compose.yml,** nhưng có **thêm phần deploy trong tệp manifest** để cấu hình cụ thể cho swarm (như số lượng replicas và ràng buộc vị trí - placement constraints).
- **Docker stack bỏ qua các chỉ thị "build"**.   chúng ta không thể xây dựng image mới bằng lệnh stack. Nó yêu cầu các image **đã được xây dựng sẵn (pre-built images) phải tồn tại.**
- **Placement Constraints**: **Cho phép ràng buộc container vào một node cụ thể** (ví dụ: node.role == manager). Khi các container này bị lỗi, swarm sẽ triển khai một container khác trên cùng node đó, đảm bảo tính bền vững dữ liệu.
- **Các lệnh Stack**:
    - Triển khai **một stack gồm nhiều service** dựa trên file `docker-compose.yml`.
    
    ```docker
    docker stack deploy -c <compose.yml> <tên_stack> 
    ```
    
    - Liệt kê tất cả các stack đang chạy trong hệ thống Swarm.
    
    ```docker
    docker stack ls
    ```
    
    - Hiển thị các task (container) của toàn bộ stack (bao gồm tất cả các service bên trong
    
    ```docker
    docker stack ps <tên_stack>
    ```
    
    - Xóa toàn bộ stack, bao gồm tất cả các service trong đó.
    
    ```docker
    docker stack rm <tên_stack>
    ```
    

## **Bộ cân bằng tải bên ngoài (External Load Balancers)**

- Để người dùng cuối truy cập ứng dụng thông qua một **điểm cuối chung (tên DNS)**, một **Bộ cân bằng tải bên ngoài hoặc Reverse Proxy** (ví dụ: HAProxy, Nginx, hoặc Traefik) được sử dụng để định tuyến lưu lượng truy cập bên ngoài vào cluster và cân bằng tải nó trên các node khả dụng
