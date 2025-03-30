# Git - Version Control System (VCS - Hệ thống quản lý phiên bản)

## Định nghĩa VCS

-  Hệ thống quản lý phiên bản (VCS) là công cụ tinh vi được thiết kế để **quản lý sự thay đổi** của một loạt tài liệu, ứng dụng, trang web và các tập tin thông tin khác thường xuyên thay đổi.

- Các hệ thống này tỉ mỉ **theo dõi mọi thay đổi** được thực hiện thông qua các phiên bản, thường được xác định bằng một số duy nhất hoặc mã (ví dụ: số phiên bản). 

- Mỗi bản ghi của một phiên bản đi kèm với một **dấu thời gian** và **danh tính** của người dùng chịu trách nhiệm cho thay đổi.

## Giới thiệu Git

### Định nghĩa

- Git là hệ thống **kiểm soát phiên bản** được tạo ra bởi Linus Torvalds vào năm 2005 giúp chúng ta theo dõi các thay đổi trong mã nguồn và cộng tác với người khác một cách hiệu quả. Nó **lưu trữ lịch sử làm việc** của người dùng, giúp dễ dàng hoàn nguyên các thay đổi nếu có sự cố xảy ra.


![Logo của Git](/Asset/Image/git-logo.png)

### Đặc điểm của Git

- **Phân tán**: Mỗi người dùng có một bản sao đầy đủ của kho lưu trữ.

- **Toàn vẹn dữ liệu**: Dữ liệu lịch sử có thể được xác minh bằng mật mã.

- **Hợp nhất**: Được thiết kế để xử lý việc hợp nhất (merge) thường xuyên một cách hiệu quả.

## Phân biệt Git và Github

| Tiêu chí          | Git                                      | GitHub                                   |
|------------------|--------------------------------------|-----------------------------------------|
| **Khái niệm**     | Hệ thống kiểm soát phiên bản phân tán (VCS). | Nền tảng lưu trữ và quản lý kho Git trên cloud. |
| **Chức năng chính** | Theo dõi thay đổi mã nguồn, quản lý phiên bản. | Lưu trữ kho Git, hỗ trợ cộng tác và CI/CD. |
| **Cài đặt**      | Cài đặt và chạy cục bộ trên máy tính.  | Dịch vụ trực tuyến, truy cập qua trình duyệt hoặc CLI. |
| **Làm việc**      | Không yêu cầu internet, làm việc cục bộ. | Cần internet để đồng bộ và cộng tác. |
| **Quản lý kho lưu trữ**  | Mỗi máy có một bản sao đầy đủ của kho. | Kho Git có thể công khai hoặc riêng tư, được lưu trữ trên máy chủ GitHub. |
| **Công cụ hỗ trợ** | Chạy trên terminal, giao diện dòng lệnh (CLI). | Cung cấp giao diện web trực quan, hỗ trợ Git CLI. |
| **Tính năng bổ sung** | Chỉ tập trung vào quản lý phiên bản. | Hỗ trợ Issue Tracking, Pull Request, Actions (CI/CD), Wiki, Discussions, v.v. |
| **Chủ sở hữu** | Phần mềm mã nguồn mở (Linux Foundation bảo trợ). | Công ty thuộc sở hữu của Microsoft. |

## Cách làm việc của Git

![Cách làm việc của Git](/Asset/Image/git-workflow.png)

### Làm việc cục bộ với Git (Working locally)

