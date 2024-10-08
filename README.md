DBT Test

Test trên dữ liệu order của một cửa hàng
- Lấy danh sách 10 khách hàng chi tiền nhiều nhất
- Tính ra trung bình động 5 ngày (5-day moving average) của doanh thu

Để tạo models trong schema khác ta chỉ cần config trong `dbt_project.yml`

Không thể tạo models trong database khác vì hạn chế của Postgres, nó chỉ có thể làm việc trong cùng một DB. 

Để có thể tạo view trên database khác với nguồn dữ liệu thì ta cần dùng tính năng Foreign Data Wrapper (FDW) của Postgres để map các bảng ở DB nguồn sang các bảng ở DB đích.