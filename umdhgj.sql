-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 03:52 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `umdhgj`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `fshiej_dhuruesit` (IN `p_ID_dhuruesit` INT(11))  DELETE FROM umdhgj_dhuruesit WHERE ID_dhuruesit=p_ID_dhuruesit$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fshiej_ggj` (IN `p_ID_GrupiGjakut` INT(11))  DELETE FROM umdhgj_grupetegjakut WHERE ID_GrupiGjakut=p_ID_GrupiGjakut$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fshiej_kont` (IN `p_ID_Kontakti` INT(11))  DELETE FROM umdhgj_kontakti WHERE ID_Kontakti=p_ID_Kontakti$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fshiej_kontakt` (IN `p_kusht` VARCHAR(200))  SELECT
    *
FROM
    umdhgj_kontakti
WHERE
    Subjekti LIKE CONCAT('%', p_kusht , '%') OR Email LIKE CONCAT('%', p_kusht , '%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `fshiej_perdorues` (IN `p_epid` INT(11))  DELETE FROM umdhgj_perdoruesit WHERE epid=p_epid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `perditeso_dhuruesit` (IN `p_Emri_dhuruesit` VARCHAR(50), IN `p_Mbiemri_dhuruesit` VARCHAR(50), IN `p_Mosha_dhuruesit` INT(11), IN `p_Adresa_dhuruesit` VARCHAR(50), IN `p_ID_GrupiGjakut` INT(11), IN `p_Foto_dh` BLOB, IN `p_Emri_Fotos` VARCHAR(50), IN `p_ID_dhuruesit` INT(11))  UPDATE umdhgj_dhuruesit 
SET 
Emri_dhuruesit=p_Emri_dhuruesit,
Mbiemri_dhuruesit=p_Mbiemri_dhuruesit
,Mosha_dhuruesit=p_Mosha_dhuruesit,
Adresa_dhuruesit=p_Adresa_dhuruesit,
ID_GrupiGjakut=p_ID_GrupiGjakut,
Foto_dh=p_Foto_dh
,Emri_Fotos=p_Emri_Fotos
WHERE ID_dhuruesit=p_ID_dhuruesit$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `perditeso_perdoruesit` (IN `p_emriperdoruesit` VARCHAR(50), IN `p_fjalekalimi` VARCHAR(50), IN `p_email` VARCHAR(150), IN `p_epid` INT(11))  UPDATE umdhgj_perdoruesit 
SET emriperdoruesit=p_emriperdoruesit,fjalekalimi=p_fjalekalimi,email=p_email WHERE epid=p_epid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `perditeso_pgj` (IN `p_GrupiGjakut` VARCHAR(50), IN `p_ID_GrupiGjakut` INT(11))  UPDATE umdhgj_grupetegjakut SET GrupiGjakut=p_GrupiGjakut WHERE ID_GrupiGjakut=p_ID_GrupiGjakut$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `perditeso_tedhenat` (IN `p_Titulli` VARCHAR(150), IN `p_PershkrimiD` VARCHAR(1000), IN `p_Skedar` VARCHAR(255), IN `p_PamjaeFaqes` VARCHAR(50), IN `p_ID_teDhenat` INT(11))  UPDATE umdhgj_tedhenat
SET Titulli=p_Titulli,
PershkrimiD=p_PershkrimiD,
Skedar=p_Skedar,
PamjaeFaqes=p_PamjaeFaqes
WHERE ID_teDhenat=p_ID_teDhenat$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selektof_DHGJ` ()  SELECT * FROM umdhgj_tedhenat WHERE PamjaeFaqes='FundiFaqes_DhuroGjakë'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selektof_info` ()  SELECT * FROM umdhgj_tedhenat WHERE PamjaeFaqes='FundiFaqes_Info'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selektof_rrs` ()  SELECT * FROM umdhgj_tedhenat WHERE PamjaeFaqes='FundiFaqes_Rrjetetsc'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_dh` ()  SELECT  f.GrupiGjakut, s.Emri_dhuruesit, s.Mbiemri_dhuruesit, s.Mosha_dhuruesit, s.Adresa_dhuruesit, s.Foto_dh, s.Emri_Fotos FROM umdhgj_dhuruesit s
LEFT OUTER JOIN umdhgj_grupetegjakut f ON s.ID_GrupiGjakut = f.ID_GrupiGjakut
GROUP BY f.GrupiGjakut, s.Emri_dhuruesit, s.Mbiemri_dhuruesit, s.Mosha_dhuruesit, s.Adresa_dhuruesit, s.Foto_dh, s.Emri_Fotos
ORDER BY f.ID_GrupiGjakut, s.ID_dhuruesit DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_fill` ()  SELECT * FROM umdhgj_tedhenat WHERE PamjaeFaqes='FillimiFaqes'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_hyerjen` (IN `p_emriperdoruesit` VARCHAR(50), IN `p_fjalekalimi` VARCHAR(50))  SELECT epid FROM umdhgj_perdoruesit WHERE emriperdoruesit=p_emriperdoruesit 
			and fjalekalimi=p_fjalekalimi$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_idtedhenat` ()  SELECT * FROM umdhgj_tedhenat ORDER BY ID_teDhenat DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_k` (IN `p_kusht` VARCHAR(200))  SELECT * FROM umdhgj_grupetegjakut WHERE GrupiGjakut LIKE CONCAT('%', p_kusht , '%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_kntr` ()  SELECT emriperdoruesit FROM umdhgj_perdoruesit WHERE emriperdoruesit='$kontrollimi_perdoruesit'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_kontrollimin` (IN `p_kontrollimi_p` VARCHAR(100))  SELECT emriperdoruesit FROM umdhgj_perdoruesit WHERE emriperdoruesit=p_kontrollimi_p$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_mdhuruesitgrgj` ()  SELECT * FROM umdhgj_grupetegjakut$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_mdhuruesitkrye` (IN `p_kusht` VARCHAR(200))  SELECT  f.GrupiGjakut, s.ID_dhuruesit, s.Emri_dhuruesit, s.Mbiemri_dhuruesit, s.Mosha_dhuruesit, s.Adresa_dhuruesit, s.Foto_dh, s.Emri_Fotos FROM umdhgj_dhuruesit s
INNER JOIN umdhgj_grupetegjakut f ON s.ID_GrupiGjakut = f.ID_GrupiGjakut
WHERE s.Emri_dhuruesit LIKE CONCAT('%',p_kusht,'%') OR s.Mbiemri_dhuruesit LIKE CONCAT('%',p_kusht,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_menyA` ()  SELECT * FROM umdhgj_tedhenat WHERE PamjaeFaqes='MenyAdministratorit'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_menyP` ()  SELECT * FROM umdhgj_tedhenat WHERE PamjaeFaqes='MenyPerdoruesit'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_mp` ()  SELECT * FROM umdhgj_perdoruesit ORDER BY epid DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_mpkusht` (IN `p_kusht` VARCHAR(200))  SELECT
    *
FROM
    umdhgj_perdoruesit
WHERE
    emriperdoruesit LIKE CONCAT('%', p_kusht , '%') OR email LIKE CONCAT('%', p_kusht , '%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_perditesodhuruesit` (IN `p_ID_dhuruesit` INT(11))  SELECT * FROM umdhgj_dhuruesit WHERE ID_dhuruesit=p_ID_dhuruesit$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_perditesotedhenat` (IN `p_ID_teDhenat` INT(11))  SELECT * FROM umdhgj_tedhenat WHERE ID_teDhenat=p_ID_teDhenat$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_pf` ()  SELECT * FROM umdhgj_tedhenat WHERE PamjaeFaqes='FundiFaqes_teDrejtateAutorit'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_pg` (IN `p_ID_GrupiGjakut` INT(11))  SELECT * FROM umdhgj_grupetegjakut WHERE ID_GrupiGjakut=p_ID_GrupiGjakut$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_pkushtedhenat` (IN `p_kusht` VARCHAR(200))  SELECT
    *
