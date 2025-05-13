# Github Actionss

## Tổng quan

- GitHub Actions là một nền tảng tích hợp liên tục và phân phối liên tục (CI/CD) được tích hợp sẵn trong GitHub, giúp cho nhà phát triển tự động hóa các quy trình phát triển phần mềm như xây dựng, thử nghiệm và triển khai. 

- Nó cho phép chúng ta tạo ra các workflow (luồng công việc) để xây dựng, kiểm thử, triển khai hoặc thực hiện các tác vụ khác khi có sự kiện xảy ra (pull request, merge, push) trong repository.

- GitHub cung cấp các máy ảo Linux, Windows và macOS để chạy quy trình công việc của dự án hoặc chúng ta có thể lưu trữ các trình chạy tự lưu trữ của riêng mình trong trung tâm dữ liệu hoặc cơ sở hạ tầng đám mây.

## Lợi ích

- Tích hợp liền mạch với GitHub repository.
- Hỗ trợ tự động hóa toàn bộ quy trình phát triển phần mềm.
- Dễ dàng mở rộng và tùy chỉnh theo nhu cầu.
- Tiết kiệm thời gian và công sức cho các tác vụ lặp đi lặp lại.

## Hạn chế cần lưu ý

- Giới hạn tài nguyên và thời gian chạy trên GitHub-hosted runner (đặc biệt với tài khoản miễn phí).
- Cần hiểu rõ YAML và các khái niệm cơ bản để tránh lỗi cấu hình.
- Workflow phức tạp có thể khó debug nếu không có kinh nghiệm.

## Các thành phần của GitHub Actions

 ![Hình minh họa thành phần của GitHub Actions](/Asset/Image/github-action-workflow.png)

- Chúng ta có thể cấu hình workflow GitHub Actions để được kích hoạt mỗi khi có bất kì sự kiện nào xảy ra trong kho lưu trữ của dự án, chẳng hạn như pull request được mở hoặc một issue được tạo. 

- Quy trình làm việc của chúng ta chứa một hoặc nhiều `job` có thể chạy theo thứ tự tuần tự hoặc song song. 

- Mỗi `job` sẽ chạy bên trong trình chạy máy ảo của riêng nó hoặc bên trong một container và có một hoặc nhiều `step` chạy một tập lệnh mã nguồn do chúng ta xác định hoặc chạy một `action`

### Workflows

- Là một tập hợp các bước tự động hóa có thể cấu hình sẽ chạy một hoặc nhiều `jobs`.

- Được lưu trong thư mục .`github/workflows/`

### Events

- Là các sự kiện kích hoạt workflow, ví dụ: `push`, `pull_request`, `schedule`, hoặc các sự kiện tùy chỉnh:
    - `push`: Kích hoạt khi có commit được đẩy lên repository.
    - `pull_request`: Kích hoạt khi có pull request được mở, cập nhật, hoặc merge.
    - `schedule`: Kích hoạt theo lịch trình định sẵn (cron).
    -` workflow_dispatch`: Kích hoạt thủ công từ giao diện GitHub.
    - `repository_dispatch`: Kích hoạt từ các sự kiện tùy chỉnh.

### Jobs

- Là một tập hợp các bước (`steps`) được thực thi trên **cùng một runner**.

- Các jobs có thể chạy song song hoặc tuần tự (nếu có thiết lập phụ thuộc).

- Chúng ta có thể cấu hình sự phụ thuộc của một `job` với các `job` khác; theo mặc định, các `job` **không có sự phụ thuộc** và chạy song song.

- Khi một `job` phụ thuộc vào một `job` khác, nó sẽ đợi `job` phụ thuộc đó hoàn tất trước khi chạy.

### Steps

- Là một bước trong `job`, có thể là một lệnh shell hoặc một action cụ thể.

### Actions

- Là các tác vụ có thể **tái sử dụng**, được viết sẵn hoặc tự tạo, giúp thực hiện các công việc cụ thể trong workflow.

- Sử dụng `action` để giúp giảm lượng mã lặp lại mà chúng ta viết trong tệp `workflow` của mình. 

- Một `action` có thể **pull** kho lưu trữ Git của lập trình viên từ GitHub, thiết lập chuỗi công cụ chính xác cho môi trường xây dựng của chúng ta hoặc thiết lập xác thực cho nhà cung cấp đám mây.

### Runners

- Là môi trường thực thi workflow (có thể là GitHub-hosted runner hoặc self-hosted runner).

## Các loại runner

- **GitHub-hosted runner**:
    - Được GitHub cung cấp sẵn, hỗ trợ các hệ điều hành như: Ubuntu, Windows, macOS.
    - Ưu điểm: Không cần cấu hình, dễ sử dụng.
    - Nhược điểm: Có giới hạn tài nguyên và thời gian chạy.

- **Self-hosted runner**:
    - Do người dùng tự quản lý, có thể chạy trên máy chủ cá nhân.
    - Ưu điểm: Tùy chỉnh tài nguyên, không bị giới hạn bởi GitHub.
    - Nhược điểm: Cần bảo trì và bảo mật.

##  Sử dụng Actions

- Actions chính thức: Được GitHub hoặc các tổ chức uy tín cung cấp, ví dụ: **actions/checkout**, **actions/setup-node.**

