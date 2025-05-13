# AWS Cloudformation là gì?

## Định nghĩa

- AWS CloudFormation là một công cụ Infrastructure as Code (IaC) của AWS, cho phép nhà phát triển quản lý và triển khai tài nguyên AWS bằng cách sử dụng các tệp mẫu (template) được viết bằng YAML hoặc JSON.

- Thay vì tạo tài nguyên thủ công trên AWS Management Console, bạn có thể sử dụng CloudFormation để tự động hóa việc tạo, cập nhật và xóa tài nguyên.

## Lợi ích

- Tự động hóa: Giảm thiểu thao tác thủ công khi triển khai hạ tầng.

- Tái sử dụng: Các template có thể được tái sử dụng cho nhiều môi trường (dev, staging, prod).

- Quản lý phiên bản: Template có thể được lưu trữ trong Git để theo dõi thay đổi.

- Rollback tự động: Nếu triển khai gặp lỗi,CloudFormation tự động hoàn tác các thay đổi.

- Tích hợp CI/CD: Dễ dàng tích hợp với các pipeline CI/CD để triển khai hạ tầng tự động.

##  Các thành phần chính của CloudFormation

###  Template

- Template là tệp YAML hoặc JSON mô tả các tài nguyên cần triển khai.

- Cấu trúc cơ bản của một template:

```yaml
---
AWSTemplateFormatVersion: version date
Description:
  String
Metadata:
  template metadata
Parameters:
  set of parameters
Rules:
  set of rules
Mappings:
  set of mappings
Conditions:
  set of conditions
Transform:
  set of transforms
Resources:
  set of resources
Outputs:
  set of outputs
```

- Cấu trúc:
    - AWSTemplateFormatVersion: Phiên bản của template.
    - Description: Mô tả template.
    - Resources: Danh sách các tài nguyên cần tạo.

### Metadata

- Có thể sử dụng phần tùy chọn này để bao gồm các đối tượng JSON hoặc YAML tùy ý cung cấp thông tin chi tiết về mẫu

```yaml
Metadata:
  Instances:
    Description: "Information about the instances"
  Databases: 
    Description: "Information about the databases"
```
### Resources

- Là phần bắt buộc ở cấp cao nhất trong template CloudFormation. Phần này khai báo các tài nguyên AWS mà chúng ta muốn CloudFormation cung cấp và cấu hình như một phần của Stack.

```yaml
Resources:
  LogicalResourceName1:
    Type: AWS::ServiceName::ResourceType
    Properties:
      PropertyName1: PropertyValue1
      ...

  LogicalResourceName2:
    Type: AWS::ServiceName::ResourceType
    Properties:
      PropertyName1: PropertyValue1
      ...
```

### Stack

- Stack là một tập hợp các tài nguyên AWS được triển khai và quản lý như một đơn vị duy nhất dựa trên template.

- Ví dụ: Một stack có thể bao gồm EC2, S3, và RDS được triển khai cùng nhau.

### Parameters

- Parameters cho phép chúng ta truyền giá trị động vào template, giúp tái sử dụng template cho nhiều môi trường.

```yaml
Parameters:
  ParameterLogicalID:
    Description: Information about the parameter
    Type: DataType
    Default: value
    AllowedValues:
      - value1
      - value2
```

### Outputs

- Outputs cung cấp thông tin về các tài nguyên được tạo, như ID hoặc URL.

```bash
Outputs:
  OutputLogicalID:
    Description: Information about the value
    Value: Value to return
    Export:
      Name: Name of resource to export
```

### Mappings

- Mappings định nghĩa các giá trị tĩnh dựa trên điều kiện, như vùng (region) hoặc môi trường

```yml
Mappings: 
  MappingLogicalName: 
    Key1: 
      Name: Value1
    Key2: 
      Name: Value2
    Key3: 
      Name: Value3
```

### Conditions

- Conditions cho phép triển khai tài nguyên dựa trên điều kiện cụ thể.

```yaml
Conditions:
  ConditionLogicalID:
    Intrinsic function
```

## Quy trình làm việc với CloudFormation

- Viết template: Tạo tệp YAML hoặc JSON mô tả tài nguyên.

- Triển khai stack: Sử dụng AWS Management Console, AWS CLI, hoặc SDK để triển khai stack.

``` bash
aws cloudformation deploy --template-file template.yaml --stack-name my-stack
```

- Quản lý stack: Cập nhật hoặc xóa stack khi cần thiết.

```bash
aws cloudformation update-stack --stack-name my-stack --template-body file://template.yaml
```

- Kiểm tra và giám sát: Sử dụng CloudFormation Events để theo dõi trạng thái triển khai.

## Các thực hành tốt (Best Practices)

- Sử dụng Modular Template: Chia nhỏ template thành các phần nhỏ (nested stacks) để dễ quản lý.

- Sử dụng Parameters và Outputs: Tăng tính linh hoạt và tái sử dụng template.

- Quản lý template bằng Git: Theo dõi thay đổi và tích hợp với CI/CD.

- Bảo vệ stack: Sử dụng Stack Policies để ngăn chặn thay đổi không mong muốn.

- Sử dụng Change Sets: Xem trước các thay đổi trước khi cập nhật stack.

```bash
aws cloudformation create-change-set --stack-name my-stack --template-body file://template.yaml
```

## Hạn chế của cloudformation

- Chỉ hỗ trợ AWS: Không thể sử dụng cho các nhà cung cấp cloud khác.

- Giới hạn tài nguyên: Có giới hạn về số lượng tài nguyên trong một stack.

- Độ phức tạp: Template lớn có thể trở nên khó đọc và quản lý.

## Ví dụ thực tế

- Triển khai một S3 Bucket

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Resources:
  MyBucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: my-example-bucket
```

- Triển khai stack

```bash
aws cloudformation deploy --template-file s3-template.yaml --stack-name my-s3-stack
```

- Xem thông tin stack

```bash
aws cloudformation describe-stacks --stack-name my-s3-stack
```