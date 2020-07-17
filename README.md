<span style="display:block;text-align:center">Auto Install & Optimize LEMP Stack on CentOS 7 </span>                             
<span style="display:block;text-align:center">Author: Sanvv - HOSTVN.NET Technical </span>

<span style="display:block;text-align:center"> ![title](https://blog.hostvn.net/wp-content/uploads/2020/07/logo-big-2.png) </span>

########################################################################################

Script được viết bằng shell dùng để cài đặt LEMP Stack (Nginx - MariaDB - PHP-FPM) trên CentOS 7 (CentOS 8 sẽ sớm được hỗ trợ).

## 1. Chi tiết Script:

- Cập nhật liên tục, cung cấp Menu giúp dễ dàng thao tác, tự động cài đặt.
- Cài đặt các phần mềm phiên bản mới nhất từ chính trang chủ.
- Cấu hình tối ưu bảo mật
- Mariadb phiên 10.5
- Phiên bản Nginx: 1.18.0
- Cho phép lựa chọn phiên bản PHP: 5.6, 7.0, 7.1, 7.2, 7.4.
- Cho phép chạy song song hai phiên bản PHP.
- Cài đặt Pureftpd, phpMyAdmin, PHPMemcachedAdmin, phpRedisAdmin, phpSysInfo
- Cài đặt memcached, redis.
- Cấu hình tối ưu MySQL, Nginx, php.
- Tích hợ Let's Encrypt SSL.
- Cung cấp Menu nâng cấp Nginx, MariaDB/, PHP, Redis, Memcached, phpMyAdmin
- Cung cấp Menu quản lý Wordpress: backup, restore, optimize database, repair database .....
- Backup và restore dữ liệu từ Google Drive với Rclone.
- Backup, restore tại Local
- Thiết lập số bản backup lưu trữ.
- And More

## 2. Yêu cầu

- CentOS 7 (CentOS 8 sẽ sớm được hỗ trợ).

## 3. Cách cài đặt

`curl -sO https://scripts.hostvn.net/install && chmod +x install && ./install`

## 4. Các tính năng đang phát triển

- Deploy nhanh mã nguồn trên VPS
- Scan Malware
- Scan bug wordpress
- Tích hợp Firewall chống XSS, SQL Injection ....

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

## 7. Feedback

Mọi ý kiến đóng góp các bạn vui lòng gửi về sanvv@hostvn.com hoặc tạo Github Issues.

## 8. Contributors & Credits
### Developers / Maintainers
- Sanvv

### Contributors
- Giapvv
- Thanhnv
- mbrother
