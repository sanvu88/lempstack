<p align="center"><strong>Auto Install & Optimize LEMP Stack on CentOS 7</strong></p>
<p align="center"><strong>Author: Sanvv - HOSTVN.NET Technical</strong></p>

<p align="center"> <img src="https://blog.hostvn.net/wp-content/uploads/2020/07/logo-big-2.png" /> </p>

########################################################################################

Script được viết bằng shell dùng để cài đặt LEMP Stack (Nginx - MariaDB - PHP-FPM) trên CentOS 7 (CentOS 8 sẽ sớm được hỗ trợ).

## 1. Chi tiết Script:

### 1.1. Cài đặt

- Cập nhật liên tục, cung cấp Menu giúp dễ dàng thao tác, tự động cài đặt.
- Cài đặt các phần mềm phiên bản mới nhất từ chính trang chủ.
- Mariadb: 10.5
- Phiên bản Nginx: 1.18.0
- Cho phép lựa chọn phiên bản PHP: 5.6, 7.0, 7.1, 7.2, 7.4.
- Cài đặt Pureftpd, phpMyAdmin, PHPMemcachedAdmin, phpRedisAdmin, phpSysInfo
- Cài đặt memcached, redis.
- Cài đặt CSF Firewall và CSF GUI - Quản lý CSF với giao diện web
- Tích hợp Let's Encrypt SSL.
- Cung cấp Menu nâng cấp Nginx, MariaDB/, PHP, Redis, Memcached, phpMyAdmin


### 1.2. Tối ưu

- Cấu hình tối ưu MySQL, Nginx, php, Opacache, Memcached, Redis phù hợp theo thông số của VPS
- Cấu hình Brotli Compress
- Cấu hình rewrite URL với một số mã nguồn phổ biến: WordPress, Laravel, Opencart, Magento, Drupal ....
- Cho phép chạy song song hai phiên bản PHP.
- Backup và restore dữ liệu từ Google Drive với Rclone.
- Backup, restore tại Local
- Thiết lập số bản backup lưu trữ.
- Quản lý FTP dễ dàng trong trường hợp bạn thuê coder và chỉ muốn họ được phép access vào thư mục nhất định
- Cho phép lựa chọn Redis Cache hoặc Memcached giúp tăng tốc độ website.
- And More

### 1.3. Bảo mật

- Cấu hình tăng cường bảo mật từ tầng webserver
- Không tắt Selinux đảm bảo mức độ bảo mật cho CentOS
- Cấu hình website chạy với user khác nhau kết hợp disable các hàm nguy hiểm, bật open_basedir và một số config khác nhằm tăng cường bảo mật
- Auto block bruteforce SSH, FTP ....
- Block run shell trong thư mục uploads WordPress. Chặn truy cập các thư mục, file nhạy cảm trên WordPress
- Chống Bruteforce wp-admin
- BLock, Unblock IP dễ dàng với CSF Gui (Quản lý CSF qua giao diện Web)
- Thay đổi Port SSH
- Thay đổi port Admin
- Thay đổi port FTP
- And More .......

### 1.4. Quản lý WordPress

- Kiểm tra phiên bản WordPress đang sử dụng
- Cập nhật WordPress
- Cập nhật plugins
- Tối ưu Database
- Repair Database
- Sao lưu dữ liệu (Local)
- Khôi phục dữ liệu (Local)
- Thay đổi tên miền
- Đổi mật khẩu admin (wp-admin)
- Cài đặt WordPress tự động
- Bật/tắt Yoast Seo config
- Bật/Tắt Rank Math Seo config
- Cấu hình Nginx với một số plugins cache phổ biến: WP-Rocket, w3 total cache, wp supercache, Cache Enabler, Swift Performance, Fast cache
- Thêm cache key tránh trùng lặp nội dung giữa các site khi dùng memcached hoặc redis
- Bật/tắt Debug
- Bật/tắt chế độ bảo trì
- Huỷ kích hoạt toàn bộ plugins
- Random database prefix khi sử dụng chức năng cài đặt tự động


## 2. Yêu cầu

- CentOS 7 (CentOS 8 sẽ sớm được hỗ trợ).

## 3. Cách cài đặt

`curl -sO https://scripts.hostvn.net/install && chmod +x install && ./install`

## 4. Các tính năng sẽ phát triển

- Deploy nhanh mã nguồn trên VPS
- Scan Malware
- Scan bug WordPress
- Thay đổi WordPress database prefix
- Tích hợp Firewall chống XSS, SQL Injection ....
- Cảnh báo qua email, telegram

## 5. Cách sử dụng

- Vui lòng truy cập: https://scripts.hostvn.net

## 6. Nguồn download các phần mềm

- Nginx: http://nginx.org/en/download.html
- MariaDB: https://downloads.mariadb.org/
- PHP: https://www.php.net/
- phpMyAdmin: https://www.phpmyadmin.net/
- PHPMemcachedAdmin: https://github.com/elijaa/phpmemcachedadmin
- phpRedisAdmin: https://github.com/erikdubbelboer/phpRedisAdmin
- phpSysInfo: https://github.com/phpsysinfo/phpsysinfo
- Pure-FTPD: https://www.pureftpd.org/project/pure-ftpd/
- Rclone: https://rclone.org/

## 7. Contact

- Homepage: https://scripts.hostvn.net
- Group: https://www.facebook.com/groups/scripthostvn/
- Email: Sanvv@hostvn.com

## 8. Feedback

- Rất mong nhận được ý kiến đóng góp của các bạn để Scripts ngày càng hoàn thiện hơn.
- Mọi ý kiến đóng góp các bạn vui lòng gửi về sanvv@hostvn.com, Group Facebook: https://www.facebook.com/groups/scripthostvn/ hoặc tạo Github Issues.

## 9. Contributors & Credits
### Developers / Maintainers
- Sanvv

### Contributors
- mbrother
- Thanhnv
- Giapvv
- Lamhn
