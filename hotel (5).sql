-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2020 at 09:50 AM
-- Server version: 5.7.26
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotel_gallery`
--

DROP TABLE IF EXISTS `hotel_gallery`;
CREATE TABLE IF NOT EXISTS `hotel_gallery` (
  `hg_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `hotel_image` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`hg_id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2018_04_27_201201_create_admin_table', 1),
(3, '2018_05_03_161401_create_category_table', 2),
(4, '2018_05_05_152006_create_manufacture_table', 3),
(5, '2018_05_07_080702_create_products_table', 4),
(7, '2018_05_07_215828_rename_id_column_to_product_id', 5),
(8, '2018_05_09_132216_create_slider_table', 6),
(10, '2018_05_13_110455_create_customer_table', 7),
(11, '2018_05_14_111755_drop_customer_address_from_tbl_customer', 8),
(12, '2018_05_14_194214_create_shipping_table', 9),
(13, '2018_05_15_092041_change_type_column_shipping_tel_in_tbl_shipping', 10),
(14, '2018_05_16_101945_create_table_payment', 11),
(15, '2018_05_16_102205_create_order_table', 11),
(16, '2018_05_16_102453_create_table_order_details', 11),
(17, '2018_05_16_204503_rename_produc_id_to_product_id_in_tbl_order_details', 12),
(18, '2018_05_16_210501_update_01_table_slider_fields', 13),
(19, '2018_05_17_091510_update_slider_table_to_add_off_image', 14),
(20, '2018_05_17_131939_create_wishlist_table', 15),
(21, '2018_05_23_123753_tbl_social_links', 16),
(22, '2018_05_23_123952_tbl_site_info', 16);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'info@samenta.ir', 'e10adc3949ba59abbe56e057f20f883e', 'sam', 9356663386, NULL, NULL),
(2, 'it.davoodi@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'زهرا', 9359088106, '2019-05-06 19:30:00', '2019-05-06 19:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bookedroom`
--

