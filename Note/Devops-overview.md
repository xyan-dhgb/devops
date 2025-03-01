# Tổng quan về DevOps

# Mục lục

1. [Các mô hình phát triển](#các-mô-hình-phát-triển)
2. [DevOps là gì?](#devops-là-gì)
3. [Quy trình làm việc của DevOps](#quy-trình-làm-việc-của-devops)
4. [Lợi ích của DevOps](#lợi-ích-của-devops)
5. [DevOps cần học gì?](#devops-cần-học-gì)
6. [Kế hoạch học DevOps](#kế-hoạch-học-devops)
7. [Tổng kết](#tổng-kết)

## Các mô hình phát triển
 
Các mô hình phát triển truyền thống thường có sự phân tách rõ ràng giữa các nhóm Development (Dev) và Operations (Ops). Điều này dẫn đến sự chậm trễ trong việc triển khai phần mềm do các quy trình phê duyệt thủ công và sự thiếu nhất quán giữa hai nhóm.

Các loại mô hình ấy có những điểm mạnh và yếu chuyên biệt, có thể được kể đến như sau:

| Tiêu chí              | Waterfall                            | Agile                               | Scrum                                |
|----------------------|----------------------------------|----------------------------------|----------------------------------|
| **Định nghĩa**       | Mô hình phát triển phần mềm tuần tự, từng giai đoạn hoàn thành trước khi chuyển sang giai đoạn tiếp theo. | Phương pháp phát triển linh hoạt, chia phần mềm thành các phần nhỏ có thể phát hành sớm. | Một khung làm việc Agile với các chu kỳ ngắn (Sprint) và các vai trò cụ thể. |
| **Quy trình**        | 6 giai đoạn: Yêu cầu → Thiết kế → Triển khai → Kiểm thử → Triển khai → Bảo trì. | Chia nhỏ dự án thành các vòng lặp (iteration), phản hồi liên tục từ khách hàng. | Sử dụng Sprint (thường 2-4 tuần), có Daily Standup, Sprint Planning, Review, Retrospective. |
| **Tính linh hoạt**   | Không linh hoạt, khó thay đổi sau khi đã lên kế hoạch. | Linh hoạt, có thể thay đổi yêu cầu ngay cả khi đang phát triển. | Linh hoạt cao, thay đổi theo yêu cầu khách hàng nhưng có khuôn khổ rõ ràng. |
| **Khả năng phản hồi** | Chậm, phản hồi khách hàng chỉ có sau khi hoàn thành sản phẩm. | Nhanh, có thể cung cấp sản phẩm từng phần và nhận phản hồi. | Rất nhanh, có thể thay đổi chiến lược trong mỗi Sprint. |
| **Thời gian phát triển** | Dài, thường mất vài tháng hoặc năm mới hoàn thành sản phẩm. | Ngắn hơn Waterfall, có thể ra bản dùng thử sớm. | Ngắn, mỗi Sprint chỉ kéo dài vài tuần. |
| **Kiểm thử**         | Kiểm thử diễn ra ở giai đoạn cuối cùng. | Kiểm thử liên tục sau mỗi vòng lặp. | Kiểm thử tích hợp trong mỗi Sprint. |
| **Triển khai sản phẩm** | Một lần duy nhất khi hoàn tất toàn bộ dự án. | Có thể triển khai từng phần sau mỗi vòng lặp. | Có thể triển khai liên tục sau mỗi Sprint. |
| **Quản lý rủi ro**   | Cao, nếu có lỗi sẽ khó sửa vì mọi thứ đã hoàn tất. | Thấp, phát hiện lỗi sớm và có thể sửa trong quá trình phát triển. | Rất thấp, liên tục cải tiến và sửa lỗi nhanh chóng. |
| **Vai trò chính**    | Quản lý dự án, khách hàng, đội phát triển. | Nhóm phát triển tự quản lý, không có vai trò cố định. | Product Owner, Scrum Master, Development Team. |
| **Phù hợp với**      | Dự án lớn, yêu cầu rõ ràng từ đầu và ít thay đổi. | Dự án có yêu cầu biến đổi nhanh, cần phản hồi liên tục. | Dự án Agile có quy mô trung bình, cần tổ chức rõ ràng. |

Tuy nhiên, ta cần nhìn nhận vấn đề như sau:

- Vấn đề của Waterfall: Quá trình phát triển chậm, phản hồi khách hàng muộn, rủi ro cao khi thay đổi yêu cầu.
- Agile & Scrum cải tiến: Giúp phát triển linh hoạt hơn, triển khai từng phần, nhận phản hồi sớm. Tuy nhiên, vẫn chưa tối ưu việc vận hành (Ops).

Vì thế, DevOps ra đời để kết hợp Agile/Scrum với vận hành hệ thống.

## DevOps là gì?
DevOps là sự kết hợp của các nguyên lý, thực hành, quy trình và các tool giúp tự động hóa quá trình lập trình, tăng tốc độ phát triển, thử nghiệm và chuyển giao phần mềm.

Hay nói cách khác, đây là sự kết hợp giữa 2 giai đoạn Phát triển (Development) và Vận hành phần mềm (Operation) sao cho 2 giai đoạn này tiến lại đồng nhất với nhau.

## Quy trình làm việc của DevOps

![Luồng làm việc của DevOps](/Asset/Image/devops-workflow.png)

Tóm tắt: Plan → Develop (Code) → Build → Test → Release → Deploy → Operate → Monitor → (Quay lại Plan)

Quá trình trên được miêu tả cụ thể như sau:

- **Plan (Lập kế hoạch)**  
   - Xác định yêu cầu, tính năng, roadmap dự án.  
   - Công cụ: Jira, Trello, GitHub Projects.  

- **Develop (Phát triển)**  
   - Lập trình và quản lý mã nguồn với Git.  
   - Code được push lên GitHub/GitLab.  
   - Công cụ: Git, GitHub, GitLab.  

- **Build (Xây dựng ứng dụng)**  
   - Biên dịch, kiểm tra dependencies (Các gói phụ thuộc).  
   - Tạo Docker Image, kiểm thử unit.  
   - Công cụ: Maven, Gradle, Docker

- **Test (Kiểm thử)**  
   - Chạy Unit Test, Integration Test, Security Test.  
   - Công cụ: Selenium, JUnit, SonarQube.
   - Mục tiêu: Đây là quá trình CI giúp tìm bug nhanh hơn từ sớm, cải thiện chất lượng phần mềm, và giản thiểu thời gian để xác thực và ra mắt các update mới.

- **Release (Phát hành)**  
   - Triển khai lên staging/test environment.  
   - Xác nhận trước khi đưa vào production.  
   - Công cụ: Jenkins, GitHub Actions, GitLab CI/CD. 

- **Deploy (Triển khai)**  
   - Continuous Deployment lên production.  
   - Triển khai bằng container, Kubernetes.  
   - Công cụ: Kubernetes, ArgoCD, Helm. 
   - Mục tiêu: Tăng tốc quá trình deploy sản phẩm liên tục để đáp ứng các yêu cầu liên tục của khách hàng

- **Operate (Vận hành)**  
   - Giám sát, log hệ thống, alert khi có sự cố.  
   - Công cụ: Prometheus, Grafana, ELK Stack.  

- **Monitor & Feedback (Giám sát & Phản hồi)**  
   - Theo dõi hiệu suất, fix bug nhanh.  
   - Feedback cải thiện sản phẩm.  
   - Công cụ: Prometheus, Grafana, Datadog.  

![Luồng làm việc cụ thể](/Asset/Image/devops-specific-workflow.png)

## Lợi ích của DevOps

- Tốc độ : DevOps giúp các developers và team operations đạt được mục tiêu ở một tốc độ khác giúp cải tiến sản phẩm nhanh chóng phục vụ người dùng, thích nghi với thị trường tốt hơn và điểu chỉnh hiểu quả kinh doanh hiệu quả hơn.

- Chuyển giao nhanh chóng: Tăng tốc độ release thường xuyên để chúng ta cải thiện sản phẩm nhanh hơn và cho ra mắt các feature nhanh hơn cũng như fix bug, giúp phản hồi cho khách hàng nhanh chóng và xây dựng nên lợi thế cạnh tranh tốt hơn.

- Độ tin cậy : DevOps đảm bảo chất lượng bằng cách áp dụng CI /CD, Monitoring và logging process. Bằng cách update mà team infrastructure cấp quyền cho team development để chuyển giao nhanh hơn mà vẫn duy trì được trải nghiệm người dùng tốt.

- Mở rộng : Team vận hành, quản lý infrastructure và các quy trình. Lên kế hoạch về quy mô và nâng cấp môi trường giúp quản trị các hệ thống phức tạp hoặc hay thay đổi hiệu quả cũng như giảm thiểu rủi ro.

- Bảo mật : DevOps giúp di chuyển mà không chịu tổn thất về bảo mật bằng các chính sách, kiểm soát và phương pháp quản lý configuration. Thậm chí các team có thể kêu gọi bạn theo các tiêu chuẩn từ sớm bằng cách cung cấp các setup các tool theo dõi.

## DevOps cần học gì?

- Biết và sử dụng linux, window, macOS. Biết dùng thành thạo lệnh Terminal trong linux, CMD và powercell trong window và lệnh trong Linux hoặc Macos.

- Có kiến thức cơ bản về: Process Management, Threads and Concurrency, Sockets, I/O Management, Virtualization, Memory storage and File systems.

- Nên có kiến thức cơ bản về dịch vụ mạng như: DNS, HTTP, HTTPS, FTP, SSL. Hoặc tìm hiểu thêm về các lỗ hổng bảo mật thường gặp.

- Biết cài đặt và sử dụng vài Web Server phổ biến như: Apache và Nginx. Tìm hiểu một số khái niệm và chức năng thường được sử dụng: Caching Server, Load balancer, Reverse Proxy, and Firewall. Có thể bắt đầu với một vài practice với Docker đơn giản như:

    - Setup thử một vài cache server
    - Giả lập có nhiều servers dưới local bằng cách dùng các Docker container. Sử dụng chức năng Load balancer của Web server để cân bằng tải cho server.

- Biết và sử dụng một số dịnh vụ cloud như AWS của amazon, google cloud, và azure của microsoft.

- Biết code một số ngôn ngữ hệ thống như bashscript, java, javascipt , python, Php…

- Biết dùng 1 số tool để truyển khai CI/CD như jenkins, jira , git (Gitlab, Bitbucket…)… 

- Một DevOps Engineer nên biết Infrastructure as code: Containers: Docker, Kubernetes

- Các công cụ quản lý cấu hình: Ansible, Pupet, Chef,..

- Biết sử dụng các tool monitoring server như: Nagios, Zabbix, Icing, Datadog…

## Kế hoạch học DevOps:

- Tổng quan về DevOps: 
    - Tìm hiểu khái niệm DevOps, lợi ích và các nguyên tắc cốt lõi (CAMs: Culture, Automation, Measurement, Sharing)
    - Các mô hình phát triển phần mềm (Waterfall vs Agile vs DevOps)
    - Các công cụ DevOps phổ biến

- Quản lý mã nguồn (Git)

- Infrastructure as Code (IaC):
    - Tìm hiểu Terraform và AWS CloudFormation
    - Viết script để tạo và quản lý hạ tầng trên AWS

-  Configuration Management:
    - Tìm hiểu về Ansible, cách viết Playbook
    - So sánh với Puppet, Chef
    - Áp dụng Ansible vào quản lý server

-  Cloud Computing:
    - Tìm hiểu AWS: EC2, S3, IAM, VPC, ...
    - Làm quen với Azure Cloud

- Containerization & Orchestration:
    - Docker basics (images, containers, networking)
    - Kubernetes cơ bản (Pods, Deployments, Services)
    - Triển khai ứng dụng trên Kubernetes

- CI/CD Pipelines:
    - Jenkins cơ bản, tạo pipeline
    - GitHub Actions, Azure DevOps
    - Triển khai CI/CD trên AWS

- GitOps:
    - Tìm hiểu GitOps và ArgoCD
    - Triển khai GitOps trên Kubernetes

- Monitoring & Logging:
    - Prometheus cơ bản (Metric, AlertManager)
    - Grafana: Visualization và Alerting

## Tổng kết
- DevOps không chỉ là công cụ, mà còn là văn hóa
- Luôn thực hành liên tục
- Dùng Open Source để tiết kiệm chi phí