FROM
    umdhgj_tedhenat
WHERE
    Titulli LIKE CONCAT('%', p_kusht , '%') OR PamjaeFaqes LIKE CONCAT('%', p_kusht , '%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selekto_p_perdoruesit` (IN `p_epid` INT(11))  SELECT * FROM umdhgj_perdoruesit WHERE epid=p_epid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `shtokontakt` (IN `Subjekti` VARCHAR(150), IN `Mesazhi` VARCHAR(1000), IN `Email` VARCHAR(159))  INSERT INTO umdhgj_kontakti(
Subjekti,
Mesazhi,
Email) 
VALUES(
    Subjekti,
    Mesazhi,
    Email
    )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `shtoP` (IN `emriperdoruesit` VARCHAR(50), IN `fjalekalimi` VARCHAR(50), IN `email` VARCHAR(150))  INSERT INTO umdhgj_perdoruesit(emriperdoruesit,fjalekalimi,email) VALUES(emriperdoruesit,fjalekalimi,email)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `shto_dhurues` (IN `p_Emri_dhuruesit` VARCHAR(50), IN `p_Mbiemri_dhuruesit` VARCHAR(50), IN `p_Mosha_dhuruesit` INT(11), IN `p_Adresa_dhuruesit` VARCHAR(50), IN `p_ID_GrupiGjakut` INT(11), IN `p_Foto_dh` BLOB, IN `p_Emri_Fotos` VARCHAR(50))  INSERT INTO umdhgj_dhuruesit(Emri_dhuruesit,Mbiemri_dhuruesit,Mosha_dhuruesit,Adresa_dhuruesit,ID_GrupiGjakut,Foto_dh,Emri_Fotos) VALUES(p_Emri_dhuruesit,p_Mbiemri_dhuruesit,p_Mosha_dhuruesit,p_Adresa_dhuruesit,p_ID_GrupiGjakut,p_Foto_dh,p_Emri_Fotos)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `shto_grgj` (IN `GrupiGjakut` VARCHAR(50))  INSERT INTO umdhgj_grupetegjakut(GrupiGjakut) VALUES(GrupiGjakut)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `umdhgj_dhuruesit`
--