- Actions từ cộng đồng: Được chia sẻ trên [GitHub Marketplace](https://github.com/marketplace.html/).

- Tự tạo Action:
    - Có thể viết bằng JavaScript hoặc Docker.
    - Định nghĩa trong file `action.yml`

## Debug và tối ưu hóa workflow

- **Debug**:
    - Sử dụng ACTIONS_RUNNER_DEBUG=true để bật chế độ debug.
    - Kiểm tra log chi tiết trong giao diện GitHub Actions.
    
- **Tối ưu hóa**:
    - Sử dụng caching (bộ nhớ đệm) để giảm thời gian chạy, ví dụ: `actions/cache`.
    - Chạy các jobs song song nếu không có phụ thuộc.
    - Sử dụng các action đã được tối ưu thay vì viết lại từ đầu.

## Các bước thực hành

- Tạo GitHub Actions workflow: [Using workflow templates](https://docs.github.com/en/actions/learn-github-actions/using-starter-workflows)

- Dành cho CI (Continuous Integration): [Building and testing](https://docs.github.com/en/actions/automating-builds-and-tests)

- Dành cho xây dựng và xuất bản các gói: [Publishing packages](https://docs.github.com/en/actions/publishing-packages)

- Để tự động hóa các tác vụ và quy trình trên GitHub: [Managing projects](https://docs.github.com/en/actions/managing-issues-and-pull-requests)

- Đối với các ví dụ minh họa các tính năng phức tạp hơn của GitHub Actions: [Use cases and examples](https://docs.github.com/en/actions/examples)

- Để chứng nhận trình độ thành thạo của bản thân trong việc tự động hóa quy trình làm việc và tăng tốc phát triển với GitHub Actions, hãy kiếm chứng chỉ GitHub Actions với GitHub Certifications: [About GitHub Certifications](https://docs.github.com/en/get-started/showcase-your-expertise-with-github-certifications/about-github-certifications)    

## Ví dụ

- Dưới đây là một ví dụ cơ bản về GitHub Actions workflow để tự động kiểm tra mã nguồn khi có thay đổi được **push** lên repository:

```yaml
name: CI Workflow Example

# Sự kiện kích hoạt workflow
on:
  push:
    branches:
      - main # Kích hoạt khi có commit push lên nhánh main
  pull_request:
    branches:
      - main # Kích hoạt khi có pull request vào nhánh main

# Định nghĩa các jobs
jobs:
  build:
    # Sử dụng GitHub-hosted runner
    runs-on: ubuntu-latest

    # Các bước trong job
    steps:
      # Bước 1: Checkout mã nguồn
      - name: Checkout code
        uses: actions/checkout@v3

      # Bước 2: Thiết lập Node.js
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: 16 # Sử dụng Node.js phiên bản 16

      # Bước 3: Cài đặt các dependencies
      - name: Install dependencies
        run: npm install

      # Bước 4: Chạy kiểm tra mã nguồn
      - name: Run tests
        run: npm test
```

- Giải thích ví dụ
1. `on`:
    - Workflow được kích hoạt khi có sự kiện push hoặc pull_request vào nhánh main.

2. `jobs`:
    - Workflow có một job tên là build, chạy trên môi trường ubuntu-latest.

3. `steps`:
    - **Bước 1**: Sử dụng action actions/checkout để lấy mã nguồn từ repository.
    - **Bước 2**: Thiết lập môi trường Node.js với phiên bản 16.
    - **Bước 3**: Cài đặt các dependencies được định nghĩa trong package.json.
    - **Bước 4**: Chạy các bài kiểm tra (test) bằng lệnh npm test.

## Github Actions và Jenkins

| Tiêu chí                          | GitHub Actions                                  | Jenkins                                          |
|----------------------------------|--------------------------------------------------|--------------------------------------------------|
| **Mức độ tích hợp với GitHub**   | Tích hợp trực tiếp, native CI/CD cho GitHub     | Cần plugin để tích hợp, không mượt bằng Actions |
| **Thiết lập ban đầu**            | Rất dễ, chỉ cần `.yml` trong repo               | Cần cài đặt, cấu hình thủ công server Jenkins   |
| **Chi phí vận hành**             | Free trong giới hạn (với GitHub Free/Pro/Teams) | Tốn tài nguyên server, phải tự quản lý          |
| **Tùy biến & mở rộng**           | Giới hạn hơn, tùy vào GitHub Runner             | Cực kỳ mạnh, plugin phong phú, có thể build pipeline phức tạp |
| **Bảo mật & kiểm soát**          | Phụ thuộc GitHub, không toàn quyền              | Toàn quyền quản lý CI/CD pipeline và bảo mật    |
| **Sử dụng cho multi-repo/project** | Hơi khó quản lý khi có nhiều repo               | Có thể dùng Shared Libraries, dễ quản lý tập trung |
| **Tích hợp công cụ ngoài (ex: AWS, Docker, SonarQube)** | Có sẵn nhiều action, nhưng không đa dạng như Jenkins | Cài plugin thoải mái, gần như tool nào cũng có |
| **Hỗ trợ self-hosted runners**   | Có, nhưng không mạnh bằng Jenkins agents        | Có thể tự cấu hình agent theo nhu cầu            |
| **Thích hợp cho nhóm nhỏ/startup** | Rất phù hợp, nhanh và nhẹ                     | Hơi nặng và overkill nếu chỉ làm CI/CD đơn giản |
| **Thích hợp cho enterprise/phức tạp** | Hạn chế về mặt quản lý & bảo mật nâng cao    | Tối ưu cho hệ thống CI/CD lớn và custom hóa cao |

>  **Tóm tắt**:  
- **Dùng GitHub Actions** khi: Dự án host trên GitHub, team nhỏ/medium, muốn setup CI/CD nhanh và dễ.  
- **Dùng Jenkins** khi: Cần custom pipeline phức tạp, enterprise-level CI/CD, nhiều repo, cần toàn quyền kiểm soát hạ tầng.


## Tham khảo

-  [Tài liệu GitHub Action chính thức của GitHub](https://docs.github.com/en/actions/about-github-actions/understanding-github-actions)

- [Tài liệu GitHub Action sưu tập](/Slide/CICD/GitHub%20Actions/)