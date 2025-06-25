## Jenkins là gì?

- **Jenkins** là một **máy chủ tự động hóa mã nguồn mở** được viết bằng Java. Nó giúp **tự động hóa các phần của quá trình phát triển phần mềm** liên quan đến việc xây dựng (building), kiểm thử (testing) và triển khai (deploying).
- Jenkins hỗ trợ **Tích hợp Liên tục (CI)** và **Phân phối Liên tục (CD)** (CI/CD).
- Đây là một trong những công cụ CI/CD phổ biến nhất được các nhà phát triển sử dụng để tạo ra một **pipeline liền mạch (seamless)** cho việc phân phối mã nguồn.

## Các khái niệm chính của Jenkins

### Jenkins Pipeline

- Là một **tập hợp các tác vụ** được tự động hóa để **xây dựng, kiểm thử và triển khai phần mềm.** Nó là một **workflow** định nghĩa các bước để đưa mã từ hệ thống quản lý phiên bản (version control) đến môi trường sản xuất (production).

### Jobs

- Một **job** trong Jenkins **đại diện cho một tác vụ hoặc một bước** trong một pipeline. Jenkins có thể có nhiều job cho các giai đoạn khác nhau trong pipeline (ví dụ: build, test, deploy).

### Build

- Một build là **kết quả của việc thực thi một job.** Các build có thể **đại diện cho mã đã được biên dịch (compiled code)** hoặc đơn giản là **kết quả** của việc chạy các bài kiểm thử tự động.

### Node và Executors (Kiến trúc Master-Slave)

- **Nodes:** Jenkins sử dụng kiến trúc **master-slave** (hiện thường gọi là **master-agent**) để quản lý các máy khác nhau thực thi các job.
- **Master Node:** Xử lý việc lập lịch (scheduling) và điều phối (orchestration) các job.
- **Slave/Agent Nodes:** Thực thi các job, và chúng có thể nằm trên các máy/máy chủ khác nhau.
- **Executors:** Là các **slot** trên một node thực thi các job. Chúng ta có thể cấu hình số lượng job mà một executor có thể thực thi.
- **Các loại Agent:**
    - **Static agents** (máy/VM **được cấu hình sẵn**).
    - **Dynamic agents** (có thể được tạo ra **theo yêu cầu,** ví dụ: Docker containers, Kubernetes pods).

### Plugins

- Jenkins có kiến trúc dựa trên plugin cho phép nó **tích hợp với hầu hết mọi công cụ phát triển** (hệ thống SCM (Source Code Management**)**, công cụ build, công cụ triển khai, v.v.). Các plugin phổ biến bao gồm
    - Git Plugin: Tích hợp mã nguồn.
    - Maven Plugin: Dùng để build các dự án Maven.
    - Docker Plugin: Dùng để tương tác với Docker.
    - Slack Plugin: Dùng để gửi thông báo.
    - Blue Ocean: Cung cấp giao diện cho Jenkins.

## Ưu điểm của Jenkins

- **Khả năng mở rộng (Extensibility):** Với hơn 1.800 plugin, Jenkins có thể tích hợp với hầu hết mọi công cụ.
- **Tự động hóa (Automation):** Tự động hóa hoàn toàn pipeline CI/CD.
- **Linh hoạt (Flexibility):** Có khả năng tùy chỉnh cao và hỗ trợ bất kỳ loại dự án nào (Java, Node.js, Python, v.v.).
- **Hỗ trợ Cộng đồng (Community Support):** Jenkins có một cộng đồng lớn, tích cực cung cấp tài liệu, hướng dẫn và plugin.
- **Đa nền tảng (Cross-Platform):** Có thể chạy trên bất kỳ hệ điều hành nào (Windows, Linux, macOS)

## Thiết lập Jenkins

- Điều kiện tiên quyết:
    - **Java:** Jenkins chạy trên Java, vì vậy cần cài đặt Java trên máy của mình (JDK 17 được khuyến nghị).
    - **Trình duyệt web:** Jenkins được truy cập thông qua giao diện web.
    - **Máy chủ:** Có thể chạy Jenkins trên máy cục bộ, máy chủ hoặc trên đám mây
- **Cài đặt:** Có thể cài đặt trên các nền tảng khác nhau (Windows, Linux).
- **Thiết lập ban đầu:** Sau khi cài đặt, Jenkins chạy trên **http://localhost:8080**.

## **Các Loại Dự Án / Khái Niệm Cơ Bản của Jenkins**

### **Freestyle Projects:**

- Là loại job Jenkins **đơn giản nhất**. Nó cho phép nhà phát triển định nghĩa một chuỗi các bước build mà Jenkins sẽ thực thi.
- Các bước:
    - Tạo "New Item" ➝ chọn "Freestyle Project"
    - Định nghĩa SCM (ví dụ: Git) ➝ ****Định nghĩa Build Triggers (khi job chạy - **thủ công (manually)**, **định kỳ (periodically),** khi có thay đổi SCM) ➝ thêm Build Steps (ví dụ: lệnh shell, Maven build) ➝ Định nghĩa Post-Build Actions (ví dụ: gửi thông báo, lưu trữ artifacts).

### Jenkins cơ bản

