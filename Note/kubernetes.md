## Định nghĩa

### Container orchestration

- Orchestration container sẽ **tự động triển khai, quản lý, mở rộng, và cấu hình mạng cho các container trên toàn cụm.** Nó chủ yếu tập trung vào việc **quản lý vòng đời của container.**
- Nó giúp **tự động hóa** nhiều tác vụ như:
    - Cấu hình và lập lịch chạy cho các container.
    - Cung cấp (provision) và triển khai (deploy) container.
    - Đảm bảo **tính sẵn sàng và dự phòng** (high availability & redundancy).
    - **Tự động scale** container lên hoặc xuống để cân bằng tải ứng dụng.
    - Di chuyển container giữa các host khi tài nguyên thiếu hụt hoặc host gặp sự cố.
    - Phân bổ tài nguyên giữa các container một cách hiệu quả.
    - Mở dịch vụ đang chạy trong container ra bên ngoài (expose service).
    - Cân bằng tải và hỗ trợ **service discovery** (tìm kiếm dịch vụ tự động).
    - Theo dõi **tình trạng sức khỏe** của container và host.

### Kubernetes (K8s)

- **Kubernetes**, còn được gọi là **K8s**, là một **công cụ quản lý container mã nguồn mở,** được viết bằng ngôn ngữ Golang và phát triển bởi Google và sau này dời sang CNCF.
- Kubernetes cung cấp **runtime container**, **điều phối container**, **điều phối cơ sở hạ tầng theo container**, **cơ chế tự khắc phục**, **khám phá dịch vụ**, **cân bằng tải**, và **mở rộng/thu hẹp container**.
- Được thiết kế **quản lý vòng đời của các ứng dụng** và **dịch vụ đóng gói trong container** một cách dự đoán được, tiện mở rộng, và luôn luôn mang tính sẵn sàng cao.

## Phân biệt Docker Swarm và Kubernetes

| Tính năng | Kubernetes | Docker Swarm |
| --- | --- | --- |
| **Cài đặt & cấu hình cụm (cluster)** | Việc cài đặt phức tạp, nhưng khi đã thiết lập xong thì cụm rất mạnh | Cài đặt rất đơn giản, nhưng cụm không mạnh |
| **Giao diện đồ họa (GUI)** | Có GUI là **Kubernetes Dashboard** | **Không có GUI** |
| **Khả năng mở rộng (Scalability)** | Khả năng mở rộng cao và scale rất nhanh | Cũng mở rộng tốt, và **scale nhanh hơn Kubernetes gấp 5 lần** |
| **Tự động mở rộng (Auto-scaling)** | Kubernetes có hỗ trợ auto-scaling | Docker Swarm **không hỗ trợ auto-scaling** |
| **Rolling Updates & Rollbacks** | Có thể triển khai rolling update và **tự động rollback** nếu có lỗi | Có rolling update, **nhưng không tự rollback** nếu lỗi |
| **Volumes dữ liệu (Data Volumes)** | Chỉ chia sẻ volume **giữa các container trong cùng Pod** | Có thể chia sẻ volume với **bất kỳ container nào khác** |
| **Logging & Monitoring** | Có sẵn công cụ tích hợp để **ghi log và giám sát** | Cần dùng **công cụ bên thứ 3** như **ELK** để ghi log và giám sát |

## Kubernetes Cluster

- Một cụm Kubernetes (Kubernetes Cluster) là một nhóm các máy **vật lý hoặc ảo** cùng với các tài nguyên hạ tầng khác mà bạn **cần để chạy các ứng dụng đóng gói trong container**. Mỗi máy trong cụm này được gọi là một node (nút).
- Hay nói cách khác, một K8s cluster sẽ gồm tập các nodes chạy các ứng dụng ảo hóa bằng container.
- Có 2 nút: Master và Worker.

## Kiến trúc Kubernetes

