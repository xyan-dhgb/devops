# Prometheus và Grafana

## **Các Loại Hệ Thống Giám Sát (Types of Monitoring Systems)**

Có nhiều cách để phân loại hệ thống giám sát, mỗi loại có những đặc điểm riêng biệt quan trọng cần ghi nhớ:

### Single System

- Thường dùng để giám sát một máy chủ duy nhất, ví dụ: monit, htop, sar, nmon

### Distributed

- Dùng để giám sát nhiều hệ thống hoặc một hạ tầng phức tạp, ví dụ: Nagios, Zabbix, collectd, Ganglia

### Self-hosted

- Tự cài đặt và quản lý hệ thống trên hạ tầng của mình, ví dụ: Nagios, Zabbix, Sensu, Icinga, Prometheus, Sysdig

### Monitoring-as-a-service

- Sử dụng dịch vụ của bên thứ ba, không cần quản lý hạ tầng giám sát, ví dụ: Amazon CloudWatch, DataDog, NewRelic, ServerDensity, SolarWinds, Sysdig.io

### Pull-based và Push-based

- **Pull-based:** Hệ thống giám sát chủ động kết nối đến các mục tiêu (target) để "kéo" dữ liệu về, ví dụ: Nagios, Zabbix, Icinga, **Prometheus**.
- **Prometheus hoạt động theo cơ chế pull**
- **Push-based:** Các mục tiêu tự động "đẩy" dữ liệu đến hệ thống giám sát, ví dụ: Graphite, Sensu, DataDog, CloudWatch

### Giám sát theo phạm vi

- Giám sát Hệ thống (Server), Giám sát Mạng (Network), Giám sát API, và Quản lý Hiệu suất Ứng dụng (Application Performance Management - APM).

## Ba lớp của giám sát

- **Monitoring Framework:** Đây là nền tảng giúp thu thập toàn bộ dữ liệu từ các lớp bên trên. Nó đóng vai trò **interface để tracking toàn hệ thống**.
- **Luồng dữ liệu giám sát:** Các lớp *Infrastructure → Application → Business Logic* đều đẩy **Events, Logs, Metrics** lên.
- **Event Router:** Là bộ điều phối các sự kiện, log, metric được gửi lên từ monitoring framework. **Xử lý, lọc, định tuyến** dữ liệu monitoring tới nơi phù hợp.
- **Destinations:** Các nơi nhận dữ liệu monitoring:
    - **Store** – lưu trữ để truy xuất sau này (VD: Elasticsearch, Prometheus TSDB)
    - **Graph** – hiển thị biểu đồ (VD: Grafana)
    - **Alerts** – cảnh báo khi có bất thường (VD: Alertmanager, Opsgenie,...)

## **Cơ Sở Dữ Liệu Chuỗi Thời Gian (Time Series Databases - TSDB)**

- Một hệ thống phần mềm được tối ưu hóa để xử lý **dữ liệu chuỗi thời gian** – tức là các mảng số được lập chỉ mục theo thời gian.

## **Prometheus: Tổng Quan và Đặc Điểm (Prometheus: Overview and Features)**

- Prometheus là một công cụ giám sát mã nguồn mở rất mạnh mẽ, cổng mặc định là **9090** với các đặc điểm nổi bật:
    - **Cơ sở dữ liệu chuỗi thời gian (Time Series Database).**
    - **Chế độ Pull (Pull Mode)**: Prometheus chủ động "kéo" các metrics từ các mục tiêu được cấu hình.
    - **Ngôn ngữ truy vấn biểu cảm (Expressive Query Language - PromQL)**: Cho phép người dùng chọn và tổng hợp dữ liệu chuỗi thời gian theo thời gian thực.
    - **Mô hình dữ liệu đa chiều (Dimensional data model)**: Dữ liệu được xác định duy nhất bằng tên metric và một tập hợp các cặp key:values (labels). **Labels là yếu tố cốt lõi cho khả năng truy vấn và tổng hợp linh hoạt của Prometheus.**
    - **Hỗ trợ nhiều thư viện client (Multiple Client Libraries)**: Giúp ứng dụng dễ dàng xuất metrics.
    - **Cảnh báo thông minh (Smart Alerting).**
    - **Tích hợp Grafana để trực quan hóa (Grafana Integration for Visualization)**

## Kiến trúc Prometheus

### Prometheus Server – Trung tâm của hệ thống

- Prometheus server là **bộ não** của hệ thống monitoring. Nó đảm nhận:
    - **Retrieval**: Kéo (pull) metrics định kỳ từ các target như node exporter, app,...
    - **TSDB (Time Series Database)**: Lưu trữ dữ liệu metrics dạng chuỗi thời gian vào bộ nhớ (HDD/SSD).
    - **HTTP Server**: Cho phép query dữ liệu qua PromQL và phục vụ web UI hoặc API client.

### Jobs / Exporters – Nguồn dữ liệu

- Là các ứng dụng, service, hoặc agent như Node Exporter, cAdvisor, v.v...
- Prometheus **pull** dữ liệu trực tiếp từ đây theo định kỳ.
- Chúng cung cấp metric ở định dạng Prometheus hiểu được (HTTP endpoint `/metrics`).