- **Pipelines**: Là các **workflow được kịch bản hóa (scripted workflows)** cung cấp nhiều quyền kiểm soát và linh hoạt hơn so với Freestyle Projects.
- Định nghĩa pipelines bằng cách sử dụng **Jenkinsfile**, một tệp văn bản chứa định nghĩa của pipeline.
- **Declarative Pipelines:** Một cách đơn giản, có cấu trúc để định nghĩa pipeline bằng cú pháp pipeline.
- **Scripted Pipelines:** Sử dụng cú pháp **Groovy** nâng cao hơn, cung cấp nhiều tính linh hoạt và kiểm soát hơn.
- **Pipelines as Code:** Định nghĩa Jenkins pipelines dưới dạng mã bằng **Jenkinsfile**, cho phép quản lý phiên bản cho pipeline của nhà phát triển và giúp việc bảo trì dễ dàng hơn. Ví dụ:

## **CI/CD với Jenkins**

- **Jenkins kích hoạt CI (Continuous Integration)** bằng cách chạy các **build** và **kiểm thử tự động** khi mã được đẩy lên hệ thống quản lý phiên bản.
- **CD (Continuous Deployment)** đạt được bằng cách tự động **triển khai ứng dụng đến môi trường staging/production** nếu build và kiểm thử thành công.
- **Workflow CI/CD đơn giản:**
    - **Build:** Jenkins **kéo mã từ GitHub**, chạy quá trình build (sử dụng Maven/Gradle), lưu trữ các build artifacts (ví dụ: tệp JAR/WAR).
    - **Test:** Jenkins chạy các **unit tests, integration tests** hoặc các kiểm thử khác (ví dụ: sử dụng JUnit).
    - **Deploy:** Nếu các kiểm thử vượt qua, Jenkins có thể triển khai ứng dụng đến môi trường production hoặc staging.
- **Kích hoạt Build (Triggering Builds):**
    - **Poll SCM:** Jenkins định kỳ kiểm tra kho lưu trữ để tìm thay đổi.
    - **Webhooks:** Jenkins kích hoạt build khi GitHub/Bitbucket gửi một sự kiện webhook.
    - **Manual:** Bạn có thể kích hoạt build thủ công

## **Các Khái Niệm Nâng Cao và Tích Hợp của Jenkins**

- **Distributed Builds (Build phân tán):** Jenkins có thể phân tán các job build trên các máy khác nhau để **cân bằng tải** và **tăng tốc quá trình**.
- **Jenkins và Docker:** Thường được sử dụng cùng nhau để:
    - **Build Docker images** trong Jenkins.
    - **Triển khai ứng dụng** bằng Docker containers.
    - Chạy Jenkins bên trong một Docker container (Jenkins-in-Docker).
- Ví dụ Jenkins với Docker:

## **Ví Dụ CI/CD Hoàn Chỉnh (Ứng Dụng Thực Tế)**

**Tổng quan Workflow:** Chạy kiểm thử trên mỗi lần đẩy mã lên GitHub, build Docker image nếu kiểm thử thành công, triển khai ứng dụng, gửi thông báo sau khi build hoàn tất

- **Các plugin cần thiết:** Git Plugin, Pipeline Plugin, Docker Pipeline Plugin, Slack Notification Plugin hoặc Email Extension Plugin.
- **Tạo Jenkins Pipeline (Jenkinsfile):** Tạo một tệp tên Jenkinsfile ở thư mục gốc của kho GitHub để định nghĩa pipeline. Các giai đoạn ví dụ trong Jenkinsfile:
    - **Checkout:** Kéo mã từ GitHub**16**.
    - **Test:** Chạy các kiểm thử tự động. Nếu kiểm thử thành công, pipeline tiếp tục.
    - **Build Docker Image:** Sử dụng Docker để build một image từ Dockerfile. Chỉ thực thi nếu giai đoạn trước thành công.
    - **Deploy to Server:** Đẩy Docker image đã build lên DockerHub, sau đó SSH vào máy chủ từ xa để kéo và chạy image mới.
    - **Post:** Gửi thông báo Slack khi thành công hoặc thất bại

### **Thiết lập Webhooks cho GitHub**

- Vào cài đặt kho GitHub.
- Chọn Webhooks và nhấp vào Add webhook.
- Đối với Payload URL, sử dụng **http://<JENKINS_URL>:<PORT>/github-webhook/.**
- Đặt Content type là **application/json.**
- Chọn "Let me select individual events" và chọn **"Push".**
- Sau khi thiết lập, mỗi khi mã được đẩy lên GitHub, Jenkins sẽ được thông báo và kích hoạt pipeline

### Dockerfile

- Cấu hình Dockerfile để build và container hóa ứng dụng

### **Thiết lập Triển khai**

- Đảm bảo Docker được cài đặt và chạy trên máy chủ từ xa, thiết lập SSH keys để Jenkins có thể SSH vào máy chủ mà không cần mật khẩu.
- Lưu trữ **SSH credentials và DockerHub login credentials** trong **kho credentials** của Jenkins.

### **Cấu hình Thông báo Slack**

- Cài đặt Slack Notification Plugin, cấu hình plugin với Slack workspace và channel.
- Tạo Slack Webhook, lưu trữ thông tin Slack trong **Jenkins credential.**

## Jenkins với Kubernetes

- Jenkins có thể tích hợp với Kubernetes để **tạo động các Jenkins agents (pods)** trong các Kubernetes clusters, làm cho pipeline CI/CD của bạn trở nên **có khả năng mở rộng** hơn.

## Best practice

- Nên ưu tiên Jenkinsfile
- Dùng song song để chạy các giai đoạn khác nhau của pipeline song song để build nhanh hơn.
- Phân phối các build trên các node khác nhau để tránh quá tải node master.