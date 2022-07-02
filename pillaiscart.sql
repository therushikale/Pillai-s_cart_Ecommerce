-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2022 at 07:24 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pillaiscart`
--

-- --------------------------------------------------------

--
-- Table structure for table `addproduct1`
--

CREATE TABLE `addproduct1` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `discount` int(50) NOT NULL,
  `discription` varchar(2000) NOT NULL,
  `about` varchar(2000) NOT NULL,
  `color` varchar(50) NOT NULL,
  `size` varchar(200) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `brand_id` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `category_id` varchar(50) NOT NULL,
  `image_1` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addproduct1`
--

INSERT INTO `addproduct1` (`id`, `name`, `price`, `discount`, `discription`, `about`, `color`, `size`, `brand`, `brand_id`, `category`, `category_id`, `image_1`) VALUES
(123400789, 'HRX', '300', 35, 'Polo,polo,Tshirts,tshirt,t-shirt,t-shirts,T-shirts,T-shirt,HRX,hrx,bellow,500,under,black,for,men,mens,boy,boys,H&M,h&m,cap,black,and,white,by', '100% Original Products Pay on delivery might be available Easy 15 days returns and exchanges Try & Buy might be available', 'black,white', 'S,M,L,XL,XXL ', '', '1009', '', '1001', 'f88a0d3c29274e53eb31.jpg'),
(124400123, 'H & M', '549', 12, 'Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,H&M,h&m,blue,and,white,by,small', '100% Original Products Pay on delivery might be available Easy 15 days returns and exchanges Try & Buy might be available', 'blue,white', 'S,M,L,XL,XXL ', '', '1009', '', '1008', 'dafff0ec93292ae6319b.jpg'),
(139400000, 'cherry crumble', '399', 50, 'for,dress,black,white,Gucci,gucci,cherry,Cherry,crumble,under,500,top,girl,Girl,girls,Girls,small,', '.', 'black,white', 'S,M,L,XL,XXL ', '', '1007', '', '1008', 'c1220565fa329a5f80ec.jpg'),
(143400345, 'YK', '659', 14, 'Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,Zara,zara,blue,and,white,by,small,YK', 'a', 'blue,white', 'S,M,L,XL,XXL ', '', '1002', '', '1008', '07bb109360ac811c5ed6.jpg'),
(156400369, 'Max', '569', 15, 'for,dress,black,pink,pumase,Puma se,Max,max,under,1000,top,girl,Girl,girls,Girls,small,', 'a', 'black,pink,white', 'S,M,L,XL,XXL ', '', '1001', '', '1008', '68a07ca8d8633914021b.jpg'),
(201400025, 'Pepe jeans', '799', 20, 'pepe,Pepe,jeans,kids,shirt,PUMA,SE,puma,se,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,orange,and,red,by,small,white', 'a', 'orange,white', 'S,M,L,XL,XXL ', '', '1001', '', '1008', 'd6f5ca84d592ca8c28b0.jpg'),
(231400655, 'Pannkh', '599', 50, 'for,saree,silk,females,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,red,brown,silk,Silk,under,1000,good,pankh,Pankh,', 'q', 'black,white,red', 'S,M,L,XL,XXL ', '', '1010', '', '1007', '3f9aac9ad6f3fb8bb17e.jpg'),
(231400674, 'MANZON', '599', 23, 'pink,red,kids ,t-shirt ,zara,T-shirt,t-shirt,t-shirts,T-shirts,T-shirt,HRX,hrx,bellow,1000,under,for,boy,boys,and,white,by', 'a', 'green,pink', 'S,M,L,XL,XXL ', '', '1002', '', '1008', 'ffef0c6703f9e2b83237.jpg'),
(241400712, 'shorts', '679', 24, 'pant,kids,calvin,klein,kid,shorts,bellow,1000,under,for,boy,boys,and,white,by,black,short,kid', 'a', 'black,green', 'S,M,L,XL,XXL ', '', '1008', '', '1008', '1a963ed4e5f87eb5f380.jpg'),
(256400966, 'HERE & NOW', '449', 30, 'Tshirts,tshirt,male,t-shirt,PUMA,SE,puma,se,T-shirt,t-shirt,t-shirts,T-shirts,T-shirt,bellow,500,under,for,men,mens,boy,boys,black,and,blue,by,jacket,jackets', '100% Original Products                                                                         Pay on delivery might be available Easy 15 days returns and exchanges Try & Buy might be available', 'blue,gray', 'S,M,L,XL,XXL ', '', '1001', '', '1001', '175a9aeb5817804b736e.jpg'),
(300400500, 'RUFF', '569', 30, 't-shirt ,kids,H&M,T-shirt,tshirt,Tshirts,tshirts,Tshirt,bellow,1000,under,for,boy,boys,H&M,h&m,blue,and,white,by,small,', '.', 'black,red,white', 'S,M,L,XL,XXL ', '', '1009', '', '1008', 'eb7f7d439620e89c7111.jpg'),
(321400658, 'Tissu', '559', 30, 'for,Tissu,tissu,kurta,female,reymond,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,1000,good,yellow,top,pant,for', 'a', 'white,yellow', 'S,M,L,XL,XXL ', '', '1003', '', '1007', '850605a6d79d97d21dac.jpg'),
(324400652, 'MINI KLUB', '889', 35, 'Tshirts,tshirt,MINI,KLUB,mini,club,Mini,kids ,t-shirt ,Reymond,reymond,T-shirt,t-shirt,t-shirts,T-shirts,T-shirt,bellow,1000,under,for,boy,boys,black,and,white,by', 'a', 'black,yellow', 'S,M,L,XL,XXL ', '', '1003', '', '1008', '4d24ae8d3a83275757bb.jpg'),
(325400645, 'Beebay', '1109', 12, 'Tshirts,tshirt,kids ,t-shirt ,gucci,T-shirt,Gucci,Beebay,beebay,kids ,t-shirt ,T-shirt,t-shirt,t-shirts,T-shirts,T-shirt,bellow,1500,under,for,boy,boys,and,white,by,red,orange', 'q', 'black,red,white', 'S,M,L,XL,XXL ', '', '1007', '', '1008', 'a39aa4103cb36d78b55e.jpg'),
(325400698, 'Taavi', '1699', 20, 'for,kurta,female,zara,dress,black,white,Zara,Taavi,taavi,under,500,top,girl,Girl,girls,Girls,small,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,2000,good,black,top,red,marron', 'a', 'black,white', 'S,M,L,XL,XXL ', '', '1002', '', '1007', '8d95e580bcb1bbc1cebd.jpeg'),
(328400695, 'Peter England', '1019', 10, 'Pant,pant,Peter,England,peter,england,shirt ,male,Zara,pant,Shirt,Shirts,shirts,shirt,bellow,1500,under,for,boy,boys,zara,black,red,marron,and,Checks,checks,by,small,men,mens,Men,Mens', 'a', 'black,white,red', 'S,M,L,XL,XXL ', '', '1002', '', '1001', '6d729bf01cb5ae8a3249.jpg'),
(332400632, 'Prakrti', '1019', 35, 'kurta,female,Gucci,gucci,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,1500,good,red,white,top,pant', 'a', 'red,white', 'S,M,L,XL,XXL ', '', '1007', '', '1007', '88a0a2c7efa5ff2c7462.jpg'),
(333400625, 'Vasmsi', '686', 30, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,red,brown,silk,Silk,under,1000,good,Vasmsi,vasmsi', 'a', 'red,green', 'S,M,L,XL,XXL ', '', '1010', '', '1007', '7759ed725bf7f6e63c61.jpg'),
(333400652, 'Vishudh', '524', 60, 'kurta,female,H&M,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,1000,good,white,black,top,pant,Vishudh,vishudh', 'a', 'blue,black', 'S,M,L,XL,XXL ', '', '1009', '', '1007', '06c6112f1570b150b725.jpg'),
(336400635, 'Kook N keeh', '999', 39, 'shirt ,male,reymond,pant,Pant,pant,kook,n,keeh,Kook,N,keeh,shirt,male,Reymond,pant,Shirt,Shirts,shirts,shirt,bellow,1500,under,for,boy,boys,black,red,marron,and,Checks,checks,by,small,men,mens,Men,Mens', 'a', 'black,white', 'S,M,L,XL,XXL ', '', '1003', '', '1001', 'a6694bb3153785d59767.jpg'),
(354400354, 'Arika', '595', 35, 'shirt,puma,se,kids,PUMA,SE,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,blue,and,white,by,small', 'a', 'blue,black', 'S,M,L,XL,XXL ', '', '1001', '', '1008', 'f50cad04f989849c6065.jpg'),
(362400065, 'Deklook', '499', 36, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,red,white,silk,Silk,under,500,good,Deklook,deklook', 'a', 'red ,white', 'S,M,L,XL,XXL ', '', '1010', '', '1007', '6d4fefa7d9347df17a86.jpg'),
(364400651, 'Ahilyaa', '1189', 35, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,black,white,silk,Silk,gray,under,1500,good,Ahilyaa,ahilyaa', 'a', 'black,white,gray', 'S,M,L,XL,XXL ', '', '1010', '', '1007', '04bf8143ccd08fe0a391.jpg'),
(365400235, 'Libas', '598', 36, 'for,kids,skirt,PUMA,SE,puma,se,Puma,dress,black,blue,Libas,libas,under,1000,top,girl,Girl,girls,Girls,small,', 'a', 'blue,black', 'S,M,L,XL,XXL ', '', '1001', '', '1008', 'bc4f5008ad5d9e89029f.jpg'),
(365400943, 'Levis', '599', 10, 'Full,full,sleeves,sleeve,t-shirt ,kids,gucci,T-shirt,t-shirt,t-shirts,T-shirts,T-shirt,Levis,levis,bellow,1000,under,for,men,mens,boy,boys,blue,and,white,by', 'a', 'white,blue', 'S,M,L,XL,XXL ', '', '1007', '', '1001', '8c9fb48856bb8060fada.jpg'),
(366400233, 'Biba', '399', 45, 'for,kurta,female,calvin,Klein,Calvin,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,pink,under,500,good,white,top,pant', 'a', 'pink,white', 'S,M,L,XL,XXL ', '', '1008', '', '1007', 'b8756ee7cc1c37d64dec.jpg'),
(367400954, 'GERUA', '815', 36, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,red,white,silk,Silk,under,1000,good,GERUA,Gerua,gerua', 'a', 'white,red,pink', 'S,M,L,XL,XXL ', '', '1010', '', '1007', '8f239a47d6a3eba265cc.jpg'),
(369400258, 'ESME', '599', 36, 'for,gucii,kids,skirt,dress,black,white,Gucci,gucci,ESME,Esme,esme,under,1000,top,girl,Girl,girls,Girls,small,', 'a', 'white,black', 'S,M,L,XL,XXL ', '', '1007', '', '1008', '09e6ecb619d47a2b0ecf.jpg'),
(369400612, 'CACA CINA', '616', 35, 'for,gucii,kids,skirt,dress,pink,blue,Gucci,gucci,CACA,CINA,Caca,Cina,caca,cina,under,1000,top,girl,Girl,girls,Girls,small,', 'a', 'pink,blue', 'S,M,L,XL,XXL ', '', '1007', '', '1008', '2ec43a977ed580c879a0.jpg'),
(369400632, 'FabIndia', '1490', 12, 'for,kurta,female,zara,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,1500,good,white,top,pant,FabIndia,fabindia', 'a', 'white,black', 'S,M,L,XL,XXL ', '', '1002', '', '1007', '8eb93c662135bfb35e4a.jpg'),
(369400699, 'Bell moda', '459', 20, 'kids,calvin,klein,gucii,kids,skirt,dress,pink,white,under,500,top,girl,Girl,girls,Girls,small,Calvin,Bell,moda,bela', 'a', 'white,pink', 'S,M,L,XL,XXL ', '', '1008', '', '1008', '7db583b7506d9cf6e93e.jpg'),
(377400632, 'Anouk', '459', 37, 'for,Anouk,anouk,kurta,female,zara,gray,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,pink,under,500,good,black,top,pant,Zara', 'a', 'black,gray,pink', 'S,M,L,XL,XXL ', '', '1002', '', '1007', '99edb4a020139b1fb2c5.jpg'),
(388400655, 'DODO & MOA', '1195', 38, 'kurta,female,H&M,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,1500,good,black,top,pant', 'a', 'black,red', 'S,M,L,XL,XXL ', '', '1009', '', '1007', 'a2d3f369066b31f7c827.jpg'),
(394400651, 'Mast & Harbour', '395', 45, ',Tshirts,tshirt,Mast,Harbour,harbour,mast,t-shirt ,male,calvin,klein,T-shirt,t-shirt,t-shirts,T-shirts,T-shirt,bellow,500,under,for,men,mens,boy,boys,H&M,h&m,black,and,white,by', 'a', 'black,white', 'S,M,L,XL,XXL ', '', '1008', '', '1001', 'dbc9a0addffcea15416f.jpg'),
(398400366, '  Kook N Keech', '699', 45, 't-shirt ,kids,zara,T-shirt,pant,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,Zara,white,and,white,by,men,mens,male,Males,Male,jacket,Jackets', 'a', 'white,black', 'S,M,L,XL,XXL ', '', '1002', '', '1001', 'e7c36b717c4cbc554b79.jpg'),
(407400740, 'Nauti Nati', '399', 40, 'for,kids,skirt,PUMA,SE,puma,se,Puma,dress,yellow,white,Gucci,gucci,Nauti ,nauti ,nati,Nati,under,500,top,girl,Girl,girls,Girls,small,red', 'a', 'yellow,red', 'S,M,L,XL,XXL ', '', '1001', '', '1008', 'dcfb90f44fed7a0c5e61.jpg'),
(432400219, 'Taavi', '659', 43, 'for,taavi,Taavi,kurta,female,reymond,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,blue,pink,under,1000,good,yellow,top,pant', 'a', 'yellow,blue,pink', 'S,M,L,XL,XXL ', '', '1003', '', '1007', '34c48acab286ff5cf0a4.jpg'),
(440400654, 'SARRA', '889', 40, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,red,green,silk,Silk,under,1000,good,SARRA,sarra,Sarra', 'a', 'red,green', 'S,M,L,XL,XXL ', '', '1010', '', '1007', '8cfbf7bc375cfc7738e0.jpg'),
(448400333, 'HELLCAT', '559', 20, 'shirt ,kids,zara,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,Zara,blue,and,white,by,small', 'a', 'blue,white', 'S,M,L,XL,XXL ', '', '1002', '', '1008', '7f20bf7423f9004f5538.jpg'),
(455400544, 'Inddus', '959', 45, 'for,Inddus,inddus,kurta,female,calvin,Klein,Calvin,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,1000,good,yellow,top,pant', 'a', 'orange,white', 'S,M,L,XL,XXL ', '', '1008', '', '1007', '8b6e342df5278e71ea1d.jpg'),
(456400986, 'Campus Sutra', '399', 33, 'Tshirts,tshirt,Zara,t-shirt ,kids,zara,T-shirt,t-shirt,t-shirts,T-shirts,T-shirt,bellow,500,under,for,men,mens,boy,boys,black,and,white,by,green,red', 'a', 'green,white,red,black', 'S,M,L,XL,XXL ', '', '1002', '', '1001', '81d6a94ad2fffdd9674e.jpg'),
(463400976, 'Polo', '249', 50, 'Tshirts,tshirt,Tshirts,tshirt,Polo,polo,t-shirt ,male,calvin,klein,T-shirt,Calvin,t-shirt,t-shirts,T-shirts,T-shirt,bellow,500,under,for,red,men,mens,boy,boys,black,and,white,by', 'a', 'red,white,black', 'S,M,L,XL,XXL ', '', '1008', '', '1001', '154619fb3a531c744b8e.jpg'),
(465400655, 'Levis', '499', 43, 'for,red,black,pink,Reymond,reymond,kids,skirt,dress,black,Levis,levis,under,500,top,girl,Girl,girls,Girls,small,Dress,Skirts,Skirt', 'a', 'red,black,pink', 'S,M,L,XL,XXL ', '', '1003', '', '1008', '7324d13843aef265c07d.jpg'),
(465400687, 'Nautica', '499', 35, 'Tshirts,tshirt,Nautica,nautica,male,tshirt,PUMA,SE,puma,se,t-shirt,t-shirts,T-shirts,T-shirt,bellow,500,under,for,men,mens,boy,boys,black,and,white,by', 'a', 'black,white', 'S,M,L,XL,XXL ', '', '1001', '', '1001', '30828dcf7460e42f95c8.jpg'),
(478400899, 'GAP', '524', 30, 'for,reymond,kids,skirt,gap,dress,black,white,reymond,Reymond,under,1000,top,girl,Girl,girls,Girls,small,', 'a', 'white,pink', 'S,M,L,XL,XXL ', '', '1003', '', '1008', '0853ed9520cef9f0c7af.jpg'),
(489400639, 'Roadster', '329', 30, 'Tshirts,tshirt,shirt ,male,gucci,blue,white,Shirt,Shirts,shirts,shirt,bellow,500,under,for,boy,boys,blue,and,white,by,men,Men,mens,Mens', 'a', 'blue,white', 'S,M,L,XL,XXL ', '', '1007', '', '1001', '4f72eedca30023e6ed1e.jpg'),
(496400987, 'GANT', '500', 50, 'Tshirts,tshirt,t-shirt ,male,gucci,T-shirt,full,sleeves,t-shirt,t-shirts,T-shirts,T-shirt,bellow,500,under,for,men,mens,boy,boys,black,and,white,by,Gucci', 'a', 'black,white', 'S,M,L,XL,XXL ', '', '1007', '', '1001', '0d0e8f52a796b4463f80.jpg'),
(500400654, 'Libas', '598', 50, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,red ,white,silk,Silk,white,under,1000,good,Libas,libas', 'a', 'red ,white', 'S,M,L,XL,XXL ', '', '1010', '', '1007', '726020589259da314362.jpg'),
(564400627, 'Sangria', '844', 33, 'for,sangria,Sangria,kurta,female,H&M,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,1000,good,pink,top,pant,pink,white', 'a', 'pink,white,yellow', 'S,M,L,XL,XXL ', '', '1009', '', '1007', '43b011bfc6e90053b20e.jpg'),
(622400321, 'Aroziya', '689', 62, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,black,white,silk,Silk,red,under,1500,good,Ahilyaa,ahilyaa', 'a', 'white,red', 'S,M,L,XL,XXL ', '', '1010', '', '1007', 'db6106e833a18900de91.jpg'),
(632400639, 'MANZON', '699', 50, 'Tshirts,tshirt,t-shirt ,kids,calvin,klein,T-shirt,t-shirt,t-shirts,T-shirts,T-shirt,bellow,1000,under,for,men,mens,boy,boys,black,and,white,by,red,white', 'a', 'yellow,black,red,white', 'S,M,L,XL,XXL ', '', '1008', '', '1008', 'a8f4d4b4c2341d0da8cd.jpg'),
(633400654, 'PISARA', '349', 63, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,black,white,silk,Silk,red,under,1500,good,Ahilyaa,ahilyaa', 'a', 'black,red,white', 'S,M,L,XL,XXL ', '', '1010', '', '1007', 'd0af52b5e4f5386804fd.jpg'),
(634400687, 'Raymond', '759', 20, 'shirt ,male,reymond,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,black,and,white,by,male,men,Men,Mens,mens', '100% Original Products Pay on delivery might be available Easy 15 days returns and exchanges Try & Buy might be available', 'black,white', 'S,M,L,XL,XXL ', '', '1003', '', '1001', 'eea0846b49eb7dca26e5.jpg'),
(635400965, 'JAINISH', '899', 10, 'shirt ,male,Zara,zara,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,black,and,white,by,male,men,Men,Mens,mens', 'a', 'gray,white', 'S,M,L,XL,XXL ', '', '1002', '', '1001', '9fed3511f8bc08d245b2.jpg'),
(639400651, 'Hancock', '699', 20, 'shirt ,male,Calvin,klein,calvin,klein,shirt ,male,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,yellow,and,red,by,male,men,Men,Mens,mens,gray', '100% Original Products Pay on delivery might be available Easy 15 days returns and exchanges Try & Buy might be available', 'yellow,gray,red', 'S,M,L,XL,XXL ', '', '1008', '', '1001', '1621aaf9025156b8f16e.jpg'),
(651400958, 'Sariya', '399', 65, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,black,white,silk,Silk,blue,under,1500,good,Ahilyaa,ahilyaa', 'a', 'blue,white', 'S,M,L,XL,XXL ', '', '1010', '', '1007', '5af4475e7bb26a07bf2f.jpg'),
(654400964, 'WROGN', '1119', 15, 'white,shirt ,male,reymond,shirt ,male,Calvin,klein,calvin,klein,shirt ,male,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,yellow,and,brown,by,male,men,Men,Mens,mens,', 'a', 'brown,white', 'S,M,L,XL,XXL ', '', '1003', '', '1001', '99aef0f69cb5f344bc5d.jpg'),
(655400321, 'Nautica', '899', 35, 'shirt ,male,zara,pant,shirt ,male,Calvin,klein,calvin,klein,shirt ,male,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,white,and,black,by,male,men,Men,Mens,mens,gray', 'a', 'white,black', 'S,M,L,XL,XXL ', '', '1002', '', '1001', '40491e8dd743e4755cda.jpg'),
(694400358, 'Shaibo', '569', 64, 'for,saree,silk,female,Saree,Sarres,sarre,sarres,girls,girl,women,womens,Women,Womens,black,white,silk,Silk,under,1500,good,Ahilyaa,ahilyaa', 'a', 'white,black', 'S,M,L,XL,XXL ', '', '1010', '', '1007', '08fcb64d9df94c18a0ab.jpg'),
(698400325, 'Nautica', '999', 35, 'pant,male,gucci,Gucci,pant,bellow,1000,under,for,boy,boys,and,white,by,black,men,Men,mens,Mens', 'a', 'black,white', 'S,M,L,XL,XXL ', '', '1007', '', '1001', '408b8f8183a0b84cbc5e.jpg'),
(756400698, ' Bene kleed', '599', 35, 'shirt ,male,zara,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,H&M,h&m,blue,and,white,by,small,orange,black,pink', 'a', 'orange,black,pink', 'S,M,L,XL,XXL ', '', '1002', '', '1001', '2363b9c104193d0c6230.jpg'),
(759400632, 'LOCOMOTIVE', '559', 25, 'shirt ,male,reymond,shirt ,male,zara,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,H&M,h&m,blue,and,white,by,small,black,', 'a', 'white,black', 'S,M,L,XL,XXL ', '', '1003', '', '1001', 'cfc7d40e65d0088dbbf6.jpg'),
(782400333, 'CUTECUMBER', '1295', 10, 'for,calvin,klein,kids,skirt,dress,black,white,under,1500,top,girl,Girl,girls,Girls,small,pink,gray,white', 'a', 'pink,gray,white', 'S,M,L,XL,XXL ', '', '1008', '', '1008', '0a125db8bdb96beed758.jpg'),
(784400959, 'Tom & Jerry', '345', 40, 'Tshirts,tshirt,t-shirt ,kids,H & M,T-shirt,Shirt,Shirts,shirts,shirt,bellow,500,under,for,boy,boys,H&M,h&m,blue,and,white,by,small,', 'a', 'red , white', 'S,M,L,XL,XXL ', '', '1009', '', '1001', '11c71f1c44eada63baab.jpg'),
(789400399, 'Disney', '539', 36, 'for,H & M,kids,skirt,dress,black,white,Gucci,gucci,under,500,top,girl,Girl,girls,Girls,small,orange,white,pink', 'a', 'orange,white,pink', 'S,M,L,XL,XXL ', '', '1009', '', '1008', 'c4c21e99951439d925fa.jpg'),
(789400444, 'Stylo Bug', '499', 30, 'shirt ,kids,gucci,Shirt,Shirts,shirts,shirt,bellow,500,under,for,boy,boys,H&M,h&m,blue,and,white,by,small,khaki,black,white,police', 'a', 'khaki,black,white', 'S,M,L,XL,XXL ', '', '1007', '', '1008', '24e3f2623313a019f020.jpg'),
(789400655, 'H & M', '499', 50, 'shirt ,male,H & M,Shirt,Shirts,shirts,shirt,bellow,1000,under,for,boy,boys,H&M,h&m,blue,and,white,by,small,black,red,men,Mens,Men,mens', 'a', 'black,red', 'S,M,L,XL,XXL ', '', '1009', '', '1001', '710d39a0fa1be6c65f17.jpg'),
(864400364, 'HERE & NOW', '399', 40, 'shirt ,male,reymond,Shirt,Shirts,shirts,shirt,bellow,500,under,for,boy,boys,black,and,white,by,male,men,Men,Mens,mens,black,pink,white', 'a', 'black,pink,white', 'S,M,L,XL,XXL ', '', '1003', '', '1001', '03b840caa41c1107e257.jpg'),
(911400333, 'HIGHLANDER', '1229', 34, 'pant,men,pant,male,h&m,H&M,pant,bellow,1000,under,for,boy,boys,and,blue,by,black,men,Men,mens,Mens', 'a', 'black,blue', 'S,M,L,XL,XXL ', '', '1009', '', '1001', '9dc1804d611c45a09cbd.jpg'),
(963400655, 'Roadster', '695', 32, 'pant,male,puma,se,PUMA,SE,pant,men,pant,male,pant,bellow,1000,under,for,boy,boys,and,blue,by,black,men,Men,mens,Mens', 'a', 'black,white', 'S,M,L,XL,XXL ', '', '1001', '', '1001', '2691f73cc62ed6b63c93.jpg'),
(964400321, 'Raodster', '799', 60, 'pant,male,puma,se,white,PUMA,SE,pant,men,pant,male,h&m,H&M,pant,bellow,1000,under,for,boy,boys,and,blue,by,black,men,Men,mens,Mens', 'a', 'black,white', 'S,M,L,XL,XXL ', '', '1001', '', '1001', '4705180d4c004962fab1.jpg'),
(965400321, 'Raodster', '859', 30, 'pant,male,calvin,klein,pant,men,pant,male,pant,bellow,1000,under,for,boy,boys,and,blue,by,black,men,Men,mens,Mens', 'a', 'black,white', 'S,M,L,XL,XXL ', '', '1008', '', '1001', 'd4b93c7da073335453ad.jpg'),
(965400694, 'Kook N keech', '449', 30, 't-shirt ,men,zara,T-shirt', 'a', 'black,white,gray,t-shirt,t-shirts,T-shirts,T-shirt', 'S,M,L,XL,XXL ', '', '1002', '', '1001', '424e7c4b76401c011d25.jpg'),
(966400622, 'Anubhutee', '499', 56, 'for,kurta,female,Gucci,gucci,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,500,good,yellow,top,pant,black,white,red,green', 'a', 'black,white,red,green', 'S,M,L,XL,XXL ', '', '1007', '', '1007', 'd6b195259097619aa276.jpg'),
(2147483647, 'Rain & Rainbow', '1285', 60, 'for,kurta,female,calvin Klein,kurta,Kurta,Kurtas,kurta,girls,girl,women,womens,Women,Womens,red,under,1500,good,yellow,top,pant,red,white', 'a', 'red,white', 'S,M,L,XL,XXL ', '', '1008', '', '1007', '472766eb2cd9e4455b78.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1001, 'PUMA SE'),
(1002, 'Zara'),
(1003, 'reymond'),
(1007, 'Gucci'),
(1008, 'calvin Klein'),
(1009, 'H & M'),
(1010, 'Silk');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1001, 'male'),
(1007, 'female'),
(1008, 'kids');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `orders` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`id`, `invoice`, `status`, `customer_id`, `date_created`, `orders`) VALUES
(1, 'db5a7fec80', 'Pending', 110106, '2021-05-24 15:03:58', '{\"123400789\": {\"color\": \"black\", \"colors\": \"black\", \"discount\": 20, \"image\": \"ec21eeebb6ceedc04c0e.jpg\", \"name\": \"HRX\", \"price\": \"300\", \"quantity\": 1}, \"124400123\": {\"color\": \"black\", \"colors\": \"black,white,yellow\", \"discount\": 12, \"image\": \"dafff0ec93292ae6319b.jpg\", \"name\": \"H & M\", \"price\": \"549\", \"quantity\": 1}}'),
(88, '4c135d33c5', 'Paid', 110167, '2021-12-27 10:17:06', '{\"256400966\": {\"color\": \"blue\", \"discount\": 30, \"name\": \"HERE & NOW\", \"price\": \"449\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(89, '554555d494', 'Paid', 110167, '2021-12-27 10:17:54', '{\"325400645\": {\"color\": \"black\", \"discount\": 12, \"name\": \"Beebay\", \"price\": \"1109\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(90, '68bb0e38db', 'Pending', 110166, '2021-12-28 15:04:58', '{\"321400200\": {\"color\": \"black\", \"discount\": 20, \"name\": \"Bhama couture\", \"price\": \"679\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(91, '5f23206756', 'Pending', 110178, '2022-01-03 16:36:17', '{\"124400123\": {\"color\": \"blue\", \"discount\": 12, \"name\": \"H & M\", \"price\": \"549\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(92, 'a603a17a2d', 'Pending', 110178, '2022-01-03 16:36:59', '{\"328400695\": {\"color\": \"black\", \"discount\": 10, \"name\": \"Peter England\", \"price\": \"1019\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(93, '805a6b30ad', 'Pending', 110178, '2022-01-03 17:30:38', '{\"256400966\": {\"color\": \"blue\", \"discount\": 30, \"name\": \"HERE & NOW\", \"price\": \"449\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(94, '002c4a5c38', 'Pending', 110169, '2022-01-03 18:25:30', '{\"256400966\": {\"color\": \"blue\", \"discount\": 30, \"name\": \"HERE & NOW\", \"price\": \"449\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(95, '0196160197', 'Pending', 110167, '2022-01-04 05:11:27', '{\"124400123\": {\"color\": \"blue\", \"discount\": 12, \"name\": \"H & M\", \"price\": \"549\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(96, '16ecfc25ef', 'Pending', 110167, '2022-01-04 05:11:36', '{\"124400123\": {\"color\": \"blue\", \"discount\": 12, \"name\": \"H & M\", \"price\": \"549\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"300400500\": {\"color\": \"black\", \"discount\": 30, \"name\": \"RUFF\", \"price\": \"569\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"333400652\": {\"color\": \"blue\", \"discount\": 60, \"name\": \"Vishudh\", \"price\": \"524\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(97, '665f113954', 'Pending', 110167, '2022-01-04 10:23:35', '{\"300400500\": {\"color\": \"black\", \"discount\": 30, \"name\": \"RUFF\", \"price\": \"569\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(98, '635c426e27', 'Pending', 110167, '2022-01-04 16:08:48', '{\"123400789\": {\"color\": \"white\", \"discount\": 35, \"name\": \"HRX\", \"price\": \"300\", \"quantity\": \"4\", \"size\": null, \"sizes\": \"S,M,L,XL,XXL \"}, \"300400500\": {\"color\": \"black\", \"discount\": 30, \"name\": \"RUFF\", \"price\": \"569\", \"quantity\": \"1\", \"size\": null, \"sizes\": \"S,M,L,XL,XXL \"}}'),
(99, 'adc142ce21', 'Pending', 110166, '2022-01-05 14:36:32', '{\"124400123\": {\"color\": \"blue\", \"discount\": 12, \"name\": \"H & M\", \"price\": \"549\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(100, '1cc2724c27', 'Pending', 110166, '2022-01-05 15:02:55', '{\"123400789\": {\"color\": \"black\", \"discount\": 35, \"name\": \"HRX\", \"price\": \"300\", \"quantity\": \"4\", \"size\": null, \"sizes\": \"S,M,L,XL,XXL \"}, \"328400695\": {\"color\": \"black\", \"discount\": 10, \"name\": \"Peter England\", \"price\": \"1019\", \"quantity\": 3, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"336400635\": {\"color\": \"black\", \"discount\": 39, \"name\": \"Kook N keeh\", \"price\": \"999\", \"quantity\": 2, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"394400651\": {\"color\": \"black\", \"discount\": 45, \"name\": \"Mast & Harbour\", \"price\": \"395\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"465400687\": {\"color\": \"black\", \"discount\": 35, \"name\": \"Nautica\", \"price\": \"499\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"489400639\": {\"color\": \"blue\", \"discount\": 30, \"name\": \"Roadster\", \"price\": \"329\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(101, '4d5a3fe0ba', 'Pending', 110167, '2022-01-05 18:08:06', '{\"300400500\": {\"color\": \"black\", \"discount\": 30, \"name\": \"RUFF\", \"price\": \"569\", \"quantity\": \"1\", \"size\": null, \"sizes\": \"S,M,L,XL,XXL \"}, \"333400652\": {\"color\": \"blue\", \"discount\": 60, \"name\": \"Vishudh\", \"price\": \"524\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(102, 'fd09683fff', 'Pending', 110167, '2022-01-06 04:05:52', '{\"123400789\": {\"color\": \"black\", \"discount\": 35, \"name\": \"HRX\", \"price\": \"300\", \"quantity\": \"6\", \"size\": null, \"sizes\": \"S,M,L,XL,XXL \"}}'),
(103, 'a9aa9b1741', 'Pending', 110167, '2022-01-06 04:11:03', '{\"123400789\": {\"color\": \"black\", \"discount\": 35, \"name\": \"HRX\", \"price\": \"300\", \"quantity\": \"5\", \"size\": null, \"sizes\": \"S,M,L,XL,XXL \"}}'),
(104, '63705d9c07', 'Pending', 110167, '2022-01-06 04:16:35', '{\"124400123\": {\"color\": \"blue\", \"discount\": 12, \"name\": \"H & M\", \"price\": \"549\", \"quantity\": \"1\", \"size\": null, \"sizes\": \"S,M,L,XL,XXL \"}}'),
(105, '952822647b', 'Pending', 110167, '2022-01-06 07:58:47', '{\"300400500\": {\"color\": \"red\", \"discount\": 30, \"name\": \"RUFF\", \"price\": \"569\", \"quantity\": \"6\", \"size\": \"M\", \"sizes\": \"S,M,L,XL,XXL \"}, \"333400652\": {\"color\": \"black\", \"discount\": 60, \"name\": \"Vishudh\", \"price\": \"524\", \"quantity\": \"8\", \"size\": \"XXL \", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(106, '2523d946e9', 'Pending', 110167, '2022-01-06 08:37:58', '{\"332400632\": {\"color\": \"red\", \"discount\": 35, \"name\": \"Prakrti\", \"price\": \"1019\", \"quantity\": \"4\", \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"365400943\": {\"color\": \"blue\", \"discount\": 10, \"name\": \"Levis\", \"price\": \"599\", \"quantity\": \"4\", \"size\": \"L\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(107, '781eb06073', 'Paid', 110167, '2022-01-06 08:47:32', '{\"300400500\": {\"color\": \"black\", \"discount\": 30, \"name\": \"RUFF\", \"price\": \"569\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"333400652\": {\"color\": \"blue\", \"discount\": 60, \"name\": \"Vishudh\", \"price\": \"524\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(108, 'a81f8322ed', 'Paid', 110167, '2022-01-06 09:06:13', '{\"300400500\": {\"color\": \"black\", \"discount\": 30, \"name\": \"RUFF\", \"price\": \"569\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"333400652\": {\"color\": \"blue\", \"discount\": 60, \"name\": \"Vishudh\", \"price\": \"524\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(109, 'bb446d4f39', 'Paid', 110167, '2022-01-06 09:44:56', '{\"156400369\": {\"color\": \"black\", \"discount\": 15, \"name\": \"Max\", \"price\": \"569\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"300400500\": {\"color\": \"black\", \"discount\": 30, \"name\": \"RUFF\", \"price\": \"569\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}, \"333400652\": {\"color\": \"blue\", \"discount\": 60, \"name\": \"Vishudh\", \"price\": \"524\", \"quantity\": 1, \"size\": \"S\", \"sizes\": \"S,M,L,XL,XXL \"}}'),
(110, '9812c3ebe7', 'Paid', 110167, '2022-01-07 04:25:15', '{\"139400000\": {\"color\": \"white\", \"discount\": 50, \"name\": \"cherry crumble\", \"price\": \"399\", \"quantity\": \"6\", \"size\": \"L\", \"sizes\": \"S,M,L,XL,XXL \"}}');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `profile` varchar(60) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `name`, `email`, `password`, `address`, `contact`, `city`, `country`, `gender`, `pincode`, `profile`, `date_created`) VALUES
(110166, 'rushi Kale', 'rushi123@gmail.com', '12345678', 'panvel', '7287898278', 'mumbai', 'profile1.jpg', 'male', '410218', '8c6fd744a06ca3f6508e.jpg', '2021-12-27 08:26:24'),
(110167, 'Rushi kale', 'rushikale136@gmail.com', '12345678', 'kalamboli,panvel', '7287898278', 'maharashtra', 'India', 'male', '410218', 'b4eacc4a20a2ed24d5cf.jpg', '2021-12-27 08:41:57'),
(110168, 'rushi Kale', 'rushi12@gmail.com', '12345678', 'PATIL CHAL KALAMBOLI GAON, KALAMBOLI,NEW PANVEL', '7287898278', 'maharashtra', 'India', 'male', '410218', 'profile1.jpg', '2022-01-02 13:50:41'),
(110169, 'omroy', 'omroy45@gmail.com', '12345678', 'panvel', '9137958564', 'mumbai', 'India', 'male', '345678', '03e0e7a1c18e584db476.jpg', '2022-01-03 05:06:01'),
(110170, 'omroy', 'omroy465@gmail.com', '12345678', 'panvel', '9137958564', 'maharashtra', 'India', 'male', '345678', 'profile1.jpg', '2022-01-03 05:23:19'),
(110171, 'omroy', 'omroy477@gmail.com', '12345678', 'panvel', '9137958564', 'maharashtra', 'India', 'male', '345678', 'profile1.jpg', '2022-01-03 05:24:17'),
(110172, 'omroy', 'omroy45666@gmail.com', '12345678', 'panvel', '9137958564', 'maharashtra', 'India', 'male', '345678', 'profile1.jpg', '2022-01-03 05:32:51'),
(110173, 'ram roy', 'ramroy6645@gmail.com', '12345678', 'panvel', '9137958564', 'maharashtra', 'India', 'male', '345678', 'profile1.jpg', '2022-01-03 05:33:42'),
(110174, 'omroy', 'omroy45656@gmail.com', '12345678', 'panvel', '9137958564', 'maharashtra', 'India', 'male', '345678', 'profile1.jpg', '2022-01-03 05:35:10'),
(110175, 'omroy', 'omroy456@gmail.com', '12345678', 'panvel', '9137958564', 'maharashtra', 'India', 'male', '345678', 'profile1.jpg', '2022-01-03 07:33:39'),
(110176, 'bhushan', 'bhushan45@gmail.com', '12345678', '', '9137958564', 'maharashtra', 'India', '', '', 'profile1.jpg', '2022-01-03 13:39:24'),
(110177, 'omroy', 'omroy4445@gmail.com', '12345678', 'panvel', '9137958564', 'maharashtra', 'India', 'male', '345678', 'e5c00373fd34d1ef89ab.jpg', '2022-01-03 13:39:59'),
(110178, 'omroy', 'omroy45@gmail.com', '12345678', 'panvel', '9137958564', 'mumbai', 'India', 'male', '345678', '1ab5e07f98d29fbad23a.jpg', '2022-01-03 15:52:15'),
(110179, 'rushi kale', 'kaleruba19it@student.mes.ac.in', '12345678', '', '9137958564', 'city?', 'India', '', '', 'profile1.jpg', '2022-01-04 04:40:41'),
(110180, 'omroy', 'omroy46675@gmail.com', '12345678', '', '9137958564', 'none', 'India', '', '', 'profile1.jpg', '2022-01-04 05:52:34'),
(110181, 'aman roy', 'aman123@gmail.com', '12345678', '', '7287898278', 'none', 'India', '', '', '0a4fd1c4c50000a3e03e.jpg', '2022-01-05 15:08:56');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `sno` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `password` int(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`sno`, `name`, `email`, `address`, `password`, `phone_no`) VALUES
(0, 'aksash', 'akki178@gmail.com', 'panvel', 0, '9139895989'),
(0, 'aniket', 'aniket169@gmail.com', 'panvel', 0, '9137958265'),
(0, 'raj roy', 'raj456@gmail.com', 'panvel', 0, '9136987564'),
(1, 'rushi kale', 'ram100@gmil.com', 'panvel', 0, '9137958265'),
(0, 'rushikesh', 'ramr100@gmil.com', 'panvel', 0, '4567879844'),
(0, 'aniket rao', 'rao234@gmail.com', 'panvel', 0, '4567894567'),
(0, 'ravi kumar', 'ravi231@gmail.com', 'panvel', 0, '9139895989'),
(0, 'vijay rao', 'vijay123@gmail.com', 'panvel', 123, '9136987564');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `sno` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address` varchar(50) NOT NULL,
  `password` binary(50) NOT NULL,
  `phone_no` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`sno`, `name`, `email`, `address`, `password`, `phone_no`) VALUES
(1, 'rushi Kale', 'rushi123@gmail.com', 'PATIL CHAL KALAMBOLI GAON, KALAMBOLI,NEW PANVEL', 0x3132333435363738000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '08879576642'),
(27, 'pillais cart', 'pillaisadmin@gamail.com', 'PATIL CHAL KALAMBOLI GAON, KALAMBOLI,NEW PANVEL', 0x3132333435363738000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '08879576642'),
(28, 'omroy', 'omroy45@gmail.com', 'panvel', 0x3132333435363738000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '9137958265'),
(29, 'omroy', 'omroy45@gmail.com', 'panvel', 0x3132333435363738000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '9137958265'),
(30, 'pillai\'s admin', 'pillaisadmin@gmail.com', 'panvel', 0x3132333435363738000000000000000000000000000000000000000000000000000000000000000000000000000000000000, '9999999999');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addproduct1`
--
ALTER TABLE `addproduct1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1012;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110182;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