- [Tạo kho lưu trữ (Creating a repository)](#tạo-kho-lưu-trữ-creating-a-repository)

- [Thêm và lưu thay đổi (Adding and committing files)](#thêm-và-lưu-thay-đổi-adding-and-committing-files)

- [Vùng tạm (Staging Area)](#vùng-tạm-staging-area)

- [Quản lý tệp (Managing files)](#quản-lý-tệp-managing-files)

#### Tạo kho lưu trữ (Creating a repository)

```bash
git init your-repository-name
```

- Đây là câu lệnh dùng để để tạo một kho lưu trữ mới.

- Lệnh này sẽ tạo thư mục ẩn .git, chứa toàn bộ metadata (thư mục cấu hình. thông tin nhánh, HEAD, ...) của Git.

#### Thêm và lưu thay đổi (Adding and committing files)

```bash
git add file-name
```

- Thêm tệp tin vào Staging Area

```bash
git commit -m "your-message"
```

- Commit giúp lưu trữ các thay đổi vào kho lưu trữ.

#### Vùng tạm (Staging Area)

- Git cung cấp một khu vực gọi là `index` để theo dõi các thay đổi sẽ được đưa vào commit tiếp theo. Người dùng cần thêm tệp vào index trước khi commit.

![Staging area](/Asset/Image/staging-area.png)

#### Quản lý tệp (Managing files)

```bash
git rm your-file
```

- Xóa tệp khỏi `index` và khỏi `working copy` (thư mục làm việc)

#### Xem sự khác biệt (Showing differences)

```bash
git diff
```

- Hiển thị sự khác biệt giữa `working copy`, `index` và commit trước đó

```bash
git diff [ rev a [ rev b ] ] [ -- path . . . ]
```

- Hiển thị sự khác biệt giữa `rev a` và `rev b`
    - `rev a` mặc định nằm ở vùng `index`
    - `rev b` mặc định nằm ở `working copy`

#### Đặt lại thay đổi (Resetting changes)

```bash
git reset [ --hard ] [ -- path . . . ]
```

- Hủy bỏ các thay đổi trong `index` (và có thể trong `working copy`)

#### Các câu lệnh khác

```bash
git status
```

- Hiển thị trạng thái của `index` và `working copy`

```bash 
git show
```

- Hiển thị chi tiết của một commit (siêu dữ liệu + sự khác biệt) 

```bash
git log
```

- Hiển thị lịch sử

```bash
git mv
```

- Di chuyển/đổi tên một tệp

```bash
git tag
```

- Tạo/xóa thẻ (để xác định một phiên bản cụ thể)

### Phân nhánh và hợp nhánh (Branching and Merging)

- Nhánh mặc định của Git là `master`

- Không có nhánh nào là "lịch sử nhánh" chính thức → một nhánh chỉ là một con trỏ đến commit mới nhất. 

- Các commit được xác định bằng **SHA-1 hash (160 bit)** được tính từ: 
 
    - Các tệp đã được commit
    - Siêu dữ liệu (tin nhắn commit, tên tác giả, ...) 
    - Các hash của các commit cha 

#### Tạo nhánh mới (Creating a new branch)

```bash
git checkout -b new-branch 
```

- Tạo một nhánh mới. Điều này cho phép phát triển song song mà không ảnh hưởng đến nhánh chính.

#### Di chuyển giữa các nhánh (Switching between branches)

```bash
git checkout [-m] branch-name
```

#### Hợp nhất các nhánh (Merging a branch)

```bash
git merge other-branch
```

- Hợp nhất các thay đổi từ nhánh khác vào nhánh hiện tại. Nếu có xung đột do các thay đổi chồng chéo, Git sẽ yêu cầu giải quyết thủ công.

- Trong trường hợp có xung đột:

    - Các tệp chưa hợp nhất (các tệp có xung đột) sẽ được để lại trong `working tree` và được đánh dấu là `unmerged`

    - Các tệp khác (không có xung đột) và metadata (thông điệp commit, các commit cha, ...) sẽ được tự động thêm vào `index`

    - Cách giải quyết:

        - **Giải quyết thủ công**: Mở file có xung đột và chỉnh sửa mã để quyết định là giữ lại thay đổi nào hoặc kết hợp chúng. 

        - **Sử dụng công cụ soạn thảo**: Sử dụng các công cụ hỗ trợ soạn thảo (như merge tool) để quản lý và giải quyết các xung đột một cách trực quan.

```bash
git mergetool [ file ]
```

#### Xóa nhánh (Deleting branches)

```bash
git branch -d branch name
```

- Lệnh này có một số hạn chế, nó không thể xóa:
    - Nhánh hiện tại (HEAD)
    - Một nhánh chưa được hợp nhất vào nhánh hiện tại

### Tương tác với kho lưu trữ từ xa (Interacing with remote repository)

#### Tổng quan

![Kho lưu trữ tổng hợp từ xa](/Asset/Image/centralized-remote-repo.png)

- Có thể làm việc với nhiều kho lưu trữ từ xa.

- Mỗi kho lưu trữ từ xa được xác định bằng một **bí danh cục bộ**. Khi làm việc với một kho lưu trữ từ xa duy nhất, nó thường được đặt tên là `origin`

- Các kho lưu trữ từ xa được `phản chiếu` trong kho lưu trữ cục bộ.

-  Các nhánh từ xa được `ánh xạ` trong một không gian tên riêng: `remote/name/branch`:

    - `master` đề cập đến nhánh master cục bộ

    - `remote/origin/master` đề cập đến nhánh master của kho lưu trữ từ xa có tên origin.

#### Thêm kho lưu trữ được chia sẻ (Adding a shared repository)

```bash
git remote add origin url
```

#### Gửi thay đổi (Sending changes (push))

```bash
git push [-u] destination repository ref [ref... ]
```

- Sử dụng tùy chọn -u lần đầu tiên để **kết nối** nhánh cục bộ với nhánh từ xa.

- Các lần push sau thì không cần

- Trước khi push, cần giải quyết xung đột giữa nhánh cục bộ và nhánh từ xa (nếu có).

#### Kéo thay đổi (Receiving changes (pull))

```bash
git pull origin branch-name
```

- Lấy và hợp nhất các thay đổi từ kho lưu trữ từ xa vào nhánh hiện tại.

#### Lấy thay đổi (Fetching changes (fetch))

```bash
git fetch orgin branch-name
```

- Chỉ cập nhật thông tin về kho từ xa mà không hợp nhất thay đổi. Người dùng cần merge thủ công sau đó.

#### Nhân bản kho lưu trữ (Cloning a repository)

```bash
git clone url
```

- Tạo một bản sao cục bộ của một kho lưu trữ từ xa và cấu hình nó như là kho lưu trữ từ xa gốc của nó.

### Quản lý máy chủ Git (Administrating a Git server)

#### Tạo kho lưu trữ chia sẻ (Creating a shared repository)

```bash
git init --bare --shared my-shared-repository.git
```

- Tạo kho lưu trữ dùng chung mà không có thư mục làm việc.

- Máy chủ có thể hỗ trợ cộng tác bằng cách cho phép nhân bản (clone) và đẩy thay đổi (push).

#### Công bố kho lưu trữ (How to publish a GIT repository)

- Native protocol (git daemon) dùng giao thức tcp ở port `9418`, không cần xác thực

- Giao thức SSH: Xác thực và mã hóa mạnh

- Truy cập cục bộ

- Máy chủ HTTP/HTTPS


### Làm việc với những tổ chức bên ngoài (Working with third-party contributors)

#### Gửi thay đổi:

- Contributor bên ngoài có thể gửi bản vá (patch) hoặc tạo yêu cầu hợp nhất (merge request) để tích hợp vào dự án.

#### Sử dụng bản vá:

```bash
git format-patch
```

- Tạo tệp bản vá để chia sẻ. Các bản vá này có thể được áp dụng vào kho khác bằng `git am`.