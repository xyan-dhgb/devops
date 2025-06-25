## Giới thiệu tổng quan về Terraform

### Định nghĩa

- **Terraform** là một công cụ **Infrastructure as Code (IaC)** mã nguồn mở do **HashiCorp** phát triển. Nó cho phép bạn **khai báo hạ tầng bằng mã nguồn** và triển khai chúng một cách **tự động, an toàn, có thể lặp lại và kiểm soát được**.

### Đặc điểm

- **Khai báo hạ tầng** dưới dạng mã (declarative) → bạn mô tả **hệ quả cần có**, Terraform lo phần còn lại.
- Hỗ trợ lưu mã vào **source control** như Git → dễ audit, rollback và cộng tác team.
- Dùng ngôn ngữ **HCL (HashiCorp Configuration Language)** – đơn giản, dễ đọc, được biên dịch bởi Golang.
- **Mã nguồn mở**, miễn phí và được cộng đồng hỗ trợ mạnh.
- Có **kiến trúc dạng plugin**, hỗ trợ nhiều provider: AWS, Azure, GCP, VMware, GitHub, Kubernetes...
- Tổ chức được cả hạ tầng **đa tầng/phức tạp** gồm cả IaaS, PaaS, SaaS trong một cấu trúc duy nhất.

### Lợi ích

| **Lợi ích** | **Giải thích ngắn gọn** |
| --- | --- |
| **Triển khai tự động** | Giảm thao tác tay, tiết kiệm thời gian, ít lỗi hơn. |
| **Môi trường nhất quán** | Dev, Test, Prod giống nhau 100%, không có “chạy được trên máy tôi”. |
| **Quy trình lặp lại được** | Có thể deploy nhiều lần vẫn ra đúng kết quả. |
| **Tái sử dụng cấu hình** | Module hóa và chia sẻ dễ dàng trong team hoặc giữa các dự án. |
| **Tài liệu sống cho hạ tầng** | Mọi thứ được mô tả bằng mã – dễ đọc, dễ review, dễ hiểu kiến trúc tổng thể. |

### Các công cụ khác và sự khác biệt với Terraform

- So sánh với các công cụ Provisioning/Orchestration khác

| Công cụ | Đặc điểm |
| --- | --- |
| **AWS CloudFormation** | Miễn phí, tích hợp sẵn trong AWS, viết bằng YAML/JSON, **lock-in vào AWS**. |
| **OpenStack Heat** | Mã nguồn mở, tương thích cú pháp CloudFormation, chỉ dùng cho OpenStack. |
- So với công cụ **quản lý cấu hình**

| Công cụ | Đặc điểm |
| --- | --- |
| **Ansible, Chef, Puppet** | Mục tiêu chính là cấu hình phần mềm (packages, services), không phải điều phối tài nguyên. |
| **Cách tiếp cận** | `Puppet/Salt` dùng cách khai báo, `Ansible/Chef` dùng cách mệnh lệnh. |
| **Lưu ý** | Không nên dùng chúng để thay thế hoàn toàn Terraform khi cần orchestration. |
- So sánh với thư viện API thấp

| Công cụ | Đặc điểm |
| --- | --- |
| **Boto, fog, libcloud** | Truy cập API trực tiếp (low-level), nhiều quyền nhưng khó maintain, dễ bug, không scale tốt. |

## Kiến trúc Terraform

- **Các thành phần chính:**
    - **Terraform Executable**: Lệnh Terraform bạn chạy
    
    - **Terraform Providers**: Các plugin (hơn 1125 nhà cung cấp) cho phép Terraform tương tác với các API của nhà cung cấp dịch vụ (IaaS, PaaS, SaaS) như AWS, Azure, GCP, Oracle, Docker, Kubernetes, v.v.
    - **API**: Giao diện để Providers tương tác với các dịch vụ đám mây
    - **Terraform Statefile**: Tệp trạng thái Terraform, rất quan trọng
    - **Terraform Config file**: Tệp cấu hình của bạn, viết bằng HCL**4**.