- Một K8s cluster sẽ gồm tập các nodes chạy các ứng dụng ảo hóa bằng container. Trên mỗi node sẽ cần chạy một **"kubelet"**, đây là **chương trình để chạy k8s**. Cần một node để làm "chủ" cluster, trên đó sẽ cài API server, scheduler ... Các máy còn lại sẽ **chạy kubelet để sinh ra các container.**
- Master node:
    - **Etcd: L**à một **kho dữ liệu key-value phân tán, tin cậy**, được Kubernetes sử dụng để **lưu trữ thông tin định danh, liên lạc giữa các nodes.**
    - **API Server**: server cung cấp **Kubernetes API**. **Giao tiếp với các thành phần còn lại của cụm thông qua kube-apiserver**, đây chính là **điểm truy cập chính** để vào control plane. **Kiểm tra tính hợp lệ và thực thi các lệnh REST từ người dùng**.
    - **Controller Manager Service:** Điểm truy cập chính vào control plane. Nó xác thực và thực thi các lệnh **REST của người dùng.** Chúng bao gồm **Node Controller, Replication Controller, Endpoints Controller, and Service Account and Token Controllers**.
        - Chúng **đóng vai trò phát hiện và phản hồi khi một node, container hoặc endpoint ngừng hoạt động**.
        - Các controller sẽ đưa ra quyết định **khởi động container mới** nếu có lỗi xảy ra.
    - **Scheduler Service:** định thời, phân bố tài nguyên còn khả dung đến các ứng dung container
- Worker node:
    - **Kubelet**: Agent kubelet trên các nút Worker chịu trách nhiệm tương tác với master để **cung cấp thông tin sức khỏe của nút worker** và **thực hiện các hành động được master yêu cầu** trên các nút worker.
    - **Kube-proxy**: Chịu trách nhiệm **đảm bảo lưu lượng mạng được định tuyến đúng cách** đến các dịch vụ nội bộ và bên ngoài theo yêu cầu và dựa trên các quy tắc được định nghĩa bởi chính sách mạng trong **kube-controller-manager**

## Kubectl

- `kubectl` (đọc là “kube control”) là **công cụ dòng lệnh (CLI)** của Kubernetes dùng để:
    - Triển khai (deploy) ứng dụng
    - Quản lý tài nguyên (pods, deployments, services, v.v.)
    - Tương tác với **API Server** của Kubernetes

## Pods

- **Là đơn vị lập lịch cơ bản trong Kubernetes** và là **đơn vị triển khai nhỏ nhấ**t có thể được tạo, lập lịch và quản lý trên cụm Kubernetes.
- Mỗi pod được gán một **địa chỉ IP duy nhất** trong cụm. Bất kỳ container nào trong cùng một pod sẽ chia sẻ **cùng một ổ đĩa lưu trữ và tài nguyên mạng**, và giao tiếp bằng cách sử dụng **localhost.**
- Mặc dù một pod có thể chứa nhiều container, **cách khuyến nghị là chỉ có một container trên mỗi pod để tránh lãng phí tài nguyên khi mở rộng.**

## Imperative vs Declarative commands

- Imperative: Sử dụng các lệnh dựa trên động từ như kubectl run, kubectl create, kubectl expose, kubectl delete, kubectl scale, và kubectl edit
- Declaratively: Các đối tượng được viết trong tệp **YAML và triển khai bằng kubectl.**

## Manifest

- **Mô tả trạng thái mong muốn của ứng dụng** bằng các **đối tượng API của Kubernetes**.
- **Chứa một hoặc nhiều manifest**, tức là **nhiều đối tượng API cùng lúc**.

| Trường | Ý nghĩa |
| --- | --- |
| `apiVersion` | Phiên bản của Kubernetes API được sử dụng. Ví dụ: `v1`, `apps/v1`,... |
| `kind` | Loại đối tượng bạn muốn tạo. Ví dụ: `Pod`, `Deployment`, `Service`... |
| `metadata` | Thông tin định danh cho object như: `name`, `namespace`, `labels`... |
| `spec` | Phần mô tả **trạng thái mong muốn** (desired state) của object đó |


## Replication Controller

- Đảm bảo độ sẵn sàng cao bằng cách thay thế các pod chết hoặc không khoẻ bằng pod mới, để luôn luôn đủ số bản replica chạy trong cụm.

## ReplicaSet

