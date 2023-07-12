/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : book_shop

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 10/07/2023 21:38:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authors
-- ----------------------------
DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors`  (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`author_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authors
-- ----------------------------
INSERT INTO `authors` VALUES (1, 'Anthony Robbin');
INSERT INTO `authors` VALUES (2, 'Eckhart Tolle');
INSERT INTO `authors` VALUES (3, 'Dale Carnegie');
INSERT INTO `authors` VALUES (4, ' Daniel Kahneman');
INSERT INTO `authors` VALUES (5, ' Davis S Landes');
INSERT INTO `authors` VALUES (7, 'Bessatsu Takarajima');
INSERT INTO `authors` VALUES (8, 'Michael Wilkinson');
INSERT INTO `authors` VALUES (9, 'Farnoosh Brock');
INSERT INTO `authors` VALUES (10, 'Trần Đình Long');
INSERT INTO `authors` VALUES (11, 'Dương Tống');
INSERT INTO `authors` VALUES (12, 'Belfort');
INSERT INTO `authors` VALUES (13, 'Trương Sỹ Bảo Duy');
INSERT INTO `authors` VALUES (14, 'Colleen Stanley');
INSERT INTO `authors` VALUES (15, 'Nguyễn Thị Xuân Hồng');
INSERT INTO `authors` VALUES (16, 'Đặng Thúy Hà');
INSERT INTO `authors` VALUES (17, 'Lee Soeun');
INSERT INTO `authors` VALUES (19, 'Ahra Kim');
INSERT INTO `authors` VALUES (20, 'Brian A. Primack');
INSERT INTO `authors` VALUES (21, 'Paul T.Mason, Randi Kreger');
INSERT INTO `authors` VALUES (22, '  Christine Li');
INSERT INTO `authors` VALUES (23, 'Toshie Igaki');
INSERT INTO `authors` VALUES (24, 'Helen Odessky');
INSERT INTO `authors` VALUES (25, 'David R. Hawkins');
INSERT INTO `authors` VALUES (26, 'Brad Stulberg');
INSERT INTO `authors` VALUES (27, 'John Perry');
INSERT INTO `authors` VALUES (28, 'Ngưu Tân');
INSERT INTO `authors` VALUES (29, 'Okada Takashi');
INSERT INTO `authors` VALUES (30, 'Peter Suber');
INSERT INTO `authors` VALUES (31, 'Jason F. Brennan');
INSERT INTO `authors` VALUES (32, 'Jennifer Church');
INSERT INTO `authors` VALUES (33, 'Nancy Sherman');
INSERT INTO `authors` VALUES (38, 'asd1');