DROP TABLE IF EXISTS `tbl_bookedroom`;
CREATE TABLE IF NOT EXISTS `tbl_bookedroom` (
  `br_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `br_inDate` varchar(255) NOT NULL,
  `br_outDate` varchar(255) NOT NULL,
  PRIMARY KEY (`br_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `room_id` (`room_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_parent1` int(11) NOT NULL,
  `category_parent2` int(11) NOT NULL,
  `category_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tour_number` int(11) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_parent1`, `category_parent2`, `category_description`, `publication_status`, `created_at`, `updated_at`, `tour_number`, `slug`) VALUES
(0, '', 0, 0, '', 0, NULL, NULL, 0, ''),
(1, 'داخلی', 0, 0, 'شما میتوانید در این قسمت لیست تور های داخل ایران را در اوکی شد ببینید', 1, '2019-08-04 19:30:00', '2019-08-04 19:30:00', 13, 'internal'),
(2, 'خارجی', 0, 0, 'شما میتوانید لیست و اطلاعات تور های خارجی را در اوکی شد قسمت ببینید', 1, '2019-08-04 19:30:00', '2019-08-04 19:30:00', 20, 'external'),
(3, 'طبیعت گردی', 0, 0, 'شما میتوانید لیست تور های طبیعت گردی در اوکی شد را در این قسمت ببینید', 1, '2019-08-04 19:30:00', '2019-08-04 19:30:00', 10, 'hiking'),
(4, 'نمایشگاهی', 0, 0, 'لیست و اطلاعات تور های نمایشگاهی را میتوانید در اوکی شد ببینید', 1, '2019-08-04 19:30:00', '2019-08-04 19:30:00', 0, 'exhibition'),
(40, 'ترکیه', 2, 0, 'تور های ترکیه را در این قسمت میتوانید مشاهده نمایید', 1, NULL, NULL, 12, 'turkey'),
(41, 'آنتالیا', 2, 40, 'شما میتوانید لیست تور ها و اطلاعات سفر به آنتالیا را در این قسمت ببینید', 1, NULL, NULL, 5, 'antalya'),
(42, 'استانبول', 2, 40, '<div style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; text-align: right;\">شما میتوانید لیست و جزئیات تور های استانبول دا در این قسسمت ببینید</div>', 1, NULL, NULL, 3, 'istanbul'),
(43, 'ازمیر', 2, 40, 'لیست و اطلاعات تور ها و سفر های ازمیر ترکیه را در این صفحه از سایت اوکی شد ببینید', 1, NULL, NULL, 1, 'izmir'),
(44, 'آنکارا', 2, 40, 'شما میتوانید اطلاعات تور های آنکارا در اوکی شد ببینید و خرید کنید', 1, NULL, NULL, 0, 'ankara'),
(45, 'کوش آداسی', 2, 40, 'خرید تور های کوش آدسی ترکیه را با بهترین قیمت در اوکی شد تجربه کنید', 1, NULL, NULL, 0, 'kusadasi'),
(46, 'ارمنستان', 2, 0, 'خرید تور های ارمنستان با بهترین قیمت در سایت اوکی شد', 1, NULL, NULL, 9, 'armenia'),
(47, 'کاشان', 1, 0, 'تور شهر کاشان ایران و لیست تور های ارائه شده برای کاشان را در این صفحه ببینید', 1, NULL, NULL, 3, 'kashan'),
(48, 'چالوس', 1, 0, '', 0, NULL, NULL, 2, 'chalus'),
(49, 'قائم شهر', 1, 0, '', 0, NULL, NULL, 2, 'ghaemshahr'),
(50, 'آمل', 1, 0, 'لیست و اطلاعات تور های آمل را در اوکی شد ببینید و تور آمل را با بهترین قیمت از اوکی شد بخرید', 1, NULL, NULL, 3, 'amol'),
(51, 'فیروزکوه', 1, 0, 'خرید تور فیروزکوه را در اوکی شد با بهترین قیمت و امکانات تجربه کنید', 1, NULL, NULL, 1, 'firoozkooh'),
(52, 'شهرکرد', 1, 0, '', 0, NULL, NULL, 0, 'shahr-e-kord'),
(53, 'سمنان', 1, 0, '', 0, NULL, NULL, 0, 'semnan'),
(54, 'کویر ابوزید آباد', 3, 0, 'تور شاد و مهیج کویر ابوزید آباد کاشان را از اوکی شد با بهترین قیمت بخواهید', 1, NULL, NULL, 5, 'abouzid-abad-desert'),
(55, 'آبشار خور', 3, 0, 'تور شاد و مهیج آبشار خور را با قیمتی باور نکردنی و با کیفیت از اوکی شد بخواهید', 1, NULL, NULL, 1, 'khor-waterfall'),
(56, 'دریاچه شورمست', 3, 0, 'تور شاد و مهیج دریاچه شورمست را با اوکی شد متفاوت تجربه کنید', 1, NULL, NULL, 1, 'shormast-lake'),
(57, 'جنگل راش', 3, 0, 'جنگل راش لوکیشنی جذاب و دیدنی است شما میتوانید تور جنگل راش را در اوکی شد ببینید', 1, NULL, NULL, 0, 'rash-wood'),
(58, 'جنگل الیمستان', 3, 0, 'تور رویایی جنگل الیمستان را در اوکی شد ببینید و بخرید&nbsp;', 1, NULL, NULL, 0, 'alimastan-wood'),
(59, 'غار رودافشان', 3, 0, 'غار رودافشان لوکیشنی متفاوت و خیره کننده شما میتوانید این تور را از اوکی شد تهیه کنید', 1, NULL, NULL, 0, 'rodafshan-cave'),
(60, 'دشت هلن', 3, 0, 'تور شاد و مهیج دشت هلن را در اوکی شد خرید کنید و هر هفته جایزه بگیرید', 1, NULL, NULL, 0, 'helen-plain'),
(61, 'غار نمکی گرمسار', 3, 0, 'غار نمکی گرمسار یکی از دیدنی ترین جاهایی است که به هر ایرانی توصیه میشود شما میتوانید این تور را در اوکی شد تهیه کنید', 1, NULL, NULL, 0, 'grmsar-cave'),
(62, 'اصفهان', 1, 0, '', 0, NULL, NULL, 0, 'esfahan'),
(63, 'شیراز', 1, 0, '', 0, NULL, NULL, 0, 'shiraz'),
(64, 'وان', 2, 40, '<div style=\"text-align: right;\"><span style=\"font-size: 10pt;\">لیست و اطلاعات تور های وان را در این صفحه از سایت اوکی شد ببینید</span></div>', 1, NULL, NULL, 0, 'van'),
(67, 'کیش', 1, 0, '', 0, NULL, NULL, 0, 'kish'),
(68, 'مشهد', 1, 0, '', 0, NULL, NULL, 0, 'mashhad'),
(69, 'قشم', 1, 0, '', 0, NULL, NULL, 0, 'qeshm'),
(70, 'تهران', 1, 0, 'تور های تهران گردی را در این صفحه از اوکی شد ببینید', 1, NULL, NULL, 1, 'tehran'),
(71, 'منطقه آزاد انزلی', 1, 0, 'تور منطقه آزاد انزلی را در اوکی شد متفاوت تجربه کنید', 1, NULL, NULL, 1, 'anzali-category'),
(72, 'گیلان', 1, 0, 'تور های گیلان گردی را در اوکی شد تجربه کنید', 1, NULL, NULL, 0, 'gilan'),
(75, 'دریاچه عروس (حلیمه جان)', 3, 0, 'دریاچه عروس یا همان دریاچه حلیمه جان مکانی جذاب و دیدنی که میتوانید تور آن را از اوکی شد تهیه کنید', 1, NULL, NULL, 0, 'aroos-lake'),
(76, 'تایلند', 2, 0, 'به زودی در این قسمت تور های تایلند تعریف میشود', 1, NULL, NULL, 0, 'tailand'),
(77, 'کویر مصر', 1, 0, 'تور متفاوت پر از دیدنی های حیرت انگیز در کویر مصر را با اوکی شد تجربه کنید', 1, NULL, NULL, 0, 'kavir-mesr'),
(78, 'مرنجاب', 1, 0, 'تور کویر مرنجاب یکی از تور های جذاب و دیدنی است که بزرگترین رمل ها را در بین کویر های ایران دارد', 1, NULL, NULL, 0, 'maranjab-cat'),
(79, 'کویر یزد', 3, 0, 'تور های کویر یزد ارائه شده در سایت اوکی شد', 1, NULL, NULL, 0, 'yazd-kavir'),
(80, 'کویر مرنجاب', 3, 0, 'تورهای کویر مرنجاب تعریف شده در سایت اوکی شد.', 1, NULL, NULL, 1, 'maranjab-desert'),
(81, 'کویر مصر', 3, 0, 'تور کویر مصر واقع در روستای مصر را در اوکی شد ببینید.', 1, NULL, NULL, 1, 'cat-kavir-mesr'),
(82, 'کویر کاراکال', 3, 0, '<span style=\"font-size: 13.3333px;\">لیست تور های کویر کاراکال در سایت اوکی شد</span>', 1, NULL, NULL, 1, 'karakal-cat');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_name` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `comment_subject` varchar(255) COLLATE utf8_persian_ci NOT NULL DEFAULT '0',
  `comment_mobile` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `comment_email` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `comment_message` text COLLATE utf8_persian_ci NOT NULL,
  `comment_date` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `comment_type` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `comment_reply` int(11) DEFAULT NULL,
  `publication_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_condition`
--

DROP TABLE IF EXISTS `tbl_condition`;
CREATE TABLE IF NOT EXISTS `tbl_condition` (
  `condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_name` varchar(255) NOT NULL,
  `publication_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`condition_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_condition`
--

INSERT INTO `tbl_condition` (`condition_id`, `condition_name`, `publication_status`) VALUES
(1, 'فقط اتاق', 1),
(2, 'صبحانه', 1),
(3, 'همراه با صبحانه و ناهار', 1),
(4, 'همه وعده های غذایی', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon`
--

DROP TABLE IF EXISTS `tbl_coupon`;
CREATE TABLE IF NOT EXISTS `tbl_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(255) CHARACTER SET utf8 NOT NULL,
  `coupon_description` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `coupon_price` int(11) NOT NULL,
  `coupon_start_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `coupon_end_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `coupon_hotels` varchar(255) DEFAULT NULL,
  `coupon_categories` varchar(255) DEFAULT NULL,
  `coupon_used_number` int(11) NOT NULL,
  `publication_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_coupon`
--

INSERT INTO `tbl_coupon` (`coupon_id`, `coupon_code`, `coupon_description`, `coupon_price`, `coupon_start_date`, `coupon_end_date`, `coupon_hotels`, `coupon_categories`, `coupon_used_number`, `publication_status`) VALUES
(0, '', '', 0, '', '', NULL, NULL, 0, 0),
(1, 'yalda98', 'تخفیف ویژه شب یلدا', 24800, '1398/10/3', '1398/10/24', 's:5:\"93,84\";', 's:3:\"1,3\";', 1, 1),
(6, 'taf521', 'تخفیف ویژه کارمندان شرکت تفریحات', 10000, '1398/10/28', '1398/11/30', NULL, NULL, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE IF NOT EXISTS `tbl_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_lname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` text CHARACTER SET utf8 COLLATE utf8_persian_ci,
  `customer_sheba` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `customer_type` tinyint(1) NOT NULL,
  `changePassword` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_wallet` int(11) NOT NULL DEFAULT '0',
  `publication_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf16;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_code`, `customer_email`, `customer_password`, `customer_name`, `customer_lname`, `customer_phone`, `customer_address`, `customer_sheba`, `customer_type`, `changePassword`, `created_at`, `updated_at`, `customer_wallet`, `publication_status`) VALUES
(0, '', '', '', '', '', '', NULL, NULL, 0, '', NULL, NULL, 0, 0),
(12, '021544444', 'it.davoodi@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'داودی', '', '021999999', 'کرج', 'IR11111111111111111111111111', 0, '98ec70f41ec9c270702eb36d43960bdf', NULL, NULL, 0, 1),
(13, 'jkhk', 'jkh', 'khj', 'hjk', 'h', 'jk', 'hj', 'kh', 1, 'j', '2020-05-18 20:30:00', '2020-05-18 20:30:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_event`
--

DROP TABLE IF EXISTS `tbl_event`;
CREATE TABLE IF NOT EXISTS `tbl_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `event_image` text CHARACTER SET ucs2 NOT NULL,
  `publication_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_event`
--

INSERT INTO `tbl_event` (`event_id`, `event_name`, `event_image`, `publication_status`) VALUES
(1, 'عید نوروز', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel`
--

DROP TABLE IF EXISTS `tbl_hotel`;
CREATE TABLE IF NOT EXISTS `tbl_hotel` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_pName` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `hotel_eName` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `hotel_address` text COLLATE utf8_persian_ci NOT NULL,
  `hotel_map` text COLLATE utf8_persian_ci NOT NULL,
  `hotel_website` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `hotel_phone` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `hotel_image` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `alt_image` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `hotel_gallery` text COLLATE utf8_persian_ci,
  `category_parent1` int(11) NOT NULL,
  `category_parent2` int(11) NOT NULL,
  `category_parent3` int(11) DEFAULT NULL,
  `hotel_rate` int(11) NOT NULL,
  `hotel_views` int(11) DEFAULT '0',
  `hotel_type` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `hotel_description` text COLLATE utf8_persian_ci NOT NULL,
  `hotel_services` text COLLATE utf8_persian_ci NOT NULL,
  `hotel_comision` int(11) NOT NULL,
  `hotel_ref_comision` int(11) NOT NULL,
  `publication_status` tinyint(1) NOT NULL,
  `keywords` text COLLATE utf8_persian_ci NOT NULL,
  `seo_description` text COLLATE utf8_persian_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `hotel_createdat` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `hotel_updatedat` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `category_parent1` (`category_parent1`),
  KEY `category_parent2` (`category_parent2`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `tbl_hotel`
--

INSERT INTO `tbl_hotel` (`hotel_id`, `hotel_pName`, `hotel_eName`, `hotel_address`, `hotel_map`, `hotel_website`, `hotel_phone`, `hotel_image`, `alt_image`, `hotel_gallery`, `category_parent1`, `category_parent2`, `category_parent3`, `hotel_rate`, `hotel_views`, `hotel_type`, `hotel_description`, `hotel_services`, `hotel_comision`, `hotel_ref_comision`, `publication_status`, `keywords`, `seo_description`, `slug`, `hotel_createdat`, `hotel_updatedat`) VALUES
(0, '', '', '', '', NULL, '', '', '', NULL, 0, 0, 0, 0, 0, '', '', '', 0, 0, 0, '', '', '', '', ''),
(112, 'الیت ورلد استانبول', 'Elite World Istanbul', 'Şehit Muhtar Mh., Şehit Muhtar Caddesi No:42, 34437 Beyoğlu/İstanbul', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12037.165278908033!2d28.9835!3d41.040758!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xf5116c47d471963b!2sElite+World+%C4%B0stanbul+Hotel!5e0!3m2!1sen!2s!4v1565438386027!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', NULL, '83 83 313 212 90+', 'images/hotels/112.jpg', 'الیت ورلد استانبول', NULL, 2, 40, 42, 5, 9, '1', '<br><div>هتلی 5 ستاره که در سال 2014 ساخته شده است این هتل امکانات رفاهی نظیر اینترنت رایگان ، استخر سرپوشیده ، سالن ماساژ و ... دارد</div><div><br></div><div><span style=\"color: rgb(25, 30, 35); font-family: &quot;Noto Serif&quot;; font-size: 16px; white-space: pre-wrap; background-color: rgb(255, 255, 255);\">این هتل صبحانه بوفه باز دارد همچنین این هتل سالن اجلاسی بزرگ دارد که مساحت آن 2577 متر است  که 9 اتاق جلسه نیز دارد. مراکز تجاری این هتل به صورت 24 ساعته فعالیت میکنند </span></div>', '', 0, 0, 1, 'استانبول,ترکیه', '', 'nuevas-suites', '2019-08-21 12:43:06', '2020-01-14 18:06:07'),
(115, 'گرند جواهر', 'Grand Cevahir', 'Halide Edip Adıvar Mah. Darülaceze Cad. No:5 Şişli İstanbul , Sisli, 34381 İstanbul, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12032.969087542853!2d28.9823697!3d41.0636966!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xef56cb01bebfa28b!2sGrand+Cevahir+Hotel+Convention+Center!5e0!3m2!1sen!2s!4v1565500394427!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www.gch.com.tr', '+90 212 314 42 42', 'images/hotels/115.jpg', 'تصویر هتل', NULL, 2, 40, 42, 5, 270, '1', '<p class=\"MsoNormal\" dir=\"RTL\"><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,sans-serif;\r\nmso-ascii-font-family:Yekan;mso-hansi-font-family:Yekan;mso-bidi-theme-font:\r\nminor-bidi;color:#333333;background:white\">هتل گرند جواهر هتلی است 5 ستاره که\r\nدر شیشلی قرار دارد . این هتل 3.8 کیلومتر تا میدان تقسیم فاصله دارد که هتل هایی\r\nنزدیک تر به این میدان نیز وجود دارند . البته از طرفی این مورد را یک مذیت هم\r\nمیتوان به حساب آورد چرا که این فاصله از شلوغی محیطی امن و ساکت را برای این هتل\r\nبه ارمغان آورده است. این هتل دارای اینترنت رایگان است و در 24 ساعت شبانه روز\r\nپذیرش دارد</span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,sans-serif;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-bidi\"><o:p></o:p></span></p>', '', 5000, 5000, 1, 'هتل های استانبول,هتل های ترکیه, هتل گرند جواهر', '', 'grand-cevahir', '2019-08-21 12:43:06', '2020-May-17 13:03:43'),
(116, 'کرون پلازای', 'Crowne Plaza', 'Ordu Cad. No:10,Beyazit,34134 Istanbul', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d462013.25404059625!2d55.280006!3d25.220802!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x7ddd2d66d76d26ba!2sCrowne+Plaza+Dubai!5e0!3m2!1sen!2str!4v1565505269685!5m2!1sen!2str\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www.ihg.com', '+971 4 331 1111', 'images/hotels/116.jpg', 'Crowne Plaza', NULL, 2, 40, 42, 4, 409, '1', '<div style=\"text-align: right;\"><span style=\"color: rgb(68, 68, 68); font-family: iransans, Tahoma, sans-serif; font-size: 15px; text-align: justify; background-color: rgb(255, 255, 255);\">هتل پنج ستاره&nbsp;</span><font face=\"iransans, Tahoma, sans-serif\"><span style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); font-size: 15px; text-align: justify;\">کرون پلازا</span></font><span style=\"color: rgb(68, 68, 68); font-family: iransans, Tahoma, sans-serif; font-size: 15px; text-align: justify; background-color: rgb(255, 255, 255);\">&nbsp;دبی (Crowne Plaza Dubai) در خیابان شیخ زاهد قرار دارد که مرکز تجاری این شهر است در هتل ۱۵ اتاق کنفرانس، اتاق های پذیرایی از مهمانان بسیار شیک و امکاناتی بسیار متفاوت قرار دارد که می توانید از آن ها استفاده کنید.</span></div>', '', 0, 0, 1, 'هتل کرون پلازای,هتل های ترکیه,هتل 5 ستاره,هتل استانبول', '', 'crowne-plaza', '2019-08-21 12:43:06', '2019-11-17 16:42:43'),
(117, 'استانبول سورملی', 'Istanbul Surmeli', 'Prof. Dr. Bulent Tarcan Sokak No:3 Gayrettepe,Şişli,34349 Istanbul', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12032.713835950368!2d29.0031655!3d41.0650916!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xf5a6c8eef1281797!2sSurmeli+Istanbul+Hotel!5e0!3m2!1sen!2s!4v1565506740247!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'surmelihotels.com', '+90 212 272 11 61', 'images/hotels/117.jpg', 'Istanbul Surmeli', NULL, 2, 40, 42, 5, 3, '1', '<p style=\"text-align: right; background: rgb(255, 255, 255); border: 0px none; font-size: 14px; margin: 0px; padding: 5px 0px; outline: 0px; vertical-align: top; font-family: iran;\">هتل 5 ستاره Surmeli ، در منطقه تجاری، تفریحی Gayreteppe شهر استانبول قرار گرفته است.</p><p style=\"text-align: right; background: rgb(255, 255, 255); border: 0px none; font-size: 14px; margin: 0px; padding: 5px 0px; outline: 0px; vertical-align: top; font-family: iran;\">هتل اقامت مجللی را در مجاورت پل بسفر و مرکز خرید Metrocity به میهمانان ارائه میدهد.</p><p style=\"text-align: right; background: rgb(255, 255, 255); border: 0px none; font-size: 14px; margin: 0px; padding: 5px 0px; outline: 0px; vertical-align: top; font-family: iran;\">هتل از دسترسی ممتاز به شاهراههای ارتباطی اصلی شهر برخوردار میباشد.</p><p style=\"text-align: right; background: rgb(255, 255, 255); border: 0px none; font-size: 14px; margin: 0px; padding: 5px 0px; outline: 0px; vertical-align: top; font-family: iran;\">.اتاقها مجلل بوده و به امکانات عالی مجهز میباشند.</p>', '', 0, 0, 1, 'هتل استانبول سورملی,هتل استانبول,هتل ترکیه', '', 'istanbul-surmeli', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(136, 'ددمان', 'Dedeman', 'No:50 Gayrettepe, Besiktas, 34340 Istanbul, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12032.903491309235!2d29.0098494!3d41.0640551!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xe774df8e3b993e24!2z2YfYqtmEINiv2K_Zhdin2YY!5e0!3m2!1sen!2s!4v1565758450036!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]dedeman[dot]com', '+90 212 337 45 00', 'images/hotels/136.jpg', 'Dedeman', NULL, 2, 40, 42, 5, 0, '1', '<div style=\"text-align: right;\"><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68); font-family: iransans, Tahoma, sans-serif; font-size: 15px; text-align: justify;\">این هتل ۵ ستاره فقط در فاصله ۸ دقیقه پیاده روی از ایستگاه متروی Gayrettepe و مرکز زرلو واقع شده است، در ۱٫۸ کیلومتر از مرکز خرید Cevahir قرار گرفته، مراکز خرید OzdilekPark نیز در فاصله هشت دقیقه رانندگی و مرکز کنگره و نمایشگاه لوتی کیدار نیز در فاصله ۷ کیلومتر از هتل ددمان استانبول&nbsp;Istanbul Dedeman Hotel قرار گرفته اند.</span></div>', '', 0, 0, 1, 'هتل Dedeman,هتل ددمان,هتل های معروف استانبول,هتل 5 ستاره استانبول', 'هتل ددمان | Dedeman هتلی 5 ستاره در استانبول است . شما میتوانید تمام اطلاعات این هتل را در صفحه اوکی شد ببینید', 'dedeman', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(137, 'هالیدی این شیشلی', 'Holiday Inn Şişli', '19 Mayıs, Halaskargazi Cd. No:206, 34360 Şişli/İstanbul, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12033.655871032204!2d28.987695!3d41.059943!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x23ca4a9b8f0a73d9!2zSG9saWRheSBJbm4gxZ5pxZ9saQ!5e0!3m2!1sen!2s!4v1565764629519!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www.hisisli.com', '+90 212 373 38 00', 'images/hotels/137.jpg', 'Holiday Inn', NULL, 2, 40, 42, 5, 0, '1', '<div style=\"text-align: right;\"><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68); font-family: iransans, Tahoma, sans-serif; font-size: 15px; text-align: justify;\">این هتل در تکسیم قرار گرفته و امکانات گوناگونی از جمله حمام ترکی سنتی و اتاق هایی با دکوراسیون زیبا و کفپوش چوبی دارد. برای تفریح می توانید از استخر هتل استفاده کنید که هم برای بزرگسالان و هم کودکان درست شده است. امکاناتی برای مهمانان دارای محدودیت جسمی در اینجا فراهم شده و اتاق های VIP و ماه عسل از جمله اتاق های خاص هتل هستند. آرایشگاه، سونا، باشگاه بدنسازی، تراس، کافی شاپ و رستوران و موارد زیاد دیگری در این هتل آماده شده تا شما از اقامتتان لذت ببرید.</span></div>', '', 0, 0, 1, 'هتل هالیدی استانبول,هتل Holiday,هتل 5 ستاره استانبول', 'هالیدی این شیشلی | Holiday Inn Şişli هتلی 5 ستاره در استانبول است. شما میتوانید تمام اطلاعات این هتل را در اوکی شد ببینید.', 'holiday-inn', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(138, 'کامفورت هتل تکسیم', 'Comfort Hotel Taksim', 'Şehit Muhtar mahallesi Feridiye Caddesi Çamdalı sokak No 5, Taksim / Beyoğlu, 34435 Beyoğlu/İstanbul, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12037.64105327497!2d28.9828896!3d41.0381565!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x9e0873dc0a1493a7!2sComfort+Hotel+Taksim!5e0!3m2!1sen!2s!4v1565846954760!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www.comfort-hotel-taksim.business.site', '+90 212 361 90 00', 'images/hotels/138.jpg', 'Comfort Hotel Taksim', NULL, 2, 40, 42, 3, 1, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">از هتل های معروف و بسیار خوب سه ستاره میدان تقسیم که مورد استقبال بسیاری از توریست ها و </span><span style=\"text-align: justify;\">گردشگران&nbsp;</span><span style=\"box-sizing: border-box; vertical-align: middle; text-align: justify;\">تور استانبول</span><span style=\"text-align: justify;\">&nbsp;شده است میتوان به هتل کامفورت سوئیت اشاره کرد. برای اقامت در این هتل نیازی به خرج هزینه بسیار نیست و شما میتوانید با صرف هزینه کم، در طول اقامت از امکانات و خدمات خوبی نظیر اینترنت بی سیم رایگان در مکان های عمومی و اتاق ها، کرایه اتومبیل، صرافی، صندوق امانات، سیستم تهویه هوا، سرویس دهی شبانه روزی، ترانسفر فرودگاهی و درون شهری، پارکینگ اختصاصی، روزنامه در لابی، آسانسور، حمل و نگهداری از چمدان ها، خشکشویی و اتوشویی، پذیرش 24 ساعته و ... برخوردار باشید. از این هتل تا مسجد آبی سه کیلومتر تا نماشگاه مرکزی سی ان آر پانزده کیلومتر راه می باشد. همینطور فاصله بین هتل تا فرودگاه بین المللی نیز پانزده کیلومتر است.</span></div>', '', 0, 0, 1, 'کامفورت هتل تکسیم,Comfort Hotel Taksim,هتل 3 ستاره استانبول,هتل 3 ستاره ترکیه', 'هتل 3 ستاره کامفورت هتل تکسیم | Comfort Hotel Taksim در نزدیکی میدان تکسیم است . شما میتوانید اطلاعات این هتل را در Okshod ببینید', 'comfort-hotel-taksim', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(139, 'هرا مونتاگنا', 'Montagna Hera', 'Inönü Mah. Elmadag Cad. No:64 Sisli, İstanbul, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12036.788006851884!2d28.9821012!3d41.0428208!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x75a904c22f3b3765!2sMontagna+Hera!5e0!3m2!1sen!2s!4v1565850808973!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www.heramontagna.com', '+90 212 296 28 78', 'images/hotels/139.jpg', 'Montagna Hera', NULL, 2, 40, 42, 3, 0, '1', '<div style=\"text-align: right;\"><span style=\"background-color: rgb(255, 255, 255); color: rgb(41, 43, 44); font-family: iranyekan, iranyekanNum, sans-serif; font-size: 12px; text-align: justify; word-spacing: 1px;\">این هتل سه ستاره در قلب منطقه تقسیم قرار دارد دارای اتاق هایی است که برخی از آنها تراس هایی به سمت نمای زیبای شهر دارد. این هتل فقط چند قدم تا مناطق معروف تفریحی و مراکز خرید این منطقه فاصله دارد.</span></div>', '', 0, 0, 1, 'هتل هرا مونتاگنا,هتل Montagna Hera,هتل 3 ستاره استانبول,هتل ترکیه', 'هتل هرا مونتاگنا | Montagna Hera واقع در استانبول . شمامیتوایند اطلاعات این هتل را در okshod ببینید.', 'montagna-hera', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(140, 'گلد آنکارا', 'Ankara Gold', 'Kavaklıdere Mahallesi Tunus Cad, Güfte Sk., 06000 Çankaya, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12241.10576655882!2d32.855467!3d39.9128294!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x55fc87884bfbff9d!2sAnkara+Gold+Hotel!5e0!3m2!1sen!2s!4v1565853519064!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www.ankaragoldhotel.com', '+90 312 419 4868', 'images/hotels/140.jpg', 'Ankara Gold', NULL, 2, 40, 44, 3, 8, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">این هتل در مرکز شهر آنکارا قرار دارد و نزدیک به شورای بزرگ ملی ترکیه است. هتل گلد دارای اتاق هایی مدرن مجهز به اینترنت رایگان Wi-Fi و پارکینگ اختصاصی رایگان می باشد. تمامی اتاق های هتل آنکارا گلد دارای تلویزیون ، تهویه کننده هوا و مینی بار می باشند.</span></div>', '', 0, 0, 1, 'هتل گلد آنکارا,هتل Ankara Gold,هتل های 3 ستاره آنکارا,هتل های آنکارا', 'هتل گلد آنکارا | Ankara Gold یک هتل 3 ستاره است. شما میتوانید تمام اطلاعات این هتل را در اوکی شد ببینید', 'ankara-gold', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(141, 'نستا آنکارا', 'nesta ankara', 'Büyükesat, Kız Kulesi Sk. No:36, 06700 Çankaya/Ankara, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12245.161606688373!2d32.872091!3d39.89013!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x638c179f6012c132!2sNesta+Boutique+Hotel!5e0!3m2!1sen!2s!4v1565856534870!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www.nesta-hotel.hotelinankara.net', '+90 312 447 10 00', 'images/hotels/141.jpg', 'nesta ankara', NULL, 2, 40, 44, 3, 0, '1', '<p style=\"text-align: right; margin-bottom: 20px; margin-top: 0px;\">هتلی 3 ستاره واقع در شهر&nbsp;<span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition-duration: 0.2s; transition-timing-function: linear; transition-property: all; outline-color: initial;\">آنکارا</span>&nbsp;می باشد. این&nbsp;<span class=\"itemExtraFieldsValue\" style=\"\">هتل از موقعیت مکانی عالی برخوردار است و در قلب شهر آنکارا واقع شده و به راحتی به مراکز خرید آنکارا دسترسی دارد.</span></p><p style=\"text-align: right; margin-bottom: 20px; margin-top: 0px;\"><span class=\"itemExtraFieldsValue\" style=\"\">خدمات هتل 24 ساعته میباشد و مسافران و گردشگران&nbsp;<span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition-duration: 0.2s; transition-timing-function: linear; transition-property: all; outline-color: initial;\">تور ترکیه</span>&nbsp;و&nbsp;<span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition-duration: 0.2s; transition-timing-function: linear; transition-property: all; outline-color: initial;\">تور آنکارا</span>&nbsp;می توانند از خدمات آرامش بخش ماساژ درمانی هتل بهره مند شوند</span></p>', '', 0, 0, 1, 'هتل نستا آنکارا,هتل nesta ankara,هتل 3 ستاره آنکارا', 'هتل نستا آنکارا | nesta ankara هتلی 3 ستاره است که در آنکارا قرار دارد . شما میتوانید اطلاعات این هتل را در okshod ببینید', 'nesta-ankara', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(142, 'آنت رویال', 'ANTROYAL', 'Altındağ Mh., Anafartalar Cd No:66, 07100 Antalya, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12763.838137959769!2d30.6947761!3d36.8913163!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd0d6d119fecf11ac!2sHotel+Antroyal!5e0!3m2!1sen!2s!4v1565859809777!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www.hotelantroyal.com', '+902422440404', 'images/hotels/142.jpg', 'ANTROYAL', NULL, 2, 40, 41, 3, 0, '1', '<div style=\"text-align: right;\"><span style=\"font-family: iranyekan; font-size: 16px; text-align: justify; background-color: rgb(255, 255, 255);\">این هتل در نزدیکی موزه آنتالیا و دریای مدیترانه قرار دارد. هر یک از اتاقهای هتل دارای امکاناتی از قبیل وای فای رایگان، تلویزیون ماهواره، سیستم تهویه مطبوع، کف فرش شده، مینی بار، سشوار، حمام اختصاصی و ... هستند</span></div>', '', 0, 0, 1, 'هتل آنت رویال,هتل ANTROYAL,هتل های آنتالیا,هتل 3 ستاره آنتالیا', 'هتل آنت رویال | ANTROYAL هتلی 3 ستاره در آنتالیا است . شما میتوانید اطلاعات این هتل را در اوکی شد ببینید.', 'antroyal', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(143, 'سوزر', 'Sozer', 'Türkmen, Atatürk Blv., 09400 Kuşadası/Aydın, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12598.980755498398!2d27.2640057!3d37.8662522!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xac7b2967e877cefb!2sS%C3%B6zer+Hotel!5e0!3m2!1sen!2s!4v1566016874535!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www.hotelsozer.com.tr', '+90 256 614 89 36', 'images/hotels/143.jpg', 'Sozer', NULL, 2, 40, 45, 3, 35, '1', '<p style=\"text-align: right; margin: 0px 0px 20px; line-height: 22px;\">این هتل سه ستاره قیمت های خوبی را به مسافران تور کوش آداسی ارائه می دهد و امکاناتش هم قابل قبول و حتی مطلوب است.</p><p style=\"text-align: right; margin: 0px 0px 20px; line-height: 22px;\">این ویژگی ۱ دقیقه پیاده روی از ساحل است. هتل Sozer در امتداد ساحل شنی در Kuşadası با منظره پانوراما از دریای اژه است. این هتل دارای استخر سرپوشیده است و اتاق های عتیقه ای با فای رایگان ارائه می دهد.</p>', '', 0, 0, 1, 'هتل سوزر,هتل Sozer ,هتل های کوش آداسی,هتل 3 ستاره کوش آداسی', 'هتل سوزر | Sozer هتلی 3 ستاره در کوش آداسی ترکیه است . شما میتوانید تمام اطلاعات این هتل را در اوکی شد ببینید.', 'sozer', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(144, 'ایسات', 'Esat', 'Türkmen, Enver Reis Sk. no:5, 09400 Kuşadası/Aydın, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1113.5375889450115!2d27.267821856203167!3d37.87058638312306!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14beaeb595d96bbd%3A0xe00e0e65dae14c1a!2sEsat+Hotel!5e0!3m2!1sen!2s!4v1566019974332!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]esatotel[dot]com', '+90 256 618 14 41', 'images/hotels/144.jpg', 'Esat', NULL, 2, 40, 45, 3, 0, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">ایسات هتل فقط ۶۰۰ متر تا ساحل فاصله دارد و اتاق های آن مجهز به سیستم تهویه هستند. هتل دارای استخر در فضای باز و سونا می باشد. در اتاق های هتل تلویزیون و ماهواره وجود دارد و اتاق ها دارای سرویس اینترنت بی سیم هستند. اتاق ها دارای بالکن رو به دریا هستند. رستوران این هتل هم رو به دریا است و در بار ان انواع نوشیدنی های الکلی و غیر الکلی سرو می شود. این هتل تا مرکز کوش آداسی ۸۰۰ متری تا فرودگاه ازمیر ۸۰ کیلومتر فاصله دارد. کارکنان این هتل به زبان انگلیسی، روسی، آلمانی و ترکی صحبت می کنند.</span></div>', '', 0, 0, 1, 'هتل ایسات,هتل Esat,هتل 3 ستاره کوش آداسی,هتل کوش آداسی', 'هتل ایسات | Esat هتلی 3 ستاره در کوش آداسی ترکیه است . شما میتوانید اطلاعات کامل این هتل را در okshod ببینید', 'esat', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(145, 'آکدامار', 'Akdamar', 'Bahçıvan, Ferit Melen Blv. No:22, 65130 İpekyolu/Van, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4416.006001921272!2d43.391779280604084!3d38.49715261161648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x2e8eb8cd04302391!2sAkdamar+Otel!5e0!3m2!1sen!2s!4v1566021810074!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]otelakdamar[dot]com', '+90 432 214 99 23', 'images/hotels/145.jpg', 'Akdamar', NULL, 2, 40, 64, 3, 0, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل&nbsp;</span>آکدامار<span style=\"text-align: justify;\">&nbsp;یک هتل سه ستاره میان‌رده در شهر وان واقع در کشور ترکیه است. این هتل ۶۶ اتاق دارد و از جمله مهم‌ترین امکانات آن می‌توان به پارکینگ رایگان، وای‌فای رایگان، پذیرش ۲۴ ساعته، روم سرویس، مینی‌بار، اجاره خودرو، تراس و سالن ورزشی اشاره کرد.&nbsp;اتاق‌های این هتل مجهز به تهویه مطبوع، تلویزیون ماهواره‌ای، مینی‌بار و حمام خصوصی هستند.</span></div>', '', 0, 0, 1, 'هتل آکدامار,هتل Akdamar,هتل 3 ستاره وان,هتل اکدامار ترکیه', 'هتل آکدامار | Akdamar هتلی 3 ستاره در شهر وان است . شما میتوانید اطلاعات کامل این هتل را در okshod ببینید', 'akdamar', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(146, 'آنمون اج', 'Anemon Ege', 'Erzene, Ege Ünv. Kampüsü, 35000 Bornova/İzmir, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12497.87919626932!2d27.210935!3d38.453714!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x992dac953953fac7!2sAnemon+Ege+Otel!5e0!3m2!1sen!2s!4v1566023812538!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]anemonhotels[dot]com', '+90 232 373 48 62', 'images/hotels/146.jpg', 'Anemon Ege', NULL, 2, 40, 43, 4, 0, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل&nbsp;</span>آنمون اج<span style=\"text-align: justify;\">&nbsp;یک هتل چهار ستاره لوکس در شهر ازمیر واقع در کشور ترکیه است. این هتل ۱۰۰ اتاق دارد و از جمله مهم‌ترین امکانات آن می‌توان به استخر رو باز، باغ، سونا، استخر سرپوشیده، باشگاه، کافه کنار استخر، زمین تنیس، پارکینگ رایگان و کرایه خودرو اشاره کرد.فاصله هتل تا مرکز شهر ۱۰ دقیقه و تا فرودگاه عدنان مندرس ۱۵ کیلومتر است.</span></div>', '', 0, 0, 1, 'هتل Anemon Ege,هتل آنمون اج,هتل 4 ستاره ازمیر,هتل های ازمیر', 'هتل آنمون اج | Anemon Ege هتلی 4 ستاره در ازمیر است. شما میتوانید اطلاعات کامل این هتل را در اوکی شد ببینید.', 'anemon-ege', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(147, 'وطن', 'Vatan', 'Kurtuluş, Anafartalar Cd. No:628, 35240 Konak/İzmir, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12503.666903521984!2d27.1394672!3d38.4202893!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x7d8493da47b7ea7c!2sVatan+Hotel!5e0!3m2!1sen!2s!4v1566027177840!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]vatanotel[dot]com', '+90 232 483 06 37', 'images/hotels/147.jpg', 'Vatan', NULL, 2, 40, 43, 3, 0, '1', '<p style=\"text-align: right; box-sizing: border-box; margin: 0.85em 0px; padding: 0px; border: 0px rgb(225, 225, 225); font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline;\">هتل وطن در رده هتل های 3 ستاره قرار دارد. امکانات رفاهی هتل شامل حمام ترکی و بخار می باشد.</p><p style=\"text-align: right; box-sizing: border-box; margin: 0.85em 0px; padding: 0px; border: 0px rgb(225, 225, 225); font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline;\">از دیگر امکانات هتل می توان به ارائه خدمات نگهداری از اطفال اشاره کرد. اين هتل داراي 30 اتاق مي باشد. يک صرافي نيز در هتل وجود دارد. اتاق جلسه کاملا مجهز در هتل موجود مي باشد.</p><p style=\"text-align: right; box-sizing: border-box; margin: 0.85em 0px; padding: 0px; border: 0px rgb(225, 225, 225); font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline;\">اتومبيل کرايه نيز بنا به درخواست ميهمانان، در اختيار آنان قرار خواهد گرفت. هتل داراي کتابخانه مي باشد. در صورت درخواست مسافرين، ترانسفر فرودگاه در اختيارشان قرار خواهد گرفت.</p>', '', 0, 0, 1, 'هتل وطن,هتل وطن ازمیر,هتل vatan ازمیر,هتل 3 ستاره ازمیر,هتل های ازمیر', 'هتل وطن | Vatan هتلی 3 ستاره در شهر ازمیر ترکیه است . شما میتوانید اطلاعات کامل این هتل را در سایت اوکی شد ببینید', 'vatan', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(148, 'ترنج', 'Toranj', 'ايـران، خليج فـارس، جزيـره كيش، مجمـوعه گردشگری و هتل دريايی ترنج', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14274.418407361509!2d53.9231961!3d26.5649674!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x882090ec26029a34!2sToranj+Marine+Hotel!5e0!3m2!1sen!2s!4v1566039673090!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]toranj-hotel[dot]com', '076 4447 4114', 'images/hotels/148.jpg', 'Toranj', NULL, 1, 67, 0, 5, 19, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل ترنج کیش که بر روی آب‌های سواحل نیلگون خلیج فارس قرار دارد می‌توانیم نمونه آن را در شهر مالدیو و جزایر بی‌‌نظیر کارائیب مشاهده کرد. هتل ترنج در دو موقعیت متفاوت آبی و خشکی واقع شده است. هتل ترنج کیش جوری ساخته شده است و از وسایلی استفاده شده است که محیط زیست ره به خطر نمی‌اندازد و با توجه به استانداردهای اکوسیستمی بنا شده است.</span></div>', '', 0, 0, 1, 'هتل ترنج کیش,Toranj Marine Hotel,هتل 5 ستاره کیش,بهترین هتل کیش', 'هتل ترنج | Toranj هتلی 5 ستاره در کیش است . شما میتوانید اطلاعات کامل این هتل را در اوکی شد ببینید.', 'toranj', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(149, 'صدف', 'Sadaf', 'کیش- میدان امیرکبیر- بلوار دانش', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14276.735840189202!2d54.0133167!3d26.5463575!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x5738c5456a4853d0!2z2YfYqtmEINi12K_ZgQ!5e0!3m2!1sen!2s!4v1566118000602!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'ندارد', '076 4442 0590', 'images/hotels/149.jpg', 'Sadaf', NULL, 1, 67, 0, 4, 21, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل چهار ستاره صدف بر اساس استانداردهای بین المللی، در زمینی بالغ بر ۱۵ هزار متر مربع در سال ۱۳۸۱ به بهره برداری رسید و آخرین بازسازی آن در سال ۱۳۹۲ انجام گردید. ساختمان هتل با معماری و طراحی داخلی مدرن در ۲ طبقه بنا و دارای ۵۵ باب اتاق و سوئیت با دکوراسیون هماهنگ و زیبا می‌باشد و همچنین در کنار هتل در فضای استثنایی کوهی به بلندی ۲۷ متر با آبشارهای عظیم و چشم اندازی زیبا بنا شده است. موقعیت مکانی هتل موجب دسترسی آسان به مراکز خریدی از جمله مرکز خرید شارستان و مروارید گردیده است.</span></div>', '', 0, 0, 1, 'هتل صدف,هتل Sadaf,هتل صدف کیش,هتل 4 ستاره کیش,هتل های کیش', 'هتل صدف | sadaf هتلی 4 ستاره در کیش است. شما میتوانید اطلاعات کامل این هتل را در سایت اوکی شد ببینید.', 'sadaf', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(150, 'پارسیس', 'Parsis', 'مشهد، بلوار وحدت، بین وحدت 7و9 ابتدای بلوار امیر المومنین، هتل پارسیس', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12863.746976780669!2d59.6290013!3d36.2895847!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x58b8a23be0159545!2sParsis+Hotel!5e0!3m2!1sen!2s!4v1566119691954!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]hotelparsis[dot]com', '051 3369 2565', 'images/hotels/150.jpg', 'parsis', NULL, 1, 68, 0, 5, 3, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل پنج ستاره پارسیس مشهد در سال ۱۳۹۵ در جوار بارگاه ملکوتی حضرت علی بن موسی الرضا (ع) افتتاح گردیده است. این هتل با ۱۷ طبقه بنا و ۱۱۲ باب اتاق و سوئیت از امکانات رفاهی ویژه ای برخوردار می‌باشد که قطعا موجب جلب رضایت شما مسافران عزیز می‌شود علاوه بر این، موقعیت مکانی هتل باعث دسترسی آسان به حرم مطهر گردیده است که لذت زیارت را برای میهمانان گرامی دو چندان می‌کند .&nbsp;</span></div>', '', 0, 0, 1, 'هتل پارسیس,هتل پارسیس مشهد,هتل Parsis,هتل های 5 ستاره مشهد,هتل parsis مشهد', 'هتل پارسیس | Parsis هتلی 5 ستاره در شهر مشهد است . شما میتوانید کلیه اطلاعات این هتل را در okshod ببینید.', 'parsis', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(151, 'اترک', 'Atrak', 'مشهد مقدس - میدان بیت المقدس - هتل اترک', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12864.788943345704!2d59.6131266!3d36.2832639!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x332e93d558d7ea48!2sAtrak+Hotel!5e0!3m2!1sen!2s!4v1566121301528!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]atrakhotel[dot]com', '051 3364 7093', 'images/hotels/151.jpg', 'Atrak', NULL, 1, 68, 0, 4, 1, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل اترک مشهد با زیر بنای 15000 متر مربع، در سال 1357 افتتاح گردید. این هتل با برخورداری از امکاناتی هم چون سالن کنفرانس، رستوران و کافی شاپ مدرن، می تواند گزینه مناسبی برای برگزاری همایش ها و جلسات اداری باشد. هتل اترک مشهد دارای 13 طبقه مشتمل بر 146 باب اتاق، سوئیت و آپارتمان است، که افتخار پذیرایی از زائران حرم مطهر امام رضا (ع) را دارد. هتل چهار ستاره اترک با موقعیت مکانی خاص خود در جوار حرم ثامن الائمه، میزبان همیشگی مهمانان گرامی خواهد بود.</span></div>', '', 0, 0, 1, 'هتل اترک,هتل Atrak,هتل 4 ستاره مشهد,هتل اترک مشهد', 'هتل اترک | atrak هتلی 4 ستاره در مشهد است . این هتل در نزدیکی حرم است اطلاعات این هتل را در okshod ببینید.', 'atrak', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(152, 'بوتیک ایرمان', 'Irman BOUTIQUE', 'قشم - نخل زرین - خیابان پژوهش - نبش خیام پیام', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14226.984541653885!2d56.2722076!3d26.9432614!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6ff599b7c3108046!2sIrman+BOUTIQUE+HOTEL!5e0!3m2!1sen!2s!4v1566124385707!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]irmanhotel[dot]com', '+9876-35100', 'images/hotels/152.jpg', 'Irman BOUTIQUE', NULL, 1, 69, 0, 4, 1, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل بوتیک ایرمان قشم در بهمن ماه سال 1396 در پنج طبقه به بهره برداری رسید. این هتل شامل 38 باب اتاق و سوئیت می باشد که این اتاق ها در طبقات اول تا پنجم پراکنده شده اند. گردشگران گرامی می توانند از هتل ایرمان قشم با فاصله ای حدودا 2 کیلومتر به تماشای آب های نیلگون خلیج فارس بروند. همچنین دسترسی به مراکز خرید نظیر سیتی سنتر، پردیس و ستاره با فاصله ی حداکثر 1.6 کیلومتر از دیگر مزایای موقعیت مکانی مناسب هتل بوتیک چهار ستاره ایرمان قشم می باشد.</span></div>', '', 0, 0, 1, 'هتل بوتیک ایرمان,هتل بوتیک ایرمان قشم,هتل 4 ستاره قشم,هتل Irman BOUTIQUE', 'هتل بوتیک ایرمان | Irman BOUTIQUE هتلی 4 ستاره در شهر قشم است . شما میتوانید اطلاعات کامل این هتل را در اوکی شد ببینید.', 'irman-boutique', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(153, 'سینگو', 'Singo', 'جزیره قشم - درگهان - طبقه دوم مجتمع تجاری دریا - هتل سینگو قشم', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14223.810239404113!2d56.0714589!3d26.9684016!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xbb3468c2fcb27c19!2sSingo+Hotel!5e0!3m2!1sen!2s!4v1566126160751!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]singohotel[dot]com', '076 3527 4245', 'images/hotels/153.jpg', 'singo', NULL, 1, 69, 0, 3, 1, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل سینگو قشم در سال 1393 به بهره برداری رسید. ساختمان این هتل دارای یک طبقه و مشتمل بر 50 باب اتاق و سوئیت می باشد. از نکات بارز هتل سینگو، قرار گرفتن در قلب مراکز تجاری و خرید درگهان است که سبب دسترسی آسان به این مراکز شده است. همچنین هتل سه ستاره سینگو قشم در فاصله 20 کیلومتری از قشم و در موقعیت خوبی نسبت به ساحل دریا قرار دارد که همین امر نمای زیبای دریا را در برخی از این اتاق ها خلق کرده است. قابل توجه مهمانان گرامی، برخی واحدها فاقد پنجره و دارای نورگیر رو به راهرو هتل می باشند.</span></div>', '', 0, 0, 1, 'هتل سینگو, هتل Singo,هتل 3 ستاره قشم,هتل سینگو قشم', 'هتل سینگو | Singo هتلی 3 ستاره در شهر قشم است شما میتوانید اطلاعات کامل این هتل را در سایت Okshod ببینید.', 'singo', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(154, 'استقلال', 'Esteghlal', 'تقاطع بزرگراه شهيد چمران و ولي‌عصر، هتل بين المللي  استقلال', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12945.541582690037!2d51.4130323!3d35.7904709!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x1ea8e60412be1037!2sParsian+Esteghlal+International+Hotel!5e0!3m2!1sen!2sua!4v1566202666644!5m2!1sen!2sua\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]esteghlalhotel[dot]ir', '+98 21 2266 0011', 'images/hotels/154.jpg', 'Esteghlal', NULL, 1, 70, 0, 5, 1, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل استقلال تهران (رویال هیلتون سابق) بزرگترین هتل ۵ ستاره ایران در شمال تهران است که در تاریخ هشتم آذر ۱۳۴۱ افتتاح گردید. این هتل در زمینی به مساحت ۷۰ هزار متر مربع بنا شده است. هتل استقلال پارسیان تهران با قرار گرفتن در یکی از بهترین نقاط تهران، دسترسی مناسبی به طولانی ترین خیابان خاورمیانه و زیباترین خیابان پایتخت، یعنی خیابان ولیعصر دارد.</span></div>', '', 0, 0, 1, 'هتل استقلال,هتل Esteghlal,هتل استقلال تهران,هتل 5 ستاره تهران,هتل پارسیان استقلال', 'هتل استقلال | Esteghlal هتلی 5 ستاره در تهران است . شما میتوانید اطلاعات کامل این هتل هم راه با تصاویر هتل را در okshod ببینید.', 'esteghlal', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(155, 'اسپیناس پالاس', 'Espinas Palace', 'تهران، سعادت آباد، انتهای بزرگراه یادگار امام، میدان بهرود', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12945.143400241292!2d51.3563478!3d35.7929152!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x5005dbbf6110316!2sEspinas+Palace+Hotel!5e0!3m2!1sen!2s!4v1566204399341!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]espinashotels[dot]com', '021 7567 5000', 'images/hotels/155.jpg', 'Espinas Palace', NULL, 1, 70, 0, 5, 5, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل اسپیناس پالاس تهران، در سال ۱۳۹۴ در منطقه سعادت آباد، یکی از بهترین محله های پایتخت افتتاح شد. این هتل پنج ستاره با طراحی مدرن و برگرفته از معماری معاصر، دارای ۴۰۰ اتاق و سوئیت مجهز در ۲۱ طبقه است. هتل اسپیناس پالاس از مدرن ترین ساختمان های تهران، با فضایی دلنشین، لابی مجلل، خدمات لوکس،به بهترین شکل پاسخگوی همه انتظارات و نیازهای مسافران و میهمانان خود است.</span></div>', '', 0, 0, 1, 'هتل اسپیناس پلاس,هتل Espinas Palace,هتل ها 5 ستاره تهران,هتل 5 ستاره اسپیناس', 'هتل اسپیناس پلاس | Espinas Palace هتلی 5 ستاره در تهران است. شما میتوانید اطلاعات کامل این هتل را در اوکی شد ببینید.', 'espinas-palace', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(156, 'بلوط', 'Baloot', 'تهران - ولنجک - خیابان یمن - بالاتر از چهارراه مقدس اردبیلی - سمت چپ - باغ گیاه پزشکی', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12944.157608775136!2d51.4038151!3d35.798966!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xc17ba53ba3f88b79!2sBaloot+Hotel!5e0!3m2!1sen!2s!4v1566210812060!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'www[dot]baloothotel[dot]com', '021 2680 2831', 'images/hotels/156.jpg', 'Baloot', NULL, 1, 70, 0, 3, 1, '1', '<div style=\"text-align: right;\"><span style=\"text-align: justify;\">هتل بلوط تهران واقع در منطقه خوش آب و هوای ولنجک، در سال 1395 برای میزبانی از مسافران گرامی افتتاح شد. این هتل با قرار گرفتن در روبروی سالن اجلاس سران (مرکز همایش های بین المللی جمهوری اسلامی)، موجب دسترسی آسان مهمانان می شود. هتل سه ستاره بلوط تهران با محوطه چشم نواز، دارای 16 باب اتاق می باشد. شایان ذکر است مزیت دیگر هتل بلوط، قرارگیری در فاصله 4 کیلومتری نمایشگاه بین المللی تهران می باشد.</span></div>', '', 0, 0, 1, 'هتل بلوط,هتل Baloot,هتل 3 ستاره تهران,هتل بلوط تهران', 'هتل بلوط | Baloot هتلی 3 ستاره در شهر تهران است . شما میتوانید اطلاعات کامل این هتل را از سایت اوکی شد دریافت کنید.', 'baloot', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(157, 'لایف کرنر', 'Life Corner', 'Etiler, 1272/2 Sokak No:2, 35240 Konak/İzmir, Turkey', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12503.355087700926!2d27.1445533!3d38.4220907!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xcec1b1e97725af4c!2sLife%20Corner%20Hotel!5e0!3m2!1sen!2s!4v1570090002353!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 'www[dot]lifecornerhotel[dot]com', '+90 232 484 41 10', 'images/hotels/157.jpg', 'لایف کرنر', NULL, 2, 40, 43, 4, 0, '1', '<div style=\"text-align: justify;\"><font color=\"#222222\" face=\"IRANSans\"><span style=\"font-size: 15px; background-color: rgb(251, 251, 251);\">هتل لایف کرنر ازمیر&nbsp; در نزدیکی ایستگاه قطار تاریخی باسمنی Basmane واقع شده است.هتل لایف کرنر ازمیر&nbsp; تنها چند دقیقه پیاده روی از نمایشگاه بین المللی İzmir، بازار تاریخی Kemaralti، شهر باستانی Agora Antic، موزه های Konak و Kordon فاصله دارد. فرودگاه بین المللی عدنان مندرس Adnan Menderes تنها 18 کیلومتری هتل میباشد.</span></font></div>', '', 0, 0, 1, 'Life Corner,لایف کورنر,هتل لایف کرنر', 'هتل لایف کرنر ازمیر هتلی 4 ستاره است که امکانات خوب و قابل قبولی را برای مهمانان عزیز ارائه میدهد.', 'life-corner', '2019-08-21 12:43:06', '2019-08-21 12:43:06'),
(158, 'هما', 'HOMA', 'تهران - ميدان ونک - خیابان ولیعصر - خیابان شهید خدامی', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12950.233042833936!2d51.4051006!3d35.7616608!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd1816a423ffc9a8c!2sHoma%20Hotel!5e0!3m2!1sen!2s!4v1570951759603!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 'Tehran@Homahotels.com', '۴۳۹۶۹ ۲۱ ۰', 'images/hotels/158.jpg', 'هتل هما', NULL, 1, 70, 0, 5, 0, '1', '<p class=\"MsoNormal\" dir=\"RTL\" style=\"\"><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\"><font face=\"Arial\" style=\"\">معرفی هتل هما و\r\nویژگی اتاق ها و سوئیت های آن<o:p></o:p></font></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"\"><font face=\"Arial\"><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\">اتاق ها:دو تخته برای\r\nیک نفر،دو تخته تویین،دو تخته دابل،</span><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\">سوئیت یک خوابه دو تخته جونیور</span><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\"><o:p></o:p></span></font></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"\"><font face=\"Arial\" style=\"\"><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\">سوئیت\r\nیک خوابه دو تخته هما کلاس بازسازی شده</span><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\">،</span><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\">دو\r\nتخته دابل هما کلاس بازسازی شده</span><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\">،</span><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\">دو تخته تویین هما کلاس بازسازی شده</span><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\">،</span><span lang=\"FA\" style=\"font-size: 14pt; line-height: 107%;\">سوئیت\r\nیک خوابه دو تخته رویال</span></font><span lang=\"FA\" style=\"font-weight: normal; font-family: Arial, sans-serif; font-size: 14pt; line-height: 107%;\"><o:p></o:p></span></p>', '', 0, 0, 0, 'هتل هما,هما,هتل,هتل تهران,هتل پنج ستاره,هتل پنج ستاره تهران', 'معرفی هتل همای تهران:تهران، میدان ونک، خیابان شهید خدامی، شماره 51. معرفی از سایت اکی شد.okshod.com', 'hotel-homa', '2019-10-13 08:51:45', '2019-10-13 09:57:39'),
(159, 'لاله', 'laleh', 'تهران، خیابان فاطمی، نبش خیابان حجاب.', 'https://goo.gl/maps/NfggzNbuGXo96VmC7', 'lalehhotel.com', '9-88965021', 'images/hotels/159.jpg', 'هتل لاله', NULL, 1, 70, 0, 5, 0, '1', '<blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><span lang=\"FA\" dir=\"RTL\" style=\"font-size:11.0pt;\r\nline-height:107%;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:\r\nminor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;\r\nmso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:FA\">&nbsp; &nbsp;&nbsp;</span></blockquote><p class=\"MsoNormal\" dir=\"RTL\"><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin\">انواع <span style=\"mso-spacerun:yes\">&nbsp;</span>اتاق و سوئیت های این هتل شامل یک تخته ،دو تخته،\r\nتوئین ،سوئیت جونیور،سوئیت رویال ،سوئیت امپریال<span style=\"mso-tab-count:1\">&nbsp; میباشد.&nbsp; &nbsp; &nbsp;</span><o:p></o:p></span></p>', '', 0, 0, 0, 'هتل لاله,هتل,لاله,هتل تهران,هتل پنج ستاره لاله,هتل پنج ستاره تهران', 'معرفی هتل پنج ستاره لاله تهران،آدرس هتل:تهران، خیابان فاطمی، نبش خیابان حجاب.معرفی توسط اکی شد okshod.com', 'hotel-lale', '2019-10-13 11:18:08', '2019-10-13 11:44:15'),
(160, 'ویستریا', 'vistiria', 'تهران، چهارراه قدس، خیابان دربند، نبش خیابان احمدی زمانی، پلاک 1', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3235.6322010979425!2d51.43123891526226!3d35.80896168016462!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3f8e0573d0e5959b%3A0x35d772f7627c269e!2z2YjbjNiz2KrYsduM2Kc!5e0!3m2!1sen!2sua!4v1570971743182!5m2!1sen!2sua\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 'fa.wisteriahotel.com', '72081000', 'images/hotels/160.jpg', 'هتل ویستریا', NULL, 1, 70, 0, 5, 0, '1', '<p class=\"MsoNormal\" dir=\"RTL\"><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin\">انواع <span style=\"mso-spacerun:yes\">&nbsp;</span>اتاق و سوئیت های این هتل شامل <span style=\"mso-spacerun:yes\">&nbsp;</span>:دو تخته دابل استاندارد</span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:Arial;mso-bidi-theme-font:minor-bidi\">، </span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">دو تخته تویین استاندارد</span><span lang=\"FA\" style=\"font-family:\r\n&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:\r\nArial;mso-bidi-theme-font:minor-bidi\">، </span><span lang=\"FA\" style=\"font-family:\r\n&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;\r\nmso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin\">دو تخته دابل کینگ</span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:Arial;mso-bidi-theme-font:minor-bidi\">، </span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">دو تخته تویین کینگ</span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:Arial;mso-bidi-theme-font:\r\nminor-bidi\">، </span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin\">سوئیت دو تخته پرزیدنتال،</span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:Arial;mso-bidi-theme-font:minor-bidi\"> </span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">سوئیت دو تخته ویستریا میباشد .<o:p></o:p></span></p>', '', 0, 0, 0, 'هتل ویستیریا,هتل پنج ستاره ویستریا,هتل,ویستریا,هتل تهران', 'معرفی هتل ویستریا:تهران، چهارراه قدس، خیابان دربند، نبش خیابان احمدی زمانی، پلاک 1.معرفی توسط سایت اوکی شد.okshod.com', 'hotel-vistiria', '2019-10-13 13:05:46', '2019-10-13 13:05:46'),
(161, 'پرشین پلازا', 'persian', 'تهران، سهروردی شمالی، پایینتر از بهشتی ، خیابان میرزای زینالی شرقی، پلاک 42.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d51828.359273859925!2d51.428432949121095!3d35.71951734834457!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x690a72eb9e9d1a20!2sPersian%20Plaza%20Hotel!5e0!3m2!1sen!2sua!4v1571033898433!5m2!1sen!2sua\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 'persianplazahotel.com', '72 781 884 21 98', 'images/hotels/161.jpg', 'هتل پرشین پلازا', NULL, 1, 70, 0, 5, 0, '1', '<div style=\"text-align: right;\"><p class=\"MsoNormal\" dir=\"RTL\"><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin\">هتل پنج ستاره پرشین پلازا،&nbsp; در یکی از خیابان‌های اصلی تهران واقع شده، خیابان عباس‌آباد یا بهشتی که دسترسی\r\nخوبی به نقاط مختلف شهر دارد. تنها ده دقیقه تا مترو ایستگاه شهید بهشتی فاصله دارد و برای رفتن به مصلی تهران و مناطق شمالی و جنوبی پایتخت هم با وجود ایستگاه تاکسی\r\nو اتوبوس در نزدیکی هتل به زحمت نمی‌افتید.</span><span dir=\"LTR\"><o:p></o:p></span></p></div>', '', 0, 0, 0, 'هتل پرشین پلازا,هتل,پرشین پلازا,هتل پتج ستاره تهران,هتل تهران,', 'معرفی هتل  پنج ستاره پرشین پلازا توسط سایت اکی شد okshod', 'hotel-persian-pelaza', '2019-10-14 07:21:43', '2019-10-14 07:39:52'),
(162, 'قصر طلایی مشهد', 'ghasr talaee', 'خیابان امام رضا - میدان بسیج، بین خیابان امام رضا 34 و 36', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12866.614364604853!2d59.6028446!3d36.2721882!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8a79fef1a275d7c1!2sGhasr%20Talaee%20International%20Hotel!5e0!3m2!1sen!2s!4v1571129831006!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 'https://ghasrtalaee.com/', '38038 (51) 98+', 'images/hotels/162.jpg', 'هتل قصر طلایی', NULL, 1, 68, 0, 5, 0, '1', '<blockquote style=\"text-align: right; margin: 0px 0px 0px 40px; border: none; padding: 0px;\"><p class=\"MsoNormal\" dir=\"RTL\"><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin\">هتل قصر طلایی پنج ستاره مشهد، انتخابی\r\nبی نظیری برای سفر زیارتی به مشهد مقدس است. این هتل پنج‌ ستاره که در فاصله‌ی\r\nاندکی از حرم امام رضا(ع) واقع شده، تمام شرایط رفاهی را فراهم\r\nآورده تا خاطره‌ ای شیرین از این سفر زیارتی در ذهن‌تان بماند.</span></p><br></blockquote>', '', 0, 0, 1, 'هتل قصر طلایی مشهد,هتل پنج ستاره قصر طلایی,هتل مشهد,قصر طلایی،هتلghasr talaee', 'معرفی امکانات هتل پنج ستاره قصر طلایی مشهد ghasr talayee توسط سایت اوکی شد okshod.com', 'hotel-ghasr-talaee', '2019-10-15 08:57:36', '2019-10-15 08:57:36'),
(163, 'درویشی', 'darvishi', 'مشهد، خیابان امام رضا، بین امام رضا 24 و 26.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12866.092203161705!2d59.6055964!3d36.2753567!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xf6c602e373ccb0b!2sRoyal%20Darvishi%20Hotel!5e0!3m2!1sen!2sua!4v1571133702650!5m2!1sen!2sua\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 'https://darvishihotel.com', '25917070-021', 'images/hotels/163.jpg', 'هتل درویشی', NULL, 1, 68, 0, 5, 1, '1', '<div style=\"text-align: right;\"><p class=\"MsoNormal\" dir=\"RTL\"><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin\">هتل مجلل درویشی که در سال 1390 افتتاح\r\nشده، از معروف‌ترین هتل‌های مشهد است. این هتل در اصلی</span><span dir=\"LTR\"></span><span dir=\"LTR\"></span><span lang=\"FA\" dir=\"LTR\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:Arial;mso-bidi-theme-font:\r\nminor-bidi\"><span dir=\"LTR\"></span><span dir=\"LTR\"></span>‎‌</span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin\">ترین خیابان منتهی به حرم امام رضا، در فاصله‌ دوکیلومتری از حرم\r\nقرار رفته. دیگر اینکه معماری منحصر بفردی دارد و در 25 طبقه یکی از مرتفع ‌ترین\r\nساختمان‌ های مشهد است. وقتی از پنجره‌ها به بیرون نگاه می‌کنید شهر زیر پای شماست</span><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:Calibri;\r\nmso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:\r\nminor-latin;mso-bidi-font-family:Arial;mso-bidi-theme-font:minor-bidi\">.<o:p></o:p></span></p><br></div>', '', 0, 0, 1, 'هتل درویشی مشهد,هتل درویشی,هتل مجلل درویشی,هتل مشهد,هتل پنج ستاره مشهد', 'معرفی هتل مجلل درویشی darvishi مشهد توسط سایت اوکی شد okshod.com', 'hotel-darvishi', '2019-10-15 10:09:35', '2019-10-15 10:09:35');
INSERT INTO `tbl_hotel` (`hotel_id`, `hotel_pName`, `hotel_eName`, `hotel_address`, `hotel_map`, `hotel_website`, `hotel_phone`, `hotel_image`, `alt_image`, `hotel_gallery`, `category_parent1`, `category_parent2`, `category_parent3`, `hotel_rate`, `hotel_views`, `hotel_type`, `hotel_description`, `hotel_services`, `hotel_comision`, `hotel_ref_comision`, `publication_status`, `keywords`, `seo_description`, `slug`, `hotel_createdat`, `hotel_updatedat`) VALUES
(165, 'هما2', 'homa2', 'استان خراسان رضوی، مشهد، ‫خیام جنوبی 18', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12858.753511019702!2d59.563583!3d36.319863!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x81e60945c4a7c9b!2sHoma%20Hotel%202!5e0!3m2!1sen!2s!4v1571207730403!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 'homahotels.com', '051 3761 1001', 'images/hotels/165.jpg', 'هتل هما2', NULL, 1, 68, 0, 5, 2, '1', '<div style=\"text-align: right;\"><p class=\"MsoNormal\" dir=\"RTL\"><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:Arial;mso-bidi-theme-font:\r\nminor-bidi\"><o:p>&nbsp;</o:p></span><span lang=\"FA\" style=\"font-size: 10pt; font-family: Arial, sans-serif;\">هتل هما دو از هتل‌های 5 ستاره مشهد\r\nاست که در منطقه‌ای آرام، دور از شلوغی‌ شهر قرار گرفته.&nbsp; برای رفتن به هتل هما دو باید از طریق اتوبان\r\nپاسداران به سمت میدان شهید فهمیده بروید.</span><span lang=\"FA\" style=\"font-size: 10pt; font-family: Arial, sans-serif;\"> </span><span lang=\"FA\" style=\"font-size: 10pt; font-family: Arial, sans-serif;\">هتل هما دو از\r\nگروه هتل‌های هما است که باسابقه‌ای طولانی سال‌هاست اقامتی آسوده و لذت بخش را\r\nبرای زائران فراهم کرده است.</span></p><br></div>', '', 0, 0, 1, 'هتل هما2 مشهد,هتل هما2,هتل مشد,هما2,هتل مشهد,هتل پنج ستاره هما2', 'معرفی هتل همای 2 مشهد توسط سایت اوکی شد okshod.com', 'hotel-homa2', '2019-10-16 06:43:02', '2019-10-16 06:43:02'),
(166, 'پارس', 'pars', 'مشهد، بلوار وکیل آباد، تقاطع صیاد شیرازی', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12856.97085721184!2d59.4870945!3d36.330667!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x2504d02dc7ad2777!2sPars%20Hotel!5e0!3m2!1sen!2s!4v1571209200236!5m2!1sen!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 'http://www.pars-hotels.com', '051 3868 9201', 'images/hotels/166.jpg', 'هتل پارس', NULL, 1, 68, 0, 5, 13, '1', '<div style=\"text-align: right;\"><p class=\"MsoNormal\" dir=\"RTL\"><span lang=\"FA\" style=\"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;\r\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\r\nCalibri;mso-hansi-theme-font:minor-latin\">هتل پارس مشهد، مناسب آن دست از\r\nمسافرانی است که هتلی لوکس و مجهز و در عین حال نزدیک به مکان‌های گردشگری و تفریحی\r\nمی‌خواهند تا علاوه بر زیارت امام رضا(ع)، بتوانند در ایام سفر، خوش بگذرانند. در\r\nاین هتل، علاوه بر اتاق‌‌ها و سوئیت‌هایی که به بهترین امکانات رفاهی مجهز شده‌اند،\r\nفضای سبز و محوطه‌ی باز فوق‌العاده جذابی نیز در نظر گرفته شده است این هتل توسط سایت اوکس شد معرفی شده است.</span></p><br></div>', '', 0, 0, 1, 'هتل پارس مشهد,هتل پنج ستاره پارس مشهد,هتل پارس,هتل مشهد', 'معرفی هتل پارس مشهد و امکاناتش توسط سایت اوکی شد okshod', 'hotel-pars-mashhad', '2019-10-16 08:21:59', '2019-10-16 08:21:59'),
(167, 'کایا هتل', 'hotel kaya', 'استانبول، فاتح، فیندیک زاده، خیابان میلت، پلاک ۸۶', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12042.534921289203!2d28.9525877!3d41.0113893!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x815d66f3eecd7c24!2za2F5YSBtYWRyaWQg2YfYqtmEINin2LPYqtin2YbYqNmI2YQ!5e0!3m2!1sfa!2s!4v1574674501100!5m2!1sfa!2s\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', 'wwwkayahotel.com', '34080', 'images/hotels/167.jpg', 'هتل کایا', NULL, 2, 40, 42, 3, 0, '1', '<p style=\"text-align: right; box-sizing: border-box; margin: 0px 0px 10px; color: rgb(68, 68, 68); font-family: iransans, Tahoma, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);\">در تمام اتاق های هتل کایا استانبول می توانید از امکانات گوناگونی بهرمند شوید. کولر و تهویه مطبوع هوای داخل اتاق ها را کاملا دلچسب و آماده استراحت می کند. در حمام و سرویس بهداشتی، همه نوع لوازم آرایشی-بهداشتی رایگان مانند حوله، سشوار، شامپو، مسواک، صابون و … خواهید داشت. اتاق های خانوادگی تودرتو در اینجا موجود است که به صورت دو اتاق مجزا با دری بین آن ها دیده می شوند.</p><p style=\"text-align: right; box-sizing: border-box; margin: 0px; color: rgb(68, 68, 68); font-family: iransans, Tahoma, sans-serif; font-size: 15px; background-color: rgb(255, 255, 255);\">سرویس پذیرایی در اتاق، در هتل کایا انجام می گیرد که می توانید صبحانه را در اتاقتان میل کنید. با گذاشتن پول و اشیاء ارزشمندتان در گاوصندوق هتلی موجود، می توانید با خیال راحت اتاق را ترک کرده و به گشت و گذار بپردازید. برای سرگرمی هم می توانید به تماشای تلویزیون اتاقتان بپردازید که شبکه های جهانی پخش می کند. تلفن و یخچال کوچک، از دیگر امکاناتی است که برای شما فراهم گشته است</p>', '', 0, 0, 1, 'هتل سه ستاره استانبول,هتل کایا,', 'معرفی هتل کایا,هتل سه ستاره کایا', 'kaiahtl', '2019-11-25 09:36:05', '2019-11-25 09:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel_attr`
--

DROP TABLE IF EXISTS `tbl_hotel_attr`;
CREATE TABLE IF NOT EXISTS `tbl_hotel_attr` (
  `hotel_id` int(11) NOT NULL,
  `attr_freenet` tinyint(1) NOT NULL DEFAULT '0',
  `attr_safebox` tinyint(1) NOT NULL DEFAULT '0',
  `attr_transfer` tinyint(1) NOT NULL DEFAULT '0',
  `attr_laundry` tinyint(4) NOT NULL DEFAULT '0',
  `attr_animal` tinyint(1) NOT NULL DEFAULT '0',
  `attr_child` tinyint(1) NOT NULL DEFAULT '0',
  `attr_fire` tinyint(1) NOT NULL DEFAULT '0',
  `attr_hair` tinyint(1) NOT NULL DEFAULT '0',
  `attr_car` tinyint(1) NOT NULL DEFAULT '0',
  `attr_indoorpool` tinyint(1) NOT NULL DEFAULT '0',
  `attr_outdoorpool` tinyint(1) NOT NULL DEFAULT '0',
  `attr_sonia` tinyint(1) NOT NULL DEFAULT '0',
  `attr_massage` tinyint(1) NOT NULL DEFAULT '0',
  `attr_gym` tinyint(1) NOT NULL DEFAULT '0',
  `attr_coffeshop` tinyint(1) NOT NULL DEFAULT '0',
  `attr_restaurant` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hotel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `tbl_hotel_attr`
--

INSERT INTO `tbl_hotel_attr` (`hotel_id`, `attr_freenet`, `attr_safebox`, `attr_transfer`, `attr_laundry`, `attr_animal`, `attr_child`, `attr_fire`, `attr_hair`, `attr_car`, `attr_indoorpool`, `attr_outdoorpool`, `attr_sonia`, `attr_massage`, `attr_gym`, `attr_coffeshop`, `attr_restaurant`) VALUES
(116, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1),
(117, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1),
(112, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(142, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1),
(141, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(143, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1),
(140, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1),
(139, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(144, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1),
(136, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1),
(138, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(137, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1),
(145, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1),
(146, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1),
(147, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1),
(148, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1),
(149, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1),
(150, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1),
(151, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1),
(152, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(153, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(154, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1),
(155, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0),
(156, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1),
(157, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1),
(158, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1),
(159, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1),
(160, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1),
(161, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(162, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1),
(163, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1),
(165, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1),
(166, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1),
(167, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0),
(115, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel_gallery`
--

DROP TABLE IF EXISTS `tbl_hotel_gallery`;
CREATE TABLE IF NOT EXISTS `tbl_hotel_gallery` (
  `hg_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `hotel_gallery` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`hg_id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `tbl_hotel_gallery`
--

INSERT INTO `tbl_hotel_gallery` (`hg_id`, `hotel_id`, `hotel_gallery`, `alt`) VALUES
(134, 115, 'images/hotels/gallery/115/1.jpg', ''),
(135, 115, 'images/hotels/gallery/115/2.jpg', 'هتل5'),
(137, 115, 'images/hotels/gallery/115/3.jpg', 'هه'),
(178, 116, 'images/hotels/gallery/116/1.jpg', 'Crowne Plaza'),
(179, 116, 'images/hotels/gallery/116/2.jpg', 'Crowne Plaza'),
(181, 116, 'images/hotels/gallery/116/4.jpg', 'Crowne Plaza'),
(182, 117, 'images/hotels/gallery/117/3.jpg', 'Istanbul Surmeli'),
(183, 117, 'images/hotels/gallery/117/4.jpg', 'Istanbul Surmeli'),
(184, 117, 'images/hotels/gallery/117/5.jpg', 'Istanbul Surmeli'),
(192, 117, 'images/hotels/gallery/117/4.jpg', 's'),
(193, 117, 'images/hotels/gallery/117/5.jpg', 't'),
(215, 136, 'images/hotels/gallery/136/1.jpg', 'Dedeman'),
(216, 136, 'images/hotels/gallery/136/2.jpg', 'Dedeman'),
(217, 136, 'images/hotels/gallery/136/3.jpg', 'Dedeman'),
(218, 136, 'images/hotels/gallery/136/4.jpg', 'Dedeman'),
(247, 137, 'images/hotels/gallery/137/1.jpg', 'Holiday Inn'),
(248, 137, 'images/hotels/gallery/137/2.jpg', 'Holiday Inn'),
(249, 137, 'images/hotels/gallery/137/3.jpeg', 'Holiday Inn'),
(250, 137, 'images/hotels/gallery/137/4.jpg', 'Holiday Inn'),
(251, 137, 'images/hotels/gallery/137/5.jpg', 'Holiday Inn'),
(252, 138, 'images/hotels/gallery/138/1.jpg', 'Comfort Hotel Taksim'),
(253, 138, 'images/hotels/gallery/138/2.jpg', 'Comfort Hotel Taksim'),
(254, 138, 'images/hotels/gallery/138/3.jpg', 'Comfort Hotel Taksim'),
(255, 139, 'images/hotels/gallery/139/1.jpg', 'Montagna Hera'),
(256, 139, 'images/hotels/gallery/139/2.jpg', 'Montagna Hera'),
(257, 139, 'images/hotels/gallery/139/3.jpg', 'Montagna Hera'),
(258, 139, 'images/hotels/gallery/139/4.jpg', 'Montagna Hera'),
(259, 140, 'images/hotels/gallery/140/1.jpg', 'Ankara Gold'),
(260, 140, 'images/hotels/gallery/140/2.jpg', 'Ankara Gold'),
(261, 140, 'images/hotels/gallery/140/3.jpg', 'Ankara Gold'),
(262, 141, 'images/hotels/gallery/141/1.jpg', 'nesta ankara'),
(263, 141, 'images/hotels/gallery/141/2.jpeg', 'nesta ankara'),
(264, 142, 'images/hotels/gallery/142/1.jpg', 'ANTROYAL'),
(265, 142, 'images/hotels/gallery/142/2.jpg', 'ANTROYAL'),
(266, 142, 'images/hotels/gallery/142/3.jpg', 'ANTROYAL'),
(267, 143, 'images/hotels/gallery/143/1.jpg', 'Sozer'),
(268, 143, 'images/hotels/gallery/143/2.jpg', 'Sozer'),
(269, 143, 'images/hotels/gallery/143/3.jpg', 'Sozer'),
(270, 143, 'images/hotels/gallery/143/4.jpg', 'Sozer'),
(271, 144, 'images/hotels/gallery/144/1.jpg', 'Esat'),
(272, 144, 'images/hotels/gallery/144/2.jpg', 'Esat'),
(273, 144, 'images/hotels/gallery/144/3.jpg', 'Esat'),
(274, 144, 'images/hotels/gallery/144/4.jpg', 'Esat'),
(275, 145, 'images/hotels/gallery/145/1.jpg', 'Akdamar'),
(276, 145, 'images/hotels/gallery/145/2.jpg', 'Akdamar'),
(277, 145, 'images/hotels/gallery/145/3.jpg', 'Akdamar'),
(278, 145, 'images/hotels/gallery/145/4.jpg', 'Akdamar'),
(279, 146, 'images/hotels/gallery/146/1.jpg', 'Anemon Ege'),
(280, 146, 'images/hotels/gallery/146/2.jpg', 'Anemon Ege'),
(281, 146, 'images/hotels/gallery/146/3.jpg', 'Anemon Ege'),
(282, 146, 'images/hotels/gallery/146/4.jpg', 'Anemon Ege'),
(283, 146, 'images/hotels/gallery/146/5.jpg', 'Anemon Ege'),
(284, 147, 'images/hotels/gallery/147/1.jpg', 'Vatan'),
(285, 147, 'images/hotels/gallery/147/2.jpg', 'Vatan'),
(286, 147, 'images/hotels/gallery/147/3.jpg', 'Vatan'),
(287, 147, 'images/hotels/gallery/147/4.jpg', 'Vatan'),
(288, 148, 'images/hotels/gallery/148/1.jpg', 'Toranj'),
(289, 148, 'images/hotels/gallery/148/2.jpg', 'Toranj'),
(290, 148, 'images/hotels/gallery/148/3.jpg', 'Toranj'),
(291, 148, 'images/hotels/gallery/148/4.jpg', 'Toranj'),
(292, 148, 'images/hotels/gallery/148/5.jpg', 'Toranj'),
(295, 149, 'images/hotels/gallery/149/3.jpg', 'Sadaf'),
(297, 149, 'images/hotels/gallery/149/5.jpg', 'Sadaf'),
(298, 150, 'images/hotels/gallery/150/1.jpg', 'parsis'),
(299, 150, 'images/hotels/gallery/150/2.jpg', 'parsis'),
(300, 150, 'images/hotels/gallery/150/3.jpg', 'parsis'),
(301, 150, 'images/hotels/gallery/150/4.jpg', 'parsis'),
(302, 150, 'images/hotels/gallery/150/5.jpg', 'parsis'),
(303, 151, 'images/hotels/gallery/151/1.jpg', 'Atrak'),
(304, 151, 'images/hotels/gallery/151/2.jpg', 'Atrak'),
(305, 151, 'images/hotels/gallery/151/3.jpg', 'Atrak'),
(306, 152, 'images/hotels/gallery/152/1.jpg', 'Irman BOUTIQUE'),
(307, 152, 'images/hotels/gallery/152/2.jpg', 'Irman BOUTIQUE'),
(308, 152, 'images/hotels/gallery/152/3.jpg', 'Irman BOUTIQUE'),
(309, 152, 'images/hotels/gallery/152/4.jpg', 'Irman BOUTIQUE'),
(310, 152, 'images/hotels/gallery/152/5.jpg', 'Irman BOUTIQUE'),
(311, 153, 'images/hotels/gallery/153/1.jpg', 'singo'),
(312, 153, 'images/hotels/gallery/153/2.jpg', 'singo'),
(313, 153, 'images/hotels/gallery/153/3.jpg', 'singo'),
(314, 153, 'images/hotels/gallery/153/4.jpg', 'singo'),
(315, 153, 'images/hotels/gallery/153/5.jpg', 'singo'),
(316, 154, 'images/hotels/gallery/154/1.jpg', 'Esteghlal'),
(317, 154, 'images/hotels/gallery/154/2.jpg', 'Esteghlal'),
(318, 154, 'images/hotels/gallery/154/3.jpg', 'Esteghlal'),
(319, 154, 'images/hotels/gallery/154/4.jpg', 'Esteghlal'),
(320, 155, 'images/hotels/gallery/155/1.jpg', 'Espinas Palace'),
(321, 155, 'images/hotels/gallery/155/2.jpg', 'Espinas Palace'),
(322, 155, 'images/hotels/gallery/155/3.jpg', 'Espinas Palace'),
(323, 155, 'images/hotels/gallery/155/4.jpg', 'Espinas Palace'),
(324, 155, 'images/hotels/gallery/155/5.jpg', 'Espinas Palace'),
(325, 155, 'images/hotels/gallery/155/6.jpg', 'Espinas Palace'),
(326, 155, 'images/hotels/gallery/155/7.jpg', 'Espinas Palace'),
(327, 156, 'images/hotels/gallery/156/1.jpg', 'Baloot'),
(328, 156, 'images/hotels/gallery/156/2.jpg', 'Baloot'),
(329, 156, 'images/hotels/gallery/156/3.jpg', 'Baloot'),
(330, 156, 'images/hotels/gallery/156/4.jpg', 'Baloot'),
(331, 156, 'images/hotels/gallery/156/5.jpg', 'Baloot'),
(332, 157, 'images/hotels/gallery/157/1.jpg', 'لایف کرنر'),
(333, 157, 'images/hotels/gallery/157/2.jpg', 'لایف کرنر'),
(334, 157, 'images/hotels/gallery/157/3.jpg', 'لایف کرنر'),
(335, 157, 'images/hotels/gallery/157/4.jpg', 'لایف کرنر'),
(336, 157, 'images/hotels/gallery/157/5.jpg', 'لایف کرنر'),
(337, 158, 'images/hotels/gallery/158/1.zip', 'اتاق هتل هما'),
(338, 158, 'images/hotels/gallery/158/2.jpeg', 'اتاق دو تخته هما'),
(339, 158, 'images/hotels/gallery/158/3.jpg', 'اتاق دو تخته هتل هما'),
(340, 158, 'images/hotels/gallery/158/4.jpg', 'لابی هتل هما'),
(341, 158, 'images/hotels/gallery/158/5.jpg', 'رستوران هتل هما'),
(342, 159, 'images/hotels/gallery/159/1.jpg', 'رستوران هتل لاله'),
(343, 159, 'images/hotels/gallery/159/2.jpg', 'هتل لاله'),
(344, 159, 'images/hotels/gallery/159/3.jpg', 'هتل لاله'),
(345, 159, 'images/hotels/gallery/159/4.jpg', 'اتاق هتل لاله'),
(346, 159, 'images/hotels/gallery/159/5.jpg', 'اتاق هتل لاله'),
(347, 160, 'images/hotels/gallery/160/1.jpg', 'هتل ویستریا'),
(348, 160, 'images/hotels/gallery/160/2.jpg', 'استخر ویستریا'),
(349, 160, 'images/hotels/gallery/160/3.jpg', 'هتل ویستریا'),
(350, 160, 'images/hotels/gallery/160/4.jpg', 'هتل ویستریا'),
(351, 160, 'images/hotels/gallery/160/5.jpeg', 'هتل ویستریا'),
(352, 161, 'images/hotels/gallery/161/1.jpg', 'هتل پرشین پلازا'),
(353, 161, 'images/hotels/gallery/161/2.jpg', 'هتل پرشین پلازا'),
(354, 161, 'images/hotels/gallery/161/3.jpg', 'هتل پرشین پلازا'),
(355, 161, 'images/hotels/gallery/161/4.jpg', 'هتل پرشین پلازا'),
(356, 161, 'images/hotels/gallery/161/5.jpg', 'هتل پرشین پلازا'),
(357, 162, 'images/hotels/gallery/162/1.jpg', 'هتل قصر طلایی'),
(358, 162, 'images/hotels/gallery/162/2.jpg', 'هتل قصر طلایی'),
(359, 162, 'images/hotels/gallery/162/3.jpg', 'هتل قصر طلایی'),
(360, 162, 'images/hotels/gallery/162/4.jpg', 'هتل قصر طلایی'),
(361, 162, 'images/hotels/gallery/162/5.jpg', 'هتل قصر طلایی'),
(362, 163, 'images/hotels/gallery/163/1.jpg', 'هتل درویشی'),
(363, 163, 'images/hotels/gallery/163/2.jpg', 'هتل درویشی'),
(364, 163, 'images/hotels/gallery/163/3.jpg', 'هتل درویشی'),
(365, 163, 'images/hotels/gallery/163/4.jpg', 'هتل درویشی'),
(366, 163, 'images/hotels/gallery/163/5.jpg', 'هتل درویشی'),
(368, 165, 'images/hotels/gallery/165/1.jpg', 'اتاق هتل هما2'),
(369, 165, 'images/hotels/gallery/165/2.jpg', 'هتل هما2'),
(370, 165, 'images/hotels/gallery/165/3.jpg', 'هتل هما2'),
(371, 165, 'images/hotels/gallery/165/4.jpg', 'هتل هما2'),
(372, 165, 'images/hotels/gallery/165/5.jpg', 'هتل هما2'),
(373, 166, 'images/hotels/gallery/166/1.jpg', 'هتل پارس'),
(374, 166, 'images/hotels/gallery/166/2.jpg', 'هتل پارس'),
(375, 166, 'images/hotels/gallery/166/3.jpg', 'هتل پارس'),
(376, 166, 'images/hotels/gallery/166/4.jpg', 'هتل پارس'),
(377, 166, 'images/hotels/gallery/166/5.jpg', 'هتل پارس'),
(378, 116, 'images/hotels/gallery/116/4.jpg', 'Crowne Plaza'),
(379, 167, 'images/hotels/gallery/167/1.jpg', 'هتل کایا'),
(380, 167, 'images/hotels/gallery/167/2.jpg', 'هتل کایا'),
(381, 167, 'images/hotels/gallery/167/3.jpg', 'هتل کایا');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel_rate`
--

DROP TABLE IF EXISTS `tbl_hotel_rate`;
CREATE TABLE IF NOT EXISTS `tbl_hotel_rate` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `rate_value` int(11) NOT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel_room`
--

DROP TABLE IF EXISTS `tbl_hotel_room`;
CREATE TABLE IF NOT EXISTS `tbl_hotel_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `child_capacity` int(11) NOT NULL DEFAULT '0',
  `adult_capacity` int(11) NOT NULL DEFAULT '0',
  `room_number` int(11) NOT NULL DEFAULT '0',
  `room_price` int(11) DEFAULT NULL,
  `room_cancel` text,
  `room_condition` varchar(255) NOT NULL,
  `publication_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_hotel_room`
--

INSERT INTO `tbl_hotel_room` (`room_id`, `hotel_id`, `room_name`, `child_capacity`, `adult_capacity`, `room_number`, `room_price`, `room_cancel`, `room_condition`, `publication_status`) VALUES
(65, 143, 'اتاق یک تخته', 1, 1, 20, NULL, 'کنسلی ندارد', '1', 1),
(105, 115, 'اتاق توئین', 1, 2, 1, NULL, 'در شش ماهه اول سال 99 ، قابلیت کنسل کردن بدون پرداخت جریمه امکان پذیر است', '2', 0),
(110, 116, 'اتاق یک تخته', 1, 1, 10, NULL, 'مبلغ غیر قابل استرداد', '1', 1),
(111, 116, 'اتاق دو تخته رویال', 1, 2, 10, NULL, 'کنسلی ندارد', '1', 1),
(112, 116, 'اتاق سه تخته', 1, 3, 10, NULL, 'کنسلی  ندارد', '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_info`
--

DROP TABLE IF EXISTS `tbl_info`;
CREATE TABLE IF NOT EXISTS `tbl_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `info_rule` longtext CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `info_about` longtext CHARACTER SET utf8 NOT NULL,
  `info_main_about` text CHARACTER SET utf8 NOT NULL,
  `info_cooperation` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_info`
--

INSERT INTO `tbl_info` (`info_id`, `info_rule`, `info_about`, `info_main_about`, `info_cooperation`) VALUES
(1, '<div style=\"\">\r\n<h2 style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">بسم الله الرحمن الرحیم</h2><div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\"><span style=\"font-size: 10pt;\">&nbsp; &nbsp; &nbsp; &nbsp;(</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(74, 74, 74); font-family: IRANSansWeb_FaNum; font-size: 17px;\">اوصيكم بتقوي الله و نظم امركم</span><span style=\"font-size: 10pt;\">) علی (ع)&nbsp; &nbsp; &nbsp;</span></div><div style=\"font-weight: normal; font-size: 10pt; text-align: center;\"><span style=\"font-size: 13.3333px; font-family: Arial, Verdana;\">&nbsp; &nbsp; شمارا به تقواي الهي و نظم در کارهايتان توصيه مي کنم&nbsp;&nbsp;</span></div><div style=\"font-weight: normal; font-size: 10pt; text-align: center;\"><br></div><div style=\"text-align: center;\"><b style=\"\"><font size=\"6\">قوانین و مقررات سایت</font></b></div><h1 style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\"><font size=\"5\">(قرارداد فروش سه جانبه تضمین شده)</font></h1>\r\n<p style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: center;\">&nbsp;</p>\r\n</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: right;\">\r\n<div style=\"text-align: justify; \"><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><b>ماده 1 )</b> <b>موضوع توافقنامه</b> : عرضه و فروش انواع تورهای شرکت ها و دفاتر خدمات گردشگری یا زیارتی دارای پروانه فعالیت و&nbsp;</span>تضمین اجرای خدمات گردشگری و زیارتی ، عرضه شده در سایت okshod .com&nbsp; .</div><div style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><span style=\"font-size: 13.3333px;\">&nbsp;</span></div>\r\n<div style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><span style=\"font-family: Arial, Verdana;\"><span style=\"font-size: 13.3333px;\"><strong>ماده 2 ) : طرفین توافقنامه</strong>&nbsp;</span></span></div>\r\n<div style=\"text-align: justify; \">الف ) شرکت تفریحات پنج قاره به عنوان مالک و صاحب امتیاز سایت okshod .com&nbsp; ، ضامن ارائه&nbsp; کلیه خدمات گردشگری و زیارتی عرضه شده در این سایت می باشد ، و اختصارا در این توافقنامه (( ضامن )) یا مدیریت سایت نامیده می شود .&nbsp;</div><div style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><b><br></b></div><div style=\"text-align: justify; \"><b><span style=\"font-family: Arial, Verdana; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">ب )</span><span style=\"font-family: Arial, Verdana; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"> </span></b>شرکت یا دفتر خدمات گردشگری یا زیارتی ، که اقدام به عرضه و فروش انواع خدمات گردشگری یا زیارتی در سایت&nbsp; &nbsp;okshod.com&nbsp; نموده است ، که به عنوان مضمون عنه این توافقنامه ، اختصارا (( آژانس )) نامیده میشود&nbsp;</div>\r\n<div style=\"text-align: justify; \"><span style=\"font-family: Arial, Verdana; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><strong>ج )</strong> </span>شخص حقیقی که اقدام به ثبت عضویت خود یا خرید انواع خدمات گردشگری یا زیارتی از سایت okshod.com می نماید ، که مضمون له این قرارداد بوده و اختصارا در این قرارداد (( مسافر )) نامیده می شود .</div>\r\n<div style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><span style=\"font-family: Arial, Verdana;\"><span style=\"font-size: 13.3333px;\">&nbsp;</span></span></div>\r\n<div style=\"text-align: justify; \"><span style=\"font-family: Arial, Verdana; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><b>ماده 3 )</b> </span>محل تنظیم این توافقنامه تهران ، خیابان مدنی ، جنب ایستگاه مترو فدک ، مجتمع تجاری اداری پالمیرا ، طبقه سوم واحد326 می باشد .</div>\r\n<div style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><span style=\"font-family: Arial, Verdana;\"><span style=\"font-size: 13.3333px;\">&nbsp;</span></span></div>\r\n<div style=\"text-align: justify; \"><b><span style=\"font-family: Arial, Verdana; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">ماده 4 ) </span>مدت اعتبار این توافقنامه :</b></div>\r\n<div style=\"text-align: justify; \">برای ضامن از تاریخ شروع فعالیت سایت تا تاریخ خاتمه فعالیت سایت می باشد .</div>\r\n<div style=\"text-align: justify; \">برای آژانس از تاریخ عضویت در سایت تا تاریخ خاتمه فعالیت یا لغو عضویت&nbsp; در سایت می باشد .</div>\r\n<div style=\"text-align: justify; \">برای مسافر عضو سایت از تاریخ ثبت عضویت در سایت تا تاریخ خاتمه یا لغو عضویت در سایت می باشد .</div>\r\n<div style=\"text-align: justify; \">برای مسافر غیر عضو: از تاریخ قطعی شدن فرآیند خرید خدمات از سایت (صدور فاکتور قطعی) ، تا 7&nbsp; روز .پس از پایان برگزاری خدمات خریداری شده از سایت می باشد&nbsp;</div><div style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><span style=\"font-size: 10pt;\"><br></span></div>\r\n<div style=\"text-align: justify; \"><b>ماده 5 ) آدرس طرفین توافقنامه :</b></div>\r\n<div style=\"text-align: justify; \">آدرس پستی یا پست الکترونیک مدیریت سایت و آژانسهای فعال در سایت ، همان آدرسهائی می باشد که در این سایت درج شده است .</div>\r\n<div style=\"text-align: justify; \">آدرس پستی یا پست الکترونیک خریدار عضو سایت ، یا نماینده مسافرین ، همان آدرسی می باشد که در هنگام خرید خدمات یا عضویت در سایت ، وارد شده است .</div>\r\n<div style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\">&nbsp;</div>\r\n<div style=\"text-align: justify; \"><b>تبصره</b> : هر گونه اعلام یا ابلاغ از طرف هر یک از طرفین توافقنامه ، به آدرس پستی یا آدرس پست الکترونیک طرف مقابل ،&nbsp; به منزله ابلاغ رسمی به وی&nbsp; تلقی خواهد شد . وطرفین موظفند به محض تغییر آدرس خود ،&nbsp; نسبت به اصلاح آدرس خود در این سایت اقدام نمایند . در غیر این صورت هر اعلام و ابلاغی که به آدرس قدیم هر طرف ابلاغ گردد ، به منزله ابلاغ رسمی تلقی خواهد گردید .</div>\r\n</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: justify;\">&nbsp;</div><div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: justify;\"><br></div>\r\n<div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: right;\">\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><strong><span lang=\"FA\">ماده 6) مبلغ خدمات :&nbsp;</span></strong></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">6-1)</strong><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"> </strong>مبلغ این قرارداد مبلغی است ریالی یا ارزی ، که مسافر برای هر فاکتور صادره در این سایت ، به صورت آنلاین پرداخت می نماید یا به کارگزاران تور پرداخت می نماید .</p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">6-2)</strong><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"> </strong>آژانس نمی تواند پس از صدور فاکتور قطعی فروش، مازاد بر مبلغی که در سایت اعلام نموده است ، مبلغ دیگری از مسافر دریافت نماید ، یا مشخصات تور را تغییر دهد . به جزء در مواردی خاص که در این توافقنامه پیش بینی شده باشد ، یا با&nbsp; توافق کتبی&nbsp; مسافر بوده باشد .</p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><strong>6-3)</strong> </span>هزینه دریافت هرگونه خدماتی مازاد بر آنچه در برنامه و مشخصات تور در سایت درج شده است ، بر عهده مسافر می باشد . و مسافر می بایست مبلغ آنرا شخصا به کارگزار ارائه کننده خدمات پرداخت نماید.</p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">6-4)</strong><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"> </strong>مسئولیت تامین هزینه های ارزی تور در هنگام خرید تور خارجی از سایت&nbsp; بر عهده مسافر بوده ، و در کشور مقصد ،&nbsp; به مجری تور یا مدیریت هتل ( ضمن اخذ رسید ) پرداخت خواهد شد .</p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><b>6-5)</b></span><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"> </span>در فاصله زمانی اخذ فاکتور فروش خدمات از سایت تا تاریخ تحویل مدارک مسافرین به آژانس و صدور فاکتور قطعی فروش خدمات در سایت ، آژانس مجاز به تغییر نرخ خدمات خود به دلیل درج اشتباه سن مسافرین از طرف نماینده مسافرین یا نوسانات نرخ ارز یا پرواز و هتل می باشد. در این صورت فاکتور اصلاحی برای نرخ اصلاحی خدمات خریداری شده صادر میگردد و مسافر مجاز به پرداخت فاکتور اصلاحی و قطعی کردن خرید و اخذ فاکتور فروش خدمات از سایت یا لغو یکطرفه خرید خود&nbsp; میباشد بدیهی است در صورت لغو خرید انجام شده مدیریت سایت موظف است ظرف مدت 48 ساعت وجوه پرداختی مسافر را عودت دهد.</p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><b>6-6)</b><span style=\"font-weight: normal;\"> مالیات و ارزش افزوده هر یک از خدمات عرضه شده در سایت و فاکتور های صادر شده در این سایت بر عهده آژانس مربوطه میباشد.</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><br></p>\r\n<div style=\"font-weight: normal; text-align: right; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><b>ماده 7 ) تعاریف :</b></div>\r\n<div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">&nbsp;</div>\r\n<div style=\"\">\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-1)</strong></span><span lang=\"FA\" style=\"font-size: 13.3333px;\"><strong>شرایط بهره مندی از تخفیف ویژه اعضای سایت</strong>&nbsp;:</span><span style=\"font-size: 13.3333px;\">منظور مبلغی است مضاف بر تخفیف کلی داده شده و منظور شده در قیمت هر تور میباشد که از طرف هر آژانس صرفا جهت پرداخت به نماینده مسافرین تعیین و در نظر گرفته شده است و مبلغ آن در اطلاعات هر تور درج شده است تا به ازای هر خرید قطعی و اجراء شده برای هر نفر به نماینده مسافرین پرداخت گردد . و پس از قطعی شدن هر فاکتور خرید خدمات ، و صدور فاکتور قطعی فروش از سایت و اجرای خدمات ، مشروط به عدم ثبت شکایتی در خصوص تور اجرا شده ، از مبلغ قابل پرداخت به آژانس کسر گردیده و در حساب بستانکاری نماینده مسافرین منظور میگردد و در پایان هر ماه به محض مطالبه نماینده مسافرین به حساب وی واریز خواهد شد.</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span style=\"font-size: 13.3333px;\"><b>7-2)&nbsp;</b></span><span lang=\"FA\" style=\"font-size: 10pt;\"><strong style=\"font-size: 10pt;\">سایت</strong><font face=\"Arial, Verdana\" style=\"font-size: 10pt;\"><span style=\"font-size: 10pt;\"><b>&nbsp;</b>:&nbsp;</span></font>منظور از سایت در این توافقنامه ، یک فضای مجازی ، قابل دسترسی در شبکه اینترنت جهانی&nbsp; با دامینهای&nbsp;</span><span dir=\"LTR\" style=\"font-size: 10pt;\">okshod.com&nbsp;</span><span lang=\"FA\" style=\"font-size: 10pt;\">&nbsp;&nbsp;می باشد . که در آن انواع خدمات گردشگری و زیارتی جهت فروش به مسافران و خریداران عضو یا غیر عضو سایت عرضه شده است .&nbsp;</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-3)مدیریت سایت یا ضامن</strong><font face=\"Arial, Verdana\" style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><span style=\"font-size: 10pt;\"> : </span></font>منظور صاحب امتیاز سایت </span><span dir=\"LTR\" style=\"\">okshod.com</span><span lang=\"FA\" style=\"\"> ، یا همان شرکت تفریحات پنج قاره می باشد .</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-4)عضو سایت</strong><font face=\"Arial, Verdana\" style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><span style=\"font-size: 10pt;\"><b> </b>: </span></font>منظور از عضو سایت در این توافقنامه ، شخصی حقیقی است که اطلاعات مورد درخواست در بخش عضویت این سایت را تکمیل نموده باشد ، و درسایت برای خود حساب کاربری با رمز عبور شخصی ایجاد کرده باشد .</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-5)ساعات کاری</strong><font face=\"Arial, Verdana\" style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span style=\"font-size: 10pt;\"><b style=\"\"> <span style=\"font-weight: normal;\">:</span></b> </span></font>منظور از ساعات کاری ،ساعات کاری آژانس کارگزار و مدیریت سایت ( ضامن ) می باشد، که محدوده آن صرفا در روزهای غیر تعطیل ، بین ساعات 9 صبح الی 5 بعداز ظهر هر روز می باشد <font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\">.</span></font></span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-6)قطعی شدن خرید</strong><font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"> : </span></font>منظور مجموعه اقداماتی به شرح و ترتیب ذیل می باشد ، که در نهایت منجر به خرید قطعی خدمات گردشگری و زیارتی از سایت و صدور فاکتور قطعی فروش خدمات می گردد . ( که مشروح جزئیات&nbsp; آن در بخش راهنمای سایت ، به مسافران آموزش داده می شود )</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">الف )</strong><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\">&nbsp;</strong></span>ورود به سایت در شبکه جهانی اینترنت و مشاهده نرخ و مشخصات خدمات گردشگری و زیارتی عرضه شده در سایت .&nbsp;</p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">ب )</span> </b>انتخاب خدمات گردشگری یا زیارتی مد نظر جهت خرید ، و تکمیل اطلاعات مورد درخواست سایت در خصوص اطلاعات فردی مسافران ، و نوع خدمات مورد نیاز از فبیل تعداد اطاق یا نوع وسیله نقلیه&nbsp; و غیره در سایت.</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">ج )</span> </b>تائید پیش فاکتور خرید خدمات ، و پرداخت مبلغ آن ، و دریافت کد پیگیری خرید ، از طریق پیامک و ایمیل و دریافت فاکتور فروش.</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">د)</b><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"> </b>تحویل کلیه مدارک مورد نیاز جهت اجرای تور به آژانس کارگزار ، و اخذ تائیدیه آژانس در سایت ، مبنی بر تحویل گرفتن مدارک مورد نیاز از نماینده مسافرین یا صدور فاکتور اصلاحی و پرداخت مبلغ آن توسط نماینده مسافرین.</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">ه)</b> دریافت فاکتور قطعی فروش خدمات خریداری شده از سایت،</span><span style=\"font-size: 13.3333px;\">&nbsp;</span><span style=\"font-size: 13.3333px;\">که به تائید آژانس کارگزار رسیده است.</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-7)نماینده مسافرین</strong><font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><b> </b>: </span></font>منظور شخصی حقیقی است که به نمایندگی از مسافران اقدام به ورود اطلاعات مسافرین در سایت و &nbsp;قطعی کردن خرید خدمات از سایت می نماید ، این شخص که عضو سایت باید باشد می تواند از میان لیست اسامی مسافران هر فاکتور باشد ، یا نباشد ، در هر صورت مدیریت سایت و آژانس کارگزار&nbsp; نسبت به خرید قطعی شده از سایت ، فقط نسبت به این فرد پاسخگو می باشند و این شخص طرف قرارداد در این توافقنامه خواهد بود و لاغیر ، و صرفا این شخص مجاز به مراجعه به آژانس و مدیریت سایت ، جهت پیگیری و ابطال خرید خدمات قطعی شده ، و دریافت وجوه پرداختی و طرح و ثبت شکایت و اعلام نظر در سایت می باشد .</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-8)خدمات</strong><font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"> : </span></font>منظور انواع خدمات گردشگری و زیارتی اعلام شده یا نشده در طول اجرای تور می باشد ، که مقررشده است به مسافر داده شود یا بدون هیچ قراری به مسافر داده می شود .</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-9)کاربر</strong><font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"> : </span></font>شخصی حقیقی که با اهداف مشاهده جزئیات یا خرید یا استفاده از بخشهای مختلف سایت ، وارد سایت می گردد اعم از اینکه عضو سایت باشد یا نباشد.</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-10)حساب کاربری</strong><font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><b> </b>: </span></font>فضائی اختصاصی در سایت می باشد ، که اطلاعات مختلف مربوط به هر مسافر یا آژانس یا مدیریت سایت در آن ذخیره شده است .</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-11)کد پیگیری</strong><font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><b> </b>:</span></font> عددی است ، که پس ازصدور پیش فاکتور خرید خدمات مسافر ، از طرف مدیریت سایت ، به شماره تلفن و آدرس پست الکترونیک مسافر ،&nbsp; به صورت پیامک و ایمیل ارسال می گردد.</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-12)تور داخلی</strong><font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><b> :</b> </span></font>مجموعه ای متشکل از انواع خدمات گردشگری یا زیارتی است ، که در داخل کشور اجراء و به مسافر داده می شود .</span></p>\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">7-13)تور خارجی</strong><font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><b> </b>: </span></font>مجموعه ای متشکل از انواع خدمات گردشگری یا زیارتی است که بخشی از آن در داخل و بخشی از آن درخارج از کشور اجراء و به مسافر داده می شود .</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b>7-14) کارگزار : </b>شخص حقیقی یا حقوقی است که تمام یا بخشی از خدمات هر فاکتور را به مسافران ارائه می نماید.</span></p>\r\n<div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span style=\"font-weight: normal;\">7-15)</span><b>هک </b>: ورود غیر مجاز هر فرد حقیقی به سایت به منظورمشاهده یا سرقت اطلاعات بخشهای مسدود شده و محرمانه سایت ، یا ایجاد اختلال در روند طبیعی&nbsp;<span style=\"font-size: 10pt;\">کارکرد سایت ، یا آسیب رساندن به بخشهای نرم افزاری و سخت افزاری سایت</span></div><div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span style=\"font-size: 10pt;\"><br></span></div>\r\n<div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">&nbsp;</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><strong>ماده 8) شرایط عضویت در سایت:</strong></div>\r\n<div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">8-1) </strong>کلیه اشخاص حقیقی می توانند با ورود به سایت و تکمیل اطلاعات مورد درخواست ، ضمن ایجاد و تعریف نام کاربری و رمز عبور برای خود ، عضو سایت گردند .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">8-2)</span> </b>عضویت در سایت رایگان و اختیاری می باشد ، و کلیه اشخاص حقیقی صرفا پس از عضویت در این سایت می توانند نسبت به خرید خدمات از این سایت اقدام نمایند .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">8-3)</strong> صرفا افراد بالای 18 سال تمام ، حق عضویت و خرید از این سایت را دارند .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">8-4)</span> </b>از آنجائیکه احراز هویت اعضای سایت ، بر اساس مشخصات و اطلاعاتی که اعضای سایت در بخش عضویت سایت وارد نموده اند ، انجام خواهد گرفت ، لذا ضروری است کاربران سایت در درج اطلاعات هویتی خود دقت لازم را مبذول نمایند ، در غیر این صورت مدیریت سایت در برابر اعضائی که اطلاعات کاربری آنها با هویت شناسنامه ای آنها مطابقت ندارد پاسخگو نخواهد بود .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">8-5)</strong> هر گاه اعضای سایت ، نام کاربری و رمز عبور خود را فراموش نموده باشند ، می توانند مجددا نسبت به اخذ نام کاربری و رمز عبور جدید برای خود از سایت اقدام نماید .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">8-6)</strong> هر شخص حقیقی فقط حق ایجاد و استفاده از یک حساب کاربری در سایت را دارد . هرگاه یک عضو با دو یا چند نام و حساب کاربری در این سایت فعالیت نماید ،مدیریت سایت مجاز خواهد بود تمامی حسابهای کاربری عضو را بدون اطلاع و موافقت وی حذف یا مسدود نماید .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">8-7)</span> </b>هرگاه هر یک از اعضا یا کاربران سایت ، با سوء استفاده از نام و کاربری و رمز عبور خود ، اقدام به نفوذ غیر مجاز ( هک ) بخشهای مسدود شده سایت بنمایند ، این اقدام مجرمانه ، مصداق ورود غیر مجاز و سرقت و تخریب سایت تلقی خواهد شد ، و مدیریت سایت مجاز به تعقیب کیفری و حقوقی شخص متخلف خواهد بود .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">8-8)</strong> اعضای سایت موظف می باشند از انتخاب اسامی ناشایست به عنوان نام کاربری خود ، اجتناب نمایند ، در غیر این صورت ، مدیریت سایت مجاز خواهد بود ضمن مسدود نمودن حساب کاربری این اشخاص ، آنان را درلیست سیاه سایت قراردهد </span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">8-9)</span> </b>کلیه اعضای سایت با قبول اولین ضوابط و مقررات این سایت ، خود را مقید به قبول اصلاحات و الحاقیه های بعدی و اعمال شده در مقررات سایت نمودند .</span></p>\r\n</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">&nbsp;</div>\r\n<div style=\"font-weight: normal; text-align: right; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><strong>ماده 9 ) تخفیف ویژه نماینده مسافرین :</strong></div>\r\n<div style=\"\">\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><font face=\"Arial, Verdana\" style=\"\"><span style=\"font-size: 13.3333px;\"><b>9-1)</b> اعضای سایت می توانند به عنوان نماینده مسافر، نسبت به خرید خدمات از سایت ، برای شخص خود یا همراهان یا اشخاص ثالث ، اقدام نموده و از مزایای دریافت تخفیف ویژه نماینده مسافرین به نفع خود بهره مند گردند.</span></font></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><font face=\"Arial, Verdana\" style=\"\"><span style=\"font-size: 13.3333px;\"><b>9-2)</b> در هر فاکتور خرید خدمات از سایت ، نماینده مسافرین میتواند جزء مسافران و خریداران خدمات در آن فاکتور باشد یا نباشد.</span></font></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><font face=\"Arial, Verdana\" style=\"\"><span style=\"font-size: 13.3333px;\"><b>9-3)</b> آژانس قبول نموده مضاف بر تخفیف کلی منظور شده برای هر تور ، به ازای فروش هر تور به هر نفر در هر فاکتور قطعی شده ، تخفیف ویژه ای جهت پرداخت به نماینده مسافرین تعیین و در سایت درج نماید. این مبلغ مشروط به اجرای تور و عدم ثبت شکایتی در خصوص آن در سایت از مبلغ بستانکاری هر آژانس بابت هر فاکتور کسر و به حساب نماینده مسافرین منظور خواهد شد و در پایان هر دوره 3 ماهه به محض مطالبه نماینده مسافرین به حساب وی واریز خواهد شد.</span></font></p><p dir=\"RTL\" style=\"font-weight: normal; text-align: justify;\"><span style=\"font-size: 13.3333px;\"><b>9-4)</b> هرگاه پس از اجرای هر فاکتور قطعی شده در سایت ، از طرف نماینده مسافرین نسبت به کمیت یا کیفیت اجرای تور ، شکایتی ثبت گردد و ظرف مدت 7 روز پس از ثبت آن در سایت ، منجر به صلح و سازش فی مابین طرفین نگردد. در این صورت تخفیف ویژه به نماینده مسافرین تعلق نخواهد گرفت.</span></p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">&nbsp;</p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><strong><span lang=\"FA\">ماده 10 ) تعهدات مدیریت سایت (ضامن):</span></strong></p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">10-1)</span> </b>مدیریت سایت ( ضامن ) ، اجرای کلیه خدمات گردشگری و زیارتی عرضه شده از طرف آژانسهای فعال در این سایت را تضمین می نماید</span> <span lang=\"FA\" style=\"\">&nbsp;. و در صورت انصراف آژانس از اجرای خدمات تعهد شده در سایت ، مدیریت سایت وجوه دریافتی از مسافر را &nbsp;ظرف مدت 48 ساعت به حساب نماینده مسافرین واریز خواهد نمود <font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\">.</span></font></span></p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">10-2)</strong> مدیریت سایت مضاف بر ضمانت اصل اجرای خدمات عرضه شده توسط آژانسهای فعال&nbsp; در سایت ، ضامن کمیت و کیفت خدمات عرضه شده توسط آژانسها در سایت می باشد ، مشروط بر آنکه قصور آژانس پس از رسیدگی توسط داور این قرارداد &nbsp;اثبات گردد . </span></p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><b style=\"\"><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-variant-ligatures: normal; font-variant-caps: normal;\">10-3)</span> </b>مدیریت سایت ( ضامن ) متعهد می گردد ، نسبت به نحوه عرضه و خرید و فروش&nbsp; انواع خدمات گردشگری و زیارتی&nbsp; ، و عملکرد&nbsp; آژانسهای فعال در این سایت نظارت و کنترلی دقیق اعمال نموده ، و مانع فعالیت اشخاص فاقد صلاحیت و پروانه&nbsp; در این سایت گردد . و صرفا خدمات آژانسهای دارای مجوز رسمی از مراجع ذیربط را در سایت عرضه نماید .</span></p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">10-4)</span> </b>هرگاه آژانس &nbsp;در اجرای تعهداتش قصور نموده ، و پس از ثبت شکایت مسافر و رسیدگی آن توسط داور این قرارداد ، آژانس &nbsp;محکوم به پرداخت خسارت یا استرداد وجه به مسافر گردد ، و از پرداخت آن به مسافر خودداری نماید ، مدیریت سایت به عنوان ضامن ، مبلغی که آژانس محکوم به پرداخت آن گردیده است را به مسافر پرداخت خواهد نمود ، و مبلغ پرداخت شده به مسافر را به حساب بدهکاری آژانس &nbsp;منظور ، و از منبع ودایع یا مطالبات یا اسناد تضمینی آژانس نزد مدیریت سایت، &nbsp;یا از هر طریق قانونی دیگر ، اقدام به وصول آن خواهد نمود .</span></p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">10-5)</span> </b>مدیریت سایت ( ضامن ) متعهد می گردد ، اطلاعات مسافران را به صورت محرمانه و رمزنگاری شده در این سایت ذخیره و نگهداری نماید ، به گونه ای که در معرض دید و استفاده اشخاص ثالث قرار نگیرد .</span></p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">10-6)</span> </b>مدیریت سایت ( ضامن ) متعهد می گردد سوابق گردش مالی مسافران و آژانسها و اعضای سایت را به گونه ای که قابل پیگیری و ارائه باشند حداقل برای مدت 2 سال نزد خود نگهداری نماید .</span></p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">10-7)</strong> مدیریت سایت متعهد می گردد ، همه روزه از اطلاعات سایت یک کپی در فضای امن دیگری ذخیره نموده ، به گونه ای که به محض بروز خرابی یا اختلال یا نفوذ غیر مجاز ( هک ) در سایت ، امکان راه انداز ی مجدد سایت ممکن گردد .</span></p>\r\n<p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">10-8)</span> </b>مدیریت سایت موظف است در راستای اطلاع رسانی صحیح و بیطرفانه به مسافران ، نظرات مثبت و منفی نماینده مسافران در خصوص هر تور&nbsp; را پس از انجام بررسیهای لازم&nbsp; در مورد صحت و سقم نظرات داده شده ،&nbsp; در ستون نظرات هر تور درج نماید .</span></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><b>10-9) </b>مدیریت سایت متعهد میگردد نهایتا پس از گذشت 10 روز کاری از اجرای هر فاکتور قطعی شده در سایت ، مبلغ هر فاکتور را پس از کسر مبالغ تخفیف ویژه نماینده مسافرین و هزینه های درج آگهی در سایت ، به حساب آژانس مربوطه واریز نماید. مشروط بر اینکه ، پس از گذشت 7 روز کاری از اجرای هر فاکتور ، هیچ شکایتی در خصوص آن در&nbsp; سایت ثبت نگردیده باشد</span></p><p dir=\"RTL\" style=\"font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><span lang=\"FA\" style=\"\"><b>10-10)</b> مدیریت سایت مجاز است بر اساس ضوابطی که خود تعیین و به کلیه آژانس های فعال در سایت ابلاغ خواهد نمود ، عملکرد هر آژانس در سایت را رتبه بندی نموده و رتبه هر آژانس در سایت را در معرض دید کلیه کاربران و اعضای سایت قرار دهد.</span></p>\r\n</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">&nbsp;</div>\r\n<div style=\"font-weight: normal; text-align: right; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><b>ماده 11) تعهدات آژانس :</b></div>\r\n<div style=\"font-weight: normal; text-align: right; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">&nbsp;</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><b>11-1)</b>آژانس متعهد می گردد خدمات گردشگری و زیارتی عرضه شده و فروخته شده در این سایت را مطابق مشخصات درج شده در سایت اجراء نماید</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">11-2)</span> </b>آژانس موظف به درج صحیح مشخصات کامل هتل و ظرفیت انواع اطاقها و قابلیت تخت اضافه هر اطاق ( &nbsp;</span><span dir=\"LTR\" style=\"\">Extera</span><span lang=\"FA\" style=\"\"> ) و دیگر خدمات گردشگری هر تور در سایت می باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">11-3)</strong> آژانس موظف به کنترل مدارک مسافر و مهلت اعتبار پاسپورتها و ویزاهای مسافرین می باشد . البته این مسئولیت مانع مسئولیت مسافر از بابت کنترل مدارکی که در اختیارش بوده یا قرار گرفته نمی باشد ، و در صورت بروز هر مشکلی از بابت عدم کنترل مدارک مورد نیاز جهت اجرای تور ، آژانس و مسافر به نسبت مساوی مسئول جبران خسارات وارده به مسافر می باشند .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">11-4)</strong> آژانس موظف است در کلیه تورهای داخلی و خارجی خود ، کلیه مسافرین خود را تحت پوشش بیمه حوادث قرار دهد . و در این صورت آژانس هیچگونه مسئولیتی از بابت بروز حوادث برای مسافر نخواهد داشت .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">11-5)</span> </b>مسئولیت کلیه متون درج شده در مشخصات و جزئیات هر تور بر عهده همان آژانسی است که آن مطالب را در سایت درج نموده است .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">11-6)</strong> هرگاه نوع خدمات گردشگری و زیارتی عرضه شده در سایت ، به گونه ای باشد که برای اجرای آن نیازمند به حد نصاب رسیدن تعداد معینی از مسافرین باشد ، آژانس موظف است این مورد را در بخش توضیحات تور به اطلاع مسافرین و کاربران سایت برساند .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span dir=\"LTR\" style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><span style=\"font-size: 13.3333px;\">&nbsp;<b>(</b></span><b>11-7</b></span>آژانس موظف است هر وجه ریالی و ارزی که مسافر جهت اجرای کامل تور، میبایست پرداخت نماید را در بخش اطلاعات هر تور وارد نموده و به اطلاع مسافرین برساند .</p><p dir=\"RTL\" style=\"text-align: justify; \">11-8) کلیه آژانسهایی که اقدام به عرضه و فروش خدمات خود در سایت می نمایند می بایست در طول مدت عرضه خدمات خود در سایت ، دارای پروانه معتبر از مراجع ذیربط باشند. هرگاه پس از درج خدمات قابل فروش آژانس در سایت ، پروانه فعالیت آژانس به هر علتی لغو گردید . مدیریت سایت مجاز است پنل کاربری آژانس را مسدود ، و از درج خدمات آژانس درسایت جلوگیری نماید.</p><p dir=\"RTL\" style=\"text-align: justify; \">11-9)آژانس موظف است در اولین ساعات کاری اطلاع از صدور پیش فاکتور فروش خدمات خود در سایت ، با نماینده مسافرین تماس برقرار نموده و نسبت به اخذ مدارک مورد نیاز جهت اجرای تور اقدام نماید.</p><p dir=\"RTL\" style=\"text-align: justify; \"><br></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><strong><span dir=\"LTR\">:ماده 12) تعهدات مسافر</span></strong></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-1)</strong> نماینده مسافرین و&nbsp;مسافر اعم از اینکه عضو </span><span dir=\"LTR\" lang=\"FA\" style=\"\">&nbsp;</span><span lang=\"FA\" style=\"\">این سایت باشد یا نباشد ، با مطالعه و تائید ضوابط سایت ، خود را متعهد به قبول و اجرای کلیه مفاد این توافقنامه می نماید، و اقرار می نمایدبا اطلاع از همه ضوابط و مقررات سایت ، و قوانین تجارت الکترونیک ، اقدام به خرید خدمات از این سایت نموده اند.</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-2)</strong> صرف عضویت یا خرید قطعی شده ( بعد از صدور فاکتور قطعی فروش خدمات ) ، توسط هر شخص حقیقی ، از این سایت به منزله مطالعه و قبول کلیه ضوابط و مقررات این سایت می باشد . و پس از عضویت یا خرید از این سایت هیچ عذری از طرف مسافر یا نماینده مسافرین مسموع و پذیرفته نمی باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-3)</span> </b>مسافر و نماینده مسافرین در هر خرید خدمات ازاین سایت متفقا ضامن اجرای کلیه مفاد این قرارداد می باشند .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-4)</strong> مسئولیت حفظ ونگهداری&nbsp; و پیشگیری&nbsp; از هر گونه سوء استفاده از نام کاربری و رمز عبور هریک از اعضای سایت&nbsp; بر عهده عضو می باشد ، و مدیریت سایت از این بابت هیچگونه مسئولیتی نداشته و پاسخگو نخواهد بود .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-5)</strong> هرگاه مسافر پس از قطعی شدن فرآیند خرید خدمات از این سایت ( بعد از صدور فاکتور قطعی فروش خدمات ) ، نسبت به تمدید یا تعویض یا تغییر مشخصات پاسپورت و دیگر اوراق هویتی خود از قبیل شناسنامه و کدملی ، اقدام نموده باشد ، موظف است به محض انجام هر یک از این اقدامات ، رونوشت تغییرات به عمل آمده را ضمن اخذ رسید به آژانس کارگزار تحویل داده یا در ساعات اداری به آدرس پست الکترونیک ( ایمیل ) آژانس کارگزار ارسال نماید ، بدیهی است در غیر این صورت مسئولیت بروز هرگونه مشکل در خدمات قابل ارائه به مسافر ، نماینده مسافرین و مسافر متفقا مسئول خواهند بود .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-6)</strong><font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\">&nbsp;</span></font>نماینده مسافر موظف است شماره موبایل و آدرس پست الکترونیک ( ایمیل ) خود را به طور صحیح در سایت و پرسشنامه های آژانس کارگزار وارد نماید ، تا در مواقع اضطراری امکان اطلاع رسانی به موقع به نماینده مسافرین ممکن گردد . بدیهی است خسارات وارده به هریک از مسافرین در اثر درج اشتباه شماره موبایل یا آدرس پست الکترونیک ، بر عهده نماینده مسافرین می باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-7)</strong> در هنگام خرید کلیه انواع خدمات ارائه شده در این سایت ، نماینده مسافرین موظف است وضعیت خود و کلیه مسافرین گروه را از لحاظ داشتن معلولیت جسمی ، بارداری ، یا داشتن بیماریهای خاص از قبیل : سرع و تشنج ، یا بدون همراه بودن کودک ، را در ستون مربوطه درج نماید .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-8)</span> </b>در کلیه انواع خدمات عرضه شده در این سایت ، مسافر متعهد می گردد ، در طول اجرای خدمات عرضه شده در این سایت ، کلیه ضوابط اعلام شده از سوی مدیر و عوامل اجرائی تور را رعایت نموده و در صورت وارد نمودن خسارت به اموال منقول و غیر منقول مورد استفاده در حین اجرای تور از قبیل : هتلها ، رستورانها ، و وسایل نقلیه ، شخصا مسئول جبران خسارات وارده می باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-9)</span> </b>مسافر موظف است ضمن کسب اطلاع در خصوص برنامه های خدمات توری که از سایت خریداری نموده است ، راس ساعات اعلام شده جهت شرکت و استفاده از آن برنامه ها حاضر گردد ، بدیهی است در غیر این صورت ، مسافر شخصا مسئول جبران خسارت وارده به خود می باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">12-10)</strong> مسئولیت حفظ اموال و مدارک شخصی هر مسافر در طول مدت اجرای&nbsp; خدمات تور&nbsp; بر عهده شخص مسافر می باشد . و در صورت مفقود شدن آنها هیچ مسئولیتی بر عهد آژانس کارگزار نخواهد بود .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><b>12-11) </b></span>نماینده مسافرین موظف است سن مسافرین را بر اساس روز شروع تاریخ برگزاری تور در سایت درج نماید . بدیهی است در غیر این صورت مسئولیت بروز هر گونه مشکل یا تغییر قیمت نرخ خدمات مسافرین برعهده نماینده مسافرین خواهد بود.</p><p dir=\"RTL\" style=\"text-align: justify; \"><br></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><strong><span lang=\"FA\">ماده 13) شرایط خدمات پروازی:</span></strong></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">13-1)</span> </b>انواع خدمات پروازی عرضه&nbsp; شده در این سایت ، مشمول قوانین حمل ونقل هوائی که در تاریخ اکتبر 1939 در ورشو به امضا رسیده و اصلاحیه آن که در تاریخ28 سپتامبر 1995 در لاهه به تصویب رسیده است ، و مقررات تصویب شده توسط سازمان هواپیمائی کشوری می باشد . که مسافر موظف به رعایت آنها می باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">13-2)</strong> بلیطهای چارتر پروازهوائی &nbsp;که در تورهای داخلی یا خارجی به مسافر داده می شوند . مشمول ضوابط بلیطهای چارتر می باشند و غیر قابل استرداد و غیر قابل تغییر نام و تاریخ می باشند . و هرگاه بنا به دلایلی از قبیل : ( عدم&nbsp; صدور ویزای مسافر ، انصراف مسافر از تور یا پرواز ، جلوگیری از خروج مسافر در فرودگاه ) ، پس از قطعی شدن فرآیند خرید خدمات از سایت ( بعد از صدور فاکتور قطعی فروش خدمات ) ، امکان استفاده از پرواز توسط مسافر ممکن نگردد ، هیچ مبلغی از بابت لغو پرواز و بلیط هواپیما به مسافر مسترد نخواهد گردید . </span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">13-3)</strong> هرگاه نوع بلیط هوائی داده شده به مسافر ، از نوع سیستمی باشد ، در صورت لغو بلیط مسافر به هر دلیل ، مطابق ضوابط کنسلی هر ایرلاین ، و با توجه به تاریخ و ساعت ثبت کنسلی هر بلیط &nbsp;، مسافر می تواند نسبت به دریافت مبلغ قابل استرداد بلیط لغو شده &nbsp;اقدام نماید .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">13-4)</strong> هر گاه مسافر قصد کنسل نمودن یا تغییر تاریخ یا ساعت&nbsp; پرواز خود را داشته باشد ، صرفا در ساعات اداری غیر تعطیل ( 9 صبح الی 5 عصر ) &nbsp;مجاز به تقدیم درخواست ابطال&nbsp; بلیط خود به آژانس مربوطه می باشد ، و آژانس در صورت امکان وفق ضوابط هر ایرلاین و نوع بلیط صادره از لحاظ سیستمی یا چارتر بودن ، ضمن اخذ هزینه مربوطه از مسافر نسب به انجام درخواست مسافر اقدام خواهد نمود .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">13-5)</span> </b>هرگاه نماینده مسافرین یا مسافر ، هنگام ثبت اطلاعات همراهان خود در سایت ، سن هر یک از همراهان خود را زیر 2 سال درج نماید ، صندلی جداگانه ای در پرواز برای او در نظر گرفته نخواهد شد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">13-6)</strong> هر مسافر بزرگسال حین استفاده از خدمات پرواز ی عرضه شده در این سایت ، فقط می تواند یک مسافر نوزاد زیر 2 سال همراه خود داشته باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">13-7)</span> </b>مسافر موظف است در صورت استفاده از خدمات پروازی داخلی ، هنگام مراجعه به فرودگاه کارت شناسائی ملی و در پروازهای خارجی پاسپورت خود را به همراه داشته باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">13-8)</strong> مسافر می بایست در هنگام استفاده از خدمات پرواز ی داخلی ، حداقل 2 ساعت قبل از ساعت پرواز ، ودر پروازهای خارجی حداقل 3 ساعت قبل از ساعت پرواز در فرودگاه حاضر گردد.</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">13-9)</strong> مسافر موظف است هنگام استفاده از خدمات پرواز داخلی یا خارجی ، به محض اقامت در هتل ، ضمن تماس با دفاتر خطوط هوائی که بلیط مسافر متعلق به آن خطوط می باشد ، از تاریخ و ساعت دقیق پرواز برگشت خود و تغییرات احتمالی آن اطلاع حاصل نماید .</span></p>\r\n</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">&nbsp;</div>\r\n<div style=\"font-weight: normal; text-align: right; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><strong>ماده 14 ) شرایط استفاده از خدمات هتل :</strong></div>\r\n<div style=\"font-weight: normal; text-align: right; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">&nbsp;</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: right;\">\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">14-1)</strong> درکلیه انواع خدمات عرضه شده درسایت که دارای خدمات هتل می باشند ، قیمت خدمات تور اعلام شده برای هر نفر ، بر اساس اقامت یک نفر در اطاق 2 تخته یا بیشتر می باشد ، لذا هر گاه مسافری به صورت انفرادی قصد اقامت در یک اطاق را داشته باشد ، مشمول نرخ استفاده از اطاق یک تخته خواهد بود .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">14-2)</span> </b>نظر به اینکه نرخ ارائه خدمات به مسافرین در هتلهای داخلی و خارجی ، با توجه به رده بندی سنی مسافرین از قرار : زیر 2 سال ( نوزاد ) ، بین 2 تا 6 سال (خردسال) ، بین 6 تا 12 سال ( کودک ) ، بالاتر از 12 سال ( بزرگسال ) ، متغییر می باشد . لذا مسئولیت درج صحیح سن هر مسافر در هنگام خرید خدمات از سایت برعهده مسافر می باشد . و در صورت بروز هر گونه مشکلی از این بابت ، مسئولیت جبران خسارات وارده ، بر عهده مسافر خواهد بود .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">14-3)</strong> اگر سن مسافر در هنگام خرید خدمات از سایت ،&nbsp; زیر 2 سال ( نوزاد ) ، یا بین 2 تا 6 سال ( خردسال ) درج شود ، به طور معمول در تمامی هتلهای داخلی و خارجی تخت جداگانهای برای مسافر در نظر گرفته نخواهد شد ، مگر آنکه مسافر گزینه دریافت تخت اضافه را برای نوزاد یا خردسال خود انتخاب نموده و هزینه آنرا در سایت پرداخت کرده باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><strong style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">14-4)</strong> در کلیه انواع خدمات عرضه شده در سایت که دارای خدمات هتل می باشند ، امکانات ارائه شده در هتل از قبیل : خوراکی ، نوشیدنی ، سونا ، جکوزی ، استخر ، و غیره ، با توجه به نوع اطاق انتخابی در سایت ، رایگان یا مشمول پرداخت بهای خدمات دریافتی خواهند بود ، لذا در صورتیکه اطاق انتخابی مسافر مجاز به استفاده رایگان از انواع خدمات عرضه شده در هتل نباشد ، مسافر موظف است در صورت استفاده از خدمات غیر رایگان هتل ، هنگام ترک هتل ، هزینه خدمات دریافتی خود را نقدا به هتل پرداخت نماید .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">14-5)</span> </b>از آنجائیکه برخی از هتلها قبل از تحویل اطاق به مسافر ، مبلغی تحت عنوان پیش دریافت هزینه استفاده ازخدمات غیر رایگان هتل از مسافر دریافت می نماید ، مسافر موظف&nbsp; به پرداخت مبلغ درخواستی ، به&nbsp; هتل می باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">14-6)</span> </b>هرگاه مسافر هنگام خرید خدمات از سایت ، ظرفیت اطاقهای مورد نیاز خود را &nbsp;متناسب با تعداد مسافرین انتخاب ننموده باشد ، مسئولیت زیان یا&nbsp; تحمیل هرگونه هزینه اضافی به مسافر در حین اجرای تور ، بر عهده خود مسافر خواهد بود .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">14-7)</span> </b>در هتلهای داخلی و خارجی ، با توجه به ضوابط داخلی هر هتل ، ساعت تحویل اطاق بین ساعت 11 تا 12 صبح و ساعت تخلیه اطاق بین ساعت 1 تا 2 بعد از ظهر می باشد ، که مسافر ملزم به رعایت آن می باشد .</span></p>\r\n<p dir=\"RTL\" style=\"text-align: justify; \"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">14-8)</span> </b>هرگاه هتل علی رغم وجود واچر معتبر ، امکان پذیرش مسافر را نداشته باشد ، آژانس موظف است هتلی با مشخصات رزرو شده برای مسافر تامین نماید . و در صورتیکه مسافر از قبول اقامت در هتل پیشنهادی امتناع ورزد ، آژانس موظف به پرداخت قیمت روز رزرو هتل به مسافر می باشد . در این صورت آژانس از بابت اقامت مسافر در هتل مسئولیت دیگری نخواهد داشت .</span></p><p dir=\"RTL\" style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><span lang=\"FA\"><br></span></p>\r\n</div>\r\n<div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; text-align: right;\"><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b>ماده 15) شرایط خدمات تورهای خارجی :<o:p></o:p></b></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-1)</span> </b>در\r\nآندسته از تورهای خارجی هوائی یا زمینی ، که اخذ ویزای مسافر نیاز به وقت سفارت و\r\nمصاحبه با عوامل سفارت نداشته یا ویزای مسافر در کشور مقصد صادر می گردد ،&nbsp; از آنجائیکه آژانس در اینگونه تورها ، به محض\r\nصدور فاکتور قطعی فروش ، به منظور جلوگیری از افزایش نرخ خدمات تور بنا به دلایلی\r\nاز قبیل : بالا رفتن نرخ بلیط و هتل و ارز ، سریعا اقدام به قطعی کردن رزرو بلیط و\r\nهتل و کلیه خدمات مسافر می نماید ، لذا هرگاه نماینده مسافرین بعد از صدور فاکتور قطعی فروش بیش از 24 ساعت مانده به اجرای تور، یکطرفه خدمات خریداری شده از سایت را لغو\r\nنماید ، صرفا 10% از مبلغ پرداختی مسافر به وی مستردد خواهد شد و هرگاه نماینده مسافرین کمتر از 24 ساعت مانده به ساعت اجرای تور ، اقدام به لغو فاکتور خود بنماید هیچ مبلغی از بابت لغو خدمات خریداری شده به مسافر عودت داده نخواهد شد .\r\n<font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><o:p></o:p></span></font></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-2)</span> </b>در\r\nآندسته از تورهای خارجی هوائی یا زمینی ، که اخذ ویزای مسافر نیاز به وقت سفارت و\r\nمصاحبه با عوامل سفارت دارد ، هر گاه به هر دلیلی ویزای مسافر صادر نگردد ، مسافر\r\nموظف است بر اساس اعلام آژانس و اسناد مثبته ارائه شده توسط آژانس ، کلیه هزینه های\r\nانجام شده توسط آژانس را پرداخت نماید .</span><span dir=\"LTR\" style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-3)</b> در\r\nآندسته از خدماتی که در سایت عرضه شده و به فروش می رسد ، و دارای خدمات ویزا می\r\nباشند ، مسئولیت صحت مدارک ارائه شده از طرف مسافر به سفارت مربوطه ، بر عهده\r\nمسافر می باشد و بس ، و از این بابت آژانس کارگزار هیچ مسئولیتی نخواهد داشت .<font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><o:p></o:p></span></font></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-4)</b> از مهلت\r\nاعتبار پاسپورت مسافران خارجی در هنگام خروج از کشور می بایست بیش از 6 ماه باقی\r\nمانده باشد . و مسئولیت کنترل آن بر عهده مسافر می باشد و بس ، لذا هرگاه از این\r\nبابت ، ارائه خدمات به مسافر غیر ممکن گردد ، مسئولیت خسارات وارده به مسافر ناشی\r\nاز این مورد بر عهده خود مسافر خواهد بود <font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\">. <o:p></o:p></span></font></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-5)</span> </b>در کلیه\r\nانواع خدمات تور خارجی عرضه شده در این سایت ، پرداخت عوارض خروج از کشور برعهده\r\nمسافر می باشد .<font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><o:p></o:p></span></font></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-6)</span> </b>هرگاه\r\nهریک از مسافرانی که اقدام به خرید خدمات تور خارجی از سایت نموده اند ، در مدت\r\nاعتبار ویزای خود ، از بازگشت به کشور خودداری نمایند ، یا در طول اجرای تور یا\r\nاقامت خود در کشور مقصد ، مرتکب اعمال خلاف قانون کشور مقصد گردند ، به گونه ای که\r\nبه منافع آژانس یا مدیریت سایت خسارات مادی وارد گردد ، آژانس و مدیریت سایت می\r\nتوانند با تقدیم دادخواست داوری به داور قرارداد ، و اخذ رای داوری مبنی بر\r\nمحکومیت مسافر ، نسبت به وصول خسارات وارده به خود از منبع ودایع و ضمانتنامه های\r\nمسافر نزد خود ، یا دیگر دارائیهای مسافر ، اقدام به وصول مطالبات خود بنمایند .<font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><o:p></o:p></span></font></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-7)</b> در برخی\r\nاز تورهای خارجی ، ارائه ضمانتنامه معتبر از طرف مسافر ، جهت تضمین مراجعت مسافر\r\nبه کشور الزامی است ، و مسافر ملزم به تحویل آن به مدیریت سایت&nbsp; قبل از دریافت مدارک سفر ( بلیط ، ویزا ، واچر\r\nهتل ) خود از آژانس&nbsp; می باشد . و متقابلا\r\nآژانس موظف به درج نوع و مبلغ این تضمین در سایت می باشد . بدیهی است پس از مراجعت\r\nمسافر به کشور ، با تائید آژانس مربوطه ، مسافر می تواند ضمن رجوع به مدیریت سایت\r\nاقدام به دریافت وجوه یا اسناد تضمینی خود بنماید .</span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b><span style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-8)</span> </b>در\r\nآندسته از خدمات تور خارجی درج شده در سایت ، که نیاز به اخذ ویزا و&nbsp; وقت مصاحبه با عوامل سفارت دارند ، مسافر می\r\nبایست راس ساعت در مکان&nbsp; اعلام و ابلاغ شده\r\nاز طرف آژانس &nbsp;حاضر گردد ، هر گاه در اثر\r\nعدم حضور به موقع مسافر در محل سفارت ، روادید مسافر صادر نگردد ، مسافر مسئول\r\nخسارات وارده از این بابت می باشد ، و ملزم به پرداخت کلیه هزینه های انجام شده از\r\nطرف آژانس بابت هر یک از خدمات تور می باشد .<font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><o:p></o:p></span></font></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-9)</b> هر گاه\r\nمسافرین به صورت گروهی برای خرید خدمات تور خارجی اقدام نموده\r\nباشند ، و به هر دلیل سفارت یا اداره مهاجرت مربوطه از صدور ویزا برای هریک از\r\nمسافرین امتناع ورزد ، یا به هر دلیل سفر هر یک از مسافرین لغو گردد ، سایر\r\nمسافرین ملزم به استفاده از خدمات خریداری شده از سایت می باشند ، هرگاه لغو تور کمتر از 24 ساعت مانده به اجرای تور باشد مسافر موظف به پرداخت کل وجه خدمات خریداری شده از سایت می باشد . و هیچ مبلغی از\r\nبابت لغو خدمات خریداری شده به وی مسترد نخواهد شد . و هرگاه لغو تور بیشتر از 24 ساعت مانده به ساعت شروع اجرای تور باشد صرفا 10% مبلغ فاکتور مسافر به وی مسترد خواهد شد.<font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><o:p></o:p></span></font></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">15-10)</b> هر گاه\r\nدر هنگام ورود مسافری به کشوری ، مقامات محلی در کشور مقصد ، به هر دلیلی از قبیل\r\n: سوء سابقه مسافر ، یا تشابه اسمی مسافر ، یا قطع روابط دو کشور ، از ورود مسافر\r\nبه کشور مقصد جلوگیری نمایند ، مسافر ملزم به پرداخت کلیه هزینه های تور به آژانس\r\nمی باشد و از این بابت هیچگونه مسئولیتی متوجه آژانس یا مدیریت سایت نخواهد بود ،\r\nو کلیه هزینه های بلیط برگشت و اقامت مسافر ، بر عهده خود وی خواهد بود .</span><span lang=\"AR-SA\" style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\">&nbsp;</span></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><strong><span lang=\"FA\">ماده 16) شرایط عمومی قرارداد:</span></strong></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><span lang=\"FA\"><b><span style=\"font-size: 10pt;\">16-1)</span>&nbsp;</b>کلیه انواع خدمات عرضه شده در این سایت ، غیر قابل واگذاری به غیر می باشند .</span></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><span lang=\"FA\"><strong style=\"font-size: 10pt;\">16-2)</strong>&nbsp;مدیریت سایت پس از قطعی شدن خرید مسافر از سایت ، با ارسال پیامک و ایمیل ، شماره محرمانه کدپیگیری مسافر را برای مسافر ، و اطلاعات خرید مسافر را برای آژانس مربوطه ارسال خواهد نمود .</span></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><span lang=\"FA\"><b><span style=\"font-size: 10pt;\">16-3)</span>&nbsp;</b>مسافر موظف است حداکثر ظرف مدت 8 ساعت کاری پس از دریافت کد پیگیری خرید ، با مسئول مربوطه در آژانس کارگزار تماس حاصل نموده و&nbsp; رونوشت مدارک مورد نیاز آژانس را از طریق ایمیل برای آژانس ارسال نماید ، و شماره کدپیگری خرید خدمات خود و شماره تماس خود را نیزدر اختیار مسئول مربوطه در آژانس قرار دهد . بدیهی است در غیر این صورت آژانس می تواند ، با توجه به امکان بروز نوسانات ارزی ، یا تکمیل ظرفیت وسایل نقلیه سفری یا تکمیل ظرفیت هتل محل اقامت مسافر ،&nbsp; اقدام به لغو یکطرفه خدمات خریداری شده از طرف مسافر بنماید ، در این صورت مدیریت سایت ظرف مدت 48 ساعت پس از دریافت شماره حساب از نماینده مسافرین اقدام به استرداد وجوه واریزی مسافر خواهد نمود .</span></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><span lang=\"FA\" style=\"font-size: 10pt;\"><b>&nbsp;16-4)&nbsp;</b></span><span lang=\"FA\">در کلیه انواع خدمات عرضه شده در این سایت ، فقط نماینده مسافرین که به نمایندگی از خود یا همراهان ، اقدام به ثبت خرید خدمات از این سایت می نماید ، مجاز به مراجعه به مدیریت سایت یا آژانس ، جهت لغو خدمات خریداری شده ، یا دریافت وجوه واریزی ، یا اجرای مفاد توافقنامه ، یا ثبت شکایت و اعلام نظر در سایت می باشد .</span></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><span lang=\"FA\"><strong style=\"font-size: 10pt;\">16-5)</strong>&nbsp;مدیریت سایت مجاز است در صورت درخواست مراجع قضائی ، اطلاعات اطلاعات مشتریان و کاربران سایت را در اختیار آنان قرار دهد .</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; font-size: 10pt; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\"></span></p><p dir=\"RTL\" style=\"font-weight: normal; font-size: 10pt; text-align: justify;\"><span lang=\"FA\"><b><span style=\"font-size: 10pt;\">16-6)</span>&nbsp;</b>هرگاه حین خرید خدمات توسط نماینده مسافرین از سایت ، اختلالات ناشی از درگاه بانکی یا شبکه اینترنت در سایت بروز نماید ، مدیریت سایت در قبال خریدهای ناموفق مسافر هیچگونه مسئولیتی نداشته ، و صرفا در صورت کسر مبلغی از این بابت از حساب مسافر موظف به عودت آن می باشد .</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b>16-7)</b>&nbsp;</span><span style=\"font-weight: normal; font-size: 13.3333px;\">مدیریت سایت از بابت وجوه یا تعهداتی که مازاد بر مشخصات هر تور در سایت ، فی مابین طرفین توافقنامه رد و بدل یا تنظیم گردد مسئولیتی نداشته و نخواهد داشت.</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span style=\"font-size: 13.3333px;\"><b>16-8)</b> مدیریت سایت مجاز است بنا به دستور مراجع قضائی یا ادارات صادرکننده پروانه فعالیت هر آژانس ، از ادامه فعالیت و عرضه خدمات آن آژانس در سایت جلوگیری نماید.</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span style=\"font-size: 13.3333px;\"><br></span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><b><span lang=\"FA\" style=\"\">ماده 17) تعلیق و\r\n</span><span lang=\"FA\" style=\"\">فسخ &nbsp;قرارداد :<o:p></o:p></span></b></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">17-1)</b> هرگاه پس\r\nاز قطعی شدن فرآیند خرید خدمات از سایت ( بعد از صدور فاکتور قطعی فروش خدمات&nbsp;) در اثر وقایع پیش بینی نشده و خارج از اراده\r\nو کنترل آژانس و عوامل اجرائی تور&nbsp; از قبیل\r\n: جنگ ، اعتصاب ، شورش ، انقلاب ، دلایل امنیتی ، اشتباهات سیستمی ، عدم صدور ویزای\r\nمسافر ، نفوذ و هک غیر مجاز به سایت ، لغو پرواز از طرف ایرلاین ، اختلال در شبکه\r\nاینترنت ، تمام یا بخشی &nbsp;از خدمات گردشگری\r\nو زیارتی فروخته شده در سایت ،&nbsp; به مسافر\r\nداده نشود ، یا پیامک و ایمیل ارسال کد &nbsp;پیگیری خرید خدمات به دست مسافر نرسد ، از بابت این موارد هیچ مسئولیتی متوجه آژانس یا ضامن نبوده و آژانس تلاش خواهد نمود ، با توافق\r\nو هماهنگی با مسافر ، ضمن اخذ هزینه ارائه خدمات جدید به مسافر&nbsp; ،در صورت امکان در همان تاریخ یا تاریخ دیگری ،\r\nمشابه همان خدمات را به مسافر تحویل دهد ، در غیر این صورت ضامن موظف است ، پس از\r\nکسر هزینه های پرداخت شده توسط آژانس از مبلغ پرداختی مسافر ، مبلغ باقیمانده را ظرف\r\nمدت 48 ساعت پس از اخذ شماره حساب نماینده مسافرین ، &nbsp;به شماره حساب نماینده مسافرین واریز نماید .<font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><o:p></o:p></span></font></span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">17-2)</b> هر گاه\r\nنوع خدمات گردشگری فروخته شده به مسافر به گونه ای باشد ، که برای اجرای آن نیاز\r\nبه حد نصاب رسیدن تعدادمعینی از مسافرین باشد . اگر در زمان اجرای تور و خدمات\r\nگردشگری ، تعداد مسافرین به حد نصاب لازم نرسد ، و اجرای خدمات تور توسط آژانس\r\nمربوطه لغو گردد ، ضامن موظف است ظرف مدت 48 ساعت پس از اخذ شماره حساب نماینده\r\nمسافرین ، مبلغ دریافتی از مسافرین را به حساب نماینده مسافرین واریز نماید .<font face=\"Arial, Verdana\"><span style=\"font-size: 10pt;\"><o:p></o:p></span></font></span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\">\r\n\r\n\r\n\r\n\r\n\r\n</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"\"><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\">17-3)</b><b style=\"font-family: Arial, Verdana; font-size: 10pt; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal;\"> </b>ملاک\r\nمحاسبه و لحاظ تاریخ اعلام انصراف ( فسخ ) مسافر از دریافت خدمات قطعی شده&nbsp; ، تاریخ اعلام انصراف کتبی مسافر به آژانس ضمن\r\nاخذ رسید یا ارسال ایمیل به آدرس پست الکترونیک آژانس ارائه دهنده خدمات در سایت ،\r\nصرفا در ساعات اداری غیر تعطیل ( 9 صبح الی 5 عصر ) می باشد .</span><span lang=\"FA\" style=\"\"><o:p></o:p></span></p></div>\r\n<div style=\"font-weight: normal; font-size: 10pt; text-align: justify; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><br></div><div style=\"font-weight: normal; font-size: 10pt; font-family: Arial, Verdana; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;\"><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"line-height: 115%;\"><b>ماده 18) شرایط ثبت و رسیدگی به &nbsp;شکایات : </b><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"line-height: 115%;\"><b>18-1) </b>کلیه اختلافات فی مابین طرفین این توافقنامه در خصوص نحوه\r\nاجراء یا تفسیر مفاد این توافقنامه ، بر اساس قوانین داوری در بخش آئین دادرسی\r\nمدنی و توسط داوری که از طرف ضامن ( مدیریت سایت ) تعیین و به طرفین ابلاغ خواهد\r\nشد ، مورد رسیدگی و صدور رای قرار خواهد گرفت ، و رای داوری صادره برای طرفین این\r\nتوافقنامه لازم الاجراء می باشد .<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"line-height: 115%;\"><b>18-2) </b>هرگاه آژانس کارگزار به تعهدات خود بر اساس این&nbsp; توافقنامه به صورت کلی یا جزئی عمل ننماید ، مسافر\r\nمی تواند نهایتا ظرف مدت یک هفته پس از تاریخ پایان برگزاری تور ، ضمن تقدیم شکایت\r\nکتبی خود به آژانس مربوطه ، نسبت به ثبت شکایت خود در سایت نیز اقدام نماید . هرگاه\r\nآژانس مربوطه پس از گذشت یک هفته از تاریخ ثبت شکایت مسافر در سایت ،&nbsp; نسبت به جلب رضایت مسافر و اخذ رضایتنامه کتبی از\r\nمسافر اقدام ننماید ، مدیریت سایت ((ضامن )) موضوع شکایت مسافر را جهت رسیدگی&nbsp; به واحد داوری ارجاع خواهد نمود ، و پس از\r\nتعیین داور و ابلاغ آن به طرفین دعوا ، موضوع اختلاف وفق قوانین آئین دادرسی مدنی\r\nدر بخش داوری ، مورد رسیدگی و مورد حکم قرار خواهد گرفت ، و در این صورت هرگاه آژانس نسبت\r\n&nbsp;به پرداخت مبلغ محکوم شده اقدام ننماید ، مدیریت سایت (( ضامن )) ،\r\nمطالبات مسافر را به وی پرداخت خواهد نمود ، &nbsp;و مبلغ پرداخت شده را در حساب بدهکاری آژانس\r\nمربوطه منظور و از منبع ودایع یا مطالبات آژانس نزد سایت ، یا هر طریق قانونی دیگری\r\nنسبت به وصول آن از آژانس اقدام خواهد نمود .<font face=\"B Titr\"><span style=\"font-size: 12pt;\"><o:p></o:p></span></font></span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"font-weight: normal; text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"line-height: 115%;\"><b>18-3)</b> هزینه داوری فی مابین طرفین اختلاف ، معادل 3.5 درصد مبلغ خواسته میباشد که از طرف خواهان پرداخت و در صورت محکومیت خوانده ، در رای داوری ، خوانده مضاف بر مبلغ محکوم شده ملزم به پرداخت هزینه داوری در وجه خواهان خواهد گردید</span></p><p class=\"MsoNormal\" dir=\"RTL\" style=\"text-align: justify; direction: rtl; unicode-bidi: embed;\"><span lang=\"FA\" style=\"line-height: 115%;\"><b>ماده 19)</b> طرفین این قرار داد در صحت کامل ، ضمن اسقاط کلیه خیارات اقدام به تائید و قبول این قرارداد نموده اند.</span></p></div></div></div>', '<p style=\"text-align: justify; padding-left: 40px;\"><span style=\"color: #222222; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 13px; background-color: #ffffff;\">اوکی شد (okshod) سال 1397 با هدف ارائه بهتر و با کیفیت در زمینه صنعت گردشگری افتتاح گردید.هدف ما کمک به شما عزیزان جهت خرید و فروش راحت تر و امن تر تور های گردشکری داخلی و خارجی است .سایت اوکی&nbsp; شد (okshod) تحت نظارت تفریحات 5 قاره (سهامی خاص) به شماره ثبت 534715 فعالیت میکند.</span></p><p style=\"text-align: justify; padding-left: 40px;\"><span style=\"color: #222222; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 13px; background-color: #ffffff;\"><br></span></p><p style=\"text-align: justify; padding-left: 40px;\"><span style=\"color: #222222; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 13px; background-color: #ffffff;\"><br></span></p><p style=\"text-align: justify; padding-left: 40px;\"><span style=\"color: #222222; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 13px; background-color: #ffffff;\"><br></span></p><p style=\"text-align: justify; padding-left: 40px;\"><br></p>', 'اوکی شد مجری برگزاری انواع تور های داخلی، خارجی، طبیعتگردی، غار نوردی، جنگل نوردی، کوه نوردی و... می باشد. شما می توانید تور های یک روزه و چند روزه را با ما تجربه کنید. شما می توانید تور های ما شامل تور دریاچه عروس، تور دریاچه حلیمه جان، تور دریاچه شورمست، تور کویر مصر، تور کویر مرنجاب، تور ماسال، تور کویر ابوزیدآباد، تور کویر یزد و ... تجربه کرده و یک سفر لذت بخش را برای خود خلق کنید. سایت اوکی شد یا همان okshod به آژانس های دیگر جهت فروش تورهایشان کمک می کند. اگر مالک آژانس هستید میتوانید تبلیغات تور خود را به صورت رایگان در سایت ما قرار دهید', '<span style=\"font-size: 10pt;\">									کاربر گرامی شما میتوانید با عضویت در این سایت ، از طریق بازاریابی و فروش انواع تور های درج شده در سایت برای خود کسب درآمد نمایید.</span><div style=\"font-size: 10pt; font-weight: normal;\"><br></div><div style=\"font-size: 10pt; font-weight: normal;\">نحوه کسب درآمد از این سایت:</div><div style=\"font-size: 10pt; font-weight: normal;\"><br></div><div style=\"font-size: 10pt; font-weight: normal;\">1-شما ابتدا باید عضو این سایت گردید . چراکه خرید از این سایت صرفا برای اعضای سایت مقدور میباشد و کاربران غیر عضو فقط میتوانند بخشهای مختلف سایت را مشاهده نمایند. و در صورتیکه قصد خرید تور و خدمات از سایت را داشته باشند ابتدای مراحل خرید گزینه تعیین وضعیت عضویت در برابر کاربر به نمایش در خواهد آمد . و در صورتیکه کاربر اعلام نماید عضو سایت نمیباشد صرفا صفحه عضویت در سایت در برابر وی قرار خواهد گرفت. از آنجائیکه عضویت در سایت برای عموم رایگان است شما میتوانید بدون آنکه مستلزم بر خرید از سایت باشید اقدام به ثبت عضویت خود در سایت نمایید.</div><div style=\"font-size: 10pt; font-weight: normal;\"><br></div><div style=\"font-size: 10pt; font-weight: normal;\"><br></div><div style=\"font-size: 10pt; font-weight: normal;\"><img src=\"https://okshod.com/ssssss.jpg\"></div><div style=\"font-size: 10pt; font-weight: normal;\"><br></div><div style=\"font-size: 10pt; font-weight: normal;\">2- پس از عضویت در سایت شما می بایست جزئیات خدمات و قیمتهای انواع تور های عرضه شده در سایت را به دقت مطالعه نمائید و خودتان به عنوان عضو سایت و نماینده مسافرین ، اقدام به خرید تور برای بستگان و دوستان و همکاران خود نمائید. و به محض خرید از سایت مبلغ در نظر گرفته شده برای نماینده مسافرین در حساب کاربری شما منظور خواهد شد. و مبلغ آن به حساب بانکی شما واریز خواهد گردید.</div><div style=\"font-size: 10pt; font-weight: normal;\"><br></div><div style=\"font-size: 10pt; font-weight: normal;\">3- سایت به گونه ای طراحی شده است که حتی اگر شما جزء گروه مسافران خریدار خدمات نباشید قادر خواهید بود به عنوان نماینده مسافرین اقدام به خرید از سایت بنمائید و از تخفیف ویژه نماینده مسافرین بهره مند گردید.</div><div style=\"font-size: 10pt; font-weight: normal;\"><br></div><div style=\"font-size: 10pt; font-weight: normal;\">نکته : آنچه در سایت به عنوان تخفیف ویژه مسافرین برای هر نفر در نظر گرفته شده است به ازای هر نفر مسافری که خرید از سایت انجام میدهد می باشد.</div><div style=\"font-size: 10pt; font-weight: normal;\">برای مثال : اگر شما به عنوان نماینده مسافرینبرای 7 نفر از دوستان خود توری را از سایت خرید نمائید که مبلغ تخفیف نماینده مسافرین آن به ازای هر نفر 10000 تومان می باشد. پس انجام خرید مبلغ 70000 تومان در حساب کاربری شما منظور و در پایان هر ماه به حساب شما واریز خواهد شد.</div><div style=\"font-size: 10pt; font-weight: normal;\"><br></div><div style=\"font-size: 10pt; font-weight: normal;\">4- شما می توانید دوستان و بستگان خود را که قصد مسافرت توریستی را دارند متقاعد نمائید نمائید که می توانید&nbsp; تور مد نظر آنهارا با قیمت مناسب برای آنها خریداری نمائید. و با خرید تور مد نظر خود از این سایت از درآمد ناشی از خرید تور بهره مند گردید.</div><div style=\"font-size: 10pt; font-weight: normal;\"><br></div><div style=\"\"><b style=\"\"><font size=\"4\">جوایز ویژه نمایندگان مسافرین تا پایان سال 1399</font></b></div><div style=\"\"><b style=\"\"><font size=\"4\"><br></font></b></div><div style=\"\">مدیریت سایت به منظور ارتقاءانگیزه رقابت میان کاربران و اعضای سایت تا پایان سال 1399 در پایان هر ماه مضاف بر کمیسیون های تعلق گرفته به نماینده مسافران ،&nbsp; با توجه به تعداد خرید انجام شده توسط هریک از نمایندگان مسافران ، جوایز ارزنده ای تقدیم آنها خواهد نمود</div><div style=\"font-size: 10pt; font-weight: normal;\"><br></div>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE IF NOT EXISTS `tbl_order` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `order_inDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_outDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_factorNum` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_trackingCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_timeId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` int(11) DEFAULT '0',
  `order_total` double NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT '1',
  `order_payment` int(11) NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci DEFAULT NULL,
  `order_description` text COLLATE utf8mb4_unicode_ci,
  `order_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `publication_status` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `ref_id` (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_status`
--

DROP TABLE IF EXISTS `tbl_order_status`;
CREATE TABLE IF NOT EXISTS `tbl_order_status` (
  `os_id` int(11) NOT NULL AUTO_INCREMENT,
  `os_name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `publication_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`os_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `tbl_order_status`
--

INSERT INTO `tbl_order_status` (`os_id`, `os_name`, `publication_status`) VALUES
(1, 'در انتظار بررسی', 1),
(2, 'پرداخت شده', 1),
(3, 'تکمیل شده', 1),
(4, 'لغو شده توسط مسافر', 1),
(5, 'لغو شده توسط هتل', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

DROP TABLE IF EXISTS `tbl_payment`;
CREATE TABLE IF NOT EXISTS `tbl_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

DROP TABLE IF EXISTS `tbl_question`;
CREATE TABLE IF NOT EXISTS `tbl_question` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_title` varchar(255) NOT NULL,
  `q_answer` text NOT NULL,
  `publication_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`q_id`, `q_title`, `q_answer`, `publication_status`) VALUES
(1, 'واچر چیست؟', 'رایند انتخاب و رزرو اینترنتی هتل در علی بابا بسیار ساده است. به سادگی و با چند کلیک می توانید با انتخاب مقصد و تاریخ سفر خود، هتل مناسب خود را با قیمت مناسب رزرو کنید. با این حال در صورت نیاز، تیم پشتیبانی 24 ساعته پاسخگوی شماست', 1),
(2, 'نیم شارژ ورود و خروج چیست ؟', 'ساعت ورود به هتل ساعت 14 و خروج 12 ظهر است؛ مسافر انی که ورود زود هنگام (حدود ساعت 8 صبح) یا خروج دیر هنگام (حدود ساعت 18 عصر) را دارند، از این گزینه استفاده می‌کنند؛ قیمت نیم‌شارژ معمولا نصف رزرو یک شب است.', 1),
(3, 'پیش از رزورو چطور باید درباره ان و فرایند رزرو اطلاعات  بدست اوریم ؟', 'فرایند انتخاب و رزرو اینترنتی هتل در علی بابا بسیار ساده است. به سادگی و با چند کلیک می توانید با انتخاب مقصد و تاریخ سفر خود، هتل مناسب خود را با قیمت مناسب رزرو کنید. با این حال در صورت نیاز، تیم پشتیبانی 24 ساعته پاسخگوی شماست', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reference`
--

DROP TABLE IF EXISTS `tbl_reference`;
CREATE TABLE IF NOT EXISTS `tbl_reference` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `ref_email` varchar(255) NOT NULL,
  `ref_password` text NOT NULL,
  `ref_code` varchar(255) CHARACTER SET utf8 NOT NULL,
  `ref_phone` varchar(255) DEFAULT NULL,
  `changePassword` varchar(255) DEFAULT NULL,
  `ref_used_number` int(11) NOT NULL,
  `ref_money` int(11) NOT NULL,
  `ref_sheba` varchar(255) DEFAULT NULL,
  `publication_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_reference`
--

INSERT INTO `tbl_reference` (`ref_id`, `ref_name`, `ref_email`, `ref_password`, `ref_code`, `ref_phone`, `changePassword`, `ref_used_number`, `ref_money`, `ref_sheba`, `publication_status`) VALUES
(0, '', '', '', '', NULL, NULL, 0, 0, NULL, 0),
(1, 'تفریحات 5 قاره', 'tafrihat5gh@yahoo.com', 'c81e728d9d4c2f636f067f89cc14862c', 'taf', NULL, NULL, 4, 20000, NULL, 1),
(2, 'دانشگاه شهید بهشتی', 'sbu@yahoo.com', '40f5888b67c748df7efba008e7c2f9d2', 'SBU', '154465654', NULL, 0, 0, 'IR55555555', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request`
--

DROP TABLE IF EXISTS `tbl_request`;
CREATE TABLE IF NOT EXISTS `tbl_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT '0',
  `hotel_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `request_status` varchar(255) CHARACTER SET utf32 NOT NULL,
  `request_date` varchar(255) NOT NULL,
  `request_pay` varchar(255) DEFAULT NULL,
  `request_paid` int(11) DEFAULT NULL,
  `request_pay_date` varchar(255) DEFAULT NULL,
  `request_description` text CHARACTER SET utf8 COLLATE utf8_persian_ci,
  PRIMARY KEY (`request_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`),
  KEY `ref_id` (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_room_price`
--

DROP TABLE IF EXISTS `tbl_room_price`;
CREATE TABLE IF NOT EXISTS `tbl_room_price` (
  `rp_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `room_fromDate` varchar(255) NOT NULL,
  `room_toDate` varchar(255) NOT NULL,
  `room_price` int(11) NOT NULL,
  PRIMARY KEY (`rp_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_room_price`
--

INSERT INTO `tbl_room_price` (`rp_id`, `room_id`, `hotel_id`, `room_fromDate`, `room_toDate`, `room_price`) VALUES
(67, 65, 143, '1399/01/01', '1399/06/31', 520000),
(117, 105, 115, '1399/02/01', '1399/04/29', 510000),
(127, 110, 116, '1399/04/29', '1399/06/29', 600000),
(128, 110, 116, '1399/02/29', '1399/04/29', 500000),
(129, 111, 116, '1399/04/29', '1399/06/01', 650000),
(130, 111, 116, '1399/02/29', '1399/04/29', 550000),
(131, 112, 116, '1399/02/01', '1399/04/29', 620000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

DROP TABLE IF EXISTS `tbl_slider`;
CREATE TABLE IF NOT EXISTS `tbl_slider` (
  `slider_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slider_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publication_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slider_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_description` text COLLATE utf8mb4_unicode_ci,
  `slider_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_button_lable` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_off_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`slider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`slider_id`, `slider_image`, `publication_status`, `created_at`, `updated_at`, `slider_title`, `slider_description`, `slider_link`, `slider_button_lable`, `slider_off_image`) VALUES
(25, 'images/mSlider/11142019090732.jpg', 1, NULL, NULL, NULL, NULL, 'https://okshod.com', NULL, NULL),
(30, 'images/mSlider/11252019053803.jpg', 1, NULL, NULL, NULL, NULL, 'https://okshod.com', NULL, NULL),
(31, 'images/mSlider/11252019053823.jpg', 1, NULL, NULL, NULL, NULL, 'https://okshod.com', NULL, NULL),
(33, 'images/mSlider/11272019102625.jpg', 1, NULL, NULL, NULL, NULL, 'https://okshod.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_traveler`
--

DROP TABLE IF EXISTS `tbl_traveler`;
CREATE TABLE IF NOT EXISTS `tbl_traveler` (
  `traveler_id` int(11) NOT NULL AUTO_INCREMENT,
  `traveler_name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `traveler_lname` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `traveler_age` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `traveler_mobile` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `traveler_gender` tinyint(1) NOT NULL,
  `traveler_type` tinyint(1) NOT NULL,
  `room_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `traveler_des` text COLLATE utf8_persian_ci NOT NULL,
  `traveler_factor_num` varchar(255) COLLATE utf8_persian_ci DEFAULT NULL,
  `traveler_submit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`traveler_id`),
  KEY `order_id` (`order_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `user_phone` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `create_at` date NOT NULL,
  `update_at` date NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_email`, `user_password`, `user_name`, `user_phone`, `hotel_id`, `create_at`, `update_at`) VALUES
(1, 'it.davoodi@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 'داودی', '02155555', 116, '2019-05-20', '2019-05-20');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotel_gallery`
--
ALTER TABLE `hotel_gallery`
  ADD CONSTRAINT `hotel_gallery_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_bookedroom`
--
ALTER TABLE `tbl_bookedroom`
  ADD CONSTRAINT `tbl_bookedroom_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_bookedroom_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `tbl_hotel_room` (`room_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_bookedroom_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT `tbl_comment_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_comment_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_hotel`
--
ALTER TABLE `tbl_hotel`
  ADD CONSTRAINT `tbl_hotel_ibfk_1` FOREIGN KEY (`category_parent1`) REFERENCES `tbl_category` (`category_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_hotel_ibfk_2` FOREIGN KEY (`category_parent2`) REFERENCES `tbl_category` (`category_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_hotel_gallery`
--
ALTER TABLE `tbl_hotel_gallery`
  ADD CONSTRAINT `tbl_hotel_gallery_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_hotel_rate`
--
ALTER TABLE `tbl_hotel_rate`
  ADD CONSTRAINT `tbl_hotel_rate_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_hotel_rate_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_hotel_room`
--
ALTER TABLE `tbl_hotel_room`
  ADD CONSTRAINT `tbl_hotel_room_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `tbl_coupon` (`coupon_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_ibfk_3` FOREIGN KEY (`ref_id`) REFERENCES `tbl_reference` (`ref_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD CONSTRAINT `tbl_request_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_request_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_request_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_request_ibfk_4` FOREIGN KEY (`ref_id`) REFERENCES `tbl_reference` (`ref_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_room_price`
--
ALTER TABLE `tbl_room_price`
  ADD CONSTRAINT `tbl_room_price_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_room_price_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `tbl_hotel_room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_traveler`
--
ALTER TABLE `tbl_traveler`
  ADD CONSTRAINT `tbl_traveler_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_traveler_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `tbl_hotel_room` (`room_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `tbl_hotel` (`hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