- **ReplicaSet là một API cấp cao hơn cung cấp khả năng dễ dàng chạy nhiều phiên bản của một Pod nhất định.**
- ReplicaSet **đảm bảo rằng một số lượng chính xác các Pod (replicas) luôn chạy trong cụm** bằng cách thay thế bất kỳ Pod bị lỗi nào bằng các Pod mới.
- Hỗ trợ `label selectors` phức tạp hơn (như matchExpressions).
- Là nền tảng để Deployment quản lý pods.
- Hiện tại chúng ta **hiếm khi tạo trực tiếp ReplicaSet**, mà chủ yếu **Deployment sẽ tự động tạo ra ReplicaSet phía sau.**

## Deployments

- **Deployment** là cách triển khai Pods và ReplicaSets theo kiểu **khai báo (declarative)**. Bạn mô tả **trạng thái mong muốn**, và **Deployment Controller** sẽ tự động điều chỉnh **trạng thái thực tế** để khớp với nó.
- Đây là phương pháp được khuyến nghị để triển khai **Pod hoặc ReplicaSet**, vì:
    - Dễ dàng tạo và quản lý **ReplicaSet**
    - Hỗ trợ **rolling updates** (cập nhật dần từng Pod)
    - Có thể **rollback** về phiên bản cũ nếu cần
    - Hỗ trợ **scale lên/xuống** số lượng pod
    - Có thể **tạm dừng / tiếp tục** (pause/resume) cập nhật
- Đảm bảo **tính sẵn sàng cao** khi cập nhật ứng dụng bằng cách **thay thế dần** các pod cũ bằng pod mới.
    - **`maxUnavailable`:** Mặc định là 25% → không nhiều hơn 25% pod bị tạm dừng cùng lúc.
    - **`maxSurge`:** Mặc định là 25% → không tạo quá 25% pod mới cùng lúc.

## Labels and Selectors

- **Label** là các **cặp khóa/giá trị (key/value)** được gắn vào các đối tượng của Kubernetes, chẳng hạn như Pod.
- **Label** giúp bạn **nhóm các đối tượng một cách logic** bằng cách gán cho chúng một hoặc nhiều tên.
- **Selector** cho phép bạn **lọc các đối tượng** (như pods, services...) **dựa trên label**.
    - **Equality-based:** Uses operators =, ==, !=
    - **Set-based:**  Uses operators in, notin

## Namespace

- Namespace là các đối tượng Kubernetes cho phép **phân vùng một cụm Kubernetes thành nhiều cụm ảo độc lập**
- **Các cụm Kubernetes có thể quản lý đồng thời một số lượng lớn workload không liên quan đến nhau, và các tổ chức thường chọn triển khai các dự án được phát triển bởi các nhóm khác nhau lên cùng một cụm dùng chung.**
- Khi có nhiều deployment trong cùng một cluster, nguy cơ cao xảy ra tình trạng vô tình xóa nhầm các deployment thuộc về dự án khác.
- Mặc định, namespace Kubernetes có 3 tên:
    - **default.**
    - **Kube-system**: is the Namespace for objects created by Kubernetes systems/control plane.
    - **kube-public:** Namespace for resources that are publicly readable by all users.

## DaemonSet

- Chạy 1 Pod tại mỗi node.

## StatefulSet

- Giống Deployment nhưng giữ được “nhận dạng” Pod (như hostname, disk).

## Service

- Service kết nối các Pod một cách logic trong toàn bộ cluster để cho phép chúng giao tiếp mạng với nhau.
- **Service đảm bảo rằng ngay cả khi một Pod (ví dụ như backend) bị chết do lỗi, thì các Pod mới được tạo ra vẫn có thể được truy cập bởi các Pod phụ thuộc (ví dụ như frontend) thông qua Service.**
- Trong trường hợp này, các ứng dụng frontend **luôn tìm thấy ứng dụng backend** thông qua **Service** (bằng tên hoặc địa chỉ IP của Service), **bất kể backend nằm ở đâu trong cluster.**

### ClusterIP

**ClusterIP là loại Service mặc định trong Kubernetes.**

- Nó cung cấp một Service nội bộ trong cụm (cluster), cho phép các ứng dụng khác **bên trong cluster** có thể truy cập được.
- Nó **hạn chế quyền truy cập từ bên ngoài**, chỉ cho phép giao tiếp nội bộ trong cluster.
- Thường được sử dụng khi ứng dụng frontend cần giao tiếp với backend.
- Mỗi ClusterIP Service sẽ được gán một địa chỉ IP **duy nhất trong cluster**.
- Có thể hiểu tương tự như `--links` trong Docker, dùng để kết nối giữa các container với nhau.

