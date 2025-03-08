# Deploying a YouTube Clone App on AWS EKS with Jenkins and Terraform

- Đây là đề tài của đồ án môn học ***Công nghệ DevOps và ứng dụng - NT548.P21***
- Tên tiếng Việt: Triển khai ứng dụng YouTube trên AWS EKS với Jenkins và Terraform

## Tổng quát

- Đồ án này nhằm cung cấp cái nhìn toàn diện về quy trình làm việc của DevOps và tư duy sử dụng công nghệ để giải quyết bài toán được đưa ra. 

- Nói một cách chi tiết, đây là dự án nhằm thực hiện triển khai một ứng dụng YouTube Clone trên cụm Kubernetes được quản lý bởi AWS Elastic Kubernetes Service (EKS), sử dụng công nghệ Jenkins để tự động hóa CI/CD và Terraform để quản lý hạ tầng.

## Phân tích giải pháp

### Giải pháp 1: Deploying a YouTube Clone App on AWS EKS with Jenkins and Terraform

- *Ưu điểm*: Phù hợp với cấp độ sinh viên, đơn giản hóa quy trình CI/CD, tập trung vào các công cụ phổ biến như Jenkins, Helm, và Blue/Green deployment.

- *Nhược điểm*: Vẫn sử dụng cách tiếp cận truyền thống với Jenkins, thiếu tính bảo mật và các giải pháp hiện đại như GitOps và object storage cho video.

- *Mô hình*:
![Giải pháp 1](/Asset/Image/first-solution.png)

- Công nghệ sử dụng: 

    - Môi trường làm việc: Vscode
    - Quản lý phiên bản và lưu trữ code: Git, Github
    - Tối ưu hóa quy trình CI/CD: Jenkins
    - Đóng gói ứng dụng: Docker
    - Xây dựng cơ sở hạ tầng AWS: Terraform
    - Quản lý cấu hình: Kubernete, Helm Charts
    - Quản lý cụm Kubernetes: AWS EKS
    - Bảo mật:
        - Phân tích chất lượng code: SonarQube
        - Quét lỗ hổng container: Trivy
    - Giám sát và cảnh báo: Prometheus, Grafana, AWS Cloudwatch


### Giải pháp 2: YouTube App Clone Deployment with Kubernetes, DevSecOps & ArgoCD on AWS

- *Ưu điểm*: Hiện đại hơn với GitOps (ArgoCD), giải quyết vấn đề lưu trữ video (AWS S3), tối ưu hóa hiệu suất (CloudFront CDN), tự động scale (Karpenter & HPA), và tăng cường bảo mật (DevSecOps).

- *Nhược điểm*: Có thể phức tạp hơn đối với sinh viên mới làm quen với DevOps, yêu cầu kiến thức sâu hơn về Kubernetes và AWS.

- *Mô hình*: 
![Giải pháp 2](/Asset/Image/second-solution.png)

- *Công nghệ sử dụng*:

    - Môi trường làm việc: Vscode
    - Quản lý phiên bản và lưu trữ code: Git, Github
    - Quản lý cơ sở hạ tầng AWS: Terraform
    - Phân tích mã nguồn tĩnh (SAST): Sonarqube
    - Kiểm tra lỗ hổng bảo mật động (DAST): OWASP
    - Quét container và image để phát hiện lỗ hổng bảo mật: Trivy
    - Triển khai theo mô hình GitOps, tự động đồng bộ hóa trạng thái mong muốn từ repository: ArgoCD
    - Đóng gói container và lưu trữ image: Docker, Docker Hub
    - Bảo vệ ứng dụng khỏi các cuộc tấn công web: AWS WAF
    - Quản lý Kubernetes cluster: AWS EKS
    - Lưu trữ video: AWS S3
    - Phân phối nội dung đến người dùng cuối: CloudFront CDN
    - Giám sát hiệu suất hệ thống: Prometheus, Grafana
    - Phân tích logs: Phân tích logs
    - Thông báo và cảnh báo: Slack