- **Terraform Providers (Plugins)**
    - Là cầu nối giữa Terraform và các nền tảng hạ tầng thực tế
    - Cung cấp khả năng tạo, quản lý và cập nhật tài nguyên thông qua API của nhà cung cấp
    - **Quan trọng**: Terraform có thể tích hợp với bất kỳ API nào sử dụng framework providers của nó. Bạn thậm chí có thể viết custom providers
- **Cú pháp Terraform (HCL)**
    - **HashiCorp Configuration Language**: Được thiết kế để con người dễ đọc và chỉnh sửa
    - Hỗ trợ **Nội suy (Interpolation)**: **Sử dụng ${...}** để tham chiếu các giá trị khác như biến, tài nguyên, hoặc kết quả của hàm
    - Hỗ trợ các câu lệnh điều kiện (Conditional), hàm (Functions), và template**3**.
    - **Các khối chính**:
        - variable: Để định nghĩa các biến đầu vào
        - provider: Để cấu hình nhà cung cấp dịch vụ
        - resource: Để định nghĩa và tạo ra các tài nguyên hạ tầng (ví dụ: aws_instance)
        - output: Để hiển thị các giá trị quan trọng sau khi triển khai
        - data: Để lấy thông tin từ các tài nguyên hiện có hoặc các dịch vụ đám mây

## Quy trình làm việc của Terraform

- **Các lệnh chính:**
    - `terraform init:`
        - **Khởi tạo thư mục làm việc**, tải xuống các plugin provider cần thiết
        - Không bao giờ xóa cấu hình hoặc trạng thái hiện có của bạn
        - Kiểm tra cú pháp cấu hình
        - **Khởi tạo backend**: Cấu hình nơi lưu trữ tệp trạng thái Terraform (state file)
    - `terraform plan:`
        - **Tạo một kế hoạch thực thi**
        - Terraform Core tính toán sự khác biệt giữa trạng thái cuối cùng được biết (last-known state) và trạng thái hiện tại của hạ tầng, sau đó hiển thị sự khác biệt đó
        - Có thể lưu kế hoạch vào một tệp (-out file.plan), nhưng **tệp này không được mã hóa (not encrypted)** và có thể chứa thông tin nhạy cảm
    - `terraform apply:`
        - **Thực thi kế hoạch** đã tạo (hoặc tạo một kế hoạch mới nếu không có kế hoạch được chỉ định) và áp dụng các thay đổi vào hạ tầng thực tế
        - Nếu hạ tầng thực tế bị thay đổi bên ngoài Terraform (ví dụ: bạn chấm dứt một instance được quản lý bởi Terraform), terraform apply sẽ điều chỉnh lại để đáp ứng trạng thái chính xác được định nghĩa trong mã nguồn của bạn (ví dụ: instance sẽ được khởi động lại)
    - `terraform destroy:`
        - **Xóa tất cả các tài nguyên** được quản lý bởi cấu hình Terraform của bạn
        - **Cảnh báo quan trọng**: **"Đo lường hai lần, cắt một lần" (Measure twice, cut once)**. Cân nhắc sử dụng cờ **-target** để xóa tài nguyên cụ thể nhưng **hạn chế chạy trên môi trường sản xuất (production)**
        - **Không có cờ "Retain"** (duy trì tài nguyên), thay vào đó, bạn có thể xóa tài nguyên khỏi tệp trạng thái (terraform state rm)
        - **prevent_destroy** là một đối số meta (meta-argument) trong lifecycle block có thể giúp ngăn chặn việc vô tình xóa tài nguyên quan trọng

## Quản lý trạng thái của Terraform

- **Terraform State File (terraform.tfstate)**
    - Là file chứa **trạng thái hiện tại của hạ tầng**, do Terraform tạo và quản lý.
    - Định dạng: **JSON**, lưu trữ thông tin về:
        - Mapping giữa mã nguồn Terraform và tài nguyên thực tế
        - Metadata quan trọng liên quan đến từng resource
    - Terraform cũng tạo bản sao lưu tại: `terraform.tfstate.backup`
    - **Không bao giờ chỉnh sửa thủ công file này!**
    - Có thể chứa thông tin nhạy cảm → cần bảo vệ chặt.