### NodePort

**NodePort mở một cổng cụ thể trên tất cả các Node trong cluster và chuyển tiếp lưu lượng nhận được trên cổng này đến các service nội bộ.**

- Rất hữu ích khi muốn **expose các Pod frontend ra bên ngoài cluster** để người dùng có thể truy cập.
- NodePort được xây dựng **dựa trên ClusterIP**, bằng cách **mở rộng khả năng truy cập ra ngoài cluster.**
- Cổng NodePort phải nằm trong khoảng **30000–32767**.
- Nếu bạn không chỉ định cổng cụ thể, Kubernetes **sẽ tự động gán một cổng ngẫu nhiên** — **nên để K8s tự chọn** để tránh xung đột và rắc rối.

### LoadBalancer

**LoadBalancer là cách tiêu chuẩn để expose một dịch vụ Kubernetes ra ngoài Internet.**

- Trên các nền tảng như **GKE (Google Kubernetes Engine)**, khi bạn tạo một LoadBalancer Service, hệ thống sẽ **tự động tạo một Network Load Balancer**, cấp cho bạn **một địa chỉ IP công cộng**, và chuyển tiếp toàn bộ lưu lượng đến service của bạn.
- **Toàn bộ lưu lượng đến cổng được chỉ định sẽ được forward trực tiếp đến service**, không có cơ chế lọc hay định tuyến gì thêm. Điều này nghĩa là bạn có thể gửi **bất kỳ loại traffic nào**, như HTTP, TCP, UDP, WebSocket, v.v.
- Một số **hạn chế** của LoadBalancer:
    - Mỗi service được expose sẽ nhận **một địa chỉ IP công cộng riêng**.
    - Việc này **rất tốn kém**, đặc biệt nếu bạn có nhiều service cần truy cập từ bên ngoài.

| Tiêu chí | **LoadBalancer** | **Ingress** |
| --- | --- | --- |
| **Cơ chế hoạt động** | Cấp 1 IP public riêng từ cloud provider cho mỗi service | Sử dụng **1 IP duy nhất**, route nhiều service qua đó |
| **Phụ thuộc gì?** | Cloud Provider (AWS, GCP, Azure…) | Cần cài **Ingress Controller** (NGINX, Traefik...) |
| **Expose bao nhiêu service?** | Mỗi service = 1 LoadBalancer (IP riêng) | Nhiều service dùng chung 1 IP + rule định tuyến |
| **Chi phí** | Tốn nhiều (mỗi service = 1 IP = 1 load balancer tốn tiền) | Rẻ hơn (chỉ cần 1 IP cho cả đám service) |
| **Hỗ trợ path-based routing** | Không hỗ trợ (chỉ port-based) | Có thể route theo domain, path (VD: `/api`, `/auth`, `/user`) |
| **Cấu hình phức tạp?** | Dễ – chỉ cần YAML `type: LoadBalancer` | Phức tạp hơn chút – phải define Ingress resource + Controller |
| **Phù hợp môi trường** | Dev hoặc prod đơn giản | Production lớn, cần route thông minh và tiết kiệm chi phí |

### MetalLB Load Balancer

**MetalLB là một triển khai LoadBalancer cho các cụm Kubernetes chạy trên máy chủ vật lý (bare metal).**

- Nó cho phép bạn tạo các **Service kiểu “LoadBalancer”** trong các cluster **on-premises** hoặc **bare-metal**, tức là **không chạy trên các cloud provider** như AWS, GCP, Azure hay DigitalOcean.
- Nhờ MetalLB, bạn vẫn có thể expose dịch vụ ra ngoài giống như khi sử dụng LoadBalancer trên cloud, **dù không có IP công cộng tự động như trên cloud**.

## Ingress Resource(rules)

