<p align="center"><strong>Auto Install & Optimize LEMP Stack on CentOS 7, 8</strong></p>
<p align="center"><strong>Author: Sanvv - HOSTVN.NET Technical</strong></p>
<p align="center"><strong>Home Page: https://hostvn.vn/</strong></p>
<p align="center"><strong>Document: https://hostvn.vn/huong-dan/</strong></p>
<p align="center"><strong>Groupt Support: https://www.facebook.com/groups/scripthostvn/</strong></p>

<p align="center"> <img src="https://blog.hostvn.net/wp-content/uploads/2020/07/logo-big-2.png" /> </p>

########################################################################################

Script được viết bằng shell dùng để cài đặt LEMP Stack (Nginx - MariaDB - PHP-FPM) trên CentOS 7, CentOS 8.

<b>Vui lòng không sao chép, phát hành lại với mục đích thương mại, donate. Xin cảm ơn.</b>

## 1. Chi tiết Script:

### 1.1. Cài đặt

- Cập nhật liên tục, cung cấp Menu giúp dễ dàng thao tác, tự động cài đặt.
- Cài đặt các phần mềm với phiên bản mới nhất từ chính trang chủ.
- Mariadb: 10.5.
- Phiên bản Nginx: 1.18.0 Stable.
- Cho phép lựa chọn phiên bản PHP:
    + centOS 7: 5.6, 7.0, 7.1, 7.2, 7.3, 7.4.
    + centOS 8: 7.2, 7.3, 7.4.
- phpMyAdmin 4.9.5 nếu cài đặt PHP mặc định là 5.6, phpMyAdmin 5.0.2 nếu cài đặt PHP mặc định là 7.x.
- Cài đặt Pureftpd giúp quản lý FTP.
- Cài đặt PHPMemcachedAdmin, phpRedisAdmin, phpSysInfo, Opcache Dashboard.
- Cài đặt memcached, redis cache. (Mặc định sẽ không bật).
- Cài đặt CSF Firewall và CSF GUI - Quản lý CSF với giao diện web.
- Tích hợp Let's Encrypt SSL.
- Cung cấp Menu nâng cấp Nginx, MariaDB, PHP, Redis, Memcached, phpMyAdmin.
- Cài đặt WP-CLI, Composer, Rclone.
- Cài đặt: ClamAV, Naxsi Firewall.
- KHÔNG THU THẬP BẤT KỲ THÔNG TIN GÌ TRÊN VPS CỦA BẠN.

### 1.2. Tối ưu

- Cấu hình tối ưu MySQL, Nginx, PHP, Opcache, Memcached, Redis phù hợp theo thông số của VPS.
- Cấu hình Brotli Compress.
- Cấu hình rewrite URL với một số mã nguồn phổ biến: WordPress, Laravel, Opencart, Magento, Drupal ...
- Cho phép chạy song song hai phiên bản PHP.
- Quản lý FTP dễ dàng trong trường hợp bạn thuê coder và chỉ muốn họ được phép access vào thư mục nhất định.
- Cho phép lựa chọn Redis Cache hoặc Memcached giúp tăng tốc độ website.
- Cho phép cấu hình tự động gia hạn Let's Encrypt.
- Menu hỗ trợ cấu hình SSL trả phí.
- Menu xem error log Nginx, Mysql, PHP và xem theo từng tên miền cụ thể.
- Cronjob tự động cập nhật dải IP mới nhất của Cloudflare cho Nginx và CSF Firewall.
- And More ...

### 1.3. Bảo mật

- Cấu hình tăng cường bảo mật từ tầng webserver.
- Không tắt Selinux trên CentOS.
- Cấu hình website chạy với user khác nhau hạn chế lây lan mã độc giữa các website.
- Disable các hàm nguy hiểm, bật open_basedir và một số config khác nhằm tăng cường bảo mật.
- Auto block bruteforce SSH, FTP .... với CSF Firewall.
- Block run shell trong thư mục uploads WordPress. Chặn truy cập các thư mục, file nhạy cảm trên WordPress.
- Chống Bruteforce wp-admin.
- BLock, Unblock IP dễ dàng với CSF Gui (Quản lý CSF qua giao diện Web) và menu quản lý CSF.
- Disable User API - /wp-json/wp/v2/users - trên WordPress tránh lộ thông tin User (Sẽ phát triển menu bật tắt disable).
- Thay đổi Port SSH tránh scan SSH.
- Cho phép thay đổi port Admin.
- Cho phép thay đổi port FTP.
- Cấu hình bảo mật FTP
- Tự động tạo mật khẩu mạnh.
- Scan Malware với Clamav.
- Hạn chế XSS, SQL Injection, RFI ... với Naxsi Firewall.
- And More ...