### Pushgateway – Cho job ngắn

- Dùng cho các **short-lived jobs** (chạy xong rồi chết như cronjob).
- Những job này **không thể bị Prometheus pull** nên sẽ **tự push metrics** sang Pushgateway khi kết thúc.
- Sau đó, Prometheus sẽ **pull từ Pushgateway**.

### Service Discovery – Tự động tìm target

- Prometheus hỗ trợ **tự phát hiện (discover)** các service hoặc endpoint cần giám sát.
- Có thể tích hợp với **Kubernetes**, **file_sd**, Consul,... để cập nhật dynamic.

### Alertmanager – Hệ thống cảnh báo

- Prometheus server có thể gửi **cảnh báo (alerts)** nếu phát hiện tình trạng bất thường (ví dụ: CPU quá cao, service down).
- Các alert này được **push sang Alertmanager**.
- Alertmanager sẽ **gửi thông báo đến các kênh như: Email, Slack, PagerDuty,...**

### Giao diện hiển thị – Web UI & Grafana

- **Prometheus Web UI**: Dùng để truy vấn trực tiếp PromQL và xem biểu đồ cơ bản.
- **Grafana**: Giao diện mạnh mẽ hơn, trực quan, đẹp mắt, có thể tạo dashboard custom từ dữ liệu Prometheus. Cổng 3000.
- Ngoài ra còn có thể dùng **API client** để truy xuất dữ liệu.

![image.png](attachment:d31d9696-05dd-45b9-9b85-4d947c263af9:image.png)

### Lưu trữ – Local Storage

- Dữ liệu time-series sẽ được lưu trữ local trong **HDD/SSD** của máy chạy Prometheus.
- Với hệ thống lớn, có thể dùng remote storage để scale tốt hơn.

## **Thu Thập Metrics (Scraping Metrics)**

- Prometheus thu thập metrics từ hai nguồn chính:
    - **Application Instrumentation (Đo lường từ Ứng dụng)**: Các ứng dụng tự tích hợp mã để **phơi bày (expose) các metrics** qua một endpoint HTTP (thường là /metrics).
        - Sử dụng **thư viện client** (ví dụ: prometheus_client cho Python) để định nghĩa và tăng/giảm giá trị của metrics trực tiếp trong mã ứng dụng
    - **Exporters (Bộ xuất)**: Là các dịch vụ riêng biệt chuyển đổi metrics từ các hệ thống **không natively hỗ trợ Prometheus** (ví dụ: cơ sở dữ liệu, hệ điều hành, dịch vụ đám mây) thành định dạng mà Prometheus có thể hiểu và pull.
        - Ví dụ phổ biến: **Node Exporter** (cho metrics phần cứng và OS của hệ thống *NIX), MySQL server exporter, MongoDB exporter, Jenkins Prometheus Plugin, AWS Health Exporter

## **Mô Hình Dữ Liệu của Prometheus (Prometheus Data Model**

- **Mỗi chuỗi thời gian được xác định duy nhất bởi tên metric của nó và một tập hợp các cặp `khóa-giá trị`, còn được gọi là nhãn (labels).**
- **Labels cho phép mô hình dữ liệu đa chiều của Prometheus**, giúp chúng ta lọc và tổng hợp dữ liệu dựa trên các chiều này.
- **Việc thay đổi bất kỳ giá trị nhãn nào (bao gồm thêm hoặc xóa nhãn) sẽ tạo ra một chuỗi thời gian mới.**
- Ví dụ: node_cpu{cpu="cpu0",instance="node:9100",job="node",mode="system"} – ở đây
    - *node_cpu* là tên metric
    - Phần trong *{}* là các labels

## **Truy Vấn Dữ Liệu với PromQL (Querying Data with PromQL)**

- **PromQL (Prometheus Query Language)** là ngôn ngữ biểu thức chức năng mạnh mẽ của Prometheus.
- Cho phép chúng ta chọn và tổng hợp dữ liệu chuỗi thời gian theo thời gian thực.
- Kết quả có thể hiển thị dưới dạng **đồ thị,** dữ liệu dạng **bảng,** hoặc qua **API HTTP.**
- **Vector Phạm Vi (Range Vector)**: Trả về một phạm vi dữ liệu trong một khoảng thời gian nhất định.
- `rate():` **Cực kỳ quan trọng để tính tốc độ thay đổi trên mỗi giây cho Counter metrics.** Hàm `rate()` tính toán tốc độ tăng trên mỗi giây giữa các điểm dữ liệu trong một khoảng thời gian, có tính đến việc counter có thể reset.

## **Hệ Thống Cảnh Báo (Alerting System)**