-- ----------------------------
-- Table structure for billdetail
-- ----------------------------
DROP TABLE IF EXISTS `billdetail`;
CREATE TABLE `billdetail`  (
  `book_id` int NULL DEFAULT NULL,
  `bills_id` int NULL DEFAULT NULL,
  `quanty` int NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  INDEX `book_id`(`book_id` ASC) USING BTREE,
  INDEX `bills_id`(`bills_id` ASC) USING BTREE,
  CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `billdetail_ibfk_2` FOREIGN KEY (`bills_id`) REFERENCES `bills` (`bills_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of billdetail
-- ----------------------------
INSERT INTO `billdetail` VALUES (10, 3, 1, 150000);
INSERT INTO `billdetail` VALUES (12, 4, 1, 79000);
INSERT INTO `billdetail` VALUES (22, 7, 1, 150000);
INSERT INTO `billdetail` VALUES (3, 8, 1, 200000);
INSERT INTO `billdetail` VALUES (15, 11, 1, 200000);
INSERT INTO `billdetail` VALUES (26, 12, 1, 150000);
INSERT INTO `billdetail` VALUES (4, 13, 1, 138000);
INSERT INTO `billdetail` VALUES (18, 14, 1, 150000);
INSERT INTO `billdetail` VALUES (16, 15, 1, 150000);
INSERT INTO `billdetail` VALUES (20, 16, 2, 300000);
INSERT INTO `billdetail` VALUES (7, 16, 1, 79000);
INSERT INTO `billdetail` VALUES (29, 16, 1, 150000);

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`  (
  `bills_id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `display_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `total` double NULL DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `quanty` int NULL DEFAULT NULL,
  PRIMARY KEY (`bills_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bills
-- ----------------------------
INSERT INTO `bills` VALUES (1, '123200064@dut.udn.vn', '905400329', 'huyen', '54 Nguyen Luong Bang, Hoa Khanh', 0, 'null', 0);
INSERT INTO `bills` VALUES (2, '', '0', '', '', 0, 'null', 0);
INSERT INTO `bills` VALUES (3, 'hohuyen712002@gmail.com', '905400329', 'nobita', '54 Nguyen Luong Bang, Hoa Khanh', 0, 'null', 0);
INSERT INTO `bills` VALUES (4, '123200064@dut.udn.vn', '905400329', 'nobita', '54 Nguyen Luong Bang, Hoa Khanh', 0, NULL, 0);
INSERT INTO `bills` VALUES (5, '123200064@dut.udn.vn', '905400329', 'huyen', '54 Nguyen Luong Bang, Hoa Khanh', 0, NULL, 0);
INSERT INTO `bills` VALUES (6, '', '0', 'ho huyen', '', 0, NULL, 0);
INSERT INTO `bills` VALUES (7, '', '0', '', '', 0, NULL, 0);
INSERT INTO `bills` VALUES (8, '', '0', '', '', 0, NULL, 0);
INSERT INTO `bills` VALUES (9, '123200064@dut.udn.vn', '905400329', '', '54 Nguyen Luong Bang, Hoa Khanh', 0, NULL, 0);
INSERT INTO `bills` VALUES (10, '123200064@dut.udn.vn', '905400329', '', '54 Nguyen Luong Bang, Hoa Khanh', 0, NULL, 0);
INSERT INTO `bills` VALUES (11, '', '0', '', '', 0, NULL, 0);
INSERT INTO `bills` VALUES (12, '', '0', '', '', 0, NULL, 0);
INSERT INTO `bills` VALUES (13, '123@gmail.com', '902123233', 'hothithuhuyen', '23ngp', 0, NULL, 0);
INSERT INTO `bills` VALUES (14, 'hohuyen712002@gmail.com', '905400329', 'huyen', '54 Nguyen Luong Bang, Hoa Khanh', 0, NULL, 0);
INSERT INTO `bills` VALUES (15, '123200064@dut.udn.vn', '905400329', '', '54 Nguyen Luong Bang, Hoa Khanh', 0, NULL, 0);
INSERT INTO `bills` VALUES (16, '', '0', '', '', 0, NULL, 0);

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `author_id` int NULL DEFAULT NULL,
  `id` int NULL DEFAULT NULL,
  `quantity_remain` int NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish_year` date NULL DEFAULT NULL,
  `avg_rating` float NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` int NULL DEFAULT NULL,
  `new_books` int NULL DEFAULT NULL,
  `high_light` int NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `author_id`(`author_id` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `books_ibfk_4` FOREIGN KEY (`id`) REFERENCES `categorys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `books_ibfk_5` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `books_ibfk_6` FOREIGN KEY (`id`) REFERENCES `categorys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, 'Đắc Nhân tâm', 40000, 3, 2, 30, 'Đắc Nhân Tâm là cuốn sách đưa ra các lời khuyên về cách thức cư xử, ứng xử và giao tiếp với mọi người để đạt được thành công trong cuộc sống.', NULL, '2019-01-02', 4, 'dacnhantam.jpg', '2023-05-04 10:46:06', NULL, 1, 1, 1);
INSERT INTO `books` VALUES (2, 'Đánh thức con người phi thường trong bạn', 150000, 1, 2, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'danh_thuc_con_nguoi_phi_thuong_trong_ban.jpg', '2023-05-04 10:48:02', '2023-05-04 10:50:48', 1, 1, 0);
INSERT INTO `books` VALUES (3, 'Tư duy nhanh và chậm', 200000, 4, 2, 50, 'Chúng ta thường tự cho rằng con người là sinh vật có lý trí mạnh mẽ, khi quyết định hay đánh giá vấn đề luôn kĩ lưỡng và lý tính', 'Nhà Xuất Bản Thế Giới', '2017-01-01', 4.3, 'tu_duy_nhanh_va_cham.jpg', '2023-05-04 10:53:11', '2023-05-04 10:53:07', 1, 1, 1);
INSERT INTO `books` VALUES (4, 'Thức tỉnh mục đích sống', 138000, 2, 2, 100, 'Thức tỉnh mục đích sống\" đã cộng hưởng thật sâu sắc với những điều bên trong tôi và giúp tôi thay đổi nhận thức về bản thân và về cả mọi điều...', 'Nhà Xuất Bản Tổng hợp TP.HCM', '2019-01-01', 4.4, 'thuc_tinh_muc_dich_song.png', '2023-05-04 10:53:15', '2023-05-04 10:53:18', 1, 1, 0);
INSERT INTO `books` VALUES (7, 'Phục Hồi Sau Trầm Cảm Và Lo Âu', 79000, 19, 2, 100, 'Tâm lý học chấm dứt mọi cảm giác hối hận, tự trách, lo âu, bồn chồn,Chúng ta đang sống trong một thời đại có quá nhiều vấn đề khiến bản thân dễ bị chi phối bởi những suy nghĩ tiêu cực và cho rằng thế giới này chỉ toàn là nỗi buồn cùng sự bất hạnh bủa vây', 'NXB Dân Trí', '2020-01-01', 4, 'phuc-hoi-sau-tram-cam-va-lo-au_L.jpg', '2014-02-07 02:00:00', '2014-02-07 03:00:00', 0, 1, 0);
INSERT INTO `books` VALUES (8, 'Rối Loạn Nhân Cách Ranh Giới Và Ái Kỷ', 150000, 21, 2, 100, 'Cuốn sách này có dành cho bạn không? Bạn lựa chọn cuốn sách này vì luôn thấy căng thẳng trong mối quan hệ, chẳng biết mình nên mong đợi gì từ một người thân yêu và luôn phải dè chừng khi ở gần họ. Ngay cả khi mối quan hệ đang êm đẹp, bạn vẫn thấp thỏm như', 'NXB Dân Trí', '2020-01-01', 4, 'roi-loan-nhan-cach-ranh-gioi-va-ai-ky_L.jpg', '2014-02-07 02:00:00', '2014-02-07 03:00:00', 0, 1, 0);
INSERT INTO `books` VALUES (9, 'Sách: 5 Phút Rèn Luyện Tính Tự Kỷ Luật', 150000, 22, 6, 100, 'Nếu bạn là tín đồ của chủ nghĩa \"để mai làm\", luôn luôn trì hoãn công việc và cuối cùng là không hoàn thành công việc đúng hạn, thì cuốn sách này dành cho bạn', 'NXB Thanh Niên', '2020-01-01', 4, 'sach-5-phut-ren-luyen-tinh-tu-ki-luat_L.jpg', '2014-02-07 02:00:00', '2014-02-08 00:00:00', 0, 1, 0);
INSERT INTO `books` VALUES (10, 'Cuộc chinh phạt của Jeff Bezos', 150000, 7, 2, 100, 'Ngày nay, Amazon bán gần như tất cả mọi thứ và chuyển phát các gói hàng rất nhanh chóng. Họ cung cấp phần lớn mạng Internet trong các trung tâm dữ liệu của mình, phát trực tuyến các chương trình truyền hình và phim đến từng nhà, đồng thời họ còn mở bán dò', 'NXB Dân Trí', '2020-01-01', 4, 'sach-amazon-cuoc-chinh-phat-cua-jeff-bezos_L.jpg', '2014-02-07 02:00:00', '2014-02-07 03:00:00', 0, 1, 0);
INSERT INTO `books` VALUES (11, 'Cẩm Nang Cung Cách Thanh Lịch - 8 Bài Học Từ Người Nhật', 79000, 23, 2, 100, 'Trong văn hóa của xứ sở hoa anh đào, phép lịch sự và lòng trắc ẩn là giá trị cốt lõi của tinh thần võ sĩ đạo - nền tảng cho những quy tắc ứng xử tạo nên thần thái riêng của người Nhật, đặc biệt là phái nữ. Bí quyết ở đây chính là thói quen chăm chút những', 'NXB Dân Trí', '2020-01-01', 4, 'sach-cam-nang-cung-cach-thanh-lich-8-bai-hoc-tu-nguoi-nhat_L.jpg', '2014-02-07 02:00:00', '2014-02-07 03:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (12, 'Sách: Đừng Để Nỗi Sợ Cản Đường Bạn', 79000, 24, 6, 0, 'Sợ hãi, thậm chí là sợ hãi tột cùng, dứt khoát là một điều rất đỗi con người. Nhưng nếu sợ hãi là một phần bản chất của chisng ta thì lòng dũng cảm cũng vậy.', 'NXB Dân Trí', '2020-01-01', 4, 'sach-dung-de-noi-so-can-duong-ban_L.jpg', '2014-02-07 00:00:00', '2014-02-07 00:00:00', 0, 1, 0);
INSERT INTO `books` VALUES (14, 'Triết Lý Của Người Giàu Sang', 200000, 14, 6, 50, 'Họ cho rằng muốn kiếm được nhiều tiền thì phải bóc lột người khác, và cách tốt nhất để rửa sạch vết nhơ đã gây ra là hãy cho đi thật nhiều.', 'NXB Thanh Niên', '2017-01-01', 4.3, 'triet-li-cua-nguoi-giau-sang_L.jpg', '2014-02-07 00:00:00', '2014-02-07 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (15, 'Tâm Lý Phạm Tội Của Những Kẻ Khốn Cùng', 200000, 24, 6, 50, 'ội ác từ đâu mà có?Ranh giới thiện – ác mong manh tới mức nào?Trong cuốn sách “Tâm lý phạm tội của những kẻ khốn cùng” sẽ mang đến câu trả lời vô cùng chân thực từ một ví dụ giả định kinh điển của thế kỷ', 'Nhà Xuất Bản Dân Trí', '2017-01-01', 4.3, 'sach-tam-ly-pham-toi-cua-nhung-ke-khon-cung_L.jpg', '2014-04-05 00:00:00', '2014-04-05 00:00:00', 0, 1, 0);
INSERT INTO `books` VALUES (16, 'Trí Tuệ Khắc Kỷ', 150000, 33, 6, 100, 'Cuốn sách này là một cuốn cẩm nang hướng dẫn thực địa về một triết lý Khắc kỷ thực tế đáng tin cậy. Nó sẽ sửa chữa những méo mó mà những lần phổ biến gần đây về chủ nghĩa Khắc kỷ cổ đại để lại và biện hộ cho những nguyên lý và thực tiễn Khắc kỷ đáng tuân ', 'NXB Dân Trí', '2020-01-01', 4, 'tri-tue-khac-ky_L.jpg', '2020-04-09 00:00:00', '2020-05-10 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (17, 'Bạn Là Những Gì Bạn Click - Click Ảo Trải Nghiệm Thật', 200000, 20, 6, 50, '“Rành mạch và hấp dẫn. Bạn là những gì bạn click là quyển sách bạn cần ngay lúc này. Primack cho chúng ta thấy tại sao mạng xã hội lại không thể thay thế được các tương tác trực tiếp giữa người và người, đồng thời lý giải nguyên do tại sao ta không thể ch', 'Nhà Xuất Bản Thế Giới', '2017-01-01', 4.3, 'ban-la-nhung-gi-ban-click-click-ao-trai-nghiem-that_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (18, 'Mình Phải Sống Thật Trọn Vẹn Mỗi Ngày', 150000, 1, 6, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'minh-phai-song-that-tron-ven-moi-ngay_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (19, 'Sách: Nói Ai Nấy Phục', 150000, 1, 6, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-noi-ai-nay-phuc_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (20, 'Triết Lý Của Người Hai Mặt', 150000, 1, 6, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'triet-li-cua-nguoi-hai-mat_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (21, 'Nghệ Thuật Sống Vững Vàng', 150000, 1, 6, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-nghe-thuat-song-vung-vang_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (22, 'Con Cừu Thứ Ngàn Lẻ Một Đêm Qua', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'con-cuu-thu-ngan-le-mot-dem-qua_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 0);
INSERT INTO `books` VALUES (23, 'Có Phải Anh Nơi Này', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-co-phai-anh-noi-nay_L.jpg.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (24, 'Kỳ Án Siêu Nhiên - Tập 10 ', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-ky-an-sieu-nhien-tap-10_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (25, 'Ngôi Nhà Kỳ Quái', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-ngoi-nha-ky-quai_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (26, 'Sống Cảm Xúc Cũng Cần Đúng Lúc', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-song-cam-xuc-cung-can-dung-luc_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 0);
INSERT INTO `books` VALUES (27, 'Thánh Hiệp Sĩ Nơi Tận Cùng Thế Giới ', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-thanh-hiep-si-noi-tan-cung-the-gioi-tap-1_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (28, 'Trở Thành Người Phụ Nữ Ai Cũng Muốn Lại Gần', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-tro-thanh-nguoi-phu-nu-ai-cung-muon-lai-gan_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (29, 'Tuổi Trẻ Lạc Lối', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-tuoi-tre-lac-loi_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (30, 'Cõi người dưng ', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'coi-nguoi-dung-doi-du-dan-my-the-ky-21_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (31, 'Đường Về - Gặp Lại Dưới Nắng Mai ', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'duong-ve-gap-lai-duoi-nang-mai_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 0);
INSERT INTO `books` VALUES (32, 'Mèo Đen Và Mắt Quỷ', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'meo-den-va-mat-quy_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (33, 'Thiên cầu ma thuật', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'thien-cau-ma-thuat-tap-3-ky-uc-vinh-cuu_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 0, 1);
INSERT INTO `books` VALUES (34, 'Ma Thuật Yêu', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'ma-thuat-yeu-brida_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 1);
INSERT INTO `books` VALUES (35, 'Những cuộc đào tẩu ngoạn mục của Kavalier và Clay', 150000, 1, 3, 100, 'Đánh thức con người phi thường trong bạn của Athony Robbins, là công trình nghiên cứu giúp bạn đánh thức năng lực vô vô hạn tiềm ẩn của bản thân để tạo nên sự thay đổi mà chính bạn cũng không ngờ đến.', 'NXB Tổng Hợp TP. HCM', '2020-01-01', 4, 'sach-nhung-cuoc-dao-tau-ngoan-muc-cua-kavalier-va-clay_L.jpg', '2020-02-09 00:00:00', '2020-02-09 00:00:00', 0, 1, 0);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NULL DEFAULT NULL,
  `book_id` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `quanty` int NULL DEFAULT NULL,
  `totalPrice` double NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `book_id`(`book_id` ASC) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for categorys
-- ----------------------------
DROP TABLE IF EXISTS `categorys`;
CREATE TABLE `categorys`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categorys
-- ----------------------------
INSERT INTO `categorys` VALUES (1, 'English Book', '');
INSERT INTO `categorys` VALUES (2, ' Tâm lý', NULL);
INSERT INTO `categorys` VALUES (3, 'Sách thiếu nhi', '');
INSERT INTO `categorys` VALUES (4, 'Sách Y học- Sức khỏe', '');
INSERT INTO `categorys` VALUES (5, 'Sách khoa học - công nghệ', '');
INSERT INTO `categorys` VALUES (6, 'Sách kiến trúc -mỹ thuật', '');
INSERT INTO `categorys` VALUES (7, 'Sách kinh tế', '');
INSERT INTO `categorys` VALUES (8, 'Sách kỹ năng sống', '');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activated` bit(10) NULL DEFAULT NULL,
  `Admin` bit(10) NULL DEFAULT NULL,
  `address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (2, 'nobita', '12345Hu', 'ho huyen', '1232000@dut.udn.v', '0905400329', b'0111111111', b'0000000000', '');
INSERT INTO `customer` VALUES (10, 'user1', '123123D', 'ho huyen', '123200064@dut.udn.vn', '0905400329', b'0111111111', b'1111111111', NULL);
INSERT INTO `customer` VALUES (11, '', '', '', '', '', b'0000000001', b'0000000000', NULL);
INSERT INTO `customer` VALUES (12, '', '', '', '', '', b'0000000001', b'0000000000', NULL);
INSERT INTO `customer` VALUES (13, 'nobita', '', '', '', '', b'0000000001', b'0000000000', NULL);
INSERT INTO `customer` VALUES (19, '', '', '', '', '', b'0000000001', b'0000000000', NULL);
INSERT INTO `customer` VALUES (20, '', '', '', '', '', b'0000000001', b'0000000000', NULL);
INSERT INTO `customer` VALUES (21, 'a', '123123D', 'ho huyen1', '123200064@dut.udn.vn', '0905400329', b'0000000001', b'0000000000', NULL);
INSERT INTO `customer` VALUES (22, 'user2', '123456W', 'Huyen Ho', '123200064@dut.udn.vn', '0905400329', b'0000000001', b'0000000000', NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'Trang Chủ', '');
INSERT INTO `menu` VALUES (2, 'Sản Phẩm', '');
INSERT INTO `menu` VALUES (3, 'So Sánh', '');
INSERT INTO `menu` VALUES (4, 'Liên Hệ', '');

-- ----------------------------
-- Table structure for slides
-- ----------------------------
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `caption` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slides
-- ----------------------------
INSERT INTO `slides` VALUES (1, 'dacnhantam.jpg', '', 'nice');
INSERT INTO `slides` VALUES (2, 'sach-doc-vi-khach-hang_L.jpg', '', NULL);
INSERT INTO `slides` VALUES (3, 'ban-la-nhung-gi-ban-click-click-ao-trai-nghiem-that_L.jpg', '', '');
INSERT INTO `slides` VALUES (4, 'meo-den-va-mat-quy_L.jpg', '', '');
INSERT INTO `slides` VALUES (5, 'graphic-issue-5-explore-the-space_L.jpg', NULL, NULL);
INSERT INTO `slides` VALUES (6, 'roi-loan-nhan-cach-ranh-gioi-va-ai-ky_L.jpg', NULL, NULL);
INSERT INTO `slides` VALUES (7, 'sach-5-phut-ren-luyen-tinh-tu-ki-luat_L.jpg', NULL, '');
INSERT INTO `slides` VALUES (8, 'sach-cam-nang-cung-cach-thanh-lich-8-bai-hoc-tu-nguoi-nhat_L.jpg', NULL, NULL);
INSERT INTO `slides` VALUES (9, 'sach-combo-lam-chu-lam-chu-cac-mau-thiet-ke-kinh-dien-trong-lap-trinh-clean-code-ma-sach-va-con-duong-tro-thanh-lap-trinh-vien-gioi-bo-2-cuon_L.jpg', NULL, NULL);
INSERT INTO `slides` VALUES (10, 'sach-dieu-ky-dieu-cua-long-hieu-khach_L.jpg', NULL, NULL);

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_role` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('1', 'user1', 'admin');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id_account` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `display_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id_account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (0, '', '0123123123', '123123Hh', 'huywn1', 'nbc');

SET FOREIGN_KEY_CHECKS = 1;
