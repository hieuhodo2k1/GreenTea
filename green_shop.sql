-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 28, 2023 lúc 01:14 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `green_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ct_hd`
--

CREATE TABLE `ct_hd` (
  `MAHD` varchar(10) NOT NULL,
  `MASP` varchar(10) NOT NULL,
  `SLG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `MAGH` varchar(10) NOT NULL,
  `MASP` varchar(10) NOT NULL,
  `MAKH` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MAHD` varchar(10) NOT NULL,
  `MAKH` varchar(500) DEFAULT NULL,
  `MOTA_DIACHI` varchar(100) DEFAULT NULL,
  `GIAOHANG` varchar(100) DEFAULT NULL,
  `HINH_THUC_TT` varchar(100) DEFAULT NULL,
  `NGAYLAP` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MAKH` varchar(500) NOT NULL,
  `SDT` varchar(100) DEFAULT NULL,
  `DIACHI` varchar(100) DEFAULT NULL,
  `MOTA_DIACHI` varchar(500) DEFAULT NULL,
  `HO` varchar(100) NOT NULL,
  `TEN` varchar(100) NOT NULL,
  `EMAIL` varchar(500) NOT NULL,
  `MATKHAU` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MAKH`, `SDT`, `DIACHI`, `MOTA_DIACHI`, `HO`, `TEN`, `EMAIL`, `MATKHAU`) VALUES