- Khi sử dụng **LoadBalancer của cloud**, chúng ta **phải trả phí cho mỗi service** được expose với kiểu `LoadBalancer`. → Khi số lượng service tăng lên, việc **quản lý SSL, scaling, xác thực (Auth)**,… cũng trở nên **phức tạp** hơn.
- **Ingress** giúp chúng ta xử lý toàn bộ những vấn đề trên **ngay bên trong cụm Kubernetes**, chỉ bằng **một file cấu hình** — file này sẽ nằm **chung với các YAML triển khai ứng dụng** khác.
- **Ingress Controller** hoạt động như một reverse proxy bên trong cluster (thường dưới dạng **Deployment hoặc DaemonSet**) và có khả năng:
    - Load balancing
    - Chứng thực (Auth)
    - Quản lý SSL (TLS termination)
    - Routing theo URL/path (VD: `/api`, `/admin`, …)
- **Ingress cho phép người dùng truy cập vào toàn bộ hệ thống qua một URL duy nhất** từ bên ngoài,
- URL đó sẽ được cấu hình để route đến các service khác nhau **dựa vào đường dẫn**, đồng thời **xử lý SSL tại chỗ** (TLS termination).

**Tip đi phỏng vấn**:

> "Ingress giúp gom nhiều service dưới 1 domain duy nhất, route thông minh theo path, đồng thời xử lý Auth, SSL termination ngay bên trong cluster — vừa tiết kiệm chi phí, vừa dễ maintain."
> 

### Reverse Proxy

**Reverse proxy đứng phía trước server**, hoạt động như một điểm trung gian giữa client và server.

- Client **không cần cấu hình gì** để sử dụng reverse proxy
- Reverse proxy **ẩn danh tính của server** với client bên ngoài
- Thường được dùng để:
    - Load balancing
    - SSL termination
    - Caching
    - Security (bảo vệ server khỏi tấn công)
- **Ingress Controller trong Kubernetes chính là một reverse proxy**, nó đứng trước các service và điều hướng traffic từ bên ngoài vào các service bên trong cluster.

## Volumes

- Volume trong K8s là **một thư mục** (directory) có thể được **mount vào trong 1 hoặc nhiều container** trong pod.
- Dữ liệu bên trong volume **không bị mất** khi container **bị restart.**
- Tuỳ loại volume, **dữ liệu có thể được lưu tạm, lưu trên node, hoặc lưu vĩnh viễn trên storage bên ngoài.**

| Nhóm | Loại Volume | Mô tả |
| --- | --- | --- |
| **Node-local** | `emptyDir`, `hostPath` | - `emptyDir`: tạo thư mục trống mỗi khi pod start, xoá khi pod chết.  - `hostPath`: gắn thư mục từ node vào pod. |
| **Cloud storage** | `awsElasticBlockStore`, `gcePersistentDisk`, `azureDisk` | Lưu dữ liệu trên ổ cứng cloud (EBS, GCP, Azure). Dữ liệu **vẫn còn** nếu pod bị xoá. |
| **File sharing** | `NFS` | Dùng chung 1 file server qua mạng cho nhiều pod |
| **Distributed FS** | `CephFS`, `GlusterFS` | Hệ thống file phân tán, phù hợp cho high-availability, scalable storage |
| **Special volumes** | `PersistentVolumeClaim`, `configMap`, `secret`, `gitRepo` | - `PVC`: yêu cầu dung lượng lưu trữ từ Persistent Volume.  - `configMap`, `secret`: mount dữ liệu cấu hình hoặc thông tin nhạy cảm  - `gitRepo`: clone repo Git vào pod (deprecated) |

### emptyDir

- `emptyDir` là một loại volume đặc biệt được **tạo ra ngay khi Pod được gán vào một Node**.
- Khi vừa tạo, volume này **trống hoàn toàn** (đúng như tên gọi).
- **Thời gian tồn tại của volume gắn chặt với vòng đời của Pod** – khi Pod bị xoá (dù là crash hay scale down), dữ liệu trong `emptyDir` cũng **biến mất vĩnh viễn**.

### hostPath

- `hostPath` là loại volume cho phép **mount một file hoặc thư mục từ máy chủ (host node)** trực tiếp vào pod.
- Tức là: container trong pod có thể **truy cập dữ liệu nằm trên hệ thống file của node vật lý đang chạy pod đó**.

## Persistent Volume and Persistent Volume Claim