- **Quy tắc cơ bản**: Giữ cảnh báo đơn giản, cảnh báo dựa trên triệu chứng (symptoms) thay vì nguyên nhân, có bảng điều khiển tốt để xác định nguyên nhân, tránh các cảnh báo không cần thiết.
- Cảnh báo có thể được tạo bằng **AlertManager** hoặc trong Grafana.
- **Alerting Rules (Quy tắc Cảnh báo)**: Được định nghĩa trong các file YAML (ví dụ: rules.yaml) và được Prometheus nạp vào. Một quy tắc cảnh báo bao gồm:
    - *alert:* Tên cảnh báo.
    - *expr:* Biểu thức PromQL định nghĩa điều kiện kích hoạt cảnh báo.
    - *for*: Thời gian mà điều kiện phải đúng để cảnh báo kích hoạt.
    - *labels*: Các nhãn bổ sung cho cảnh báo (ví dụ: severity: page).
    - *annotations*: Thông tin mô tả thêm về cảnh báo (ví dụ: summary).
- **Recording Rules (Quy tắc Ghi lại)**: Dùng để tính toán trước các biểu thức PromQL thường xuyên được sử dụng hoặc tốn kém về mặt tính toán, lưu trữ kết quả dưới dạng metric mới.
- **Alertmanager**: Là một dịch vụ riêng biệt mà Prometheus gửi cảnh báo đến. Có nhiệm vụ chính:
    - **Khử trùng lặp (Deduplicating)**
    - **Nhóm (Grouping)** các cảnh báo tương tự
    - **Định tuyến (Routing)** cảnh báo đến các hệ thống nhận thích hợp (ví dụ: Email, PagerDuty, OpsGenie, **Slack**)
- Cũng xử lý việc **tắt (silencing)** và **ức chế (inhibition)** các cảnh báo.

## Các loại metrics

- Prometheus hỗ trợ 4 loại metric chính, mỗi loại có cách sử dụng và ý nghĩa khác nhau:

### **Gauge (Đồng hồ đo)**:

- **Mô tả**: Đại diện cho một **giá trị số đơn lẻ có thể tăng hoặc giảm tùy ý** tại bất kỳ thời điểm nào. Nó là **một snapshot của trạng thái hiện tại**.
- **Sử dụng**: Thường dùng để đo lường những thứ như s*ố lượng mục trong hàng đợi, mức sử dụng bộ nhớ, số lượng luồng hoạt động, thời gian cuối cùng một bản ghi được xử lý.*
- **Tổng hợp**: Khi tổng hợp, chúng ta thường muốn lấy **tổng, trung bình, tối thiểu hoặc tối đa.**

### Counter

- **Mô tả**: Là một **giá trị số đơn lẻ chỉ có thể tăng lên hoặc được đặt lại về 0** (khi hệ thống khởi động lại chẳng hạn). Nó theo dõi **số lượng hoặc kích thước của các sự kiện.**
- **Sử dụng**: *Đếm tổng số yêu cầu, tổng số lỗi, tổng số byte đã truyền.*
- **Điểm quan trọng**: Giá trị của Counter là tổng số **kể từ khi bắt đầu đo lường**. Để biết tốc độ thay đổi (tức là tần suất xảy ra sự kiện), chúng ta **phải sử dụng hàm** `rate()`

### Summary

- **Mô tả**: Lấy mẫu các quan sát (thường là *thời gian phản hồi yêu cầu* hoặc *kích thước phản hồi)* và cung cấp **tổng số quan sát (_count) và tổng tất cả các giá trị quan sát (_sum), cùng với các quantiles** (ví dụ: p50, p90, p99) được tính toán phía client.
- **Điểm quan trọng**: Các quantiles của Summary được tính ở phía client, **do đó không thể kết hợp chúng lại với nhau** (ví dụ: không thể tính quantile cho toàn bộ cụm từ các Summary của từng instance riêng lẻ

### Histogram

- **Mô tả**: Tương tự Summary, nhưng cho phép lấy mẫu các quan sát vào các **bucket được định nghĩa trước** (ví dụ: bucket cho độ trễ <10ms, <100ms, <1s, <10s). Nó cũng cung cấp **_bucket, _count, và _sum.**
- **Sử dụng**: Thường dùng để *theo dõi độ trễ, kích thước phản hồi.*
- **Điểm quan trọng**: Với Histogram, chúng ta **có thể tính toán quantiles (ví dụ: p90) ở phía server bằng hàm histogram_quantile()**, cho phép tổng hợp trên nhiều instance.

## **Instrumentation (Đo lường từ Ứng dụng)**

- **Khái niệm**: Là quá trình cho phép mã ứng dụng của chúng ta được giám sát bằng cách phơi bày các metrics và logs.
- **Cách thực hiện**: Trực tiếp phơi bày metrics hoặc sử dụng thư viện client.
- **Thư viện client**: Prometheus cung cấp các thư viện client chính thức cho Go, Python, Java, Ruby và không chính thức cho nhiều ngôn ngữ khác.
- **Ví dụ thực tế**: Thêm Counter hoặc Gauge vào mã Python của chúng ta để đếm số yêu cầu, số lỗi hoặc đo trạng thái.
- **Gán nhãn (Labeling)**: chúng ta có thể thêm nhãn cho metrics của mình để phân biệt các loại dữ liệu, ví dụ: c = Counter('my_requests_total', 'HTTP Failures', ['method']) và c.labels('get').inc() để đếm riêng các yêu cầu GET và POST