('KH-MAF2X0z', NULL, NULL, NULL, 'Hieu', 'Ho Do', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
('KH-R8WFcV1', NULL, NULL, NULL, 'Admin', 'Admin', '19130068@st.hcmuaf.edu.vn', 'e10adc3949ba59abbe56e057f20f883e'),
('KH-S6S81nC', NULL, NULL, NULL, 'Nguyen Van', 'B', 'august4th2001@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai`
--

CREATE TABLE `loai` (
  `MALOAI` varchar(100) NOT NULL,
  `TENLOAI` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `loai`
--

INSERT INTO `loai` (`MALOAI`, `TENLOAI`) VALUES
('LO3s2BwS4', 'Trà sữa than tre'),
('LOa8WulTm', 'Matcha '),
('LOefF18Zv', 'Trà sữa kem mặn'),
('LOjLf56QJ', 'Hồng trà sữa'),
('LOjQZHS0H', 'Sữa tươi trân châu đường đen'),
('LOKMIdjZV', 'Trà thái xanh'),
('LOLMhqfBS', 'Trà sữa sương sáo'),
('LOLr0t7Ab', 'Pudding'),
('LOMGg50Aw', 'Trà sữa olong'),
('LOppDTwbH', 'Trà sữa hoa nhài'),
('LOrBHrgZw', 'Cafe muối'),
('LOyi3VTdw', 'Trà trái cây'),
('LOzLFxamV', 'Trà sữa hokkaido');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanxet`
--

CREATE TABLE `nhanxet` (
  `MANX` varchar(10) NOT NULL,
  `MAKH` varchar(500) NOT NULL,
  `NOIDUNG` varchar(1000) DEFAULT NULL,
  `DANHGIA` varchar(50) DEFAULT NULL,
  `MASP` varchar(10) DEFAULT NULL,
  `THOIGIAN` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nhanxet`
--

INSERT INTO `nhanxet` (`MANX`, `MAKH`, `NOIDUNG`, `DANHGIA`, `MASP`, `THOIGIAN`) VALUES
('NX-H9ZqsQO', 'KH-S6S81nC', 'ngon', '5', 'SP7lVHMhq', '2023-12-24 00:00:00'),
('NX-obVAMtV', 'KH-S6S81nC', 'ngon', '5', 'SPNyxw5sT', '2023-12-24 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_user`
--

CREATE TABLE `role_user` (
  `ROLE_USER` varchar(255) NOT NULL,
  `MAKH` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `role_user`
--

INSERT INTO `role_user` (`ROLE_USER`, `MAKH`) VALUES
('ADMIN', 'KH-MAF2X0z'),
('ADMIN', 'KH-R8WFcV1'),
('CUSTOMER', 'KH-MAF2X0z'),
('CUSTOMER', 'KH-S6S81nC');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MASP` varchar(10) NOT NULL,
  `TENSP` varchar(1000) NOT NULL,
  `MOTA` varchar(4000) DEFAULT NULL,
  `GIA` decimal(10,0) DEFAULT NULL,
  `LINK_IMAGE` varchar(1000) DEFAULT NULL,
  `MALOAI` varchar(100) DEFAULT NULL,
  `LINK_LIST` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MASP`, `TENSP`, `MOTA`, `GIA`, `LINK_IMAGE`, `MALOAI`, `LINK_LIST`) VALUES
('SP3owU0U2', 'Trà sữa sương sáo', 'Trà sữa sương sáo độc đáo mới lạ', '35000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763521/pjvrplfdldyfvg5wcnsq.jpg', 'LOLMhqfBS', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763523/w5xktqcdkzpxegiewtcd.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763525/qrekyfsxlhepdtbe4kow.jpg'),
('SP6Q2GDhh', 'Trà thái xanh', 'test ', '20000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737718/ldagj3kns7wleagvy3yv.jpg', 'LOKMIdjZV', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737720/ydydsrcdipjixgowy9ev.webp http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737723/dzlf9z1mi49ayoflx3rp.jpg'),
('SP75z72u8', 'Hồng trà sữa', 'test   ', '35000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737520/l845jpizwk11uwll092v.jpg', 'LOjLf56QJ', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737522/xjilblej00i7audflqus.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737523/glpcffpmbv1r7cxwgyew.webp'),
('SP7lVHMhq', 'Trà sữa hoa nhài', 'Test', '25000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703732160/of7bh02vwg2jfkvfw3aq.jpg', 'LOppDTwbH', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703732163/a9bsxvya5uinuwokjtuj.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703732165/q8wqghpios3xtjvt2o4r.webp'),
('SPAJyZQqc', 'Trà ôlong', 'Test ', '30000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703732255/wqmur2t5gz2bu2edqiot.jpg', 'LOMGg50Aw', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703732257/m93tctmvlqmiqncppyh7.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703732259/ov9qoqzhidpgujybsfx3.jpg'),
('SPb211FlV', 'Trà sữa hokkaido', 'Test ', '40000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737018/o9hehgycleaap6j29nxi.jpg', 'LOzLFxamV', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737020/mgwhinncancftmyanxv1.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737023/tkgsf5czksop3mqzswmy.jpg'),
('SPbmnYgp4', 'Trà sữa pudding', 'pudding', '39000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737654/g2yo2o4sol1isagonlgo.jpg', 'LOLr0t7Ab', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737656/jd6tqlw000uwkwiv7gur.webp http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737658/cww7tylbvybjwqxzrmdk.jpg'),
('SPEDtHPBn', 'Trà matcha đậu đỏ', 'Mới lạ độc đáo cảm nhận vị ngon khó cưỡng', '45000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763740/eee8ciesqt8f9tur00zw.jpg', 'LOa8WulTm', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763741/lhfrdvblqvf4yicokgjp.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763743/qrsn9knunv6gxy612vus.jpg'),
('SPfDK9S1q', 'Trà sữa matcha', 'test', '50000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703732325/j26rs9hvb3zib6m8zxt2.jpg', 'LOa8WulTm', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703732328/cabmxxwxz9v7htm3tmtk.webp http://res.cloudinary.com/dyip8lyz6/image/upload/v1703732331/rjta8qahmfdwtkoaxb8l.webp'),
('SPgalVSEl', 'Trà đào', 'Đào tươi 100%', '29000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703739919/ob0uveoayjbwhvx5dp6w.jpg', 'LOyi3VTdw', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703739921/jzdwy82rylnkwfyakz3n.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703739922/bhvmowvumotdo8041ca9.jpg'),
('SPhDG3bZE', 'Trà sữa oreo cake cream', 'Sự kết hợp tuyệt vời giữa bánh oreo và vị thơm ngon của trà sữa ', '55000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763840/yhsa4w25lczbxv1kmr9v.jpg', 'LOa8WulTm', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763842/eythvxso4nbjfxzztrcr.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763844/jddf0urhpunuupszsupi.jpg'),
('SPi8NZkTe', 'Trà sữa hoa đậu biết', 'Hoa đậu biết thơm dịu hài hòa lãng mạn', '29000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763668/uqeeypv97sb2ym33qj1h.jpg', 'LOyi3VTdw', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763671/ejyuqebcsnrmkun2js6r.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763674/s68axeomcoj6yx2iyhci.jpg'),
('SPIQ6xTxb', 'Trà vãi', 'Vãi tươi mát lạnh', '25000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703740138/r7tdjzsuj4oeo9uluou2.jpg', 'LOyi3VTdw', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703740139/ua0fda4sjeacbrt6glpk.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703740141/piazvhkwen9rdbb1oksp.jpg'),
('SPk097YPB', 'Trà sữa bạc hà', 'Bạc hà the mát tránh nóng mùa hè hiệu quả', '39000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763584/odpyaapgkpwjfpwy1ir0.jpg', 'LOyi3VTdw', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763586/he8l0retk2j1xehl69vz.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763588/eahhtjwckg8dzuf2wszr.jpg'),
('SPM262Oy0', 'Sữa tưới trân châu đường đen', 'Trân châu đen', '45000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737779/skiquwlb8vvnyqzyc3rk.jpg', 'LOjQZHS0H', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737781/ox6atsa6qf8mkulajxwf.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737785/ydnk7buf2zwcx07m2mrv.png'),
('SPNyxw5sT', 'Trà sữa khoai môn', 'Test ', '27000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703731822/znmqwrgybnloymktcgdy.jpg', 'LOyi3VTdw', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703731824/ljujakpqzffqblve41kq.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703731827/tduuvwqgzfjavpznqwwl.webp'),
('SPqctCCU8', 'Trà sữa kem mặn', 'test', '38000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737600/twbkdolc5s3ykq1ox1fl.webp', 'LOefF18Zv', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737602/nzrnalqlwqqto33bfr5s.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737605/d0vfqv1jckeuywtvts3j.webp'),
('SPRt8GBr4', 'Trà sữa than tre', 'Mới lạ độc đá', '30000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763408/eyubyu44fzy5lzqzpsts.jpg', 'LO3s2BwS4', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763411/ryps0zd9jujknflraobp.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703763413/wuq84rm4h9p3vhwi9fdh.jpg'),
('SPRTD3C8S', 'Trà dâu', 'Dâu đà lạt', '39000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703740270/edknn7d4a3fpis15hezz.jpg', 'LOyi3VTdw', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703740272/xja9aybyg8obz1uv5n0a.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703740274/pbavl8ctqe94x5l2e7gt.jpg'),
('SPtVj6iOs', 'Trà sữa xoài', 'Xoài 100%', '33000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737846/qbkucqqrzvjad5qzravu.png', 'LOyi3VTdw', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737849/hns6hzgaoveiputsu9dx.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703737850/eqeaprbf2uk2jwnxmoqa.jpg'),
('SPu2tm0AS', 'Bánh pudding', 'Thơm từ trứng ngọt từ sữa', '25000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703740898/qcglnbtwkkui13pcaodv.jpg', 'LOLr0t7Ab', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703740900/dvzgjxjvpnyn5czpdafd.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703740901/pnanfvs3nskndtcgif44.jpg'),
('SPypzv1ab', 'Cà phê muối', 'Cà phê muối chuẩn vị', '34000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703739438/sc3vjhpxwmw6oliyhjg1.jpg', 'LOrBHrgZw', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703739441/xwipjyujw7ibnjsco6gj.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703739445/kj79kpvte0vh2meeqt9t.webp'),
('SPZtczyEw', 'Matcha đá xay', 'Matcha', '55000', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703739323/v3ffulmuemqvkfx1yavu.jpg', 'LOa8WulTm', 'http://res.cloudinary.com/dyip8lyz6/image/upload/v1703739325/phqpdvvctchsmpml78ri.jpg http://res.cloudinary.com/dyip8lyz6/image/upload/v1703739326/ehval0uoqyyqkm6gbdnt.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ct_hd`
--
ALTER TABLE `ct_hd`
  ADD PRIMARY KEY (`MAHD`,`MASP`),
  ADD KEY `MASP` (`MASP`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`MAGH`,`MAKH`),
  ADD KEY `MASP` (`MASP`),
  ADD KEY `MAKH` (`MAKH`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MAHD`),
  ADD KEY `MAKH` (`MAKH`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MAKH`);

--
-- Chỉ mục cho bảng `loai`
--
ALTER TABLE `loai`
  ADD PRIMARY KEY (`MALOAI`);

--
-- Chỉ mục cho bảng `nhanxet`
--
ALTER TABLE `nhanxet`
  ADD PRIMARY KEY (`MANX`),
  ADD KEY `MAKH` (`MAKH`),
  ADD KEY `MASP` (`MASP`);

--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`ROLE_USER`,`MAKH`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MASP`),
  ADD KEY `MALOAI` (`MALOAI`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `ct_hd`
--
ALTER TABLE `ct_hd`
  ADD CONSTRAINT `ct_hd_ibfk_1` FOREIGN KEY (`MAHD`) REFERENCES `hoadon` (`MAHD`),
  ADD CONSTRAINT `ct_hd_ibfk_2` FOREIGN KEY (`MASP`) REFERENCES `sanpham` (`MASP`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`MAKH`),
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`MASP`) REFERENCES `sanpham` (`MASP`),
  ADD CONSTRAINT `giohang_ibfk_3` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`MAKH`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`MAKH`);

--
-- Các ràng buộc cho bảng `nhanxet`
--
ALTER TABLE `nhanxet`
  ADD CONSTRAINT `nhanxet_ibfk_1` FOREIGN KEY (`MAKH`) REFERENCES `khachhang` (`MAKH`),
  ADD CONSTRAINT `nhanxet_ibfk_2` FOREIGN KEY (`MASP`) REFERENCES `sanpham` (`MASP`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MALOAI`) REFERENCES `loai` (`MALOAI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