> PV là tài nguyên lưu trữ (storage) được quản lý bởi cluster admin, không phụ thuộc vào vòng đời của Pod.
> 
- Là 1 **volume thực tế**, có thể đến từ cloud (EBS, GCE Disk, Azure Disk), NFS, hay iSCSI, GlusterFS, v.v.
- PV tồn tại **độc lập**, **có thể dùng lại**, không bị xoá khi pod chết.
- Nó là abstraction để Kubernetes nói chuyện với các loại storage khác nhau.

> PVC là yêu cầu từ người dùng để "xin dùng" một PV.
> 
- Dev không cần biết dùng loại disk nào, chỉ cần "claim" nhu cầu: cần bao nhiêu GB, loại gì (ReadWriteOnce?).
- PVC sẽ **tự động được bind (gắn)** vào một PV tương thích đã có trong cluster.

## **Tại sao cần tách PV và PVC?**

- **Tách biệt nhiệm vụ**: Admin quản lý PV, Dev chỉ cần PVC.
- **Tái sử dụng volume**: PVC chết thì PV có thể reuse.
- **Tự động hóa (Dynamic Provisioning)**: Nếu không có PV phù hợp, Kubernetes có thể **tự tạo PV mới** từ StorageClass để phục vụ PVC.

## Kubernetes Scheduling – Lên lịch Pod

- Mặc định, **Kubernetes tự động chọn node phù hợp** để chạy Pod.
- Tuy nhiên, bạn có thể **tùy chỉnh cách Pod được lên lịch** trong các trường hợp đặc biệt, ví dụ như:
    - Cần phần cứng chuyên dụng (GPU, SSD, v.v.)
    - Chạy các dịch vụ cần nằm chung (co-location)
    - Cách ly workload ra node riêng

### Các tùy chọn lên lịch thủ công

### `nodeName` (đơn giản nhất)

- Gán Pod **trực tiếp vào một node cụ thể** bằng tên node.
- **Hạn chế:** Nếu node không tồn tại hoặc thiếu tài nguyên → Pod sẽ **fail hoặc không chạy**.
- Dùng khi bạn **chắc chắn** node tồn tại và ổn định (ít dùng trong cloud do tên node không ổn định).

### `nodeSelector`

- Gán Pod dựa trên **label (key-value)** của node.
- Là một “**yêu cầu cứng (hard requirement)**” → nếu không có node nào khớp → Pod sẽ ở trạng thái **Pending**.
- Đơn giản nhưng giới hạn logic.

### `Node Affinity` (nâng cao hơn `nodeSelector`)

- Cho phép dùng **các quy tắc phức tạp hơn** để match node.
- Hỗ trợ cả yêu cầu cứng và mềm:

### **Taints và Tolerations** (Ngăn Pod chạy sai chỗ)

| Thành phần | Giải thích dễ hiểu |
| --- | --- |
| **Taint** | Đặt trên node để **“đuổi” Pod không phù hợp** → như một **ổ khóa** |
| **Toleration** | Đặt trên Pod để **“chịu được” taint** → như **chiếc chìa khóa mở khóa node** |
- Chúng **phối hợp với nhau** để **ngăn Pod user chạy trên Master node**, hoặc cô lập workload nhạy cảm.

### Hiệu ứng của Taint (Taint Effects)

| Hiệu ứng | Ý nghĩa |
| --- | --- |
| `NoSchedule` | Không cho bất kỳ Pod nào **không có Toleration tương ứng** được lên lịch vào node này. |
| `PreferNoSchedule` | Tránh chạy Pod nếu không có Toleration, nhưng không cứng nhắc. |
| `NoExecute` | **Đuổi Pod đang chạy ngay lập tức**, và cũng không cho Pod mới lên lịch nếu không có Toleration. |

### Tóm tắt

| Cách | Cứng hay mềm | Dễ hiểu như |
| --- | --- | --- |
| `nodeName` | Cứng | Gán cứng vào node theo tên |
| `nodeSelector` | Cứng | Gán theo nhãn |
| `Node Affinity` | Cứng & Mềm | Match logic phức tạp hơn |
| `Taints & Tolerations` | Cứng & Mềm | Khóa và chìa khóa node |