CREATE TABLE `umdhgj_dhuruesit` (
  `ID_dhuruesit` int(11) NOT NULL,
  `Emri_dhuruesit` varchar(50) NOT NULL,
  `Mbiemri_dhuruesit` varchar(50) NOT NULL,
  `Mosha_dhuruesit` int(11) NOT NULL,
  `Adresa_dhuruesit` varchar(50) NOT NULL,
  `ID_GrupiGjakut` int(11) NOT NULL,
  `Foto_dh` blob NOT NULL,
  `Emri_Fotos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umdhgj_dhuruesit`
--

INSERT INTO `umdhgj_dhuruesit` (`ID_dhuruesit`, `Emri_dhuruesit`, `Mbiemri_dhuruesit`, `Mosha_dhuruesit`, `Adresa_dhuruesit`, `ID_GrupiGjakut`, `Foto_dh`, `Emri_Fotos`) VALUES
(34, 'Erblina', 'Qeli11', 18, 'Ferizaji', 32, 0x89504e470d0a1a0a0000000d49484452000000e1000000e10803000000096d2248000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000cc504c5445fffffff5f5f8e5e5ebd3d2dcc3c2cfb9b8c7b2b1c1aaa9b8a0a0b09291a7908fa688869fa5a4b75b597d3a37690c005100004500004600004800004b0e084d100b4e151150eeeef29d9cb082809b4a48710c054d1a16521c1953181451000049c2c1ce525075201d553e3b6a6b6989797892c9c8d4d5d4ddf4f4f7171351e8e8ed2e2b5f1e1b542b285d72708e373463dedde573718f221f5643416d00003800004247456f5e5c7f5c5a7b00003d0000419692ba7570a4070075bcbad021127a544e93a19ebf00002f000000b29569340000004474524e53ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0071d28f12000000097048597300000ec300000ec301c76fa86400002f1749444154785ed55d0b8f9b48b67687b8992c57d7255950f4c28dc4181c6b2d8ba290dc917a1775f8ff3fea7ea71e5014603b996476e6db47dc7e00a7cefbd4a9aacd9f031e1cbbe7308cd208ff4dd370db7501379ffdbd21ba302aea3deb99c22ecb629665fa0fd6efebf728ecf893f9f2df0c5ca4514bb464499e2749b2dbeff79a30c6f6f84f86f772f9597de35aa5c1c9fceeef01de45d798b138910928d8cbb628ab280dbb63200841d785695495c541127db14c12c692223afe3de4f624a2029298c878c7585d4661c0d71f9cf3208c9a1ae29be4a0326ea3c07cf25705ef4ab025c9c1c04b133e2c79a7206dd4eff28c5dcaeeafcbca0ecc8b939c31d96cbfff29795799d1898bcebcf7974250e2f164c2f6c5f307f3d6f78387055d0522500af3d65f043c952c8626c9f28f8f7e0041274ecaf4af23ad82d89783bc353371b20ad945515445a17a74b16e818e8a48c6aabf06238f058be58e15fab97df0206aae87c3eb37f569c46060e11643bc461060c479c12091b82670357f018dec5a1aede4656db4cb7e0f37b08bd99948ac3279adaef801df7096e7269829cb7421841315a43e61ed7f97c66d8d9166e7379f0bfc18b5a97a95ee641da52593718dbfa298d877cd59b7112caff5cf38c535b28d3a7f944ee19941b90fc4f1ff0e3ad02759bd30c8352215a65e750856f04f984976040f13a2b04858b039b2e4aabeb1e105548e5c217dd143071a7356e3a7ff0508688a64678f3ecd875a4ac94af5379392fe6d6556118549d39549027e1ad23544805ff4e0fa731c799c3cd64a56fffc5887973dd4c9e39f88207e008fe3a6958c9e5520ea241d7b89e357a210be2e4e88f690a97f0c2296ef31029b36cee026a644425420abe5a221fb7548957bf0f877ea59ac9f238ed3308b9514829934fe694c2c6b6259b7899420011436f4b942c572467acbc1f10c968974d681d647add87f0e0228e04e4eee28e0bb06c1e32c4e37b9540c6d7345e16b1c474421de6b920c2fa37d82ff573895e0e0377af5c6f2366d11d1e03577cd5794efa0f19e00ff329c2262603389cd22c622b0c58c3367a0015c3b80a3a51a7c082bfb080ac9d2044a35ab6467283c41a1d956bd8468d3972b1a93a2de3a34f286ac76f4a7882a543fdf5f1dcde7780d994bc852ea51167d722dc8d8c0707eca92328840e0577c50120fe109e10f61509ff5970f99dc6979c738481b39042ce9273c2393c36ae7bebf0a6020c6d219dd909189a8218c87449aa7db4b3800b00a46a6235318c7da157c653d790bd6bf6dea4c5b2521617d8c42a7f86e025127f1b826648968f40640f91375b35f098181dcbbfa90f25a694db54b8a5ce6b09740077542e68b318f36c79e8a17cd17f501f27b8c0d927cb189aa425d26c24048d9a69415b679fe2ad96e8fb7313060f41b46c6b919dd9d1d269cfdd908c9a659030108d98b54b187fc1e7123a1fbc3e4d0507f026962133e07b79e292c10aa82c77dbd11080b38b450c944924444100cabfb6b2541bf30c62971fdb37b43ced8c78029af5020396c121850d88c94ecce66f3143e36dc3cac20e4157e96abe8000819e481a8b97a1e495c76b2771ce94f056f6122bc8b5f5978d22a8667ca04942aef614693ebf78e33ff2836076299b634f0999088a458302ce5fe57496a172349f21f3c82c8bca85727847001346597f4d1e9c78cbaa80e6c07b1e4345cbbb3943bf301a51f234de13e4ff25f10a9e2a609c522064678ba1e5e4ea34a3230f8f4fe87d2d6a0aa49e86592bdf05aeae01d286098dfcc6b8cc419e2fbd3239c0a5e59072c045eb6fa8518c5080e0ca37f1bfcc401375899a33b2afbbae1756228e47506a9ed478d448c207fb6dbf02ed92e653a325909394ee2d8454dd1d667ca39cef27caedba28cb647b13222c1ff22cf38c1faa8bfa0dc59f33a1dbe0acfb3f0083f8c538da8709412504802e963493a4f5d5a4a64b87ade02ffbf876fd07ff6f84f26cb74b1d28d70872326a297c738c95e376eae457883a61a39fa0938c142ea008420545432e605abe05d951019c8df9bb4eb260ce360eb5b75953467d3e7d55279f5098916068d62a2125640c7e974738d8efd5f6c42a83f0c8aab721d9300698ffb16aedb5f4410d5a02d3994886dcc5b4be0c1b712fad6b33a9d398650f61fe0236389ac04512c8948c746d90cf0c1cf21912c9763449ff749bb79f7fde204a7e0e502f2aed183f5791e445748adacfcc1889052935b64a4bff82c6219221dfba50f1224fe11c36d404e5cd5c92c2ae448659cb4e18a4914d1a167fbd707e3190b11be23723bf8b60a372b1040e424a99baa8f2b4a4aacc27099c4973f4c2297f948205781759dc72d65e2d22fa910ba1246e47d8dfa9be0e12b7efb3a0dd30459708ae1490121130239493e3ccff98f7311c3341228747509192c52074af39372504f058e77fb3f528de79f9075d5b3f14158bfd3093732eddc89ab606f13f923a33902043ada7cd6894584e40803dae261dc017c4a6132dcd4f8877044fc127b83f4c6a0fb0aa29cc68dfc92bb0ff8fda8114b38bfa7ec9c84a8ce33fae738899c9050fc9c82184d834c83b2a3ce5596c03fcbf80ff8c52293f144cc052233c4bcd00b53541b10d28cd8cfa08fc01bf071c2ac72087f7df058663f1cdd5068e4091d725bca714336bd6a70f8c9337ec4c7db55e0c06617473ca54e6fbe1b088cc648c602c1450d56956ead94e371dc62c34f81803ede100a9150c547e1a329b67e37a85262635147e32af2f81b77ee2f84e3988dc44f402759a28b8c7320581dab19e9122beee35ff15891113b9a5330287793808663acef8570232879bad19be101bea158fc320864d5beb7f4572c9fda8b47c0cf9fe341d58e7db21fa878aaddbc651b3f528ae6c72e55e913a22fa046f68460fc7edf97b8305b697471845c865420b7172892e4605e3e8c32fbfd3cba52b2a1263d0c37dc6159c9fa7b0c0c42ea40514906febbcb32e44fea35fe4f16e91df18a583f4b63ba5e2a4beb54ddec54d7e320d176592376ffa72f51b8147d904cde3478226d551a78798da6e913175d17151784a2ac6fe769858320d1d3c723b67d92506ccad97ed01d01aefe665e3f04fa811d9f937a327e51558c72efe834e53237baee442441c0b9589ac236e008b82fe067a2662a56f0ca9c02065973b94340de84c8bac6f7433cf177a822af93d8cac656f66a8201efed5fe189c78bc20eac1b6991223fcc409df9fb06448aecafafbd594307d1deb911294c071d44f23911cc26a379d7471165f9d9bc0cd97e9f30e214bf42389c5a06a85d0d34027cc8aecbdd194be0e1fbbe67abcd381ff57c9b46a7e6a94479a915d91fadd65cbec3f17723c703967c0ba1925453e3d7dda8daa78291e75f0462f2fe127d67679448cf88db576884c28ff6db3c9a6ed281bc9ae08634eb0189513029044199ab3283cf23c7d40e5686b7ac5d2190e86bf5c4d977a22b20acc3184e715d1c50d1b26470d548791e4c339a4cda681dc28d116a13127ab73ec9cfae4f747184f1fcf1b602714546b65cce2e7c930aa4c8519d24ff90d3e4f27d50246b7f55e2758aeb04419da886038378c5fb5084fac726314163bf1ce336b649604001b9749f8392bb476e5ec78ee5027519cb21f1cfccda1e5c295b2926a6fd4f885003b88f455680c4493a7fdd25dedd22a405e6e50dc0d7bbdf12e7441257d2912888e82281a414b7a5e4c1199b6fc9b22034ccd533643957437164b5aa7d20cb207763aeaec7079135bcbfa019210d18994511458ebf1c265bf0af715e44e9f17ee4bd16cd97cc49e7af89996cc4c85aba1e993b29d5f43941f452c7eed13edf9fd927f51af8ba686448036f0f5f98336a60eb7beafe4608070fb4a86f0ae1747adbe2bd1f07d1d6dd43245283b4568957fd9f21e873d23ac22bc6a35577e9b27c37b06d328e038e77ba5df8b1e893320abb20804f2032155add94b90048ca924ab7a382447b7a108cac6be645328da7e7b82663340b2b039b498fc0cf83a58e26ba6011224e342f17115e5c677e12c7e7f0b76fd12be2d66c95f1cb4121353f182459d17d4a32373a550f7dd3d86c279fd3f8c43a3fb354752c5b201031da8aa35620b572bde908dec54caefdb4630b13f6c234a9005d0f3f9db3ab7aa0a391ac27e4510bbc1f80707d723f78a7c40dec617016fc71c16e66d85f244bd607004fb9d6ea24e442e0741c9b33684a5df70e5251c78c61c792d1afcd400658bf1a3a75c29d2dc6125453960768cc6a840af0aa67d5e8c720a1d3648a8730856b75907a8144e88979851fab4f79c5a863da105eab7690151c0699aefaca5cbadb8fcd57cd821985082e991e03dcbc7fb7bf3f1d23a206615d95be05636629a87cbecc47c4f733f1283d6f9566599e952933750c788cd5111f5928fa642ff5f4011f3d21724ff36a043878c33c77c80906df1dd6643e59fd5e28af711de7c96000e07517e3d1722e204f13266dcf2cc9257e5b0f4c9cda1e175755d05608aec80a551379c76cbd867bad740470f0068110a8f15e509532dc760257e361d3bcd3244e31ae7382d22d2a6b33273118f59e0c05ab0bfa6963451d4ca4a6c8058c2c24202b849d4a75efb9c2d2c4ef2d02f9c1f12c27a43f5e24c6439aa018aabe0806173d071cf0a8c61ad170d72f4c2629e42c093b995987054d5c6662e171f7138b290cb154877ee72e800136afe6108c5a2d0d305e4b4321e0678672219f9625062c8ce26118f6520d0b1e1d59907d0fe674d134042cb78f1bbc28e9e1cd6e7464c2368f3a78e92fe6d51c888e92af2093f8feb4ea10555069b50a8e60d146d4b37002a367be28d81eaf0e59e476148289b36705cac1172286de1b673bdeb09ccb28c47ae942845398b00c4f2124f58dd4d97a9969b3ad872c1d0ab6e85973a7e4ae910eec4e599c16f134de0e59bc200d9065339b1a30764e72a61aaf071cfb993cc2fd7b9a35a0cbfae26db0ffed9d781f0609212bbdeab278a674c03cd080d2da77201f63c55bdf88233a9ddf32ddab9e50a0602f27deeea6c25fcf9577c532007c5203888659a23560cc77bd7a620465ba09778a8ef9d3f5dd68012a04a8ead353579837a36ce1d962b9d31711eab7e154bd43f66e5e0d785db60b0074cbd2748cf897c156ad039e76afefde2d87b8d5ccda280fa1a1231b119d61db346705cb73f5c201ec8cb9c60b3b40f89c9c9eb09bb9c2ed82fbd7d8c699fd32e281bbe98c4235b4ec54b3728c42eb334564997945a0b56ec83232bb40f07574ed16a58dd94fb4d4a0082e131d8b66a650a896ac254069cc27db3a86bf79a83834fe888f7ecdc5f8058b66343f4193533f711d0e91e0f364458e021b5a120452dfcccbb2c6c8cd62bdef4b7d22707b681763aff774d0e03a8c2192a6a531096ddc69318693883131909359f62799b0a9c982e11f474e34592693646c6b99b3305c0db77125fcbf2836a77eb7baa8748e231baa95ed7ee6e109852fa7d55059a94d12e500be6f9a61202870e59647c8e9c65918cfdd00ab320aa36baefcb618c5aca21c4611de6a6964f8ae9f3e051faa8b0be38de074f21ecf862e7983d31b320173c5b4f7593844b9338c06a89de9fa6da8058a0ad7e5f691c837dea535a7a779627e92f930434c8062ced53b34549c86bcc4620c9a6678d77eed4d6ce2f8c6dce202c68c21d87bdc32f07b5fe0d70c132b87787311bd98730084745d659e6ff9220f1f7ae537cbff74fc013738453538f17aec1a70d1f5de250bab47106c3d2694af684a107e3bb1c3e96c9bc697f0eedb36b1ea0a11bfd010befde7fd295815e4359ca8607da47b75fbe51bf88155308c7d419d707c0b4ec5d691efdd86351832c3e5bafce8c785621691fe731ec119082d2dfffe4f88dce2413f31a2c2c869b7b790c710029f894e34710a117fc3290eed9b45b21f3913d9a94f41ebe5bd95f5d1a4871d80169a5733b43bf553f1ede9c37575185611b0de947cd31501f02ffacd7e0f09b622cf59bfdfb1dd68205b5bed0fea447db11d3b7c9fcebeabf8ba5acb2afb6e73ace9a662bf5e2c5947c5ba4e29329f67320a5d3f35097c50dd7607399cdc11c9d2f0655a7d6b5e82d9af708520b236641c7d1b2de2351672724bb51ad66f2c5f1d87750876d9e8f2d460433c5c3d8b4863aa10169daf5e675ac8a91132b36055cf7e9dba8aaa62c6c354fe93bef4ff635ef988fa372a4510fbb9fcaee60f03fcd848dd71255c78f6c63b9c88f387b42ccaa1fb1629941da6c84a54672dfc5310d952ecac937429b9d4d8115166ee2cc86e58e755c844b9d32f623314783df87777a7a653d2c57828fc742cb68a0835d4ced9759c069d3f77a017c52ee143ef4eda9c7bf3e23b709292aa2e41ff8fd5a88916cbb9b0ee0f8858be6367e89849de464544be64f475c1937ff28574e61d07e08a0e85f52aab6fa0de9125e5788ae342630241e7e723b643171abc3423090d86b6e8da2a228254cd169eec227f6f27e9cd35fdabaf57833166aa040a0736ede37f0897513667f9a041317d5fec2dc59051ddc12468550f01819be6c69b2d1cd02830262b673108efbda87dcd53115257803fe900f5fb701995f7eb4a15e8cd6b862c6c0cdb0c2bbd6c5970d81fa0b1a9102dc181ae267bb816f378535b05784338c124fae956f5751d8193057d5a19cad1056a4466593f34d75a8c3713b87db1c2d95a712d592abaea9ad3d62b46211d4556c0f57db7e3a072f49833b78e721bb677c1cdb44705f3e08d716009d36bca096fd63aee8c8161b9f611dc64683c885e6d2233b6e16acc783a81094b35e2d1ee8863d8e13f513915bcb46ddb7fb64d58b575a4ee3cd6e868b4562cdaa769c02b123392623074ba5f14848077f42f3ed1cff5f43a9a3ff382fbc5916ad2ea39c3c5f1d34356d9950891089957c5ac697d1de2275ae3ce5e394d1c0c57ef5685457869d9d52ae26516eb37893277886896751ae8fcec3eb19d1a8be06e246202afe8c2582c65ae3bbc27c158a9da4f68672c5a5a5ae0d947bebdce1d97c1695c00ad302892b326d900a10cf93a589cb58b41b6a71fdd496b11988e03a0a7c0ba9eb1b2d969fa24621657898e611804216d17d985ef2fc4f6e1218b75775a4ce5b75b579c4eb7de0e3b9244f4d5e9757dcb19deee5be7aeda7e52b387c777e25a042e6a4cab94c7e7f0eda308ed8c7a39b2586d9cb58c703aec631a3c83f1f4d7c4ec9b5611857d0fc9adede4b91f05beacb7052bb8b1563a5602820bed91a0e18e19c4472133d98a536bea97431a824712b7dd5f7320ca2299cbf3b38e524871f0de89427c7d79ee34242ad47613b915c01c9776d5f2381dd7f52381d249da0e997a072a6a9676202c313f369b6d2c8223c77221f1c83eccf35f540991e54679480b04d1f481195d16be00b0f5904d4320b627b3088c15ba3a91499c51219d281d08a7ed50327c04632af5f29731dff103ec09bc9cdcd54bdefd4f143565617200f8761a918476ffa117eccba9239a8e56be7c25167e9d648e021c51bfead830fbb3cf13718caa2880830213ed3588b569c1f254bcf75a7f4bb3c9dbe669bdd60578d6a11a8aa5d43ea89c52d66ba61594350deef00362b6f339a9c3e093655de87998a0ffb779b58a126c5282e8f4de74baab1ea02da2c676888a7a179477a6060d20b211d9edd5f0a90dd4349e87a7a40da740a16c0bd3c30387287053d31cbdedf7bb9838c012eb2023cfb0bcad44c32390db83061ab2f3f4313438a474bd570f8faea84fe56da7b4ed875650c220695dbf2b3be1ead14b0609ee2c85a7e0392c0f1803b33725507ab960743ba20160d8603710f88a6cd1a15df3b1783247a722ef9addfa0e3084a21a810d43df66533a305dddcce13f892eb54bb4af9e3b2cbdbfe710641e6370299cf54f28408e6e3cfc91a4b464b7d84c10d38adb10c67d9a89d86fd4e8f1bcb7e234b7b9ad3707d7dea590c450b5f7bd0f8b0327e86e3e3bc64759de496cb780690275b239ac3305658671bb07fbde48540969365b54e3d75afc847f0ede227a81d8c3314e05fc21702a54d210dd499ebd6aaa2598f7bb224dd397aa6ccf5a533bb6ff06c2ccb37c9acb9593722bc8d562f7801750f8b985e4fc0885304f27b143a671e7b77bb7e4050a6de75da46d296d6daf6765604653da34558b9e0a4b27e092764e73b05a0b1e015f4a218adfc3f320ce49a9c4dcfcb986e9d4e066749eaafd313bb7c5abd68680c5115168a494d54dd9545515bd980d2f4e9226ac1dc4b7fcb0013975098bba524c8c6eaa584b7b38dca7f030edc5726ba6a7c95a074114566e958622a81d8b4d8af3c16b4ae18f5088805bc3fc3d45773b392954007b6f41018cd1243c5edfa646f170489e3ed16c05dbeff15fe306e1bed5bf163c5e6fd41b41893b9e72b90eb53eb7aa90aa2c2b9b38f405785e4ce66bf90078d878e921e164b7dff679f6100f37451622a95fa684af7738284470f666dfd35b58e321c2b143514669b83deadb7ca1754ac8f435c7962c8d67591ea2b0eb85886032cc9f136cd7a71e15cef16b374cf5ade330ed608c3f0f14aa95e240ffbb7a43e92128d45f9fcf1470392d08f258ffee36a859689c919ce275768f0910416e36ff9ab78ef8909e2db5ca13bea5c89ccaa2ce13dd86a7f410a19bd13a13e03bf0fde1eff7bd057081038ed8347634187b7b17a14b3b6627f01bc87c6f31f95344b534fe106e39258f3f4d204e5cd8151117cfe47f7e88c29484225872db108a6a73d22233b1ea062a697a5db58c03bc247f12e21c8b7dc62e66202114e9e6d9b63e8930551be3d572e844693d1ede8f4b094279846f4ba177c9e2e21c9f8bb22a5406e281280cbc89ec2578143a620d97bf63e35a62d5cb090af51b6f3ddbc321d2ea9391c2e970de9ab470a0f2077f1a4c0349784c6107dc523c6b6dc6fd1063dd5655029f961a865a0b874d499c051e2ab7e836dddeb4e7746c9724b22e8a2ab5934f7e7e583d369f14920e7e584e1079588541d4e226d1fc4c992bf85edc0bbb1d923484cd0f43041bd74e380b5552da02e26827f1b9f8e03fd28be799fc02f11acabeeaf406dedf8736b9769e15598217187576a78194d1ee75b4ecc84e255619c64bf82d6d7c5cdae9d7696e9497a7a08a1002f0bbcfea814cc0a20d9ec22b090f4f1916302332a173a58cf0a93a0df73af7a94a6b85c0a728e897dacc971036651dc7ff327f3d089aa1bddafaf70d3453333d9134ced51c81d98ebb506e596dbe46082b6880607996a9ddc58179bdd49b8aba09db56fe3030b8f7e23505af57d29bc77051a8e93584f38660e276c9f21026490fa4aa0fbbf07ceb6d8c3db10fe2f5c11f7869aa3e7c01888b32eddce5d31c691cfe19a680d574d89e02caab15745f956e0cd71ce14a3bc592af279c1eac7c082fac4b4c16fba18fc9cec01f94260be599924fa58d8406de08610e3ea4570abe037cd4982a049e63d61065bf3fd20692b39dac033b997007cf53473a4cd404e0d57eaf7cba1186a057491cc236fdd86f4c3e7f55e4ea056140da4fcbba8f9b1ac25ca605e2d544edb94fe7ac4521603e019cc9aa9b70e6e0089d5b1ffe103c47ef084bf5f39bf9c3610e1852cb12d5587bb0846dbd4d6d4e8b81ca1a6a9a63765b39cb1e3e848ae24946755510ca9cc8b799afcb5984d78b344e5b8c304e3f627b1a0ce450c65d0467a62771c5179b03fbc6d3af11dfc4bf497e5e47e5e26c9f5319e6f0b58c427ab1cfaf8e3b2ac67d1b6e417859ea75beb2d5c22aa0b37434b04f6385c7efc5b839ebe503d69f438846591569cb76325397b8e6ee8a0ec203f11ac16b07e1c9b4207882470cb4189f4c2f0622093ff8f8f06ec7a5f4ee2aacab7c082a49394c9c2a4fcd3e02e96c95f67ad3e304e534381e2631f8f60db9d13fdb73cc7ae3e43273a454698da94584f8dfb0ca9fb8e7c9fdb071846a53d2e67904620ef5afcf30848fe6d54df845dcc8da8c14e1681613326b4aa90e4540966f458fb7591d20441ff661f19b57905e2cce472c43af7ee96eee4830e06d7d11878b8f5ede3958862291ede1f0cfd7324a7fd36f414b8c4db5ed5f14a3c62ccb93f338beb93757346b8abe05ae0e1380823d322af70bc10a5e4627863e05b9cbbd2d54abc4962f767691e9338b5f23292f8e01989996cb63daa251a8c5475dffc0466ab48fa177ab25f064da97e024072ff03d934d6d0e39f5e302b6fd8bc8811d39aa6ef9cedcede8f708bbdd79f720a4aed615f7c554cd7febed706e22f50c83cb52b54d4233dc6aec11a6c2beb6057a400ebfd36e95763e67b2c717b05c9d58441843f2e8caa7fc1e89a798eaf9fbbed8de21f23a6dcce572e7b234945996d915d6e33a19442e66d29596fb88a88e61928616dd6a6a0967f75803172dcd60d0696b64f0bc55293e6a0c465e97c85d93b67c2d5f8bd7e5f5ed7e0fffd66bbce30dfcc04593e8f4ea8b5d6c1cc821a9919cd3b6ce43b035cc925b6c17575b4f704c5fe196f0d0e08c12ea61e5d50a1a46a71f3fc35b5e77b4e127d5aa16f7b419d6571894d6960c97ff52db75df07674104aeaebff189a618a56ef6349f9e54fbbc032439379f76d31df42e5010d1b08c959c9eced934e39962db5f113d19a38890444090c08b72625308be8a8c4d5be5b8937baabf635abe349ad8d8f30fec6aeb6cb50d6b5efcad4f539fab131c5bc62e6d8a4122450f3384f3b005d17e5e3b1cc0f128a1bb83278157f0df13c70094de1aacd066069c52c3e9a2dcd10902c721f81e9b51aed60c7f992d315e9a93a0810fcb82e660cd8503da528acedf8811889e34a18be00506d33f8304a04d57a7073e0a7f1f8ea19e9142f89016ba7bfabfba77a4353ce6252128415cb7b74dba855735c5e5301e22ad8a9aaabb183bda3a48690f309c8caab602c2d87d85841c614eeda16c3e8e17b8a768b760bfba04ead8d78d3ab18c302c8b35183733b8b2b42b60ac182b6ce72022176774c635a41cb212f68810f9b0cba2bfd68896a044257895e4794c1572c6f2ba2dde9b88f663b352f04159636a91437a0667d1b1716f6917aaa90731e992f9e2615a5ea93698a82396029f85af36588225c37d618df150a6b6e8f80a42c8e8945082da24fb42d6616cf69cad03c6d76399c7b0ecaf4d1a0ab1b445b75e6104ba9e68fba02bdf5c96f6bf47aa41f742f0bf26c31bb1ad2e18448cfcd56b24839d3162f6a2a40a4634806ceaf78635951a1c29b77e1551a25ded4b1ed5c39afd68b67d2ddc33ab970ef01860d6b0fda6a27a1e31d95c10e04c770ae41d1d1c8f47070b6f995a0c5401f18ffc2c602827e9b5dc0da51495add7492f5419b688123d22fc204b62960f7b9e3fcd5a479c9d455660b6ea48cdfec5fc4aee1f56a78ec2e33138769d080b493334745bf8e655161a042dbe3cfd121f77c7e3b45f04253227ab5bc15006360807d37a65550316c12e8d19b8ea8f9e60b6c18107c1f499690dfca1be4c4b1dfb00a9ad462291c829b5bdc4ff54dfb989c2afa6be0c4fa52483872069d88e0ce6cd8b18e070f593805698dd789a88cc4212beb6f0cac06e375022a8d1af364193c42afab42b13a4cdf490239befdc00dc9b796530ee8bf1654c29862d50ce3397066b6accfc7e17cfb6647ef1c70f03714b738635482d28fcc6ed7c170f2f670ca5c6b8273ab4d4bc5ac7bc516e14ac16ced0704498adc3c027df388ffbd3444bbbdfb161cb198b5b6dbc5b3bbcb03770db3d3b4743201d50173169819d89be2ff284d9ed84ed98c6cb7fd36e2c8dfb840bfbd36c98d42bcd1d2042b441d23c52fbb0700d8ba15b3d645d5724b428067181b9fc336582880e072d8790fac33783e91e76f0ea0e8b2873e44d236be038e6ebca52773b300461e14b017f315465948b9c00ae6e81d9040432e6932b8932bca5082bd6c7651a861de23899146e73c4b7fbed258800bd4140c66c5e6960d090f4591ad3dd825808969b884134261cdbef6462971fe806e5099ab5271b766072d7419dc2aa56815d2ef3c98696d0307ff07cf8e53aa01e24a828d2a3f8ca22f813b3a801975ccc7f20ba5a334eea686cf8e82e84dbb4fd55ef4b8d05d3b297c53fac0d99d703226d4cdd8380aaf901163eea99a11b171b6ea9f521531e3bb47da7b0bbf3f089f86e038b90956f47a809398e6128749c3985add67918da2960d049db82341a7a1f10cbd2f08d970a671a36433bcbb9c154fb60748c370483d46e9850827a2d4610adb7d1433aed994fe74209aa1d660c1837c46b59b82d956cf6f2db0775c6916c119f8f9745807ccfcc94f300aa1d7256ba92f8c891c820c435fcf8889ba8173eb653ded2e1c20e8110f879b1a59b2b0830fa4ac4fc08288b2825250499bbc83bcde3b8788109cab9b74c87ae22deea6848f73f9be16e9d2d29a738e44e2698327b5e971d63b1b07fe92289b0a5c36faac25a63dabf744a1edde4ae2b7c61f359c871593c4454dfff1d041add80ab588b9aa177834e44bd3a9c0b08879c65697f4f245233b7b8e2e0aa99444368ef1d0e53daca9983b1740cc1b477ea8698e2300b49478c1a8a9f66ea252f60abec3d968eae0cd97cf98f7bf6c00d44ecee8c2144743658ce8a2abd33280fc82e5a40b3d7d79bbf0d4cfcd2eb0d7a4069a2e7fb1496460724fa6ffa7b192f033ae83b010f8bdb4ce391ccab4da7ba1243e42bce69e1d0c255168289c399b1ef1475083a89db3d0e40f40ba15ad7cf62c6b9eecc8198f5ceac366281b95a7c71f6a64658d5a96de7e3f1844018d25b713c34d1b966844048edd01c98bd4fe80b0bf387b0981ecf1e6862e4977b8e10566c2e0a624c4968c06141b3f8dc211b346f6d2e7736378226da0b889a9212a22765633d375a9a0ce467574c80a1beb08e2b6bedb02d63514b9fdab1a282e7805a656a18985d948f1478cd906a20b0b102d6b29dda8d106280c07d206b71f7675abce9da9bf6ae0911cc51ef05882bcb1778518c6c4dc9061d1bd5c3399470a89f64f4788b28125b75e35abbc04a29dde63ee7260ed27def78bbfb479f7f64b9330f3bc3365e3c0ec4397a424085ec10c06699f18db2c588d4051d4c6b044ec5dc218b9368b2c41c22b96402830ba39dd115a041d6cfafe104239615d5369835b5027410c0d210558e8a9c1a3ca9fe12c25ff344c8a996928a2910ff38415dc9e25c541989f6f04b18c1452b5ff5b69630ec07730ba9aa25b3787efa1152d5f392a8c1f2b98f4ffba3eac99bcecee1149324770d3465645ed2f1c2570a51200e5cedc3a6803716afd3c16cab511d52cddbe8c267dab1dcbb58870876f1f2951f2a09d899d65d3d035779dbcc6804f081e64a9f14fb9becb38a35c7a93b90b89cd3c1fec92d7df76eca3720b8ee7b272316d77ee534309740fb242d12c3d11e91868d7fdd40b91bc253daa48f67506384a96ea420563688270deadb5b35fa05d049d0e6da41d1b3953393e1d807c2c321b768c08e7f98d77075ce3e8237719e9c9af4899d4f5fe1392612c2ebb5a38f02da94f99e3df3817428a0edb87bf6bfb32057a37023703ab7c148679825d615bec1e82f3fd30cced979c0258b5ab855efb70819978549d138d59707f08634f20cfead08195c963e4e46e3e9ba1b4e1cff68a751112a3e26a384261935b663128190e2e9b12c9c69d6af2c5e736896c0714eca999c1adf33ff2a883363ef6bd70b66272b34c61b76c7e1326db2b84df60aa41c167647c884734517b539b87e2aea5dd59c4394f5b955fe437cadebd614101ba9781f14f8d0d10538f955c6234f9e19573c16eeaedbca142a70c2bc7c04745aa2e5b81547757414a2b3f1b190372ddb1b0daa8065744002a71283317ac8de68d28fd368255ef7cf0a4ae62dfb504092c0a273664f238166cd2b10b7108d670807fa31402005145098316086d7583fa90b0eb91125f5405419eb8e999a024e11e392027cc5e09f64f2c0a843059dadfcac4802473ce2676b7e44361e40fd20be26d33ea60a21b90a1ca6859977b6da6311d11681188314561c515211ffce371796c99c3af8399d835dacef0e340012eaa860e8da30ee9cfc5edf3d6f6d0e99abbe4203c4729a60bff4842758b3a904d597a466d4233a4fa066a9b4d9cd976a77e3a02b0dd1f67be73bc7de6d77188f20a563eeef0f960fe2fba02620d0361af9f37274e8e46aaa446b9ec1765a59a5f66e880446ceacc2a0106bb59ea281e1bb4eb4009234ec268680cb124f7d8d93ef3d862d7e66dd2f28545738b50b45a6b73d6b97ed3c7e46bf53411cb8a92e115b1e86a5f43a293d7460e0f4a01468459c15a6e41a0d768a1a6f2682f528a8e66d9ffc9336ca05ecc55c26f9fb90554c6039affa91ec5cbd94c34a9a61a5c7123ec084be4f16a52b14796c7b242c511448af19833b40723f5d160e7bba5c5be9241b66b6068040ddf6ae2ccd57b36a3efe9d5ad1820e0c804eaf51c8ab78f94853c1ce3413e3ecc84d6bd16e39ad9b28e2cf6ea4d75873b300a88c77741aef655e7c2dfe9912fbb622feac9bc77eff4c14b6ac3f521ab92cdd1cbf58610b3fc72245e43bccd87299df6955b9852729e37175160894ebc5238ecc694263b5cfd5461b1546191edfee7e1dab4e4f3ad80df2b628111c4672edc0408c3aa95c34d0cf2fc963c9e81a62874408d5da6d1588c67e0c5cdb734d90104771cd737b90e3f9aca3b65a267249b802844debf41171aee3e3073ce1cda7ba0711ff3e165bcd6613ebe09f2e480f970e1c5f680b5b3a3a17a9623f69309ce3e88ef3893608bdf5ed07207e97d477f73042a4c059e34c103e0ede3550bf62ddbc2a70a7684f7b364d6de18f80b8b844e22a0da2ca592fbf9748d19512ecbbd92ba7c0cfc3d3f03ace3fff6102351767335ca2f0729f09ba6acffae4a1e3ff093c488ba467ac996d8dbf84418661567f02070901b8e8cd711d19de5bae88197415b5a4cb6bf4f1f63388ae6a25be9954df1b9508f9b308dc6cfe15fffe799acfbfaa2ebc3bfbca8b902666e19eeb32da1e9d9d0e085c04615ad6999ae42f9c1dc41fc511121acf639e1f04c7704dc20fd366785f0a4517b534c34e3dd2a0e5b324ff1167e64f24c1d7e8b6c27e3c2e7f8c58d42ea1f83928b2dc15ca42f3d01f79bbfd92071e7469f37eadeb0be20fb587695d5f8b2ada7a6d0b730852cfa5098288c99beb1b7e00afc834c6f50fdb9e58e84d70864512b7f3ed3c1c706a00c3ff6e4fab8de088a2643eef71e7253d8df9e3a721dde74ec922bcf8351a5ee8c7199bf5ff38a8070e23e9f760f33a7b687ee27b817c314986a79feefc0614d491478dbfc94ac5ff2e78f0e2f145effde62c0c5108e3580e136b3f1582ceeef4c7d3821e2669bb2ecac0c71fcad6a817d53bab4b681e4ea39c8ac1eefd242fe1038228cd91f93ed4deb32a7907abf3c1c83de8f2d5d74e6d2e9d139a149090e6d3663371c033dc5d5af6e340dabfdc2b431b429a648f9c831905d1b30269c2ed01a748564967944ce69a15c2eb38a947c003fc7042ff182890589a9379817052b52b386d9e82d09634de589e30d0d92735d286edd689ca82b4b9ea47a58303f654d82599bcbd991875bfc4975f24a1039a45363689da1a97237676e20c5ad650288bc8360179f8716848fe725588aac84126f20b25b3b783881076ece73b8939b6c4c669910fb4e87586dffa7ce79c0c76566602e1477ea57a51ee94446803503d0faf5d420eeb484b17fce2da88000c4c166b373f1dbca165a6d3dd8ed28cf6d6dd1cdff1e0899d2ca6b3c0a09ce98ef6bfa6a5cc638a423b2ae7b0ba7883efd4fa04a47ddb6c38e667064e95c97973e3af422741902d4b28900ea966f3633c9a52da5d8cc153c24746c42a679e801857edd4a8a86ddc6b50cc0a106a3779f4904a84698bed0bbf0a11d9b4b32332081465dc1c8f11c4d56a297c23551f6b258e646dc7501976f3c249884110f89f94341ac4cbc51dc33fd674bb5f10c5dcc287163c61ed1832360ce99a3a8e84f1b66d28590769d49bc1d48ea41d1e725c8c5a27b2a52881dc03f19f6dba5e09ebc269a150402868f1d332a58771c4c026fd58cf3fd2daad0426a3d8c838a6e8849ebcdb9ce81fa1e472ac3f10c3559840aef30002041c9132aa63f552031e025ebf761768fc7908e51e516831d218b5e7ba2dc4a655a491e0420dc9c4ec9f54583b9811900bee726860fc5519625248deaa8d872656ba2be834e3f39dead42f4478567cf4eb87bf116db045ea0c013231f249999d611e0eaa27919d905c223752eca5b7a995ffea141342f02f61e7ef9cfafcc978a3a5b7acfe34a5516552301d347b0b6da3456320639cc4541934ad2286b416b43fb1697e7c73127e115d947cfef7f867f17ca507c95e27a9f89b5ae7a15af910b390f9201eca5221dc10f94c160de4933c6611fb9dcbbc2b630af9daff3e7d84a05076f4ac165c5b882ed4f2d66a2d53b99eda028845b09e4627db0c293384f665323ec7eaacaef8f5cf7480b7c1a31dcb3f67ecf2327fa6a64868aeff8db647a5ba64c2529ad2d4f1e5b1f96deb281e21a093fc69e9901be1fe15d0412e69656fd62c57c78e51f4d234e5eb6b71084b564fcf7d1da00afbf0eeeeb1b77f1df0b08d59fc39667d9baed4000d164b72fc98b6ac8f3fe72c3e2c4deefc35c0d382ceda4d48bba2d02b02af838b90369e80c54a607f7ea03cfca78277d5750f2a697344d9d29e167cb98a4ae09c776953d0bc354da6b2c38fcd5afdf910617560fb1ded9b013ae3ba289b280c8fb4ff894210746148074fd531f2e2f8336c2c985e857f31d3720760ceeb99e88b69b23ba6edee551d7f401c83d132a10fcec5b07dc9df0d3c08d342397fb6074f0954d74f76893af59065759386776bfb7f07f0a023b97cf9778590a66a5ed2b7b09bec87fbcbb0d9fc3f69d9c27888193acf0000000049454e44ae426082, 'Emri_Fotos');

-- --------------------------------------------------------

--
-- Table structure for table `umdhgj_grupetegjakut`
--

CREATE TABLE `umdhgj_grupetegjakut` (
  `ID_GrupiGjakut` int(11) NOT NULL,
  `GrupiGjakut` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umdhgj_grupetegjakut`
--

INSERT INTO `umdhgj_grupetegjakut` (`ID_GrupiGjakut`, `GrupiGjakut`) VALUES
(32, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `umdhgj_kontakti`
--

CREATE TABLE `umdhgj_kontakti` (
  `ID_Kontakti` int(11) NOT NULL,
  `Subjekti` varchar(150) NOT NULL,
  `Mesazhi` varchar(1000) NOT NULL,
  `Email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `umdhgj_log_perdoruesit_pfshierjes`
--

CREATE TABLE `umdhgj_log_perdoruesit_pfshierjes` (
  `epid` int(11) NOT NULL,
  `emriperdoruesit` varchar(50) NOT NULL,
  `fjalekalimi` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `umdhgj_log_perdoruesit_pperditesimit`
--

CREATE TABLE `umdhgj_log_perdoruesit_pperditesimit` (
  `epid` int(11) NOT NULL,
  `emriperdoruesit` varchar(50) NOT NULL,
  `fjalekalimi` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `a_emriperdoruesit` varchar(50) NOT NULL,
  `a_fjalekalimi` varchar(50) NOT NULL,
  `a_email` varchar(150) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `umdhgj_log_perdoruesit_pshtimit`
--

CREATE TABLE `umdhgj_log_perdoruesit_pshtimit` (
  `epid` int(11) NOT NULL,
  `emriperdoruesit` varchar(50) NOT NULL,
  `fjalekalimi` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umdhgj_log_perdoruesit_pshtimit`
--

INSERT INTO `umdhgj_log_perdoruesit_pshtimit` (`epid`, `emriperdoruesit`, `fjalekalimi`, `email`, `data`) VALUES
(28, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', '2022-10-14 15:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `umdhgj_perdoruesit`
--

CREATE TABLE `umdhgj_perdoruesit` (
  `epid` int(11) NOT NULL,
  `emriperdoruesit` varchar(50) NOT NULL,
  `fjalekalimi` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umdhgj_perdoruesit`
--

INSERT INTO `umdhgj_perdoruesit` (`epid`, `emriperdoruesit`, `fjalekalimi`, `email`) VALUES
(27, 'ard', '202cb962ac59075b964b07152d234b70', 'ardonit@gmail.com'),
(28, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com');

--
-- Triggers `umdhgj_perdoruesit`
--
DELIMITER $$
CREATE TRIGGER `perdoruesit_PFSHIERJES` AFTER DELETE ON `umdhgj_perdoruesit` FOR EACH ROW INSERT INTO umdhgj_log_perdoruesit_pfshierjes
VALUES(
    OLD.epid,
    OLD.emriperdoruesit,
    OLD.fjalekalimi,
    OLD.email,
    NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `perdoruesit_PRMODIFIKIMIT` BEFORE UPDATE ON `umdhgj_perdoruesit` FOR EACH ROW INSERT INTO umdhgj_log_perdoruesit_pperditesimit
VALUES(
    OLD.epid,
    OLD.emriperdoruesit,
    OLD.fjalekalimi,
    OLD.email,
    NEW.emriperdoruesit,
    NEW.fjalekalimi,
    NEW.email,
    NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `perdoruesit_PSHTIMIT` AFTER INSERT ON `umdhgj_perdoruesit` FOR EACH ROW BEGIN
    INSERT INTO umdhgj_log_perdoruesit_pshtimit
VALUES(
    NEW.epid,
    NEW.emriperdoruesit,
    NEW.fjalekalimi,
    NEW.email,
    NOW()) ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `umdhgj_tedhenat`
--

CREATE TABLE `umdhgj_tedhenat` (
  `ID_teDhenat` int(11) NOT NULL,
  `Titulli` varchar(150) NOT NULL,
  `PershkrimiD` varchar(1000) NOT NULL,
  `Skedar` varchar(255) NOT NULL,
  `PamjaeFaqes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umdhgj_tedhenat`
--

INSERT INTO `umdhgj_tedhenat` (`ID_teDhenat`, `Titulli`, `PershkrimiD`, `Skedar`, `PamjaeFaqes`) VALUES
(2, 'Dhuro Gjakë', 'Gjaku juaj është i çmuar dhe dhurimet tuaja janë vërtet jetëshpëtuese. Nga mënyra se si funksionon dhurimi e deri tek kush ka nevojë, ka kaq shumë për të ditur për gjakun. Dhurimi vullnetar i gjakut është një procedurë e sigurt dhe e thjeshtë që përfshin një dhurues që jep një nga produktet e mëposhtme të gjakut: gjak të plotë, qeliza të kuqe të gjakut, plazma ose trombocitet.', ' ', 'FundiFaqes_DhuroGjakë'),
(3, 'Rjetet Sociale', '<ul class=\"icons\">\r\n								\r\n								<li><a href=\"https://www.facebook.com/ardonit.vrella1/\" class=\"icon brands fa-facebook-f alt\"><span class=\"label\">Facebook</span></a></li>\r\n								<li><a href=\"https://www.instagram.com/ardonit.vr/\" class=\"icon brands fa-instagram alt\"><span class=\"label\">Instagram</span></a></li>\r\n								\r\n							</ul>', ' ', 'FundiFaqes_Rrjetetsc'),
(4, 'Info', '<dl class=\"alt\">\r\n								<dt>Addresa</dt>\r\n								<dd>Rruga 12345; Ferizaj,• Kosova</dd>\r\n								<dt>Telefon</dt>\r\n								<dd>0038345533492</dd>\r\n								<dt>Email</dt>\r\n								<dd><a href=\"#\">bloodonationks@untitled.tld</a></dd>\r\n							</dl>', ' ', 'FundiFaqes_Info'),
(5, 'teDrejtateAutorit', '© Untitled. Dizajni: <a href=\"https://html5up.net\">HTML5 UP</a>.| \r\nMeritat: @html5up.net per template lejuar nen <a href=\"https://creativecommons.org/licenses/by/3.0/\">Creative Commons Attribution License 3.0 </a> | Fotot: <a href=\"https://unsplash.com\">Unsplash</a>.\r\n', '', 'FundiFaqes_teDrejtateAutorit'),
(6, 'MenyP', '						<ul>\r\n							<li><a href=\"index.php\">Ballina</a></li>\r\n							<li><a href=\"kontakt.php\">Kontakti</a></li>\r\n							\r\n						</ul>\r\n					</nav>', ' ', 'MenyPerdoruesit'),
(9, 'Uebaplikacioni per Menaxhimin e Dhurimit te GJakut (UMDHGJ)', ' ', 'logo.svg', 'FillimiFaqes'),
(10, 'MenyA', '						<ul>\r\n							<li><a href=\"ballina.php\">Ballina</a></li>\r\n							<li><a href=\"fshiej_kontakt.php\">Kontaktet</a></li>\r\n							<li><a href=\"perdoruesit.php\">Perdoruesit</a></li>\r\n							<li><a href=\"ckycy.php\">Ckycy</a></li>\r\n							\r\n						</ul>\r\n					</nav>', '  ', 'MenyAdministratorit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `umdhgj_dhuruesit`
--
ALTER TABLE `umdhgj_dhuruesit`
  ADD PRIMARY KEY (`ID_dhuruesit`),
  ADD KEY `foreign_key_dhuruesit` (`ID_GrupiGjakut`);

--
-- Indexes for table `umdhgj_grupetegjakut`
--
ALTER TABLE `umdhgj_grupetegjakut`
  ADD PRIMARY KEY (`ID_GrupiGjakut`);

--
-- Indexes for table `umdhgj_kontakti`
--
ALTER TABLE `umdhgj_kontakti`
  ADD PRIMARY KEY (`ID_Kontakti`);

--
-- Indexes for table `umdhgj_log_perdoruesit_pfshierjes`
--
ALTER TABLE `umdhgj_log_perdoruesit_pfshierjes`
  ADD PRIMARY KEY (`epid`);

--
-- Indexes for table `umdhgj_log_perdoruesit_pperditesimit`
--
ALTER TABLE `umdhgj_log_perdoruesit_pperditesimit`
  ADD PRIMARY KEY (`epid`);

--
-- Indexes for table `umdhgj_log_perdoruesit_pshtimit`
--
ALTER TABLE `umdhgj_log_perdoruesit_pshtimit`
  ADD PRIMARY KEY (`epid`);

--
-- Indexes for table `umdhgj_perdoruesit`
--
ALTER TABLE `umdhgj_perdoruesit`
  ADD PRIMARY KEY (`epid`);

--
-- Indexes for table `umdhgj_tedhenat`
--
ALTER TABLE `umdhgj_tedhenat`
  ADD PRIMARY KEY (`ID_teDhenat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `umdhgj_dhuruesit`
--
ALTER TABLE `umdhgj_dhuruesit`
  MODIFY `ID_dhuruesit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `umdhgj_grupetegjakut`
--
ALTER TABLE `umdhgj_grupetegjakut`
  MODIFY `ID_GrupiGjakut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `umdhgj_kontakti`
--
ALTER TABLE `umdhgj_kontakti`
  MODIFY `ID_Kontakti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `umdhgj_log_perdoruesit_pfshierjes`
--
ALTER TABLE `umdhgj_log_perdoruesit_pfshierjes`
  MODIFY `epid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `umdhgj_log_perdoruesit_pperditesimit`
--
ALTER TABLE `umdhgj_log_perdoruesit_pperditesimit`
  MODIFY `epid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `umdhgj_log_perdoruesit_pshtimit`
--
ALTER TABLE `umdhgj_log_perdoruesit_pshtimit`
  MODIFY `epid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `umdhgj_perdoruesit`
--
ALTER TABLE `umdhgj_perdoruesit`
  MODIFY `epid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `umdhgj_tedhenat`
--
ALTER TABLE `umdhgj_tedhenat`
  MODIFY `ID_teDhenat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `umdhgj_dhuruesit`
--
ALTER TABLE `umdhgj_dhuruesit`
  ADD CONSTRAINT `umdhgj_dhuruesit_ibfk_1` FOREIGN KEY (`ID_GrupiGjakut`) REFERENCES `umdhgj_grupetegjakut` (`ID_GrupiGjakut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
