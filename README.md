# Công nghệ DevOps và ứng dụng - NT548.P21

Đây là kho lữu trữ cung cấp cho tôi kiến thức nền tảng về DevOps, bao gồm các khái niệm, kỹ thuật và công
nghệ liên quan. Ngoài ra, tôi sẽ được giới thiệu tổng quan và các xu hướng hiện nay về DevSecOps, MLOps, cùng với việc tích hợp bảo mật vào quy trình DevOps và áp dụng DevOps trong triển khai mô hình học máy (Machine Learning - ML).

## Mục Lục

1. [Giới thiệu DevOps](#giới-thiệu-về-devops)
2. [Mục tiêu](#mục-tiêu)
3. [Cách thực hành](#cách-thực-hành)
4. [Cấu trúc thư mục](#cấu-trúc-thư-mục)
5. [Tài liệu học tập](#tài-liệu-học-tập)
6. [Cách làm việc](#cách-làm-việc)
77. [Thông tin liên hệ](#thông-tin-liên-hệ)

## Giới thiệu về DevOps

DevOps là một tập hợp các thực hành kết hợp phát triển phần mềm (Dev) và vận hành (Ops). Nó nhằm rút ngắn vòng đời phát triển và cung cấp phần mềm chất lượng cao liên tục.

Tham khảo thêm ở [Devops-overview](/Note/Devops-overview.md)

## Mục tiêu

Môn học cung cấp một cái một cái nhìn toàn diện về DevOps, từ những nguyên tắc, kiến thức cơ bản đến nâng cao, những thách thức và xu hướng mới trong lĩnh vực này. 

Điều này sẽ giúp tôi không những hiểu được lý thuyết mà còn có khả năng áp dụng các kỹ năng này một cách thực
tế trong môi trường làm việc chuyên nghiệp

## Cách thực hành

- Tự động hóa mọi thứ: Kiểm thử, triển khai, giám sát.
- Triển khai các pipeline CI/CD.
- Sử dụng quản lý phiên bản cho tất cả mã và tệp cấu hình.
- Giám sát và ghi nhật ký mọi thứ để đảm bảo sức khỏe và hiệu suất hệ thống.
- Khuyến khích văn hóa hợp tác giữa các nhóm phát triển và vận hành.

## Cấu trúc thư mục
```bash
├── Asset           # Lưu trữ tài nguyên tĩnh như ảnh, gif, ...
├── Note            # Ghi chú về lý thuyết
├── Project         # Đồ án
├── README.md       # Nội dung tổng quát của repo
└── Slide           # Slide lý thuyết
```

## Tài liệu học tập

- [DevOps Handbook](https://www.amazon.com/DevOps-Handbook-World-Class-Reliability-Organizations/dp/1942788002)
- [Continuous Delivery](https://www.amazon.com/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912)
- [Tài Liệu Kubernetes](https://kubernetes.io/docs/home/)
- [Tài Liệu Docker](https://docs.docker.com/)

## Cách làm việc

Mỗi khi có thay đổi, cần phải push lên GitHub theo cú pháp nhất định của commit. Cú pháp commit nên bao gồm:

- **Tiêu đề**: Mô tả ngắn gọn về thay đổi (tối đa 50 ký tự).
- **Nội dung chi tiết**: Mô tả chi tiết về thay đổi, lý do thay đổi và bất kỳ thông tin liên quan nào khác.
- **Tham chiếu**: Tham chiếu đến các issue hoặc pull request liên quan (nếu có).

Ví dụ:

```
feat: Thêm chức năng tự động triển khai

- Thêm script tự động triển khai lên môi trường staging
- Cập nhật tài liệu hướng dẫn sử dụng
- Đã kiểm thử và xác nhận hoạt động tốt

Refs: #123
```

Dùng dấu ! nếu commit có thay đổi lớn (breaking change)

Ví dụ:
```
feat(api)!: change response format to JSON
```

Commit nhỏ nên được squash lại trước khi push

Ví dụ:
```
git rebase -i HEAD~5  # Squash 5 commit gần nhất thành 1
```

Sử dụng git commit --amend để chỉnh sửa commit gần nhất

Ví dụ:
```
git commit --amend -m "fix(auth): correct JWT token expiration"
```

## Thông tin liên hệ

Liên hệ tôi thông qua email: giabaoctg@gmail.com