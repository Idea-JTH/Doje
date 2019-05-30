-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 19-01-29 16:00
-- 서버 버전: 10.1.37-MariaDB
-- PHP 버전: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `hotdog`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `freeboard`
--

CREATE TABLE `freeboard` (
  `id` int(15) NOT NULL,
  `writer` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `writedate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `freeboard`
--

INSERT INTO `freeboard` (`id`, `writer`, `title`, `content`, `writedate`) VALUES
(1, '태현짱짱맨3', '첫번째 글', '<p>첫번째 글입니다요~</p>', '2019-01-29 23:38:45');

-- --------------------------------------------------------

--
-- 테이블 구조 `user`
--

CREATE TABLE `user` (
  `id` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `regdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`id`, `password`, `nickname`, `email`, `phonenumber`, `regdate`) VALUES
('midnsmidns12', '*FF60283097F46E403C7C9E9A181834BC1D0B25BA', '태현짱짱맨3', 'midns@midns.com', '01062879761', '2019-01-22'),
('zxcv', '*F95008B30C8987EA3327BBABBF7F4562F2FCE6AB', '태짱15호', 'jth0415@nate.com', '01062879761', '2019-01-29');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `freeboard`
--
ALTER TABLE `freeboard`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `freeboard`
--
ALTER TABLE `freeboard`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
