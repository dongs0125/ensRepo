-- --------------------------------------------------------
-- 호스트:                          202.30.21.46
-- 서버 버전:                        10.2.14-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- ensdr 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `ensdr` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ensdr`;


-- 테이블 ensdr.angle_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `angle_table` (
  `device_id` int(11) unsigned DEFAULT NULL,
  `command_idx` int(11) unsigned DEFAULT NULL,
  `tick` bigint(13) unsigned DEFAULT NULL,
  `tick_idx` bigint(13) unsigned DEFAULT NULL,
  `ang_j1` float DEFAULT NULL,
  `ang_j2` float DEFAULT NULL,
  `ang_j3` float DEFAULT NULL,
  `ang_j4` float DEFAULT NULL,
  `ang_j5` float DEFAULT NULL,
  `ang_j6` float DEFAULT NULL,
  KEY `device_id` (`device_id`),
  KEY `command_idx` (`command_idx`),
  CONSTRAINT `FK_angle_table_commandidx_table` FOREIGN KEY (`command_idx`) REFERENCES `commandidx_table` (`command_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_angle_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.bootidx_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `bootidx_table` (
  `boot_idx` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventF_idx` int(11) unsigned DEFAULT NULL,
  `device_id` int(11) unsigned DEFAULT NULL,
  `bootDate` date DEFAULT NULL,
  `bootTime` tinytext DEFAULT NULL,
  `bootTick` bigint(20) unsigned DEFAULT NULL,
  `offDate` date DEFAULT NULL,
  `offTime` tinytext DEFAULT NULL,
  `offTick` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`boot_idx`),
  KEY `eventF_idx` (`eventF_idx`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `FK_bootidx_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bootidx_table_event_table` FOREIGN KEY (`eventF_idx`) REFERENCES `event_table` (`eventF_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bootidx_table_programidx_table` FOREIGN KEY (`boot_idx`) REFERENCES `programidx_table` (`boot_idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.commandidx_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `commandidx_table` (
  `command_idx` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `program_idx` int(11) unsigned DEFAULT NULL,
  `command_id` int(11) unsigned DEFAULT NULL,
  `commandStartDate` date DEFAULT NULL,
  `commandStartTime` tinytext DEFAULT NULL,
  `commandStartTick` bigint(20) unsigned DEFAULT NULL,
  `commandEndDate` date DEFAULT NULL,
  `commandEndTime` tinytext DEFAULT NULL,
  `commandEndTick` bigint(20) unsigned DEFAULT NULL,
  `movingTime` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`command_idx`),
  KEY `program_idx` (`program_idx`),
  KEY `command_id` (`command_id`),
  CONSTRAINT `FK_commandidx_table_commandid_table` FOREIGN KEY (`command_idx`) REFERENCES `commandid_table` (`command_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_commandidx_table_programidx_table` FOREIGN KEY (`program_idx`) REFERENCES `programidx_table` (`program_idx`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.commandid_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `commandid_table` (
  `command_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `program_id` int(11) unsigned DEFAULT NULL,
  `device_id` int(11) unsigned DEFAULT NULL,
  `commandLast` text DEFAULT NULL,
  `commandCur` text DEFAULT NULL,
  PRIMARY KEY (`command_id`),
  KEY `program_id` (`program_id`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `FK_commandid_table_commandidx_table` FOREIGN KEY (`command_id`) REFERENCES `commandidx_table` (`command_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_commandid_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_commandid_table_programid_table` FOREIGN KEY (`program_id`) REFERENCES `programid_table` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.current_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `current_table` (
  `device_id` int(11) unsigned DEFAULT NULL,
  `command_idx` int(11) unsigned DEFAULT NULL,
  `tick` bigint(13) unsigned DEFAULT NULL,
  `tick_idx` bigint(13) unsigned DEFAULT NULL,
  `cur_j1` float DEFAULT NULL,
  `cur_j2` float DEFAULT NULL,
  `cur_j3` float DEFAULT NULL,
  `cur_j4` float DEFAULT NULL,
  `cur_j5` float DEFAULT NULL,
  `cur_j6` float DEFAULT NULL,
  KEY `device_id` (`device_id`),
  KEY `command_idx` (`command_idx`),
  CONSTRAINT `FK_current_table_commandidx_table` FOREIGN KEY (`command_idx`) REFERENCES `commandidx_table` (`command_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_current_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.deviceid_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `deviceid_table` (
  `device_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deviceName` tinytext DEFAULT NULL,
  `deviceType` enum('manipulator','conveyorbelt','controller') DEFAULT NULL,
  `devicePicture` text DEFAULT NULL,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.event_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `event_table` (
  `eventF_idx` int(11) unsigned NOT NULL,
  `device_id` int(11) unsigned DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `eventTime` tinytext DEFAULT NULL,
  `eventLevel` enum('INFO','WARN','FAULT','DEBUG') DEFAULT NULL,
  `eventGroup` enum('MACHINE','FRAMEWORK','CONTROLLER','DETECTOR') DEFAULT NULL,
  `eventTick` bigint(13) DEFAULT NULL,
  `eventIdt` enum('BOOT','STATE','EVENT','PROGRAM','MOTION','COMMUNICATION','ERROR','ANOMALY','FAULT') DEFAULT NULL,
  `eventNote` text DEFAULT NULL,
  KEY `eventF_idx` (`eventF_idx`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `FK_event_table_bootidx_table` FOREIGN KEY (`eventF_idx`) REFERENCES `bootidx_table` (`eventF_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_event_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.file_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `file_table` (
  `F_idx` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int(11) unsigned DEFAULT NULL,
  `filePath` text DEFAULT NULL,
  `fileSize` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `startTime` tinytext DEFAULT NULL,
  `startTick` bigint(13) DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `endTime` tinytext DEFAULT NULL,
  `endTick` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`F_idx`),
  KEY `FK_file_table_deviceid_table` (`device_id`),
  CONSTRAINT `FK_file_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.marker_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `marker_table` (
  `device_id` int(11) unsigned DEFAULT NULL,
  `command_idx` int(11) unsigned DEFAULT NULL,
  `tick` bigint(13) unsigned DEFAULT NULL,
  `tick_idx` bigint(13) unsigned DEFAULT NULL,
  `pos_x` float DEFAULT NULL,
  `pos_y` float DEFAULT NULL,
  `pos_z` float DEFAULT NULL,
  `marker_id` int(11) NOT NULL,
  PRIMARY KEY (`marker_id`),
  KEY `device_id` (`device_id`),
  KEY `command_idx` (`command_idx`),
  CONSTRAINT `FK_marker_table_commandidx_table` FOREIGN KEY (`command_idx`) REFERENCES `commandidx_table` (`command_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_marker_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.penel_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `penel_table` (
  `device_id` int(11) unsigned DEFAULT NULL,
  `command_idx` int(11) unsigned DEFAULT NULL,
  `tick` bigint(13) unsigned DEFAULT NULL,
  `tick_idx` bigint(13) unsigned DEFAULT NULL,
  `penel_x` float DEFAULT NULL,
  `penel_y` float DEFAULT NULL,
  KEY `device_id` (`device_id`),
  KEY `command_idx` (`command_idx`),
  CONSTRAINT `FK_penel_table_commandidx_table` FOREIGN KEY (`command_idx`) REFERENCES `commandidx_table` (`command_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_penel_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.postion_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `postion_table` (
  `device_id` int(11) unsigned DEFAULT NULL,
  `command_idx` int(11) unsigned DEFAULT NULL,
  `tick` bigint(13) unsigned DEFAULT NULL,
  `tick_idx` bigint(13) unsigned DEFAULT NULL,
  `pos_x` float DEFAULT NULL,
  `pos_y` float DEFAULT NULL,
  `pos_z` float DEFAULT NULL,
  `roll` float DEFAULT NULL,
  `pitch` float DEFAULT NULL,
  `yaw` float DEFAULT NULL,
  KEY `device_id` (`device_id`),
  KEY `command_idx` (`command_idx`),
  CONSTRAINT `FK_postion_table_commandidx_table` FOREIGN KEY (`command_idx`) REFERENCES `commandidx_table` (`command_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_postion_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.programidx_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `programidx_table` (
  `program_idx` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `program_id` int(11) unsigned DEFAULT NULL,
  `boot_idx` int(11) unsigned NOT NULL,
  `programStartDate` date DEFAULT NULL,
  `programStartTime` tinytext DEFAULT NULL,
  `programStartTick` bigint(13) unsigned DEFAULT NULL,
  `programEndDate` date DEFAULT NULL,
  `programEndTime` tinytext DEFAULT NULL,
  `programEndTick` bigint(13) unsigned DEFAULT NULL,
  PRIMARY KEY (`program_idx`),
  KEY `program_id` (`program_id`),
  KEY `boot_idx` (`boot_idx`),
  CONSTRAINT `FK_programidx_table_bootidx_table` FOREIGN KEY (`boot_idx`) REFERENCES `bootidx_table` (`boot_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_programidx_table_commandidx_table` FOREIGN KEY (`program_idx`) REFERENCES `commandidx_table` (`program_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_programidx_table_programid_table` FOREIGN KEY (`program_id`) REFERENCES `programid_table` (`program_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.programid_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `programid_table` (
  `program_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `programName` tinytext DEFAULT NULL,
  `device_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`program_id`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `FK_programid_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.temperature_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `temperature_table` (
  `device_id` int(11) unsigned DEFAULT NULL,
  `command_idx` int(11) unsigned DEFAULT NULL,
  `tick` bigint(13) unsigned DEFAULT NULL,
  `tick_idx` bigint(13) unsigned DEFAULT NULL,
  `temp_j1` float DEFAULT NULL,
  `temp_j2` float DEFAULT NULL,
  `temp_j3` float DEFAULT NULL,
  `temp_j4` float DEFAULT NULL,
  `temp_j5` float DEFAULT NULL,
  `temp_j6` float DEFAULT NULL,
  KEY `device_id` (`device_id`),
  KEY `command_idx` (`command_idx`),
  CONSTRAINT `FK_temperature_table_commandidx_table` FOREIGN KEY (`command_idx`) REFERENCES `commandidx_table` (`command_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_temperature_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 ensdr.voltage_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `voltage_table` (
  `device_id` int(11) unsigned DEFAULT NULL,
  `command_idx` int(11) unsigned DEFAULT NULL,
  `tick` bigint(13) unsigned DEFAULT NULL,
  `tick_idx` bigint(13) unsigned DEFAULT NULL,
  `vol_j1` float DEFAULT NULL,
  `vol_j2` float DEFAULT NULL,
  `vol_j3` float DEFAULT NULL,
  `vol_j4` float DEFAULT NULL,
  `vol_j5` float DEFAULT NULL,
  `vol_j6` float DEFAULT NULL,
  KEY `device_id` (`device_id`),
  KEY `command_idx` (`command_idx`),
  CONSTRAINT `FK_voltage_table_commandidx_table` FOREIGN KEY (`command_idx`) REFERENCES `commandidx_table` (`command_idx`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_voltage_table_deviceid_table` FOREIGN KEY (`device_id`) REFERENCES `deviceid_table` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