- **Lưu trữ trạng thái (State Storage)**
    - **Local State**
        - Lưu `terraform.tfstate` trên máy local.
        - Dễ dùng cho project nhỏ.
        - Không phù hợp khi làm việc nhóm hoặc deploy production.
    - **Remote State**
        - Giúp lưu trạng thái ở nơi dùng chung, an toàn và hỗ trợ làm việc nhóm.
        - **Lợi ích chính**:
            - **Team collaboration**: Trạng thái được chia sẻ giữa các thành viên.
            - **Locking**: Tránh xung đột do nhiều người **chạy Terraform cùng lúc.**
            - **Encryption at rest**: **Mã hóa dữ liệu** khi lưu trữ từ xa.
            - **Versioning**: Theo dõi lịch sử thay đổi trạng thái.
            - **Remote operations**: Một số backend hỗ trợ apply/plan từ xa.
        - Một số backend phổ biến

| **Backend** | **Ghi chú thêm** |
| --- | --- |
| AWS S3 + DynamoDB | Phổ biến nhất, dùng để lưu + lock file |
| Azure Blob Storage | Dành cho hệ sinh thái Azure |
| Google Cloud Storage | Tương tự như S3, dùng cho GCP |
| HashiCorp Consul | Dùng kèm với các công cụ HashiCorp khác |
| Terraform Enterprise | Có UI, quản lý user/team, CI/CD |
- **Lưu ý:** Cấu hình `backend` **không hỗ trợ nội suy (interpolation)** → phải dùng **giá trị tĩnh.**

## **Biến (Variables), Điều kiện (Conditionals), và Lặp (Iterations)**

### **Biến đầu vào (Input Variables)**

- Là các tham số cho module hoặc mã Terraform, cho phép tùy chỉnh mà không cần thay đổi mã nguồn
- Có thể đặt giá trị qua **CLI (-var)** hoặc **biến môi trường (TF_VAR_)**, hoặc **truyền vào trong khối module**
- **Các kiểu dữ liệu**: String, Number, List, Map, Boolean, Set, Object, Tuple
- Nên đặt description và type, và default value nếu có thể. **Nếu không có default, phải gán giá trị trước khi apply**

### **Biến đầu ra (Output Variables)**

- Giống như **giá trị trả về của một module**
- Dùng để hiển thị các giá trị quan trọng trong đầu ra CLI sau khi `terraform apply`
- Có thể được truy cập bởi các cấu hình khác thông qua **terraform_remote_state** khi sử dụng trạng thái từ xa

### **Biến cục bộ (Local Variables)**

- Được định nghĩa trong khối locals và chỉ sử dụng trong module đó
- **Giúp tránh lặp lại cùng một giá trị hoặc biểu thức nhiều lần**
- **Không thay đổi giá trị** trong hoặc giữa các lần chạy Terraform (plan, apply, destroy)
- Truy cập bằng định dạng **local.Variable_Name**
- Nên sử dụng có chừng mực để **tránh làm khó đọc cấu hình**

### **Nội suy (Interpolation)**

- Sử dụng **${...}** để tham chiếu các giá trị khác trong biểu thức
- Cho phép thực hiện **các phép toán đơn giản, tham chiếu biến, tài nguyên, dữ liệu, module và thông tin meta** của Terraform

### **Điều kiện (Conditioning)**

- Sử dụng biểu thức điều kiện (conditional expression) hoặc đối số **meta depends_on**

### **Lặp (Iterations)**

- Sử dụng **for hoặc for_each** để tạo nhiều tài nguyên hoặc thực hiện các hoạt động lặp lại

### **Đối số Meta của Tài nguyên (Resource Meta-arguments)**

- `depends_on`: Xử lý các phụ thuộc ẩn mà Terraform không thể tự động suy luận
- `count`: Tạo nhiều instance của một tài nguyên hoặc module dựa trên một số nguyên
- `for_each`: Tạo một instance cho mỗi mục trong một bản đồ (map) hoặc tập hợp chuỗi (set of strings)
- `lifecycle`: Khối lồng ghép trong khối tài nguyên để kiểm soát hành vi vòng đời của tài nguyên, bao gồm create_before_destroy, prevent_destroy, ignore_changes