### 1.4. Quản lý WordPress

- Kiểm tra phiên bản WordPress đang sử dụng.
- Cập nhật WordPress.
- Cập nhật plugins.
- Tối ưu Database.
- Repair Database.
- Sao lưu dữ liệu (Local/GG Drive).
- Khôi phục dữ liệu (Local/GG Drive).
- Thay đổi tên miền.
- Đổi mật khẩu admin (wp-admin).
- Cài đặt WordPress tự động.
- Bật/tắt Yoast Seo config.
- Bật/Tắt Rank Math Seo config.
- Cấu hình Nginx với một số plugins cache phổ biến: WP-Rocket, w3 total cache, wp supercache, Cache Enabler, Swift Performance, Fast cache.
- Thêm cache key tránh trùng lặp nội dung giữa các site khi dùng memcached hoặc redis.
- Bật/tắt Debug.
- Bật/tắt chế độ bảo trì.
- Bật/Tắt disable xmlrpc (Mặc định sẽ disable xmlrpc để tránh bị khai thác DDOS).
- Huỷ kích hoạt toàn bộ plugins.
- Random database prefix khi sử dụng chức năng cài đặt tự động.

### 1.5. Sao lưu/Khôi phục dữ liệu
- Backup và restore dữ liệu từ Google Drive với Rclone.
- Backup, restore tại Local.
- Thiết lập số bản backup lưu trữ.
- Quản lý các bản sao lưu.
- Cho phép kết nối nhiều tài khoản Google Drive.

## 2. Yêu cầu

- VPS tối thiểu 1G ram và chưa cài đặt bất kỳ dịch vụ nào.
- CentOS 7, CentOS 8.

## 3. Cách cài đặt

`curl -sO https://scripts.hostvn.net/install && chmod +x install && ./install`

## 4. Các tính năng sẽ phát triển

- Lựa chọn phiên bản PHP từng website.
- Deploy nhanh mã nguồn trên VPS (giải nén file, import Database).
- Cảnh báo qua email, telegram.
- Rewrite config vhost về mặc định.
- Tối ưu hình ảnh.
- Tối ưu lại các thông số VPS trong trường hợp bạn nâng cấp cấu hình VPS.
- Cronjob auto xoá cache redis, memcached tránh full cache.
- Hỗ trợ tạo Subdomain, Alias Domain.
- Menu check DDOS.
- Menu tạo Swap.
- Menu quản lý Naxsi Firewall.
- Hỗ trợ Wordpress Multisite.
- Scan bug WordPress.
- Thay đổi Prefix database cho wordpress.
- Bật/tắt bảo vệ 2 lớp cho wp-admin.
- Option disable wp cron, chuyển sang dùng cronjob giúp tăng tốc độ cho WordPress.
- Lựa chọn website khi backup tự động
- Thêm tính năng đồng bộ qua 1 vps dự phòng.
- Các tính năng được người dùng yêu cầu.

## 5. Cách sử dụng

- Vui lòng truy cập: https://hostvn.vn/huong-dan/

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
- WP-CLI: https://wp-cli.org/
- Composer: https://getcomposer.org/
- ClamAV: https://www.clamav.net/
- Naxsi Firewall: https://github.com/nbs-system/naxsi

## 7. Contact

- Homepage: https://hostvn.vn
- Group: https://www.facebook.com/groups/scripthostvn/
- Email: Sanvv@hostvn.com

## 8. Feedback

- Do chưa có nhiều kinh nghiệm nên Scripts khó tránh khỏi thiếu sót, rất mong nhận được ý kiến đóng góp của các bạn để Scripts ngày càng hoàn thiện hơn.
- Mọi ý kiến đóng góp các bạn vui lòng gửi về sanvv@hostvn.com, Group Facebook: https://www.facebook.com/groups/scripthostvn/ hoặc tạo Github Issues.

## 9. Contributors & Credits
### Developers / Maintainers
- Sanvv

### Contributors
- Mbrother GP
- Thanhnv
- Vouuvhb (Mtdev)
- Giapvv
- Lamhn