## **Module trong Terraform**

### Định nghĩa

- Là các đơn vị mã Terraform có thể **tái sử dụng, kết hợp và đã được kiểm thử (battle-tested)**
- Giống như các **bản thiết kế (blueprints) có thể tái sử dụng** cho hạ tầng của bạn
- Mỗi module là một cấu hình Terraform "mini"

### Cấu trúc

- Thông thường bao gồm:
    - `main.tf:` Chứa định nghĩa tài nguyên chính
    - `variables.tf`: Định nghĩa các biến đầu vào của module
    - `outputs.tf:` Định nghĩa các giá trị đầu ra của module
    - `README.md`: Tài liệu mô tả module
- Các module phức tạp hơn có thể bao gồm các thư mục con như **modules (chứa các submodule), examples (ví dụ về cách sử dụng module), và test (các bài kiểm tra tự động)**

### Cách sử dụng Module

- Sử dụng khối module và chỉ định source
- source có thể trỏ đến:
    - **Đường dẫn tệp cục bộ (Local file paths)**: ./my-module
    - **URL Registry Terraform**: hashicorp/vault/aws
    - **URL Git bất kỳ**: git::git@github.com:foo/bar.git**49**.
        - **Quan trọng**: Nên liên kết đến một **thẻ Git cụ thể (specific Git tag)** để kiểm soát phiên bản (ví dụ: ?ref=v1.0.0)

### Lợi ích của Module

- **Tái sử dụng mã (Code reuse)**
- **Áp dụng kiểm soát phiên bản (Apply versioning)**
- **Đơn giản hóa việc kiểm thử (Easier testing)**
- **Đóng gói (Encapsulation)**: Che giấu sự phức tạp của hạ tầng bên dưới một API đơn giản
- Thúc đẩy việc xây dựng trên mã đã được kiểm thử và hỗ trợ thương mại

### **Một module Terraform "tốt"**

- Mã sạch và linh hoạt (Clean and flexible code)
- Các giá trị mặc định được trình bày tốt (Well presented default values)
- Được bao phủ bởi các bài kiểm thử (Covered with tests)
- Có ví dụ và tài liệu rõ ràng (Examples and Documentation)
- Có Changelog và đảm bảo tính bảo mật (Secure)
- **Lời khuyên**: **Không nên quá tải module với quá nhiều tính năng (Do not overload modules with features)**

## **Quản lý môi trường và Workspace**

### **Quản lý nhiều môi trường (Multiple Environments)**

- Terraform cho phép bạn quản lý các môi trường riêng biệt như Development, QA/UAT, Production
- **Để cô lập hoàn toàn (complete isolation)**, tốt nhất nên **tạo nhiều tài khoản đám mây** (ví dụ: nhiều tài khoản AWS) cho mỗi môi trường
- Việc tách Terraform thành nhiều dự án cũng sẽ giảm lượng tài nguyên bạn cần quản lý trong một lần `terraform apply`

### **Terraform Workspace**

- Một tính năng để quản lý nhiều phiên bản của cùng một cấu hình Terraform
- Các workspace là các tệp trạng thái riêng biệt được liên kết với một cấu hình Terraform duy nhất
- Lưu ý: "Workspaces" trước đây được gọi là "environments"

## **Bảo mật thông tin nhạy cảm trong Terraform**

### **Rủi ro lộ thông tin nhạy cảm**

- Tệp `terraform plan -out file.plan` **không được bảo mật (not secured)** và có thể chứa thông tin nhạy cảm
- Tệp trạng thái Terraform (terraform state) cũng **không được bảo mật** theo mặc định nếu **không được mã hóa tại nơi lưu trữ**
- Lệnh `terraform pull` (để quan sát trạng thái từ xa hiện tại) cũng có thể làm lộ thông tin nhạy cảm
- Ngay cả khi bạn đánh dấu một output là sensitive = true, nó sẽ bị ẩn trong CLI nhưng vẫn có thể xuất hiện trong trạng thái từ xa nếu không được xử lý cẩn thận

### **Cách xử lý bí mật (secrets)**

- **Tuyệt đối KHÔNG LƯU TRỮ bí mật trực tiếp trong tệp trạng thái Terraform**
- **Sử dụng các dịch vụ quản lý bí mật chuyên dụng**:
    - AWS Key Management Service (KMS), Google Cloud Key Vault, Azure Key Vault
    - AWS System Manager Parameter Store
    - AWS Secrets Manager
    - **Sử dụng Resource Roles**: Gán vai trò (roles) cho tài nguyên thay vì nhúng thông tin xác thực trực tiếp**56**.
- **Mã hóa tệp .tfvars và các thông tin dự án/module cụ thể khác**: Sử dụng các công cụ như pass (The password store) hoặc git-crypt
- **Mã hóa trạng thái khi lưu trữ (Secure state at rest)**: Sử dụng các tính năng mã hóa tích hợp sẵn của backend lưu trữ trạng thái (ví dụ: mã hóa S3 bucket)

## **Provisioners trong Terraform**

### **Provisioners là gì?**

- Được sử dụng để **cấu hình tài nguyên sau khi tạo (Configuring Resources After Creation)**
- Mô hình hóa các hành động cụ thể trên máy cục bộ hoặc máy từ xa để chuẩn bị máy chủ hoặc các đối tượng hạ tầng khác cho dịch vụ
- **Chạy mã cục bộ (local-exec) hoặc từ xa (remote-exec)** sau khi tài nguyên được tạo
- Nếu quá trình provisioning thất bại, tài nguyên được đánh dấu là **"tainted" (bị làm bẩn)** và sẽ được tạo lại ở lần `terraform apply` tiếp theo
- Có thể chạy mã khi **xóa tài nguyên (on deletion)**, nhưng nếu nó thất bại, tài nguyên sẽ không bị xóa

### **Các loại Provisioners phổ biến**

- `file provisioner:` Sao chép tệp hoặc thư mục từ máy chạy Terraform đến tài nguyên mới tạo
- `local-exec provisioner:` Chạy một lệnh cục bộ trên máy đang thực thi Terraform
- `remote-exec provisioner:` Chạy các lệnh trên tài nguyên từ xa thông qua SSH hoặc WinRM
- Các provisioner khác: chef, habitat, puppet, salt-masterless
- **Lưu ý**: Nên ưu tiên sử dụng **UserData/Cloud-init** (đối với máy ảo) hoặc **Image-level configuration (AMI/Docker images)** để cấu hình hơn là Provisioners, vì Provisioners có thể gây ra sự thiếu ổn định và khó quản lý hơn trong quy trình IaC.

## **Các hàm (Functions) trong Terraform**

### Khái niệm

- Ngôn ngữ Terraform bao gồm nhiều hàm tích hợp sẵn (built-in functions) mà bạn có thể gọi trong các biểu thức để chuyển đổi và kết hợp các giá trị
- Cú pháp chung là tên hàm theo sau bởi các đối số cách nhau bằng dấu phẩy trong ngoặc đơn: function_name(arg1, arg2, ...)

### Các hàm quan trọng

- basename(path): **Trả về tên tệp (phần tử cuối cùng) của một đường dẫn**
- cidrsubnet(prefix, newbits, netnum): Tính toán một khối CIDR con từ một khối CIDR lớn hơn
- coalesce(string1, string2, ...): **Trả về giá trị không rỗng đầu tiên**
- element(list, index): Trả về một phần tử từ danh sách tại chỉ mục đã cho
- format(format, args, ...): Định dạng một chuỗi theo định dạng đã cho
- lookup(map, key, default): Tra cứu một giá trị trong bản đồ
- split(delim, string): Tách một chuỗi thành một danh sách
- substr(string, offset, length): Trích xuất chuỗi con từ một chuỗi
- timestamp(): Trả về dấu thời gian RFC 3339
- upper(string): Chuyển đổi chuỗi thành chữ hoa
- uuid(): Trả về một chuỗi UUID values(map): Trả về các giá trị của một bản đồ