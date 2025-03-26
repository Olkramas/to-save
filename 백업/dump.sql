-- --------------------------------------------------------
-- 호스트:                          10.10.2.24
-- 서버 버전:                        10.5.13-MariaDB-log - MariaDB Server
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- cmsdb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `cmsdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `cmsdb`;

-- 테이블 cmsdb.comtccmmnclcode 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtccmmnclcode` (
  `CL_CODE` char(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '분류코드',
  `CL_CODE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '분류코드명',
  `CL_CODE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '분류코드설명',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통분류코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtccmmncode 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtccmmncode` (
  `CODE_ID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드ID',
  `CODE_ID_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드 명',
  `CODE_ID_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드 설명',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `CL_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '분류코드',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`CODE_ID`),
  KEY `COMTCCMMNCODE_i01` (`CL_CODE`),
  CONSTRAINT `COMTCCMMNCODE_FK1` FOREIGN KEY (`CL_CODE`) REFERENCES `comtccmmnclcode` (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtccmmndetailcode 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtccmmndetailcode` (
  `CODE_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드ID',
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드',
  `CODE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드명',
  `CODE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드설명',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `SORT_ORDER` int(11) DEFAULT NULL COMMENT '정렬순서',
  `ATTR1` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추가필드1',
  `ATTR2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추가필드2',
  PRIMARY KEY (`CODE_ID`,`CODE`),
  CONSTRAINT `COMTCCMMNDETAILCODE_FK1` FOREIGN KEY (`CODE_ID`) REFERENCES `comtccmmncode` (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통상세코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtecopseq 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtecopseq` (
  `table_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '테이블명',
  `next_id` decimal(30,0) DEFAULT NULL COMMENT '다음아이디',
  PRIMARY KEY (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='시퀀스관리';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comthconfmhistory 구조 내보내기
CREATE TABLE IF NOT EXISTS `comthconfmhistory` (
  `CONFM_NO` decimal(8,0) NOT NULL COMMENT '승인번호',
  `CONFM_RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '승인요청자ID',
  `CONFMER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인자ID',
  `CONFM_DE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인일',
  `CONFM_TY_CODE` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '승인유형코드',
  `CONFM_STTUS_CODE` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '승인상태코드',
  `OPERT_TY_CODE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작업유형코드',
  `OPERT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작업ID',
  `TRGET_JOB_TY_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대상업무유형코드',
  `TRGET_JOB_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대상업무ID',
  PRIMARY KEY (`CONFM_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='승인이력';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comthprogrmchangedtls 구조 내보내기
CREATE TABLE IF NOT EXISTS `comthprogrmchangedtls` (
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램파일명',
  `REQUST_NO` decimal(10,0) NOT NULL DEFAULT 0 COMMENT '요청번호',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청자ID',
  `CHANGE_REQUST_CN` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변경요청내용',
  `REQUST_PROCESS_CN` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청처리내용',
  `OPETR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리자ID',
  `PROCESS_STTUS_CODE` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '처리상태코드',
  `PROCESS_DE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리일',
  `RQESTDE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청일',
  `REQUST_SJ` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청제목',
  PRIMARY KEY (`PROGRM_FILE_NM`,`REQUST_NO`),
  CONSTRAINT `COMTHPROGRMCHANGEDTLS_FK1` FOREIGN KEY (`PROGRM_FILE_NM`) REFERENCES `comtnprogrmlist` (`PROGRM_FILE_NM`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램변경내역';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comthsyshist 구조 내보내기
CREATE TABLE IF NOT EXISTS `comthsyshist` (
  `HIST_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력ID',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `HIST_SE_CODE` char(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력구분코드',
  `HIST_CN` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력내용',
  `SYS_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '시스템명',
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일ID',
  PRIMARY KEY (`HIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='시스템이력';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnauthorgroupinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnauthorgroupinfo` (
  `GROUP_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '그룹ID',
  `GROUP_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '그룹명',
  `GROUP_CREAT_DE` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '그룹생성일',
  `GROUP_DC` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹설명',
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='권한그룹정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnauthorinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnauthorinfo` (
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '권한코드',
  `AUTHOR_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한명',
  `AUTHOR_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한설명',
  `AUTHOR_CREAT_DE` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한생성일',
  `AUTHOR_ADM` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자권한여부 (S: SYSTEM 기본, Y:관리자, N:사용자)',
  PRIMARY KEY (`AUTHOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='권한정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnauthorrolerelate 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnauthorrolerelate` (
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  `ROLE_CODE` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '롤코드',
  `CREAT_DT` datetime DEFAULT NULL COMMENT '생성일시',
  PRIMARY KEY (`AUTHOR_CODE`,`ROLE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='권한롤관계';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnbbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnbbs` (
  `ntt_id` decimal(20,0) NOT NULL COMMENT '게시물ID',
  `bbs_id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판ID',
  `ntt_no` decimal(20,0) DEFAULT NULL COMMENT '게시물번호',
  `ntt_sj` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시물제목',
  `ntt_cn` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시물내용',
  `answer_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '댓글여부',
  `parntsctt_no` decimal(10,0) DEFAULT NULL COMMENT '부모글번호',
  `answer_lc` decimal(8,0) DEFAULT NULL COMMENT '댓글위치',
  `sort_ordr` decimal(8,0) DEFAULT NULL COMMENT '정렬순서',
  `rdcnt` decimal(10,0) DEFAULT NULL COMMENT '조회수',
  `use_at` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `ntce_bgnde` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시시작일',
  `ntce_endde` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시종료일',
  `ntcr_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시자ID',
  `ntcr_nm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시자명',
  `password` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `atch_file_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일ID',
  `notice_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공지사항여부',
  `sj_bold_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목볼드여부',
  `secret_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀글여부',
  `frst_regist_pnttm` datetime NOT NULL COMMENT '최초등록시점',
  `frst_register_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '최초등록자ID',
  `last_updt_pnttm` datetime DEFAULT NULL COMMENT '최종수정시점',
  `last_updusr_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `blog_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '블로그 ID',
  PRIMARY KEY (`ntt_id`,`bbs_id`),
  KEY `COMTNBBS_i01` (`bbs_id`),
  CONSTRAINT `COMTNBBS_FK1` FOREIGN KEY (`bbs_id`) REFERENCES `comtnbbsmaster` (`bbs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnbbsmaster 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnbbsmaster` (
  `bbs_id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판ID',
  `bbs_nm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판명',
  `bbs_intrcn` varchar(2400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판소개',
  `bbs_ty_code` char(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판유형코드',
  `reply_posbl_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답장가능여부',
  `file_atch_posbl_at` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일첨부가능여부',
  `atch_posbl_file_number` decimal(2,0) NOT NULL COMMENT '첨부가능파일숫자',
  `atch_posbl_file_size` decimal(8,0) DEFAULT NULL COMMENT '첨부가능파일사이즈',
  `use_at` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `tmplat_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿ID',
  `cmmnty_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '커뮤니티ID',
  `frst_register_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '최초등록자ID',
  `frst_regist_pnttm` datetime NOT NULL COMMENT '최초등록시점',
  `last_updusr_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `last_updt_pnttm` datetime DEFAULT NULL COMMENT '최종수정시점',
  `blog_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '블로그 ID',
  `blog_at` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '블로그 여부',
  PRIMARY KEY (`bbs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판마스터';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnbbsmasteroptn 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnbbsmasteroptn` (
  `BBS_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판ID',
  `ANSWER_AT` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '댓글여부',
  `STSFDG_AT` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '만족도여부',
  `FRST_REGIST_PNTTM` datetime NOT NULL COMMENT '최초등록시점',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '최초등록자ID',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판마스터옵션';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnemplyrinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnemplyrinfo` (
  `EMPLYR_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '업무사용자ID',
  `ORGNZT_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직ID',
  `USER_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자명',
  `PASSWORD` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀번호',
  `EMPL_NO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사원번호',
  `IHIDNUM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주민등록번호',
  `SEXDSTN_CODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별코드',
  `BRTHDY` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '생일',
  `FXNUM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팩스번호',
  `HOUSE_ADRES` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주택주소',
  `PASSWORD_HINT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호힌트',
  `PASSWORD_CNSR` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호정답',
  `HOUSE_END_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주택끝전화번호',
  `AREA_NO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '지역번호',
  `DETAIL_ADRES` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세주소',
  `ZIP` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '우편번호',
  `OFFM_TELNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사무실전화번호',
  `MBTLNUM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이동전화번호',
  `EMAIL_ADRES` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일주소',
  `OFCPS_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '직위명',
  `HOUSE_MIDDLE_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주택중간전화번호',
  `GROUP_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹ID',
  `PSTINST_CODE` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소속기관코드',
  `EMPLYR_STTUS_CODE` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자상태코드',
  `ESNTL_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유ID',
  `CRTFC_DN_VALUE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인증DN값',
  `SBSCRB_DE` datetime DEFAULT NULL COMMENT '가입일자',
  `LOCK_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잠금여부',
  `LOCK_CNT` decimal(3,0) DEFAULT NULL COMMENT '잠금회수',
  `LOCK_LAST_PNTTM` datetime DEFAULT NULL COMMENT '잠금최종시점',
  `LAST_LOGIN` datetime DEFAULT NULL COMMENT '최종로그인시간',
  `PWD_CHNG_YN` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`EMPLYR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='업무사용자정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnemplyrscrtyestbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnemplyrscrtyestbs` (
  `SCRTY_DTRMN_TRGET_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '보안설정대상ID',
  `MBER_TY_CODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원유형코드',
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  KEY `comtnemplyrscrtyestbs_i01` (`AUTHOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자보안설정';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnerrorlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnerrorlog` (
  `SEQ` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `METHOD_NM` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '호출된메소드',
  `ERROR_URL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '에러URL',
  `ERROR_NM` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '에러명',
  `ERROR_CONT` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '에러내용',
  `PARAMETER` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파라미터',
  `MENU_NO` decimal(20,0) DEFAULT NULL COMMENT '메뉴번호',
  `MENU_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴명',
  `SITE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트(A:관리자, U:사용자)',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=2218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통에러로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnfile 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnfile` (
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `CREAT_DT` datetime NOT NULL COMMENT '생성일시',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  PRIMARY KEY (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일속성';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnfiledetail 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnfiledetail` (
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `FILE_SN` decimal(10,0) NOT NULL COMMENT '파일순번',
  `FILE_STRE_COURS` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일저장경로',
  `STRE_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '저장파일명',
  `ORIGNL_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원파일명',
  `FILE_EXTSN` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일확장자',
  `FILE_CN` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일내용',
  `FILE_SIZE` decimal(8,0) DEFAULT NULL COMMENT '파일크기',
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`),
  CONSTRAINT `COMTNFILEDETAIL_FK1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `comtnfile` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일상세정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtngnrlmber 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtngnrlmber` (
  `MBER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '회원ID',
  `PASSWORD` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀번호',
  `PASSWORD_HINT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호힌트',
  `PASSWORD_CNSR` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호정답',
  `IHIDNUM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주민등록번호',
  `MBER_NM` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '회원명',
  `ZIP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우편번호',
  `ADRES` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `AREA_NO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지역번호',
  `MBER_STTUS` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원상태',
  `DETAIL_ADRES` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세주소',
  `END_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '끝전화번호',
  `MBTLNUM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이동전화번호',
  `GROUP_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹ID',
  `MBER_FXNUM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원팩스번호',
  `MBER_EMAIL_ADRES` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원이메일주소',
  `MIDDLE_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '중간전화번호',
  `SBSCRB_DE` datetime DEFAULT NULL COMMENT '가입일자',
  `SEXDSTN_CODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별코드',
  `ESNTL_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유ID',
  `LOCK_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잠금여부',
  `LOCK_CNT` decimal(3,0) DEFAULT NULL COMMENT '잠금회수',
  `LOCK_LAST_PNTTM` datetime DEFAULT NULL COMMENT '잠금최종시점',
  `SECESSION_REASON` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴사유',
  `SECESSION_DT` datetime DEFAULT NULL COMMENT '탈퇴일자',
  `PASS_CHG_DT` datetime DEFAULT NULL COMMENT '비밀번호 변경일자',
  PRIMARY KEY (`MBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='일반회원';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnloginlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnloginlog` (
  `LOG_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '로그ID',
  `CONECT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속ID',
  `CONECT_IP` varchar(23) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속IP',
  `CONECT_MTHD` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속방식',
  `ERROR_OCCRRNC_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오류발생여부',
  `ERROR_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오류코드',
  `CREAT_DT` datetime DEFAULT NULL COMMENT '생성일시',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='접속로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnmenucreatdtls 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnmenucreatdtls` (
  `MENU_NO` decimal(20,0) NOT NULL COMMENT '메뉴번호',
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  `MAPNG_CREAT_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '매핑생성ID',
  PRIMARY KEY (`MENU_NO`,`AUTHOR_CODE`),
  KEY `COMTNMENUCREATDTLS_i01` (`MAPNG_CREAT_ID`),
  KEY `COMTNMENUCREATDTLS_i02` (`AUTHOR_CODE`),
  CONSTRAINT `COMTNMENUCREATDTLS_FK1` FOREIGN KEY (`AUTHOR_CODE`) REFERENCES `comtnauthorinfo` (`AUTHOR_CODE`),
  CONSTRAINT `COMTNMENUCREATDTLS_FK2` FOREIGN KEY (`MENU_NO`) REFERENCES `comtnmenuinfo` (`MENU_NO`) ON DELETE CASCADE,
  CONSTRAINT `COMTNMENUCREATDTLS_FK3` FOREIGN KEY (`MAPNG_CREAT_ID`) REFERENCES `comtnsitemap` (`MAPNG_CREAT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메뉴생성내역';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnmenuinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnmenuinfo` (
  `MENU_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴명',
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램파일명',
  `MENU_NO` decimal(20,0) NOT NULL COMMENT '메뉴번호',
  `UPPER_MENU_NO` decimal(20,0) DEFAULT NULL COMMENT '상위메뉴번호',
  `MENU_ORDR` decimal(5,0) NOT NULL COMMENT '메뉴순서',
  `MENU_DC` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴설명',
  `RELATE_IMAGE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계이미지경로',
  `RELATE_IMAGE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계이미지명',
  `MENU_VIEW_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 표시여부',
  `USER_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자유형',
  PRIMARY KEY (`MENU_NO`),
  KEY `COMTNMENUINFO_i01` (`PROGRM_FILE_NM`),
  KEY `COMTNMENUINFO_i02` (`UPPER_MENU_NO`),
  CONSTRAINT `COMTNMENUINFO_FK1` FOREIGN KEY (`UPPER_MENU_NO`) REFERENCES `comtnmenuinfo` (`MENU_NO`) ON DELETE CASCADE,
  CONSTRAINT `COMTNMENUINFO_FK2` FOREIGN KEY (`PROGRM_FILE_NM`) REFERENCES `comtnprogrmlist` (`PROGRM_FILE_NM`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메뉴정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnprogrmlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnprogrmlist` (
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '프로그램파일명',
  `PROGRM_STRE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램저장경로',
  `PROGRM_KOREAN_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램한글명',
  `PROGRM_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램설명',
  `URL` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'URL',
  PRIMARY KEY (`PROGRM_FILE_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램목록';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnrestde 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnrestde` (
  `RESTDE_NO` decimal(6,0) NOT NULL COMMENT '휴일번호',
  `RESTDE` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일',
  `RESTDE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일명',
  `RESTDE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일설명',
  `RESTDE_SE_CODE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일구분코드',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`RESTDE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='휴일관리';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnroleinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnroleinfo` (
  `ROLE_CODE` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '롤코드',
  `ROLE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '롤명',
  `ROLE_PTTRN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤패턴',
  `ROLE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤설명',
  `ROLE_TY` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤유형',
  `ROLE_SORT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤정렬',
  `ROLE_CREAT_DE` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '롤생성일',
  PRIMARY KEY (`ROLE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='롤정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnroles_hierarchy 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnroles_hierarchy` (
  `PARNTS_ROLE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '부모롤',
  `CHLDRN_ROLE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '자식롤',
  PRIMARY KEY (`PARNTS_ROLE`,`CHLDRN_ROLE`),
  UNIQUE KEY `COMTNROLES_i01` (`PARNTS_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='롤 계층구조';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnschdulinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnschdulinfo` (
  `SCHDUL_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '일정ID',
  `SCHDUL_SE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정구분',
  `SCHDUL_DEPT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정부서ID',
  `SCHDUL_KND_CODE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SCHDUL_BGNDE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정시작일',
  `SCHDUL_ENDDE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정종료일',
  `SCHDUL_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정명',
  `SCHDUL_CN` varchar(2500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정내용',
  `SCHDUL_PLACE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정장소',
  `SCHDUL_IPCR_CODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정중요도코드',
  `SCHDUL_CHARGER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정담당자ID',
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일ID',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `REPTIT_SE_CODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '반복구분코드',
  PRIMARY KEY (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='일정정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnsitemap 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnsitemap` (
  `MAPNG_CREAT_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '매핑생성ID',
  `CREATR_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '생성자ID',
  `MAPNG_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '매핑파일명',
  `MAPNG_FILE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '매핑파일경로',
  PRIMARY KEY (`MAPNG_CREAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사이트맵';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnsyslog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnsyslog` (
  `REQUST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청ID',
  `JOB_SE_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '업무구분코드',
  `INSTT_CODE` char(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관코드',
  `OCCRRNC_DE` datetime DEFAULT NULL COMMENT '발생일',
  `RQESTER_IP` varchar(23) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자IP',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자ID',
  `TRGET_MENU_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대상메뉴명',
  `SVC_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서비스명',
  `METHOD_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메서드명',
  `PROCESS_SE_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리구분코드',
  `PROCESS_CO` decimal(10,0) DEFAULT NULL COMMENT '처리수',
  `PROCESS_TIME` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리시간',
  `RSPNS_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '응답코드',
  `ERROR_SE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오류구분',
  `ERROR_CO` decimal(10,0) DEFAULT NULL COMMENT '오류수',
  `ERROR_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오류코드',
  PRIMARY KEY (`REQUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='시스템로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtntmplatinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtntmplatinfo` (
  `TMPLAT_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '템플릿ID',
  `TMPLAT_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿명',
  `TMPLAT_COURS` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿경로',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `TMPLAT_SE_CODE` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿구분코드',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  PRIMARY KEY (`TMPLAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='템플릿';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnuserlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnuserlog` (
  `OCCRRNC_DE` char(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '발생일',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '요청자ID',
  `SVC_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '서비스명',
  `METHOD_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '메서드명',
  `CREAT_CO` decimal(10,0) DEFAULT NULL COMMENT '생성수',
  `UPDT_CO` decimal(10,0) DEFAULT NULL COMMENT '수정수',
  `RDCNT` decimal(10,0) DEFAULT NULL COMMENT '조회수',
  `DELETE_CO` decimal(10,0) DEFAULT NULL COMMENT '삭제수',
  `OUTPT_CO` decimal(10,0) DEFAULT NULL COMMENT '출력수',
  `ERROR_CO` decimal(10,0) DEFAULT NULL COMMENT '오류수',
  PRIMARY KEY (`OCCRRNC_DE`,`RQESTER_ID`,`SVC_NM`,`METHOD_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtnweblog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnweblog` (
  `REQUST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청ID',
  `OCCRRNC_DE` datetime DEFAULT NULL COMMENT '발생일',
  `URL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자ID',
  `RQESTER_IP` varchar(23) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자IP',
  `parameter` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='웹로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtsbbssummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtsbbssummary` (
  `occrrnc_de` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '발생일',
  `stats_se` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '통계구분',
  `detail_stats_se` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '세부통계구분',
  `creat_co` decimal(10,0) DEFAULT NULL COMMENT '생성수',
  `tot_rdcnt` decimal(10,0) DEFAULT NULL COMMENT '총조회수',
  `avrg_rdcnt` decimal(10,0) DEFAULT NULL COMMENT '평균조회수',
  `top_inqire_bbsctt_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최고조회게시글ID',
  `mumm_inqire_bbsctt_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소조회게시글ID',
  `top_ntcr_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최고게시자ID',
  PRIMARY KEY (`occrrnc_de`,`stats_se`,`detail_stats_se`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시물통계요약';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtssyslogsummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtssyslogsummary` (
  `occrrnc_de` char(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '발생일',
  `svc_nm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '서비스명',
  `method_nm` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메서드명',
  `creat_co` decimal(10,0) DEFAULT NULL COMMENT '생성수',
  `updt_co` decimal(10,0) DEFAULT NULL COMMENT '수정수',
  `rdcnt` decimal(10,0) DEFAULT NULL COMMENT '조회수',
  `delete_co` decimal(10,0) DEFAULT NULL COMMENT '삭제수',
  `outpt_co` decimal(10,0) DEFAULT NULL COMMENT '출력수',
  `error_co` decimal(10,0) DEFAULT NULL COMMENT '오류수',
  PRIMARY KEY (`occrrnc_de`,`svc_nm`,`method_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='시스템로그요약';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtsusersummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtsusersummary` (
  `occrrnc_de` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '발생일',
  `stats_se` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '통계구분',
  `detail_stats_se` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '세부통계구분',
  `user_co` decimal(10,0) DEFAULT NULL COMMENT '사용자수',
  PRIMARY KEY (`occrrnc_de`,`stats_se`,`detail_stats_se`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자통계요약';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.comtsweblogsummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtsweblogsummary` (
  `occrrnc_de` char(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '발생일',
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'URL',
  `rdcnt` decimal(10,0) DEFAULT NULL COMMENT '조회수',
  PRIMARY KEY (`occrrnc_de`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='웹로그 요약';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 뷰 cmsdb.comvmenulist 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `comvmenulist` (
	`MENU_NO` DECIMAL(20,0) NULL,
	`MENU_ORDR` DECIMAL(5,0) NULL,
	`MENU_NM` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`UPPER_MENU_NO` DECIMAL(20,0) NULL,
	`MENU_DC` VARCHAR(250) NULL COLLATE 'utf8mb4_unicode_ci',
	`RELATE_IMAGE_PATH` VARCHAR(100) NULL COLLATE 'utf8mb4_unicode_ci',
	`RELATE_IMAGE_NM` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`PROGRM_FILE_NM` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`level` INT(1) NULL,
	`TOP_MENU` DECIMAL(20,0) NULL,
	`USER_TYPE` VARCHAR(20) NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- 뷰 cmsdb.comvnusermaster 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `comvnusermaster` (
	`ESNTL_ID` CHAR(20) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_ID` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`PASSWORD` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_NM` VARCHAR(60) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_ZIP` VARCHAR(6) NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_ADRES` VARCHAR(100) NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_EMAIL` VARCHAR(500) NULL COLLATE 'utf8mb4_unicode_ci',
	`GROUP_ID` VARCHAR(20) NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_SE` VARCHAR(3) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`ORGNZT_ID` VARCHAR(20) NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- 테이블 cmsdb.hibernate_sequence 구조 내보내기
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) NOT NULL,
  PRIMARY KEY (`next_val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_access_ip 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_access_ip` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접근IP',
  `user_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접근자명',
  `use_yn` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `reg_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `reg_dt` datetime DEFAULT NULL COMMENT '등록일',
  `upd_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `upd_dt` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='접근가능IP';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_banner 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_banner` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DT` datetime DEFAULT NULL COMMENT '시작일',
  `END_DT` datetime DEFAULT NULL COMMENT '종료일',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `LINK_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `LINK_TARGET` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크타겟',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `SYNC_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일연동여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='배너';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `REF` int(11) NOT NULL COMMENT 'REF',
  `BBS_LEVEL` int(11) NOT NULL COMMENT 'LEVEL',
  `STEP` int(11) NOT NULL COMMENT 'STEP',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `CATEGORY` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 아이디',
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `REPLY` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변',
  `SEC_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀글여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `NOTICE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공지여부',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `READ_CNT` int(11) NOT NULL COMMENT '조회수',
  `ATCH_FILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일아이디',
  `STATUS` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상태',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `PWD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `REG_NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자명',
  `REG_TEL` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 연락처',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_bbs_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs_category` (
  `CATEGORY_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '카테고리 인덱스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판마스터 아이디',
  `CATEGORY_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리명',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`CATEGORY_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 카테고리';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_bbs_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs_comment` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글인덱스',
  `SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_COMMENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '댓글',
  `PASS` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `REG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자이름',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 댓글';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_bbs_manager 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs_manager` (
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `GROUP_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '회원권한아이디',
  `LIST_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록접근가능여부',
  `READ_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세접근가능여부',
  `WRITE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록접근가능여부',
  `UPDATE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정접근가능여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`BBS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 관리자 그룹';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_bbs_mast 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs_mast` (
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_NAME` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판이름',
  `BBS_TYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판타입',
  `BBS_SKIN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판스킨',
  `SNS_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS공유여부',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `CATEGORY_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리 사용여부',
  `LIST_COUNT` int(11) NOT NULL COMMENT '목록글갯수',
  `FILE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일사용여부',
  `FILE_COUNT` int(11) NOT NULL COMMENT '파일최대첨부수',
  `REG_LEVEL` int(11) DEFAULT NULL COMMENT '글등록권한',
  `COMMENT_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '댓글여부',
  `REPLY_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `DEL_YN` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT '삭제여부',
  `MENU_NO` decimal(20,0) DEFAULT NULL COMMENT '연결메뉴',
  PRIMARY KEY (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판마스터';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_con 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_con` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `CON_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `REF` int(11) NOT NULL COMMENT 'REF',
  `CON_LEVEL` int(11) NOT NULL COMMENT 'LEVEL',
  `STEP` int(11) NOT NULL COMMENT 'STEP',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `CATEGORY` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 아이디',
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `REPLY` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변',
  `SEC_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀글여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `NOTICE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공지여부',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `READ_CNT` int(11) NOT NULL COMMENT '조회수',
  `ATCH_FILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일아이디',
  `STATUS` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상태',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='콘텐츠 게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_contents 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_contents` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `MENU_NO` decimal(20,0) DEFAULT NULL COMMENT '메뉴번호',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='컨텐츠';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_ctb_bbscomment 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_ctb_bbscomment` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글인덱스',
  `BBS_ARTICLE_ID` int(11) NOT NULL COMMENT '시퀀스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_COMMENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '댓글',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `REG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자이름',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`COMMENT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 댓글';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_ctb_bbsdtls 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_ctb_bbsdtls` (
  `BBS_ARTICLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유PK',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  `NOTICE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '공지여부',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자아이피',
  `READ_CNT` int(11) NOT NULL DEFAULT 0 COMMENT '조회수',
  `ATCH_FILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일아이디',
  `STATUS` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상태',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `PWD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `REG_NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자명',
  PRIMARY KEY (`BBS_ARTICLE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_ctb_bbsmst 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_ctb_bbsmst` (
  `BBS_MANAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '게시판 고유 아이디',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_NAME` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판이름',
  `BBS_TYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판타입',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `LIST_COUNT` int(10) NOT NULL DEFAULT 0 COMMENT '목록갯수',
  `FILE_YN` varchar(10) CHARACTER SET utf8mb4 DEFAULT 'N' COMMENT '첨부파일 사용여부',
  `FILE_COUNT` int(11) DEFAULT NULL COMMENT '첨부파일 사용갯수',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `DEL_YN` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT '삭제여부',
  `comment_yn` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`BBS_MANAGE_ID`) USING BTREE,
  UNIQUE KEY `BBS_ID` (`BBS_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='게시판 관리 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_file_dtl 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_file_dtl` (
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `FILE_SN` decimal(10,0) NOT NULL COMMENT '파일순번',
  `FILE_STRE_COURS` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일저장경로',
  `STRE_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '저장파일명',
  `ORIGNL_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원파일명',
  `FILE_EXTSN` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일확장자',
  `FILE_CN` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일내용',
  `FILE_SIZE` decimal(8,0) DEFAULT NULL COMMENT '파일크기',
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`),
  CONSTRAINT `SILLA_FILE_DTL_FK1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `silla_file_mast` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일상세정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_file_mast 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_file_mast` (
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `CREAT_DT` datetime NOT NULL COMMENT '생성일시',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  PRIMARY KEY (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일속성';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_holiday 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_holiday` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `STD_YEAR` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기준년도',
  `START_DT` datetime DEFAULT NULL COMMENT '시작일',
  `END_DT` datetime DEFAULT NULL COMMENT '종료일',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일제목',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='휴일';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_homepage_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_homepage_info` (
  `SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `SITEMAP_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트맵 사용여부',
  `LOGIN_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 사용여부',
  `JOIN_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원가입 사용여부',
  `SLIDE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인 슬라이드 사용여부',
  `CARD_BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카드형 게시판 아이디',
  `CARD_BBS_CNT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카드형 게시판 노출건수',
  `CARD_BBS_POS` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카드형 게시판 위치',
  `PHOTO_BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진형 게시판 아이디',
  `PHOTO_BBS_CNT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진형 게시판 노출건수',
  `PHOTO_BBS_POS` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진형 게시판 위치',
  `LIST_BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록형 게시판 아이디',
  `LIST_BBS_CNT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록형 게시판 노출건수',
  `LIST_BBS_POS` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록형 게시판 위치',
  `PRIVACY_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보 처리방침 사용여부',
  `EMAIL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일주소무단수집거부 사용여부',
  `SITELINK_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관련사이트링크 사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자 아이디',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='홈페이지 설정';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_login_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_login_log` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `LOGIN_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 아이디',
  `LOGIN_IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 아이피',
  `LOGIN_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 관리자 명',
  `LOGIN_TYPE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 타입',
  `LOGIN_TIME` datetime DEFAULT NULL COMMENT '로그인 시간',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=1740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='로그인 로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_main_slide 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_main_slide` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `LINK_YN` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크사용여부',
  `LINK_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `IMG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `ORIGIN_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_TEXT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대체텍스트',
  `SORT_ORDER` int(11) DEFAULT NULL COMMENT '정렬순서',
  `USE_YN` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메인슬라이드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_offense_words 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_offense_words` (
  `SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `OFFENSE_WORD` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '위반단어',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='금지단어';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_peakday 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_peakday` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `STD_YEAR` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기준년도',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DT` datetime DEFAULT NULL COMMENT '시작일',
  `END_DT` datetime DEFAULT NULL COMMENT '종료일',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='성수기';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_poll_answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_answer` (
  `ANSWER_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '답변 인덱스',
  `POLL_SEQ` int(11) NOT NULL COMMENT '설문조사 인덱스',
  `QUESTION_SEQ` int(11) NOT NULL COMMENT '질문 인덱스',
  `ANSWER` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '답변',
  `SORT_ORDER` int(11) NOT NULL COMMENT '정렬순서',
  `IS_ETC` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기타여부',
  PRIMARY KEY (`ANSWER_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사 답변';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_poll_mast 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_mast` (
  `POLL_SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `DESC` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설명',
  `START_DT` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시 시작일',
  `END_DT` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시 종료일',
  `POLL_START_DT` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '응답 시작일',
  `POLL_END_DT` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '응답 종료일',
  `IS_USER_INFO` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '개인정보 수집여부',
  `USE_YN` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`POLL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사 마스터';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_poll_question 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_question` (
  `QUESTION_SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `POLL_SEQ` int(11) NOT NULL COMMENT '설문조사 시퀀스',
  `QUESTION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '질문',
  `QUESTION_DESC` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '질문 부가설명',
  `QUESTION_TYPE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '문항 유형',
  `QUESTION_SELECT_TYPE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세선택',
  `QUESTION_SELECT_CNT` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '멀티선택 개수',
  `IS_REQUIRE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '필수응답여부',
  `SCALE_CNT` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '척도 개수',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 경로',
  `SORT_ORDER` int(11) NOT NULL COMMENT '정렬순서',
  PRIMARY KEY (`QUESTION_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사 질문';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_poll_result 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_result` (
  `SEQ` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `POLL_SEQ` int(11) NOT NULL COMMENT '설문조사 시퀀스',
  `QUESTION_SEQ` int(11) NOT NULL COMMENT '질문 시퀀스',
  `ANSWER_SEQ` int(11) DEFAULT NULL COMMENT '답변 시퀀스',
  `ANSWER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변',
  `QUESTION_TYPE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '질문 타입',
  `IS_ETC` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기타 여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 ID',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일자',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사결과';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_poll_user_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_user_info` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `POLL_SEQ` int(11) NOT NULL COMMENT '설문조사 시퀀스',
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이름',
  `TEL` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '연락처',
  `EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이메일',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `VDL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '반영여부',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사 개인정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_popup 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_popup` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DT` datetime DEFAULT NULL COMMENT '시작일',
  `END_DT` datetime DEFAULT NULL COMMENT '종료일',
  `WIDTH` int(11) DEFAULT NULL COMMENT '가로사이즈',
  `HEIGHT` int(11) DEFAULT NULL COMMENT '세로사이즈',
  `HORIZONTAL` int(11) DEFAULT NULL COMMENT '가로위치',
  `VERTICAL` int(11) DEFAULT NULL COMMENT '세로위치',
  `LAYER_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레이어팝업유무',
  `IMG_TEXT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대체텍스트',
  `LINK_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `LINK_TARGET` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크타겟',
  `COOKIE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '쿠키설정',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `SYNC_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일연동여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='팝업';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_relate_site 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_relate_site` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `LINK_URL` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `SYNC_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일연동여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관련사이트';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_site_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_site_info` (
  `IDX` int(11) NOT NULL COMMENT '시퀀스',
  `SITE_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 이름',
  `SITE_DESC` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 소개',
  `SITE_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 주소',
  `SITE_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표 이메일',
  `SITE_TEL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표 전화',
  `SITE_ADDR` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `COMP_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회사명',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 경로',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본파일명',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사이트 정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_sndng_mail 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_sndng_mail` (
  `MESSAGE_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메일ID',
  `DSPTCH_PERSON` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '발송자',
  `RECPTN_PERSON` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수신자',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `SNDNG_RESULT_CODE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '발송여부',
  `EMAIL_CN` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용',
  `ATCH_FILE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일ID',
  `SNDNG_DE` datetime DEFAULT NULL COMMENT '발송일자',
  `LINK` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '링크여부',
  `USE_YN` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT '사용여부',
  PRIMARY KEY (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_terms 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_terms` (
  `IDX` int(11) NOT NULL COMMENT '시퀀스',
  `TERM` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이용약관',
  `PRIVACY` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보처리방침',
  `PRIVACY_TITLE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보 이용 목적',
  `PRIVACY_PERIOD` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '보유 및 이용기간',
  `PRIVACY_COMPANY` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '위탁받는자(수탁자)',
  `PRIVACY_CONTENT` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '위탁받는 업무내용',
  `PRIVACY_INFO` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서비스 이용 안내문',
  `PRIVACY_MANAGER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보 보호 책임자',
  `PRIVACY_HELP_CONT` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권익침해 구제방법',
  `APPLY_DT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '적용일',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원약관';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_terms_collection 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_terms_collection` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TERMS_IDX` int(11) DEFAULT NULL COMMENT '약관 시퀀스',
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공통코드',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='약관 수집개인정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_testdtls 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_testdtls` (
  `UQ_DTLS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UQ_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고유 ID',
  `CD_VAL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관심분야 값',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 ID',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`UQ_DTLS_ID`),
  UNIQUE KEY `UQ_DTLS_ID` (`UQ_DTLS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신입교육 상세 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_testmst 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_testmst` (
  `UQ_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `START_DT` date NOT NULL COMMENT '게시기간 시작일자',
  `END_DT` date NOT NULL COMMENT '게시기간 종료일자',
  `NUMB` int(11) DEFAULT NULL COMMENT '숫자 값',
  `NM` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이름',
  `PRT_PSN` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USE_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `AGE_VAL` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연령대',
  `CONTENT` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 ID',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일자',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자 ID',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일자',
  PRIMARY KEY (`UQ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신입교육 마스터 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_testsgw 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_testsgw` (
  `UQ_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판ID',
  `BBS_NM` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL,
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `READ_CNT` int(10) DEFAULT 0,
  `ATCH_FILE_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOTICE_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `REPLY` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`UQ_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_testsgw_manage 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_testsgw_manage` (
  `BBS_MANAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '게시판마스터ID',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판ID',
  `BBS_NM` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판이름',
  `BBS_TYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판종류',
  `USE_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `LIST_COUNT` int(10) NOT NULL DEFAULT 0 COMMENT '목록 개수',
  `FILE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '파일여부',
  `FILE_COUNT` int(11) DEFAULT NULL COMMENT '파일 개수',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일시',
  `DEL_YN` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `REPLY_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '답변 사용여부',
  PRIMARY KEY (`BBS_MANAGE_ID`),
  UNIQUE KEY `BBS_ID` (`BBS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.silla_user_access_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_user_access_log` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `ACCESS_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속자 아이디',
  `ACCESS_IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속자 아이피',
  `ACCESS_MENU` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속 메뉴',
  `ACCESS_URL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속 주소',
  `ACCESS_PARAM` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACCESS_DATE` datetime DEFAULT NULL COMMENT '접속 일자',
  `ACCESS_WORK` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작업구분',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='개인정보 접속기록';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.tbl_batschdul 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_batschdul` (
  `BATCH_SCHDUL_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BATCH_OPERT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXECUT_CYCLE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXECUT_SCHDUL_DE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXECUT_SCHDUL_HOUR` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXECUT_SCHDUL_MNT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXECUT_SCHDUL_SECND` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_UPDT_PNTTM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FRST_REGIST_PNTTM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.tb_batopert 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_batopert` (
  `BATCH_OPERT_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BATCH_OPERT_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BATCH_PROGRM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARAMTR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USE_AT` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_UPDT_PNTTM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FRST_REGIST_PNTTM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.test_bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `test_bbs` (
  `BBS_ARTICLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유PK',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `CATEGORY` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' 카테고리선택',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  `NOTICE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '공지여부',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자아이피',
  `REPLY` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판 답변',
  `READ_CNT` int(11) NOT NULL DEFAULT 0 COMMENT '조회수',
  `ATCH_FILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일아이디',
  `STATUS` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상태',
  `SELECTED_DAYS` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '선택된 요일',
  `SHOW_TYPE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'ALL' COMMENT '게시 대상',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정자',
  `UPD_DT` datetime NOT NULL COMMENT '수정일',
  `PWD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `REG_NAME` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자명',
  PRIMARY KEY (`BBS_ARTICLE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.test_bbs_mast 구조 내보내기
CREATE TABLE IF NOT EXISTS `test_bbs_mast` (
  `BBS_MANAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '게시판 고유 아이디',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_NAME` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판이름',
  `BBS_TYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판타입',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `LIST_COUNT` int(10) NOT NULL DEFAULT 0 COMMENT '목록갯수',
  `FILE_YN` varchar(10) CHARACTER SET utf8mb4 DEFAULT 'N' COMMENT '첨부파일 사용여부',
  `FILE_COUNT` int(11) DEFAULT NULL COMMENT '첨부파일 사용갯수',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `DEL_YN` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT '삭제여부',
  PRIMARY KEY (`BBS_MANAGE_ID`),
  UNIQUE KEY `BBS_ID` (`BBS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='게시판 관리 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.test_lsy_bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `test_lsy_bbs` (
  `BBS_ARTICLE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유PK',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  `NOTICE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '공지여부',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자아이피',
  `READ_CNT` int(11) NOT NULL DEFAULT 0 COMMENT '조회수',
  `ATCH_FILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일아이디',
  `STATUS` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상태',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `PWD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `REG_NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자명',
  `NOTI_TYPE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공지사항 종류',
  `NOTI_STYLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시글 스타일',
  `POST_DATE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시글 게시 기간',
  `REPLY` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변',
  PRIMARY KEY (`BBS_ARTICLE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.test_lsy_bbs_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `test_lsy_bbs_comment` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글인덱스',
  `BBS_ARTICLE_ID` int(11) NOT NULL COMMENT '시퀀스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_COMMENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '댓글',
  `PASS` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `REG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자이름',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `PARENT_ID` int(11) DEFAULT 0 COMMENT '댓글의 부모 인덱스',
  `LEVEL` int(11) DEFAULT 0 COMMENT '댓글의 깊이',
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 댓글';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.test_lsy_bbs_manage 구조 내보내기
CREATE TABLE IF NOT EXISTS `test_lsy_bbs_manage` (
  `BBS_MANAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '게시판 고유 아이디',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_NAME` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판이름',
  `BBS_TYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판타입',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `LIST_COUNT` int(10) NOT NULL DEFAULT 0 COMMENT '목록갯수',
  `FILE_YN` varchar(10) CHARACTER SET utf8mb4 DEFAULT 'N' COMMENT '첨부파일 사용여부',
  `FILE_COUNT` int(11) DEFAULT NULL COMMENT '첨부파일 사용갯수',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `DEL_YN` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT '삭제여부',
  PRIMARY KEY (`BBS_MANAGE_ID`),
  UNIQUE KEY `BBS_ID` (`BBS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='게시판 관리 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 cmsdb.test_member_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `test_member_info` (
  `MEMBER_INFO_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '고유아이디',
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이름',
  `GENDER` enum('남','여') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '성별',
  `BIRTH` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '생년월일',
  `PHONE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연락처',
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이메일',
  `ZIP` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '우편번호',
  `ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `DETAIL_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세주소',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `REG_ID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '등록한 id',
  `DEL_YN` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '삭제여부',
  PRIMARY KEY (`MEMBER_INFO_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='회원 개인정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 뷰 cmsdb.comvmenulist 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `comvmenulist`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `comvmenulist` AS with recursive menu as (select `c`.`MENU_NO` AS `MENU_NO`,`c`.`MENU_ORDR` AS `MENU_ORDR`,`c`.`MENU_NM` AS `MENU_NM`,`c`.`UPPER_MENU_NO` AS `UPPER_MENU_NO`,`c`.`MENU_DC` AS `MENU_DC`,`c`.`RELATE_IMAGE_PATH` AS `RELATE_IMAGE_PATH`,`c`.`RELATE_IMAGE_NM` AS `RELATE_IMAGE_NM`,`c`.`PROGRM_FILE_NM` AS `PROGRM_FILE_NM`,`c`.`MENU_NO` AS `TOP_MENU`,`c`.`USER_TYPE` AS `USER_TYPE`,1 AS `level` from `cmsdb`.`comtnmenuinfo` `c` where `c`.`UPPER_MENU_NO` = '0' and `c`.`MENU_NO` > 0 and `c`.`MENU_VIEW_YN` = 'Y' union all select `p`.`MENU_NO` AS `MENU_NO`,`p`.`MENU_ORDR` AS `MENU_ORDR`,`p`.`MENU_NM` AS `MENU_NM`,`p`.`UPPER_MENU_NO` AS `UPPER_MENU_NO`,`p`.`MENU_DC` AS `MENU_DC`,`p`.`RELATE_IMAGE_PATH` AS `RELATE_IMAGE_PATH`,`p`.`RELATE_IMAGE_NM` AS `RELATE_IMAGE_NM`,`p`.`PROGRM_FILE_NM` AS `PROGRM_FILE_NM`,`o`.`TOP_MENU` AS `TOP_MENU`,`p`.`USER_TYPE` AS `USER_TYPE`,1 + `o`.`level` AS `level` from (`cmsdb`.`comtnmenuinfo` `p` join `menu` `o` on(`p`.`UPPER_MENU_NO` = `o`.`MENU_NO`)) where `p`.`MENU_VIEW_YN` = 'Y')select `menu`.`MENU_NO` AS `MENU_NO`,`menu`.`MENU_ORDR` AS `MENU_ORDR`,`menu`.`MENU_NM` AS `MENU_NM`,`menu`.`UPPER_MENU_NO` AS `UPPER_MENU_NO`,`menu`.`MENU_DC` AS `MENU_DC`,`menu`.`RELATE_IMAGE_PATH` AS `RELATE_IMAGE_PATH`,`menu`.`RELATE_IMAGE_NM` AS `RELATE_IMAGE_NM`,`menu`.`PROGRM_FILE_NM` AS `PROGRM_FILE_NM`,`menu`.`level` AS `level`,`menu`.`TOP_MENU` AS `TOP_MENU`,`menu`.`USER_TYPE` AS `USER_TYPE` from `menu`;

-- 뷰 cmsdb.comvnusermaster 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `comvnusermaster`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `comvnusermaster` AS select `comtngnrlmber`.`ESNTL_ID` AS `ESNTL_ID`,`comtngnrlmber`.`MBER_ID` AS `USER_ID`,`comtngnrlmber`.`PASSWORD` AS `PASSWORD`,`comtngnrlmber`.`MBER_NM` AS `USER_NM`,`comtngnrlmber`.`ZIP` AS `USER_ZIP`,`comtngnrlmber`.`ADRES` AS `USER_ADRES`,`comtngnrlmber`.`MBER_EMAIL_ADRES` AS `USER_EMAIL`,' ' AS `GROUP_ID`,'GNR' AS `USER_SE`,' ' AS `ORGNZT_ID` from `comtngnrlmber` union all select `comtnemplyrinfo`.`ESNTL_ID` AS `ESNTL_ID`,`comtnemplyrinfo`.`EMPLYR_ID` AS `EMPLYR_ID`,`comtnemplyrinfo`.`PASSWORD` AS `PASSWORD`,`comtnemplyrinfo`.`USER_NM` AS `USER_NM`,`comtnemplyrinfo`.`ZIP` AS `ZIP`,`comtnemplyrinfo`.`HOUSE_ADRES` AS `HOUSE_ADRES`,`comtnemplyrinfo`.`EMAIL_ADRES` AS `EMAIL_ADRES`,`comtnemplyrinfo`.`GROUP_ID` AS `GROUP_ID`,'USR' AS `USER_SE`,`comtnemplyrinfo`.`ORGNZT_ID` AS `ORGNZT_ID` from `comtnemplyrinfo` order by `ESNTL_ID`;


-- information_schema 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `information_schema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `information_schema`;

-- 테이블 information_schema.ALL_PLUGINS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `ALL_PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_STATUS` varchar(16) NOT NULL DEFAULT '',
  `PLUGIN_TYPE` varchar(80) NOT NULL DEFAULT '',
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_LIBRARY` varchar(64) DEFAULT NULL,
  `PLUGIN_LIBRARY_VERSION` varchar(20) DEFAULT NULL,
  `PLUGIN_AUTHOR` varchar(64) DEFAULT NULL,
  `PLUGIN_DESCRIPTION` longtext DEFAULT NULL,
  `PLUGIN_LICENSE` varchar(80) NOT NULL DEFAULT '',
  `LOAD_OPTION` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_MATURITY` varchar(12) NOT NULL DEFAULT '',
  `PLUGIN_AUTH_VERSION` varchar(80) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.APPLICABLE_ROLES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `APPLICABLE_ROLES` (
  `GRANTEE` varchar(190) NOT NULL DEFAULT '',
  `ROLE_NAME` varchar(128) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT '',
  `IS_DEFAULT` varchar(3) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.CHARACTER_SETS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATE_NAME` varchar(32) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(60) NOT NULL DEFAULT '',
  `MAXLEN` bigint(3) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.CHECK_CONSTRAINTS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `CHECK_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `LEVEL` varchar(6) NOT NULL DEFAULT '',
  `CHECK_CLAUSE` longtext NOT NULL DEFAULT ''
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.CLIENT_STATISTICS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `CLIENT_STATISTICS` (
  `CLIENT` varchar(64) NOT NULL DEFAULT '',
  `TOTAL_CONNECTIONS` bigint(21) NOT NULL DEFAULT 0,
  `CONCURRENT_CONNECTIONS` bigint(21) NOT NULL DEFAULT 0,
  `CONNECTED_TIME` bigint(21) NOT NULL DEFAULT 0,
  `BUSY_TIME` double NOT NULL DEFAULT 0,
  `CPU_TIME` double NOT NULL DEFAULT 0,
  `BYTES_RECEIVED` bigint(21) NOT NULL DEFAULT 0,
  `BYTES_SENT` bigint(21) NOT NULL DEFAULT 0,
  `BINLOG_BYTES_WRITTEN` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_READ` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_SENT` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_DELETED` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_INSERTED` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_UPDATED` bigint(21) NOT NULL DEFAULT 0,
  `SELECT_COMMANDS` bigint(21) NOT NULL DEFAULT 0,
  `UPDATE_COMMANDS` bigint(21) NOT NULL DEFAULT 0,
  `OTHER_COMMANDS` bigint(21) NOT NULL DEFAULT 0,
  `COMMIT_TRANSACTIONS` bigint(21) NOT NULL DEFAULT 0,
  `ROLLBACK_TRANSACTIONS` bigint(21) NOT NULL DEFAULT 0,
  `DENIED_CONNECTIONS` bigint(21) NOT NULL DEFAULT 0,
  `LOST_CONNECTIONS` bigint(21) NOT NULL DEFAULT 0,
  `ACCESS_DENIED` bigint(21) NOT NULL DEFAULT 0,
  `EMPTY_QUERIES` bigint(21) NOT NULL DEFAULT 0,
  `TOTAL_SSL_CONNECTIONS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `MAX_STATEMENT_TIME_EXCEEDED` bigint(21) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.COLLATIONS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `COLLATIONS` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `ID` bigint(11) NOT NULL DEFAULT 0,
  `IS_DEFAULT` varchar(3) NOT NULL DEFAULT '',
  `IS_COMPILED` varchar(3) NOT NULL DEFAULT '',
  `SORTLEN` bigint(3) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.COLLATION_CHARACTER_SET_APPLICABILITY 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.COLUMNS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `COLUMNS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL DEFAULT 0,
  `COLUMN_DEFAULT` longtext DEFAULT NULL,
  `IS_NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL,
  `DATETIME_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(32) DEFAULT NULL,
  `COLLATION_NAME` varchar(32) DEFAULT NULL,
  `COLUMN_TYPE` longtext NOT NULL DEFAULT '',
  `COLUMN_KEY` varchar(3) NOT NULL DEFAULT '',
  `EXTRA` varchar(30) NOT NULL DEFAULT '',
  `PRIVILEGES` varchar(80) NOT NULL DEFAULT '',
  `COLUMN_COMMENT` varchar(1024) NOT NULL DEFAULT '',
  `IS_GENERATED` varchar(6) NOT NULL DEFAULT '',
  `GENERATION_EXPRESSION` longtext DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.COLUMN_PRIVILEGES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(190) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.ENABLED_ROLES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `ENABLED_ROLES` (
  `ROLE_NAME` varchar(128) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.ENGINES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `ENGINES` (
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `SUPPORT` varchar(8) NOT NULL DEFAULT '',
  `COMMENT` varchar(160) NOT NULL DEFAULT '',
  `TRANSACTIONS` varchar(3) DEFAULT NULL,
  `XA` varchar(3) DEFAULT NULL,
  `SAVEPOINTS` varchar(3) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.EVENTS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `EVENTS` (
  `EVENT_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `EVENT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(189) NOT NULL DEFAULT '',
  `TIME_ZONE` varchar(64) NOT NULL DEFAULT '',
  `EVENT_BODY` varchar(8) NOT NULL DEFAULT '',
  `EVENT_DEFINITION` longtext NOT NULL DEFAULT '',
  `EVENT_TYPE` varchar(9) NOT NULL DEFAULT '',
  `EXECUTE_AT` datetime DEFAULT NULL,
  `INTERVAL_VALUE` varchar(256) DEFAULT NULL,
  `INTERVAL_FIELD` varchar(18) DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `STARTS` datetime DEFAULT NULL,
  `ENDS` datetime DEFAULT NULL,
  `STATUS` varchar(18) NOT NULL DEFAULT '',
  `ON_COMPLETION` varchar(12) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `EVENT_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `ORIGINATOR` bigint(10) NOT NULL DEFAULT 0,
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.FILES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `FILES` (
  `FILE_ID` bigint(4) NOT NULL DEFAULT 0,
  `FILE_NAME` varchar(512) DEFAULT NULL,
  `FILE_TYPE` varchar(20) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL,
  `TABLE_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NUMBER` bigint(4) DEFAULT NULL,
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `FULLTEXT_KEYS` varchar(64) DEFAULT NULL,
  `DELETED_ROWS` bigint(4) DEFAULT NULL,
  `UPDATE_COUNT` bigint(4) DEFAULT NULL,
  `FREE_EXTENTS` bigint(4) DEFAULT NULL,
  `TOTAL_EXTENTS` bigint(4) DEFAULT NULL,
  `EXTENT_SIZE` bigint(4) NOT NULL DEFAULT 0,
  `INITIAL_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `CREATION_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `LAST_ACCESS_TIME` datetime DEFAULT NULL,
  `RECOVER_TIME` bigint(4) DEFAULT NULL,
  `TRANSACTION_COUNTER` bigint(4) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `EXTRA` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.GEOMETRY_COLUMNS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `GEOMETRY_COLUMNS` (
  `F_TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `F_TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `F_TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `F_GEOMETRY_COLUMN` varchar(64) NOT NULL DEFAULT '',
  `G_TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `G_TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `G_TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `G_GEOMETRY_COLUMN` varchar(64) NOT NULL DEFAULT '',
  `STORAGE_TYPE` tinyint(2) NOT NULL DEFAULT 0,
  `GEOMETRY_TYPE` int(7) NOT NULL DEFAULT 0,
  `COORD_DIMENSION` tinyint(2) NOT NULL DEFAULT 0,
  `MAX_PPR` tinyint(2) NOT NULL DEFAULT 0,
  `SRID` smallint(5) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.GLOBAL_STATUS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `GLOBAL_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.GLOBAL_VARIABLES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `GLOBAL_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INDEX_STATISTICS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INDEX_STATISTICS` (
  `TABLE_SCHEMA` varchar(192) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(192) NOT NULL DEFAULT '',
  `INDEX_NAME` varchar(192) NOT NULL DEFAULT '',
  `ROWS_READ` bigint(21) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_BUFFER_PAGE 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_BUFFER_PAGE` (
  `POOL_ID` int(11) unsigned NOT NULL DEFAULT 0,
  `BLOCK_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `SPACE` int(11) unsigned NOT NULL DEFAULT 0,
  `PAGE_NUMBER` int(11) unsigned NOT NULL DEFAULT 0,
  `PAGE_TYPE` varchar(64) DEFAULT NULL,
  `FLUSH_TYPE` int(11) unsigned NOT NULL DEFAULT 0,
  `FIX_COUNT` int(11) unsigned NOT NULL DEFAULT 0,
  `IS_HASHED` int(1) NOT NULL DEFAULT 0,
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT 0,
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT 0,
  `ACCESS_TIME` bigint(21) unsigned NOT NULL DEFAULT 0,
  `TABLE_NAME` varchar(1024) DEFAULT NULL,
  `INDEX_NAME` varchar(64) DEFAULT NULL,
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DATA_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `PAGE_STATE` enum('NOT_USED','MEMORY','REMOVE_HASH','FILE_PAGE') NOT NULL,
  `IO_FIX` enum('IO_NONE','IO_READ','IO_WRITE','IO_PIN') NOT NULL,
  `IS_OLD` int(1) NOT NULL DEFAULT 0,
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_BUFFER_PAGE_LRU 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_BUFFER_PAGE_LRU` (
  `POOL_ID` int(11) unsigned NOT NULL DEFAULT 0,
  `LRU_POSITION` bigint(21) unsigned NOT NULL DEFAULT 0,
  `SPACE` int(11) unsigned NOT NULL DEFAULT 0,
  `PAGE_NUMBER` int(11) unsigned NOT NULL DEFAULT 0,
  `PAGE_TYPE` varchar(64) DEFAULT NULL,
  `FLUSH_TYPE` int(11) unsigned NOT NULL DEFAULT 0,
  `FIX_COUNT` int(11) unsigned NOT NULL DEFAULT 0,
  `IS_HASHED` int(1) NOT NULL DEFAULT 0,
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT 0,
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT 0,
  `ACCESS_TIME` bigint(21) unsigned NOT NULL DEFAULT 0,
  `TABLE_NAME` varchar(1024) DEFAULT NULL,
  `INDEX_NAME` varchar(64) DEFAULT NULL,
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DATA_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `COMPRESSED` int(1) NOT NULL DEFAULT 0,
  `IO_FIX` enum('IO_NONE','IO_READ','IO_WRITE','IO_PIN') NOT NULL,
  `IS_OLD` int(1) DEFAULT NULL,
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_BUFFER_POOL_STATS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_BUFFER_POOL_STATS` (
  `POOL_ID` int(11) unsigned NOT NULL DEFAULT 0,
  `POOL_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `FREE_BUFFERS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT 0,
  `OLD_DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT 0,
  `MODIFIED_DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT 0,
  `PENDING_DECOMPRESS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `PENDING_READS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `PENDING_FLUSH_LRU` bigint(21) unsigned NOT NULL DEFAULT 0,
  `PENDING_FLUSH_LIST` bigint(21) unsigned NOT NULL DEFAULT 0,
  `PAGES_MADE_YOUNG` bigint(21) unsigned NOT NULL DEFAULT 0,
  `PAGES_NOT_MADE_YOUNG` bigint(21) unsigned NOT NULL DEFAULT 0,
  `PAGES_MADE_YOUNG_RATE` float NOT NULL DEFAULT 0,
  `PAGES_MADE_NOT_YOUNG_RATE` float NOT NULL DEFAULT 0,
  `NUMBER_PAGES_READ` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NUMBER_PAGES_CREATED` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NUMBER_PAGES_WRITTEN` bigint(21) unsigned NOT NULL DEFAULT 0,
  `PAGES_READ_RATE` float NOT NULL DEFAULT 0,
  `PAGES_CREATE_RATE` float NOT NULL DEFAULT 0,
  `PAGES_WRITTEN_RATE` float NOT NULL DEFAULT 0,
  `NUMBER_PAGES_GET` bigint(21) unsigned NOT NULL DEFAULT 0,
  `HIT_RATE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NOT_YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NUMBER_PAGES_READ_AHEAD` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NUMBER_READ_AHEAD_EVICTED` bigint(21) unsigned NOT NULL DEFAULT 0,
  `READ_AHEAD_RATE` float NOT NULL DEFAULT 0,
  `READ_AHEAD_EVICTED_RATE` float NOT NULL DEFAULT 0,
  `LRU_IO_TOTAL` bigint(21) unsigned NOT NULL DEFAULT 0,
  `LRU_IO_CURRENT` bigint(21) unsigned NOT NULL DEFAULT 0,
  `UNCOMPRESS_TOTAL` bigint(21) unsigned NOT NULL DEFAULT 0,
  `UNCOMPRESS_CURRENT` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_CMP 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMP` (
  `page_size` int(5) NOT NULL DEFAULT 0,
  `compress_ops` int(11) NOT NULL DEFAULT 0,
  `compress_ops_ok` int(11) NOT NULL DEFAULT 0,
  `compress_time` int(11) NOT NULL DEFAULT 0,
  `uncompress_ops` int(11) NOT NULL DEFAULT 0,
  `uncompress_time` int(11) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_CMPMEM 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMPMEM` (
  `page_size` int(5) NOT NULL DEFAULT 0,
  `buffer_pool_instance` int(11) NOT NULL DEFAULT 0,
  `pages_used` int(11) NOT NULL DEFAULT 0,
  `pages_free` int(11) NOT NULL DEFAULT 0,
  `relocation_ops` bigint(21) NOT NULL DEFAULT 0,
  `relocation_time` int(11) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_CMPMEM_RESET 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMPMEM_RESET` (
  `page_size` int(5) NOT NULL DEFAULT 0,
  `buffer_pool_instance` int(11) NOT NULL DEFAULT 0,
  `pages_used` int(11) NOT NULL DEFAULT 0,
  `pages_free` int(11) NOT NULL DEFAULT 0,
  `relocation_ops` bigint(21) NOT NULL DEFAULT 0,
  `relocation_time` int(11) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_CMP_PER_INDEX 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMP_PER_INDEX` (
  `database_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `index_name` varchar(64) NOT NULL DEFAULT '',
  `compress_ops` int(11) NOT NULL DEFAULT 0,
  `compress_ops_ok` int(11) NOT NULL DEFAULT 0,
  `compress_time` int(11) NOT NULL DEFAULT 0,
  `uncompress_ops` int(11) NOT NULL DEFAULT 0,
  `uncompress_time` int(11) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_CMP_PER_INDEX_RESET 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMP_PER_INDEX_RESET` (
  `database_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `index_name` varchar(64) NOT NULL DEFAULT '',
  `compress_ops` int(11) NOT NULL DEFAULT 0,
  `compress_ops_ok` int(11) NOT NULL DEFAULT 0,
  `compress_time` int(11) NOT NULL DEFAULT 0,
  `uncompress_ops` int(11) NOT NULL DEFAULT 0,
  `uncompress_time` int(11) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_CMP_RESET 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_CMP_RESET` (
  `page_size` int(5) NOT NULL DEFAULT 0,
  `compress_ops` int(11) NOT NULL DEFAULT 0,
  `compress_ops_ok` int(11) NOT NULL DEFAULT 0,
  `compress_time` int(11) NOT NULL DEFAULT 0,
  `uncompress_ops` int(11) NOT NULL DEFAULT 0,
  `uncompress_time` int(11) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_FT_BEING_DELETED 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_BEING_DELETED` (
  `DOC_ID` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_FT_CONFIG 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_CONFIG` (
  `KEY` varchar(193) NOT NULL DEFAULT '',
  `VALUE` varchar(193) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_FT_DEFAULT_STOPWORD 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_DEFAULT_STOPWORD` (
  `value` varchar(18) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_FT_DELETED 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_DELETED` (
  `DOC_ID` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_FT_INDEX_CACHE 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_INDEX_CACHE` (
  `WORD` varchar(337) NOT NULL DEFAULT '',
  `FIRST_DOC_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `LAST_DOC_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DOC_COUNT` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DOC_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `POSITION` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_FT_INDEX_TABLE 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_FT_INDEX_TABLE` (
  `WORD` varchar(337) NOT NULL DEFAULT '',
  `FIRST_DOC_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `LAST_DOC_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DOC_COUNT` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DOC_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `POSITION` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_LOCKS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_LOCKS` (
  `lock_id` varchar(81) NOT NULL DEFAULT '',
  `lock_trx_id` bigint(21) unsigned NOT NULL DEFAULT 0,
  `lock_mode` enum('S','S,GAP','X','X,GAP','IS','IS,GAP','IX','IX,GAP','AUTO_INC') NOT NULL,
  `lock_type` enum('RECORD','TABLE') NOT NULL,
  `lock_table` varchar(1024) NOT NULL DEFAULT '',
  `lock_index` varchar(1024) DEFAULT NULL,
  `lock_space` int(11) unsigned DEFAULT NULL,
  `lock_page` int(11) unsigned DEFAULT NULL,
  `lock_rec` int(11) unsigned DEFAULT NULL,
  `lock_data` varchar(8192) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_LOCK_WAITS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_LOCK_WAITS` (
  `requesting_trx_id` bigint(21) unsigned NOT NULL DEFAULT 0,
  `requested_lock_id` varchar(81) NOT NULL DEFAULT '',
  `blocking_trx_id` bigint(21) unsigned NOT NULL DEFAULT 0,
  `blocking_lock_id` varchar(81) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_METRICS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_METRICS` (
  `NAME` varchar(193) NOT NULL DEFAULT '',
  `SUBSYSTEM` varchar(193) NOT NULL DEFAULT '',
  `COUNT` bigint(21) NOT NULL DEFAULT 0,
  `MAX_COUNT` bigint(21) DEFAULT NULL,
  `MIN_COUNT` bigint(21) DEFAULT NULL,
  `AVG_COUNT` float DEFAULT NULL,
  `COUNT_RESET` bigint(21) NOT NULL DEFAULT 0,
  `MAX_COUNT_RESET` bigint(21) DEFAULT NULL,
  `MIN_COUNT_RESET` bigint(21) DEFAULT NULL,
  `AVG_COUNT_RESET` float DEFAULT NULL,
  `TIME_ENABLED` datetime DEFAULT NULL,
  `TIME_DISABLED` datetime DEFAULT NULL,
  `TIME_ELAPSED` bigint(21) DEFAULT NULL,
  `TIME_RESET` datetime DEFAULT NULL,
  `ENABLED` int(1) NOT NULL DEFAULT 0,
  `TYPE` enum('value','status_counter','set_owner','set_member','counter') NOT NULL,
  `COMMENT` varchar(193) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_MUTEXES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_MUTEXES` (
  `NAME` varchar(4000) NOT NULL DEFAULT '',
  `CREATE_FILE` varchar(4000) NOT NULL DEFAULT '',
  `CREATE_LINE` int(11) unsigned NOT NULL DEFAULT 0,
  `OS_WAITS` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_COLUMNS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_COLUMNS` (
  `TABLE_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NAME` varchar(64) NOT NULL DEFAULT '',
  `POS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `MTYPE` int(11) NOT NULL DEFAULT 0,
  `PRTYPE` int(11) NOT NULL DEFAULT 0,
  `LEN` int(11) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_DATAFILES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_DATAFILES` (
  `SPACE` int(11) unsigned NOT NULL DEFAULT 0,
  `PATH` varchar(4000) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_FIELDS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_FIELDS` (
  `INDEX_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NAME` varchar(64) NOT NULL DEFAULT '',
  `POS` int(11) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_FOREIGN 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_FOREIGN` (
  `ID` varchar(193) NOT NULL DEFAULT '',
  `FOR_NAME` varchar(193) NOT NULL DEFAULT '',
  `REF_NAME` varchar(193) NOT NULL DEFAULT '',
  `N_COLS` int(11) unsigned NOT NULL DEFAULT 0,
  `TYPE` int(11) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_FOREIGN_COLS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_FOREIGN_COLS` (
  `ID` varchar(193) NOT NULL DEFAULT '',
  `FOR_COL_NAME` varchar(64) NOT NULL DEFAULT '',
  `REF_COL_NAME` varchar(64) NOT NULL DEFAULT '',
  `POS` int(11) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_INDEXES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_INDEXES` (
  `INDEX_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `TYPE` int(11) NOT NULL DEFAULT 0,
  `N_FIELDS` int(11) NOT NULL DEFAULT 0,
  `PAGE_NO` int(11) NOT NULL DEFAULT 0,
  `SPACE` int(11) NOT NULL DEFAULT 0,
  `MERGE_THRESHOLD` int(11) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_SEMAPHORE_WAITS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_SEMAPHORE_WAITS` (
  `THREAD_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `OBJECT_NAME` varchar(4000) DEFAULT NULL,
  `FILE` varchar(4000) DEFAULT NULL,
  `LINE` int(11) unsigned NOT NULL DEFAULT 0,
  `WAIT_TIME` bigint(21) unsigned NOT NULL DEFAULT 0,
  `WAIT_OBJECT` bigint(21) unsigned NOT NULL DEFAULT 0,
  `WAIT_TYPE` varchar(16) DEFAULT NULL,
  `HOLDER_THREAD_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `HOLDER_FILE` varchar(4000) DEFAULT NULL,
  `HOLDER_LINE` int(11) unsigned NOT NULL DEFAULT 0,
  `CREATED_FILE` varchar(4000) DEFAULT NULL,
  `CREATED_LINE` int(11) unsigned NOT NULL DEFAULT 0,
  `WRITER_THREAD` bigint(21) unsigned NOT NULL DEFAULT 0,
  `RESERVATION_MODE` varchar(16) DEFAULT NULL,
  `READERS` int(11) unsigned NOT NULL DEFAULT 0,
  `WAITERS_FLAG` bigint(21) unsigned NOT NULL DEFAULT 0,
  `LOCK_WORD` bigint(21) unsigned NOT NULL DEFAULT 0,
  `LAST_WRITER_FILE` varchar(4000) DEFAULT NULL,
  `LAST_WRITER_LINE` int(11) unsigned NOT NULL DEFAULT 0,
  `OS_WAIT_COUNT` int(11) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_TABLES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_TABLES` (
  `TABLE_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NAME` varchar(655) NOT NULL DEFAULT '',
  `FLAG` int(11) NOT NULL DEFAULT 0,
  `N_COLS` int(11) unsigned NOT NULL DEFAULT 0,
  `SPACE` int(11) unsigned NOT NULL DEFAULT 0,
  `ROW_FORMAT` enum('Redundant','Compact','Compressed','Dynamic') DEFAULT NULL,
  `ZIP_PAGE_SIZE` int(11) unsigned NOT NULL DEFAULT 0,
  `SPACE_TYPE` enum('Single','System') DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_TABLESPACES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_TABLESPACES` (
  `SPACE` int(11) unsigned NOT NULL DEFAULT 0,
  `NAME` varchar(655) NOT NULL DEFAULT '',
  `FLAG` int(11) unsigned NOT NULL DEFAULT 0,
  `ROW_FORMAT` varchar(22) DEFAULT NULL,
  `PAGE_SIZE` int(11) unsigned NOT NULL DEFAULT 0,
  `ZIP_PAGE_SIZE` int(11) unsigned NOT NULL DEFAULT 0,
  `FS_BLOCK_SIZE` int(11) unsigned NOT NULL DEFAULT 0,
  `FILE_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `ALLOCATED_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_TABLESTATS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_TABLESTATS` (
  `TABLE_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `NAME` varchar(64) NOT NULL DEFAULT '',
  `STATS_INITIALIZED` int(1) NOT NULL DEFAULT 0,
  `NUM_ROWS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `CLUST_INDEX_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `OTHER_INDEX_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `MODIFIED_COUNTER` bigint(21) unsigned NOT NULL DEFAULT 0,
  `AUTOINC` bigint(21) unsigned NOT NULL DEFAULT 0,
  `REF_COUNT` int(11) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_SYS_VIRTUAL 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_SYS_VIRTUAL` (
  `TABLE_ID` bigint(21) unsigned NOT NULL DEFAULT 0,
  `POS` int(11) unsigned NOT NULL DEFAULT 0,
  `BASE_POS` int(11) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_TABLESPACES_ENCRYPTION 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_TABLESPACES_ENCRYPTION` (
  `SPACE` int(11) unsigned NOT NULL DEFAULT 0,
  `NAME` varchar(655) DEFAULT NULL,
  `ENCRYPTION_SCHEME` int(11) unsigned NOT NULL DEFAULT 0,
  `KEYSERVER_REQUESTS` int(11) unsigned NOT NULL DEFAULT 0,
  `MIN_KEY_VERSION` int(11) unsigned NOT NULL DEFAULT 0,
  `CURRENT_KEY_VERSION` int(11) unsigned NOT NULL DEFAULT 0,
  `KEY_ROTATION_PAGE_NUMBER` bigint(21) unsigned DEFAULT NULL,
  `KEY_ROTATION_MAX_PAGE_NUMBER` bigint(21) unsigned DEFAULT NULL,
  `CURRENT_KEY_ID` int(11) unsigned NOT NULL DEFAULT 0,
  `ROTATING_OR_FLUSHING` int(1) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.INNODB_TRX 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `INNODB_TRX` (
  `trx_id` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_state` varchar(13) NOT NULL DEFAULT '',
  `trx_started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trx_requested_lock_id` varchar(81) DEFAULT NULL,
  `trx_wait_started` datetime DEFAULT NULL,
  `trx_weight` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_mysql_thread_id` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_query` varchar(1024) DEFAULT NULL,
  `trx_operation_state` varchar(64) DEFAULT NULL,
  `trx_tables_in_use` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_tables_locked` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_lock_structs` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_lock_memory_bytes` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_rows_locked` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_rows_modified` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_concurrency_tickets` bigint(21) unsigned NOT NULL DEFAULT 0,
  `trx_isolation_level` enum('READ UNCOMMITTED','READ COMMITTED','REPEATABLE READ','SERIALIZABLE') NOT NULL,
  `trx_unique_checks` int(1) NOT NULL DEFAULT 0,
  `trx_foreign_key_checks` int(1) NOT NULL DEFAULT 0,
  `trx_last_foreign_key_error` varchar(256) DEFAULT NULL,
  `trx_is_read_only` int(1) NOT NULL DEFAULT 0,
  `trx_autocommit_non_locking` int(1) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.KEYWORDS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `KEYWORDS` (
  `WORD` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.KEY_CACHES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `KEY_CACHES` (
  `KEY_CACHE_NAME` varchar(192) NOT NULL DEFAULT '',
  `SEGMENTS` int(3) unsigned DEFAULT NULL,
  `SEGMENT_NUMBER` int(3) unsigned DEFAULT NULL,
  `FULL_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `BLOCK_SIZE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `USED_BLOCKS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `UNUSED_BLOCKS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DIRTY_BLOCKS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `READ_REQUESTS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `READS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `WRITE_REQUESTS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `WRITES` bigint(21) unsigned NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.KEY_COLUMN_USAGE 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(10) NOT NULL DEFAULT 0,
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) DEFAULT NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `REFERENCED_TABLE_NAME` varchar(64) DEFAULT NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.OPTIMIZER_TRACE 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `OPTIMIZER_TRACE` (
  `QUERY` longtext NOT NULL DEFAULT '',
  `TRACE` longtext NOT NULL DEFAULT '',
  `MISSING_BYTES_BEYOND_MAX_MEM_SIZE` int(20) NOT NULL DEFAULT 0,
  `INSUFFICIENT_PRIVILEGES` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.PARAMETERS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `PARAMETERS` (
  `SPECIFIC_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `SPECIFIC_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` int(21) NOT NULL DEFAULT 0,
  `PARAMETER_MODE` varchar(5) DEFAULT NULL,
  `PARAMETER_NAME` varchar(64) DEFAULT NULL,
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `DATETIME_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext NOT NULL DEFAULT '',
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT ''
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.PARTITIONS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `PARTITIONS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PARTITION_NAME` varchar(64) DEFAULT NULL,
  `SUBPARTITION_NAME` varchar(64) DEFAULT NULL,
  `PARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `SUBPARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_METHOD` varchar(18) DEFAULT NULL,
  `SUBPARTITION_METHOD` varchar(12) DEFAULT NULL,
  `PARTITION_EXPRESSION` longtext DEFAULT NULL,
  `SUBPARTITION_EXPRESSION` longtext DEFAULT NULL,
  `PARTITION_DESCRIPTION` longtext DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `AVG_ROW_LENGTH` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DATA_LENGTH` bigint(21) unsigned NOT NULL DEFAULT 0,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned NOT NULL DEFAULT 0,
  `DATA_FREE` bigint(21) unsigned NOT NULL DEFAULT 0,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_COMMENT` varchar(80) NOT NULL DEFAULT '',
  `NODEGROUP` varchar(12) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.PLUGINS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_STATUS` varchar(16) NOT NULL DEFAULT '',
  `PLUGIN_TYPE` varchar(80) NOT NULL DEFAULT '',
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_LIBRARY` varchar(64) DEFAULT NULL,
  `PLUGIN_LIBRARY_VERSION` varchar(20) DEFAULT NULL,
  `PLUGIN_AUTHOR` varchar(64) DEFAULT NULL,
  `PLUGIN_DESCRIPTION` longtext DEFAULT NULL,
  `PLUGIN_LICENSE` varchar(80) NOT NULL DEFAULT '',
  `LOAD_OPTION` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_MATURITY` varchar(12) NOT NULL DEFAULT '',
  `PLUGIN_AUTH_VERSION` varchar(80) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.PROCESSLIST 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `PROCESSLIST` (
  `ID` bigint(4) NOT NULL DEFAULT 0,
  `USER` varchar(128) NOT NULL DEFAULT '',
  `HOST` varchar(64) NOT NULL DEFAULT '',
  `DB` varchar(64) DEFAULT NULL,
  `COMMAND` varchar(16) NOT NULL DEFAULT '',
  `TIME` int(7) NOT NULL DEFAULT 0,
  `STATE` varchar(64) DEFAULT NULL,
  `INFO` longtext DEFAULT NULL,
  `TIME_MS` decimal(22,3) NOT NULL DEFAULT 0.000,
  `STAGE` tinyint(2) NOT NULL DEFAULT 0,
  `MAX_STAGE` tinyint(2) NOT NULL DEFAULT 0,
  `PROGRESS` decimal(7,3) NOT NULL DEFAULT 0.000,
  `MEMORY_USED` bigint(7) NOT NULL DEFAULT 0,
  `MAX_MEMORY_USED` bigint(7) NOT NULL DEFAULT 0,
  `EXAMINED_ROWS` int(7) NOT NULL DEFAULT 0,
  `QUERY_ID` bigint(4) NOT NULL DEFAULT 0,
  `INFO_BINARY` blob DEFAULT NULL,
  `TID` bigint(4) NOT NULL DEFAULT 0
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.PROFILING 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `PROFILING` (
  `QUERY_ID` int(20) NOT NULL DEFAULT 0,
  `SEQ` int(20) NOT NULL DEFAULT 0,
  `STATE` varchar(30) NOT NULL DEFAULT '',
  `DURATION` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `CPU_USER` decimal(9,6) DEFAULT NULL,
  `CPU_SYSTEM` decimal(9,6) DEFAULT NULL,
  `CONTEXT_VOLUNTARY` int(20) DEFAULT NULL,
  `CONTEXT_INVOLUNTARY` int(20) DEFAULT NULL,
  `BLOCK_OPS_IN` int(20) DEFAULT NULL,
  `BLOCK_OPS_OUT` int(20) DEFAULT NULL,
  `MESSAGES_SENT` int(20) DEFAULT NULL,
  `MESSAGES_RECEIVED` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MAJOR` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MINOR` int(20) DEFAULT NULL,
  `SWAPS` int(20) DEFAULT NULL,
  `SOURCE_FUNCTION` varchar(30) DEFAULT NULL,
  `SOURCE_FILE` varchar(20) DEFAULT NULL,
  `SOURCE_LINE` int(20) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.REFERENTIAL_CONSTRAINTS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `REFERENTIAL_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_NAME` varchar(64) DEFAULT NULL,
  `MATCH_OPTION` varchar(64) NOT NULL DEFAULT '',
  `UPDATE_RULE` varchar(64) NOT NULL DEFAULT '',
  `DELETE_RULE` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `REFERENCED_TABLE_NAME` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.ROUTINES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `ROUTINE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_TYPE` varchar(13) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `DATETIME_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext DEFAULT NULL,
  `ROUTINE_BODY` varchar(8) NOT NULL DEFAULT '',
  `ROUTINE_DEFINITION` longtext DEFAULT NULL,
  `EXTERNAL_NAME` varchar(64) DEFAULT NULL,
  `EXTERNAL_LANGUAGE` varchar(64) DEFAULT NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL DEFAULT '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL DEFAULT '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(64) DEFAULT NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `ROUTINE_COMMENT` longtext NOT NULL DEFAULT '',
  `DEFINER` varchar(189) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.SCHEMATA 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `SCHEMATA` (
  `CATALOG_NAME` varchar(512) NOT NULL DEFAULT '',
  `SCHEMA_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(512) DEFAULT NULL,
  `SCHEMA_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.SCHEMA_PRIVILEGES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(190) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.SESSION_STATUS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `SESSION_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.SESSION_VARIABLES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `SESSION_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.SPATIAL_REF_SYS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `SPATIAL_REF_SYS` (
  `SRID` smallint(5) NOT NULL DEFAULT 0,
  `AUTH_NAME` varchar(512) NOT NULL DEFAULT '',
  `AUTH_SRID` int(5) NOT NULL DEFAULT 0,
  `SRTEXT` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.SQL_FUNCTIONS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `SQL_FUNCTIONS` (
  `FUNCTION` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.STATISTICS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `STATISTICS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `NON_UNIQUE` bigint(1) NOT NULL DEFAULT 0,
  `INDEX_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `INDEX_NAME` varchar(64) NOT NULL DEFAULT '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL DEFAULT 0,
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLLATION` varchar(1) DEFAULT NULL,
  `CARDINALITY` bigint(21) DEFAULT NULL,
  `SUB_PART` bigint(3) DEFAULT NULL,
  `PACKED` varchar(10) DEFAULT NULL,
  `NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `INDEX_TYPE` varchar(16) NOT NULL DEFAULT '',
  `COMMENT` varchar(16) DEFAULT NULL,
  `INDEX_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.SYSTEM_VARIABLES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `SYSTEM_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `SESSION_VALUE` varchar(2048) DEFAULT NULL,
  `GLOBAL_VALUE` varchar(2048) DEFAULT NULL,
  `GLOBAL_VALUE_ORIGIN` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_VALUE` varchar(2048) DEFAULT NULL,
  `VARIABLE_SCOPE` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_COMMENT` varchar(2048) NOT NULL DEFAULT '',
  `NUMERIC_MIN_VALUE` varchar(21) DEFAULT NULL,
  `NUMERIC_MAX_VALUE` varchar(21) DEFAULT NULL,
  `NUMERIC_BLOCK_SIZE` varchar(21) DEFAULT NULL,
  `ENUM_VALUE_LIST` longtext DEFAULT NULL,
  `READ_ONLY` varchar(3) NOT NULL DEFAULT '',
  `COMMAND_LINE_ARGUMENT` varchar(64) DEFAULT NULL,
  `GLOBAL_VALUE_PATH` varchar(2048) DEFAULT NULL
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.TABLES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLES` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `TABLE_COLLATION` varchar(32) DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `CREATE_OPTIONS` varchar(2048) DEFAULT NULL,
  `TABLE_COMMENT` varchar(2048) NOT NULL DEFAULT '',
  `MAX_INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `TEMPORARY` varchar(1) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.TABLESPACES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLESPACES` (
  `TABLESPACE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `TABLESPACE_TYPE` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `EXTENT_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `NODEGROUP_ID` bigint(21) unsigned DEFAULT NULL,
  `TABLESPACE_COMMENT` varchar(2048) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.TABLE_CONSTRAINTS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.TABLE_PRIVILEGES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(190) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.TABLE_STATISTICS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `TABLE_STATISTICS` (
  `TABLE_SCHEMA` varchar(192) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(192) NOT NULL DEFAULT '',
  `ROWS_READ` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_CHANGED` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_CHANGED_X_INDEXES` bigint(21) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.THREAD_POOL_GROUPS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `THREAD_POOL_GROUPS` (
  `GROUP_ID` int(6) NOT NULL DEFAULT 0,
  `CONNECTIONS` int(6) NOT NULL DEFAULT 0,
  `THREADS` int(6) NOT NULL DEFAULT 0,
  `ACTIVE_THREADS` int(6) NOT NULL DEFAULT 0,
  `STANDBY_THREADS` int(6) NOT NULL DEFAULT 0,
  `QUEUE_LENGTH` int(6) NOT NULL DEFAULT 0,
  `HAS_LISTENER` tinyint(1) NOT NULL DEFAULT 0,
  `IS_STALLED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.THREAD_POOL_QUEUES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `THREAD_POOL_QUEUES` (
  `GROUP_ID` int(6) NOT NULL DEFAULT 0,
  `POSITION` int(6) NOT NULL DEFAULT 0,
  `PRIORITY` int(1) NOT NULL DEFAULT 0,
  `CONNECTION_ID` bigint(19) unsigned DEFAULT NULL,
  `QUEUEING_TIME_MICROSECONDS` bigint(19) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.THREAD_POOL_STATS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `THREAD_POOL_STATS` (
  `GROUP_ID` int(6) NOT NULL DEFAULT 0,
  `THREAD_CREATIONS` bigint(19) NOT NULL DEFAULT 0,
  `THREAD_CREATIONS_DUE_TO_STALL` bigint(19) NOT NULL DEFAULT 0,
  `WAKES` bigint(19) NOT NULL DEFAULT 0,
  `WAKES_DUE_TO_STALL` bigint(19) NOT NULL DEFAULT 0,
  `THROTTLES` bigint(19) NOT NULL DEFAULT 0,
  `STALLS` bigint(19) NOT NULL DEFAULT 0,
  `POLLS_BY_LISTENER` bigint(19) NOT NULL DEFAULT 0,
  `POLLS_BY_WORKER` bigint(19) NOT NULL DEFAULT 0,
  `DEQUEUES_BY_LISTENER` bigint(19) NOT NULL DEFAULT 0,
  `DEQUEUES_BY_WORKER` bigint(19) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.THREAD_POOL_WAITS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `THREAD_POOL_WAITS` (
  `REASON` varchar(16) NOT NULL DEFAULT '',
  `COUNT` bigint(19) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.TRIGGERS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TRIGGER_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TRIGGER_NAME` varchar(64) NOT NULL DEFAULT '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL DEFAULT '',
  `EVENT_OBJECT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL DEFAULT '',
  `ACTION_ORDER` bigint(4) NOT NULL DEFAULT 0,
  `ACTION_CONDITION` longtext DEFAULT NULL,
  `ACTION_STATEMENT` longtext NOT NULL DEFAULT '',
  `ACTION_ORIENTATION` varchar(9) NOT NULL DEFAULT '',
  `ACTION_TIMING` varchar(6) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL DEFAULT '',
  `CREATED` datetime(2) DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `DEFINER` varchar(189) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.USER_PRIVILEGES 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `USER_PRIVILEGES` (
  `GRANTEE` varchar(190) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.USER_STATISTICS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `USER_STATISTICS` (
  `USER` varchar(128) NOT NULL DEFAULT '',
  `TOTAL_CONNECTIONS` int(11) NOT NULL DEFAULT 0,
  `CONCURRENT_CONNECTIONS` int(11) NOT NULL DEFAULT 0,
  `CONNECTED_TIME` int(11) NOT NULL DEFAULT 0,
  `BUSY_TIME` double NOT NULL DEFAULT 0,
  `CPU_TIME` double NOT NULL DEFAULT 0,
  `BYTES_RECEIVED` bigint(21) NOT NULL DEFAULT 0,
  `BYTES_SENT` bigint(21) NOT NULL DEFAULT 0,
  `BINLOG_BYTES_WRITTEN` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_READ` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_SENT` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_DELETED` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_INSERTED` bigint(21) NOT NULL DEFAULT 0,
  `ROWS_UPDATED` bigint(21) NOT NULL DEFAULT 0,
  `SELECT_COMMANDS` bigint(21) NOT NULL DEFAULT 0,
  `UPDATE_COMMANDS` bigint(21) NOT NULL DEFAULT 0,
  `OTHER_COMMANDS` bigint(21) NOT NULL DEFAULT 0,
  `COMMIT_TRANSACTIONS` bigint(21) NOT NULL DEFAULT 0,
  `ROLLBACK_TRANSACTIONS` bigint(21) NOT NULL DEFAULT 0,
  `DENIED_CONNECTIONS` bigint(21) NOT NULL DEFAULT 0,
  `LOST_CONNECTIONS` bigint(21) NOT NULL DEFAULT 0,
  `ACCESS_DENIED` bigint(21) NOT NULL DEFAULT 0,
  `EMPTY_QUERIES` bigint(21) NOT NULL DEFAULT 0,
  `TOTAL_SSL_CONNECTIONS` bigint(21) unsigned NOT NULL DEFAULT 0,
  `MAX_STATEMENT_TIME_EXCEEDED` bigint(21) NOT NULL DEFAULT 0
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.user_variables 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `user_variables` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(2048) DEFAULT NULL,
  `VARIABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 information_schema.VIEWS 구조 내보내기
CREATE TEMPORARY TABLE IF NOT EXISTS `VIEWS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VIEW_DEFINITION` longtext NOT NULL DEFAULT '',
  `CHECK_OPTION` varchar(8) NOT NULL DEFAULT '',
  `IS_UPDATABLE` varchar(3) NOT NULL DEFAULT '',
  `DEFINER` varchar(189) NOT NULL DEFAULT '',
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `ALGORITHM` varchar(10) NOT NULL DEFAULT ''
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- mysql 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `mysql` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mysql`;

-- 프로시저 mysql.AddGeometryColumn 구조 내보내기
DELIMITER //
CREATE PROCEDURE `AddGeometryColumn`(catalog varchar(64), t_schema varchar(64),
   t_name varchar(64), geometry_column varchar(64), t_srid int)
    SQL SECURITY INVOKER
begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' ADD ', geometry_column,' GEOMETRY REF_SYSTEM_ID=', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end//
DELIMITER ;

-- 테이블 mysql.columns_priv 구조 내보내기
CREATE TABLE IF NOT EXISTS `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Column privileges';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.column_stats 구조 내보내기
CREATE TABLE IF NOT EXISTS `column_stats` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `min_value` varbinary(255) DEFAULT NULL,
  `max_value` varbinary(255) DEFAULT NULL,
  `nulls_ratio` decimal(12,4) DEFAULT NULL,
  `avg_length` decimal(12,4) DEFAULT NULL,
  `avg_frequency` decimal(12,4) DEFAULT NULL,
  `hist_size` tinyint(3) unsigned DEFAULT NULL,
  `hist_type` enum('SINGLE_PREC_HB','DOUBLE_PREC_HB') COLLATE utf8_bin DEFAULT NULL,
  `histogram` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`,`column_name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=0 COMMENT='Statistics on Columns';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.db 구조 내보내기
CREATE TABLE IF NOT EXISTS `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_history_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Database privileges';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 프로시저 mysql.DropGeometryColumn 구조 내보내기
DELIMITER //
CREATE PROCEDURE `DropGeometryColumn`(catalog varchar(64), t_schema varchar(64),
   t_name varchar(64), geometry_column varchar(64))
    SQL SECURITY INVOKER
begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' DROP ', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end//
DELIMITER ;

-- 테이블 mysql.event 구조 내보내기
CREATE TABLE IF NOT EXISTS `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(141) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','IGNORE_BAD_TABLE_OPTIONS','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH','EMPTY_STRING_IS_NULL','SIMULTANEOUS_ASSIGNMENT','TIME_ROUND_FRACTIONAL') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob DEFAULT NULL,
  PRIMARY KEY (`db`,`name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Events';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.func 구조 내보내기
CREATE TABLE IF NOT EXISTS `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT 0,
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='User defined functions';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.general_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.global_priv 구조 내보내기
CREATE TABLE IF NOT EXISTS `global_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Priv` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{}' CHECK (json_valid(`Priv`)),
  PRIMARY KEY (`Host`,`User`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Users and global privileges';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.gtid_slave_pos 구조 내보내기
CREATE TABLE IF NOT EXISTS `gtid_slave_pos` (
  `domain_id` int(10) unsigned NOT NULL,
  `sub_id` bigint(20) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `seq_no` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`domain_id`,`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Replication slave GTID position';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.help_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=0 COMMENT='help categories';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.help_keyword 구조 내보내기
CREATE TABLE IF NOT EXISTS `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=0 COMMENT='help keywords';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.help_relation 구조 내보내기
CREATE TABLE IF NOT EXISTS `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`),
  KEY `help_topic_id` (`help_topic_id`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=0 COMMENT='keyword-topic relation';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.help_topic 구조 내보내기
CREATE TABLE IF NOT EXISTS `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=0 COMMENT='help topics';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.index_stats 구조 내보내기
CREATE TABLE IF NOT EXISTS `index_stats` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefix_arity` int(11) unsigned NOT NULL,
  `avg_frequency` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`,`index_name`,`prefix_arity`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=0 COMMENT='Statistics on Indexes';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.innodb_index_stats 구조 내보내기
CREATE TABLE IF NOT EXISTS `innodb_index_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `stat_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `stat_value` bigint(20) unsigned NOT NULL,
  `sample_size` bigint(20) unsigned DEFAULT NULL,
  `stat_description` varchar(1024) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`,`index_name`,`stat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.innodb_table_stats 구조 내보내기
CREATE TABLE IF NOT EXISTS `innodb_table_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `n_rows` bigint(20) unsigned NOT NULL,
  `clustered_index_size` bigint(20) unsigned NOT NULL,
  `sum_of_other_index_sizes` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.plugin 구조 내보내기
CREATE TABLE IF NOT EXISTS `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='MySQL plugins';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.proc 구조 내보내기
CREATE TABLE IF NOT EXISTS `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE','PACKAGE','PACKAGE BODY') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(141) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','IGNORE_BAD_TABLE_OPTIONS','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH','EMPTY_STRING_IS_NULL','SIMULTANEOUS_ASSIGNMENT','TIME_ROUND_FRACTIONAL') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob DEFAULT NULL,
  `aggregate` enum('NONE','GROUP') NOT NULL DEFAULT 'NONE',
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Stored Procedures';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.procs_priv 구조 내보내기
CREATE TABLE IF NOT EXISTS `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE','PACKAGE','PACKAGE BODY') COLLATE utf8_bin NOT NULL,
  `Grantor` char(141) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Procedure privileges';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.proxies_priv 구조 내보내기
CREATE TABLE IF NOT EXISTS `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT 0,
  `Grantor` char(141) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='User proxy privileges';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.roles_mapping 구조 내보내기
CREATE TABLE IF NOT EXISTS `roles_mapping` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Role` char(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Admin_option` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  UNIQUE KEY `Host` (`Host`,`User`,`Role`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Granted roles';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.servers 구조 내보내기
CREATE TABLE IF NOT EXISTS `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` varchar(2048) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(80) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT 0,
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='MySQL Foreign Servers table';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.slow_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL,
  `rows_affected` int(11) NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.tables_priv 구조 내보내기
CREATE TABLE IF NOT EXISTS `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(80) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(141) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger','Delete versioning rows') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Table privileges';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.table_stats 구조 내보내기
CREATE TABLE IF NOT EXISTS `table_stats` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `cardinality` bigint(21) unsigned DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=0 COMMENT='Statistics on Tables';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.time_zone 구조 내보내기
CREATE TABLE IF NOT EXISTS `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Time zones';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.time_zone_leap_second 구조 내보내기
CREATE TABLE IF NOT EXISTS `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Leap seconds information for time zones';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.time_zone_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Time zone names';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.time_zone_transition 구조 내보내기
CREATE TABLE IF NOT EXISTS `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Time zone transitions';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.time_zone_transition_type 구조 내보내기
CREATE TABLE IF NOT EXISTS `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT 0,
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=Aria DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Time zone transition types';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 mysql.transaction_registry 구조 내보내기
CREATE TABLE IF NOT EXISTS `transaction_registry` (
  `transaction_id` bigint(20) unsigned NOT NULL,
  `commit_id` bigint(20) unsigned NOT NULL,
  `begin_timestamp` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `commit_timestamp` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `isolation_level` enum('READ-UNCOMMITTED','READ-COMMITTED','REPEATABLE-READ','SERIALIZABLE') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `commit_id` (`commit_id`),
  KEY `begin_timestamp` (`begin_timestamp`),
  KEY `commit_timestamp` (`commit_timestamp`,`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 뷰 mysql.user 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `user` (
	`Host` CHAR(60) NOT NULL COLLATE 'utf8_bin',
	`User` CHAR(80) NOT NULL COLLATE 'utf8_bin',
	`Password` LONGTEXT NULL COLLATE 'utf8mb4_bin',
	`Select_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Insert_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Update_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Delete_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Create_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Drop_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Reload_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Shutdown_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Process_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`File_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Grant_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`References_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Index_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Alter_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Show_db_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Super_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Create_tmp_table_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Lock_tables_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Execute_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Repl_slave_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Repl_client_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Create_view_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Show_view_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Create_routine_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Alter_routine_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Create_user_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Event_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Trigger_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Create_tablespace_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`Delete_history_priv` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`ssl_type` VARCHAR(9) NULL COLLATE 'latin1_swedish_ci',
	`ssl_cipher` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`x509_issuer` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`x509_subject` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`max_questions` BIGINT(20) UNSIGNED NOT NULL,
	`max_updates` BIGINT(20) UNSIGNED NOT NULL,
	`max_connections` BIGINT(20) UNSIGNED NOT NULL,
	`max_user_connections` BIGINT(21) NOT NULL,
	`plugin` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`authentication_string` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`password_expired` VARCHAR(1) NOT NULL COLLATE 'latin1_swedish_ci',
	`is_role` VARCHAR(1) NULL COLLATE 'latin1_swedish_ci',
	`default_role` LONGTEXT NOT NULL COLLATE 'utf8mb4_bin',
	`max_statement_time` DECIMAL(12,6) NOT NULL
) ENGINE=MyISAM;

-- 뷰 mysql.user 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `user`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `mysql`.`user` AS select `mysql`.`global_priv`.`Host` AS `Host`,`mysql`.`global_priv`.`User` AS `User`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.plugin') in ('mysql_native_password','mysql_old_password'),ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.authentication_string'),''),'') AS `Password`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 1,'Y','N') AS `Select_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 2,'Y','N') AS `Insert_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 4,'Y','N') AS `Update_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 8,'Y','N') AS `Delete_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 16,'Y','N') AS `Create_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 32,'Y','N') AS `Drop_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 64,'Y','N') AS `Reload_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 128,'Y','N') AS `Shutdown_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 256,'Y','N') AS `Process_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 512,'Y','N') AS `File_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 1024,'Y','N') AS `Grant_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 2048,'Y','N') AS `References_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 4096,'Y','N') AS `Index_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 8192,'Y','N') AS `Alter_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 16384,'Y','N') AS `Show_db_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 32768,'Y','N') AS `Super_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 65536,'Y','N') AS `Create_tmp_table_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 131072,'Y','N') AS `Lock_tables_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 262144,'Y','N') AS `Execute_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 524288,'Y','N') AS `Repl_slave_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 1048576,'Y','N') AS `Repl_client_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 2097152,'Y','N') AS `Create_view_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 4194304,'Y','N') AS `Show_view_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 8388608,'Y','N') AS `Create_routine_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 16777216,'Y','N') AS `Alter_routine_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 33554432,'Y','N') AS `Create_user_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 67108864,'Y','N') AS `Event_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 134217728,'Y','N') AS `Trigger_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 268435456,'Y','N') AS `Create_tablespace_priv`,if(json_value(`mysql`.`global_priv`.`Priv`,'$.access') & 536870912,'Y','N') AS `Delete_history_priv`,elt(ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.ssl_type'),0) + 1,'','ANY','X509','SPECIFIED') AS `ssl_type`,ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.ssl_cipher'),'') AS `ssl_cipher`,ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.x509_issuer'),'') AS `x509_issuer`,ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.x509_subject'),'') AS `x509_subject`,cast(ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.max_questions'),0) as unsigned) AS `max_questions`,cast(ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.max_updates'),0) as unsigned) AS `max_updates`,cast(ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.max_connections'),0) as unsigned) AS `max_connections`,cast(ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.max_user_connections'),0) as signed) AS `max_user_connections`,ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.plugin'),'') AS `plugin`,ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.authentication_string'),'') AS `authentication_string`,'N' AS `password_expired`,elt(ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.is_role'),0) + 1,'N','Y') AS `is_role`,ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.default_role'),'') AS `default_role`,cast(ifnull(json_value(`mysql`.`global_priv`.`Priv`,'$.max_statement_time'),0.0) as decimal(12,6)) AS `max_statement_time` from `mysql`.`global_priv`;


-- performance_schema 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `performance_schema` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `performance_schema`;

-- 테이블 performance_schema.accounts 구조 내보내기
CREATE TABLE IF NOT EXISTS `accounts` (
  `USER` char(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The connection''s client user name for the connection, or NULL if an internal thread.',
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The connection client''s host name, or NULL if an internal thread.',
  `CURRENT_CONNECTIONS` bigint(20) NOT NULL COMMENT 'Current connections for the account.',
  `TOTAL_CONNECTIONS` bigint(20) NOT NULL COMMENT 'Total connections for the account.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.cond_instances 구조 내보내기
CREATE TABLE IF NOT EXISTS `cond_instances` (
  `NAME` varchar(128) NOT NULL COMMENT 'Client user name for the connection, or NULL if an internal thread.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Address in memory of the instrumented condition.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_stages_current 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_stages_current` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_ID uniquely identifies the row.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread''s current event number at the start of the event. Together with THREAD_ID uniquely identifies the row.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL when the event starts, set to the thread''s current event number at the end of the event.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event instrument name and a NAME from the setup_instruments table',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Name and line number of the source file containing the instrumented code that produced the event.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing started or NULL if timing is not collected.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing ended, or NULL if the event has not ended or timing is not collected.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds of the event''s duration or NULL if the event has not ended or timing is not collected.',
  `WORK_COMPLETED` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of work units completed for the stage. NULL if the stage event progress is not instrumented.',
  `WORK_ESTIMATED` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of work units expected for the stage. NULL if the stage event progress is not instrumented.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'EVENT_ID of event within which this event nests.',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'Nesting event type. Either transaction, statement, stage or wait.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_stages_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_stages_history` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_ID uniquely identifies the row.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread''s current event number at the start of the event. Together with THREAD_ID uniquely identifies the row.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL when the event starts, set to the thread''s current event number at the end of the event.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event instrument name and a NAME from the setup_instruments table',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Name and line number of the source file containing the instrumented code that produced the event.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing started or NULL if timing is not collected.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing ended, or NULL if the event has not ended or timing is not collected.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds of the event''s duration or NULL if the event has not ended or timing is not collected.',
  `WORK_COMPLETED` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of work units completed for the stage. NULL if the stage event progress is not instrumented.',
  `WORK_ESTIMATED` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of work units expected for the stage. NULL if the stage event progress is not instrumented.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'EVENT_ID of event within which this event nests.',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'Nesting event type. Either transaction, statement, stage or wait.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_stages_history_long 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_stages_history_long` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_ID uniquely identifies the row.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread''s current event number at the start of the event. Together with THREAD_ID uniquely identifies the row.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL when the event starts, set to the thread''s current event number at the end of the event.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event instrument name and a NAME from the setup_instruments table',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Name and line number of the source file containing the instrumented code that produced the event.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing started or NULL if timing is not collected.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing ended, or NULL if the event has not ended or timing is not collected.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds of the event''s duration or NULL if the event has not ended or timing is not collected.',
  `WORK_COMPLETED` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of work units completed for the stage. NULL if the stage event progress is not instrumented.',
  `WORK_ESTIMATED` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of work units expected for the stage. NULL if the stage event progress is not instrumented.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'EVENT_ID of event within which this event nests.',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'Nesting event type. Either transaction, statement, stage or wait.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_stages_summary_by_account_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_stages_summary_by_account_by_event_name` (
  `USER` char(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User. Used together with HOST and EVENT_NAME for grouping events.',
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host. Used together with USER and EVENT_NAME for grouping events.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with USER and HOST for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events, which includes all timed and untimed events.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the timed summarized events.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the timed summarized events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the timed summarized events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the timed summarized events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_stages_summary_by_host_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_stages_summary_by_host_by_event_name` (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host. Used together with EVENT_NAME for grouping events.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with HOST for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events, which includes all timed and untimed events.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the timed summarized events.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the timed summarized events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the timed summarized events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the timed summarized events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_stages_summary_by_thread_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_stages_summary_by_thread_by_event_name` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_NAME uniquely identifies the row.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with THREAD_ID for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events, which includes all timed and untimed events.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the timed summarized events.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the timed summarized events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the timed summarized events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the timed summarized events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_stages_summary_by_user_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_stages_summary_by_user_by_event_name` (
  `USER` char(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User. Used together with EVENT_NAME for grouping events.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with USER for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events, which includes all timed and untimed events.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the timed summarized events.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the timed summarized events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the timed summarized events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the timed summarized events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_stages_summary_global_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_stages_summary_global_by_event_name` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events, which includes all timed and untimed events.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the timed summarized events.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the timed summarized events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the timed summarized events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the timed summarized events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_current 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_current` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_ID uniquely identifies the row.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread''s current event number at the start of the event. Together with THREAD_ID uniquely identifies the row.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL when the event starts, set to the thread''s current event number at the end of the event.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event instrument name and a NAME from the setup_instruments table',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Name and line number of the source file containing the instrumented code that produced the event.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing started or NULL if timing is not collected.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing ended, or NULL if the event has not ended or timing is not collected.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds of the event''s duration or NULL if the event has not ended or timing is not collected.',
  `LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'Time in picoseconds spent waiting for locks. The time is calculated in microseconds but stored in picoseconds for compatibility with other timings.',
  `SQL_TEXT` longtext DEFAULT NULL COMMENT 'The SQL statement, or NULL if the command is not associated with an SQL statement.',
  `DIGEST` varchar(32) DEFAULT NULL COMMENT 'Statement digest.',
  `DIGEST_TEXT` longtext DEFAULT NULL COMMENT 'Statement digest text.',
  `CURRENT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Statement''s default database for the statement, or NULL if there was none.',
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement object type for nested statements (stored programs).',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement object schema for nested statements (stored programs).',
  `OBJECT_NAME` varchar(64) DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement object name for nested statements (stored programs).',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned DEFAULT NULL COMMENT 'Address in memory of the statement object.',
  `MYSQL_ERRNO` int(11) DEFAULT NULL COMMENT 'Error code. See MariaDB Error Codes for a full list.',
  `RETURNED_SQLSTATE` varchar(5) DEFAULT NULL COMMENT 'The SQLSTATE value.',
  `MESSAGE_TEXT` varchar(128) DEFAULT NULL COMMENT 'Statement error message. See MariaDB Error Codes.',
  `ERRORS` bigint(20) unsigned NOT NULL COMMENT '0 if SQLSTATE signifies completion (starting with 00) or warning (01), otherwise 1.',
  `WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'Number of warnings from the diagnostics area.',
  `ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'Number of rows affected the statement affected.',
  `ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'Number of rows returned.',
  `ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'Number of rows read during the statement''s execution.',
  `CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Number of on-disk temp tables created by the statement.',
  `CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Number of temp tables created by the statement.',
  `SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which did not use an index.',
  `SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which used a range search of the first table.',
  `SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which used a range of the first table.',
  `SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'Number of joins without keys performed by the statement that check for key usage after each row.',
  `SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which used a full scan of the first table.',
  `SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'Number of merge passes by the sort algorithm performed by the statement. If too high, you may need to increase the sort_buffer_size.',
  `SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Number of sorts performed by the statement which used a range.',
  `SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'Number of rows sorted by the statement.',
  `SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Number of sorts performed by the statement which used a full table scan.',
  `NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT '0 if the statement performed a table scan with an index, 1 if without an index.',
  `NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT '0 if a good index was found for the statement, 1 if no good index was found. See the Range checked for each record description in the EXPLAIN article.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement event id for nested statements (stored programs).',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement event type for nested statements (stored programs).',
  `NESTING_EVENT_LEVEL` int(11) DEFAULT NULL COMMENT '0 for top level statements. The parent statement level plus 1 for nested statements (stored programs).'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_history` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_ID uniquely identifies the row.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread''s current event number at the start of the event. Together with THREAD_ID uniquely identifies the row.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL when the event starts, set to the thread''s current event number at the end of the event.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event instrument name and a NAME from the setup_instruments table',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Name and line number of the source file containing the instrumented code that produced the event.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing started or NULL if timing is not collected.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing ended, or NULL if the event has not ended or timing is not collected.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds of the event''s duration or NULL if the event has not ended or timing is not collected.',
  `LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'Time in picoseconds spent waiting for locks. The time is calculated in microseconds but stored in picoseconds for compatibility with other timings.',
  `SQL_TEXT` longtext DEFAULT NULL COMMENT 'The SQL statement, or NULL if the command is not associated with an SQL statement.',
  `DIGEST` varchar(32) DEFAULT NULL COMMENT 'Statement digest.',
  `DIGEST_TEXT` longtext DEFAULT NULL COMMENT 'Statement digest text.',
  `CURRENT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Statement''s default database for the statement, or NULL if there was none.',
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement object type for nested statements (stored programs).',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement object schema for nested statements (stored programs).',
  `OBJECT_NAME` varchar(64) DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement object name for nested statements (stored programs).',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned DEFAULT NULL COMMENT 'Address in memory of the statement object.',
  `MYSQL_ERRNO` int(11) DEFAULT NULL COMMENT 'Error code. See MariaDB Error Codes for a full list.',
  `RETURNED_SQLSTATE` varchar(5) DEFAULT NULL COMMENT 'The SQLSTATE value.',
  `MESSAGE_TEXT` varchar(128) DEFAULT NULL COMMENT 'Statement error message. See MariaDB Error Codes.',
  `ERRORS` bigint(20) unsigned NOT NULL COMMENT '0 if SQLSTATE signifies completion (starting with 00) or warning (01), otherwise 1.',
  `WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'Number of warnings from the diagnostics area.',
  `ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'Number of rows affected the statement affected.',
  `ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'Number of rows returned.',
  `ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'Number of rows read during the statement''s execution.',
  `CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Number of on-disk temp tables created by the statement.',
  `CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Number of temp tables created by the statement.',
  `SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which did not use an index.',
  `SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which used a range search of the first table.',
  `SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which used a range of the first table.',
  `SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'Number of joins without keys performed by the statement that check for key usage after each row.',
  `SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which used a full scan of the first table.',
  `SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'Number of merge passes by the sort algorithm performed by the statement. If too high, you may need to increase the sort_buffer_size.',
  `SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Number of sorts performed by the statement which used a range.',
  `SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'Number of rows sorted by the statement.',
  `SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Number of sorts performed by the statement which used a full table scan.',
  `NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT '0 if the statement performed a table scan with an index, 1 if without an index.',
  `NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT '0 if a good index was found for the statement, 1 if no good index was found. See the Range checked for each record description in the EXPLAIN article.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement event id for nested statements (stored programs).',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement event type for nested statements (stored programs).',
  `NESTING_EVENT_LEVEL` int(11) DEFAULT NULL COMMENT '0 for top level statements. The parent statement level plus 1 for nested statements (stored programs).'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_history_long 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_history_long` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_ID uniquely identifies the row.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread''s current event number at the start of the event. Together with THREAD_ID uniquely identifies the row.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL when the event starts, set to the thread''s current event number at the end of the event.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event instrument name and a NAME from the setup_instruments table',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Name and line number of the source file containing the instrumented code that produced the event.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing started or NULL if timing is not collected.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing ended, or NULL if the event has not ended or timing is not collected.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds of the event''s duration or NULL if the event has not ended or timing is not collected.',
  `LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'Time in picoseconds spent waiting for locks. The time is calculated in microseconds but stored in picoseconds for compatibility with other timings.',
  `SQL_TEXT` longtext DEFAULT NULL COMMENT 'The SQL statement, or NULL if the command is not associated with an SQL statement.',
  `DIGEST` varchar(32) DEFAULT NULL COMMENT 'Statement digest.',
  `DIGEST_TEXT` longtext DEFAULT NULL COMMENT 'Statement digest text.',
  `CURRENT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Statement''s default database for the statement, or NULL if there was none.',
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement object type for nested statements (stored programs).',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement object schema for nested statements (stored programs).',
  `OBJECT_NAME` varchar(64) DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement object name for nested statements (stored programs).',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned DEFAULT NULL COMMENT 'Address in memory of the statement object.',
  `MYSQL_ERRNO` int(11) DEFAULT NULL COMMENT 'Error code. See MariaDB Error Codes for a full list.',
  `RETURNED_SQLSTATE` varchar(5) DEFAULT NULL COMMENT 'The SQLSTATE value.',
  `MESSAGE_TEXT` varchar(128) DEFAULT NULL COMMENT 'Statement error message. See MariaDB Error Codes.',
  `ERRORS` bigint(20) unsigned NOT NULL COMMENT '0 if SQLSTATE signifies completion (starting with 00) or warning (01), otherwise 1.',
  `WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'Number of warnings from the diagnostics area.',
  `ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'Number of rows affected the statement affected.',
  `ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'Number of rows returned.',
  `ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'Number of rows read during the statement''s execution.',
  `CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Number of on-disk temp tables created by the statement.',
  `CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Number of temp tables created by the statement.',
  `SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which did not use an index.',
  `SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which used a range search of the first table.',
  `SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which used a range of the first table.',
  `SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'Number of joins without keys performed by the statement that check for key usage after each row.',
  `SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Number of joins performed by the statement which used a full scan of the first table.',
  `SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'Number of merge passes by the sort algorithm performed by the statement. If too high, you may need to increase the sort_buffer_size.',
  `SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Number of sorts performed by the statement which used a range.',
  `SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'Number of rows sorted by the statement.',
  `SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Number of sorts performed by the statement which used a full table scan.',
  `NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT '0 if the statement performed a table scan with an index, 1 if without an index.',
  `NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT '0 if a good index was found for the statement, 1 if no good index was found. See the Range checked for each record description in the EXPLAIN article.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement event id for nested statements (stored programs).',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'NULL for top level statements. The parent statement event type for nested statements (stored programs).',
  `NESTING_EVENT_LEVEL` int(11) DEFAULT NULL COMMENT '0 for top level statements. The parent statement level plus 1 for nested statements (stored programs).'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_summary_by_account_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_summary_by_account_by_event_name` (
  `USER` char(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User. Used together with HOST and EVENT_NAME for grouping events.',
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host. Used together with USER and EVENT_NAME for grouping events.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with USER and HOST for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `SUM_LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'Sum of the LOCK_TIME column in the events_statements_current table.',
  `SUM_ERRORS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ERRORS column in the events_statements_current table.',
  `SUM_WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the WARNINGS column in the events_statements_current table.',
  `SUM_ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_AFFECTED column in the events_statements_current table.',
  `SUM_ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_SENT column in the events_statements_current table.',
  `SUM_ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_EXAMINED column in the events_statements_current table.',
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_DISK_TABLES column in the events_statements_current table.',
  `SUM_CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_TABLES column in the events_statements_current table.',
  `SUM_SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_JOIN column in the events_statements_current table.',
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_RANGE_JOIN column in the events_statements_current table.',
  `SUM_SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE column in the events_statements_current table.',
  `SUM_SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE_CHECK column in the events_statements_current table.',
  `SUM_SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_SCAN column in the events_statements_current table.',
  `SUM_SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_MERGE_PASSES column in the events_statements_current table.',
  `SUM_SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_RANGE column in the events_statements_current table.',
  `SUM_SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_ROWS column in the events_statements_current table.',
  `SUM_SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_SCAN column in the events_statements_current table.',
  `SUM_NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_INDEX_USED column in the events_statements_current table.',
  `SUM_NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_GOOD_INDEX_USED column in the events_statements_current table.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_summary_by_digest 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_summary_by_digest` (
  `SCHEMA_NAME` varchar(64) DEFAULT NULL COMMENT 'Database name. Records are summarised together with DIGEST.',
  `DIGEST` varchar(32) DEFAULT NULL COMMENT 'Performance Schema digest. Records are summarised together with SCHEMA NAME.',
  `DIGEST_TEXT` longtext DEFAULT NULL COMMENT 'The unhashed form of the digest.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `SUM_LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'Sum of the LOCK_TIME column in the events_statements_current table.',
  `SUM_ERRORS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ERRORS column in the events_statements_current table.',
  `SUM_WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the WARNINGS column in the events_statements_current table.',
  `SUM_ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_AFFECTED column in the events_statements_current table.',
  `SUM_ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_SENT column in the events_statements_current table.',
  `SUM_ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_EXAMINED column in the events_statements_current table.',
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_DISK_TABLES column in the events_statements_current table.',
  `SUM_CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_TABLES column in the events_statements_current table.',
  `SUM_SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_JOIN column in the events_statements_current table.',
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_RANGE_JOIN column in the events_statements_current table.',
  `SUM_SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE column in the events_statements_current table.',
  `SUM_SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE_CHECK column in the events_statements_current table.',
  `SUM_SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_SCAN column in the events_statements_current table.',
  `SUM_SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_MERGE_PASSES column in the events_statements_current table.',
  `SUM_SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_RANGE column in the events_statements_current table.',
  `SUM_SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_ROWS column in the events_statements_current table.',
  `SUM_SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_SCAN column in the events_statements_current table.',
  `SUM_NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_INDEX_USED column in the events_statements_current table.',
  `SUM_NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_GOOD_INDEX_USED column in the events_statements_current table.',
  `FIRST_SEEN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time at which the digest was first seen.',
  `LAST_SEEN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time at which the digest was most recently seen.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_summary_by_host_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_summary_by_host_by_event_name` (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host. Used together with EVENT_NAME for grouping events.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with HOST for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `SUM_LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'Sum of the LOCK_TIME column in the events_statements_currentd table.',
  `SUM_ERRORS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ERRORS column in the events_statements_current table.',
  `SUM_WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the WARNINGS column in the events_statements_current table.',
  `SUM_ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_AFFECTED column in the events_statements_current table.',
  `SUM_ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_SENT column in the events_statements_current table.',
  `SUM_ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_EXAMINED column in the events_statements_current table.',
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_DISK_TABLES column in the events_statements_current table.',
  `SUM_CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_TABLES column in the events_statements_current table.',
  `SUM_SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_JOIN column in the events_statements_current table.',
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_RANGE_JOINW column in the events_statements_current table.',
  `SUM_SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE column in the events_statements_current table.',
  `SUM_SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE_CHECK column in the events_statements_current table.',
  `SUM_SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_SCAN column in the events_statements_current table.',
  `SUM_SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_MERGE_PASSES column in the events_statements_current table.',
  `SUM_SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_RANGE column in the events_statements_current table.',
  `SUM_SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_ROWS column in the events_statements_current table.',
  `SUM_SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_SCAN column in the events_statements_current table.',
  `SUM_NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_INDEX_USED column in the events_statements_current table.',
  `SUM_NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_GOOD_INDEX_USED column in the events_statements_current table.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_summary_by_program 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_summary_by_program` (
  `OBJECT_TYPE` enum('EVENT','FUNCTION','PROCEDURE','TABLE','TRIGGER') DEFAULT NULL COMMENT 'Object type for which the summary is generated.',
  `OBJECT_SCHEMA` varchar(64) NOT NULL COMMENT 'The schema of the object for which the summary is generated.',
  `OBJECT_NAME` varchar(64) NOT NULL COMMENT 'The name of the object for which the summary is generated.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'The number of summarized events (from events_statements_current). This value includes all events, whether timed or nontimed.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of the summarized timed events. This value is calculated only for timed events because nontimed events have a wait time of NULL. The same is true for the other xxx_TIMER_WAIT values.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of the summarized timed events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of the summarized timed events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of the summarized timed events.',
  `COUNT_STATEMENTS` bigint(20) unsigned NOT NULL COMMENT 'Total number of nested statements invoked during stored program execution.',
  `SUM_STATEMENTS_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of the summarized timed statements. This value is calculated only for timed statements because nontimed statements have a wait time of NULL. The same is true for the other xxx_STATEMENT_WAIT values.',
  `MIN_STATEMENTS_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of the summarized timed statements.',
  `AVG_STATEMENTS_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of the summarized timed statements.',
  `MAX_STATEMENTS_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of the summarized timed statements.',
  `SUM_LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'The total time spent (in picoseconds) waiting for table locks for the summarized statements.',
  `SUM_ERRORS` bigint(20) unsigned NOT NULL COMMENT 'The total number of errors that occurend for the summarized statements.',
  `SUM_WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'The total number of warnings that occurend for the summarized statements.',
  `SUM_ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'The total number of affected rows by the summarized statements.',
  `SUM_ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'The total number of rows returned by the summarized statements.',
  `SUM_ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'The total number of rows examined by the summarized statements.',
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'The total number of on-disk temporary tables created by the summarized statements.',
  `SUM_CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'The total number of in-memory temporary tables created by the summarized statements.',
  `SUM_SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'The total number of full joins executed by the summarized statements.',
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'The total number of range search joins executed by the summarized statements.',
  `SUM_SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'The total number of joins that used ranges on the first table executed by the summarized statements.',
  `SUM_SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'The total number of joins that check for key usage after each row executed by the summarized statements.',
  `SUM_SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'The total number of joins that did a full scan of the first table executed by the summarized statements.',
  `SUM_SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'The total number of merge passes that the sort algorithm has had to do for the summarized statements.',
  `SUM_SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'The total number of sorts that were done using ranges for the summarized statements.',
  `SUM_SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'The total number of sorted rows that were sorted by the summarized statements.',
  `SUM_SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'The total number of sorts that were done by scanning the table by the summarized statements.',
  `SUM_NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'The total number of statements that performed a table scan without using an index.',
  `SUM_NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'The total number of statements where no good index was found.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_summary_by_thread_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_summary_by_thread_by_event_name` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_NAME uniquely identifies the row.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with THREAD_ID for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `SUM_LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'Sum of the LOCK_TIME column in the events_statements_current table.',
  `SUM_ERRORS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ERRORS column in the events_statements_current table.',
  `SUM_WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the WARNINGS column in the events_statements_current table.',
  `SUM_ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_AFFECTED column in the events_statements_current table.',
  `SUM_ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_SENT column in the events_statements_current table.',
  `SUM_ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_EXAMINED column in the events_statements_current table.',
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_DISK_TABLES column in the events_statements_current table.',
  `SUM_CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_TABLES column in the events_statements_current table.',
  `SUM_SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_JOIN column in the events_statements_current table.',
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_RANGE_JOIN column in the events_statements_current table.',
  `SUM_SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE column in the events_statements_current table.',
  `SUM_SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE_CHECK column in the events_statements_current table.',
  `SUM_SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_SCAN column in the events_statements_current table.',
  `SUM_SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_MERGE_PASSES column in the events_statements_current table.',
  `SUM_SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_RANGE column in the events_statements_current table.',
  `SUM_SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_ROWS column in the events_statements_current table.',
  `SUM_SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_SCAN column in the events_statements_current table.',
  `SUM_NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_INDEX_USED column in the events_statements_current table.',
  `SUM_NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_GOOD_INDEX_USED column in the events_statements_current table.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_summary_by_user_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_summary_by_user_by_event_name` (
  `USER` char(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User. Used together with EVENT_NAME for grouping events.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with USER for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `SUM_LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'Sum of the LOCK_TIME column in the events_statements_current table.',
  `SUM_ERRORS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ERRORS column in the events_statements_current table.',
  `SUM_WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the WARNINGS column in the events_statements_current table.',
  `SUM_ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_AFFECTED column in the events_statements_current table.',
  `SUM_ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_SENT column in the events_statements_current table.',
  `SUM_ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_EXAMINED column in the events_statements_current table.',
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_DISK_TABLES column in the events_statements_current table.',
  `SUM_CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_TABLES column in the events_statements_current table.',
  `SUM_SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_JOIN column in the events_statements_current table.',
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_RANGE_JOIN column in the events_statements_current table.',
  `SUM_SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE column in the events_statements_current table.',
  `SUM_SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE_CHECK column in the events_statements_current table.',
  `SUM_SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_SCAN column in the events_statements_current table.',
  `SUM_SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_MERGE_PASSES column in the events_statements_current table.',
  `SUM_SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_RANGE column in the events_statements_current table.',
  `SUM_SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_ROWS column in the events_statements_current table.',
  `SUM_SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_SCAN column in the events_statements_current table.',
  `SUM_NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_INDEX_USED column in the events_statements_current table.',
  `SUM_NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_GOOD_INDEX_USED column in the events_statements_current table.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_statements_summary_global_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_statements_summary_global_by_event_name` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `SUM_LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'Sum of the LOCK_TIME column in the events_statements_current table.',
  `SUM_ERRORS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ERRORS column in the events_statements_current table.',
  `SUM_WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the WARNINGS column in the events_statements_current table.',
  `SUM_ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_AFFECTED column in the events_statements_current table.',
  `SUM_ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_SENT column in the events_statements_current table.',
  `SUM_ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the ROWS_EXAMINED column in the events_statements_current table.',
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_DISK_TABLES column in the events_statements_current table.',
  `SUM_CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the CREATED_TMP_TABLES column in the events_statements_current table.',
  `SUM_SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_JOIN column in the events_statements_current table.',
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_FULL_RANGE_JOIN column in the events_statements_current table.',
  `SUM_SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE column in the events_statements_current table.',
  `SUM_SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_RANGE_CHECK column in the events_statements_current table.',
  `SUM_SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SELECT_SCAN column in the events_statements_current table.',
  `SUM_SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_MERGE_PASSES column in the events_statements_current table.',
  `SUM_SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_RANGE column in the events_statements_current table.',
  `SUM_SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_ROWS column in the events_statements_current table.',
  `SUM_SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'Sum of the SORT_SCAN column in the events_statements_current table.',
  `SUM_NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_INDEX_USED column in the events_statements_current table.',
  `SUM_NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'Sum of the NO_GOOD_INDEX_USED column in the events_statements_current table.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_transactions_current 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_transactions_current` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'The thread associated with the event.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'The event id associated with the event.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'This column is set to NULL when the event starts and updated to the thread current event number when the event ends.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'The name of the instrument from which the event was collected. This is a NAME value from the setup_instruments table.',
  `STATE` enum('ACTIVE','COMMITTED','ROLLED BACK') DEFAULT NULL COMMENT 'The current transaction state. The value is ACTIVE (after START TRANSACTION or BEGIN), COMMITTED (after COMMIT), or ROLLED BACK (after ROLLBACK).',
  `TRX_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'Unused.',
  `GTID` varchar(64) DEFAULT NULL COMMENT 'Transaction GTID, using the format DOMAIN-SERVER_ID-SEQUENCE_NO.',
  `XID_FORMAT_ID` int(11) DEFAULT NULL COMMENT 'XA transaction format ID for GTRID and BQUAL values.',
  `XID_GTRID` varchar(130) DEFAULT NULL COMMENT 'XA global transaction ID.',
  `XID_BQUAL` varchar(130) DEFAULT NULL COMMENT 'XA transaction branch qualifier.',
  `XA_STATE` varchar(64) DEFAULT NULL COMMENT 'The state of the XA transaction. The value is ACTIVE (after XA START), IDLE (after XA END), PREPARED (after XA PREPARE), ROLLED BACK (after XA ROLLBACK), or COMMITTED (after XA COMMIT).',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'The name of the source file containing the instrumented code that produced the event and the line number in the file at which the instrumentation occurs.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'The unit is picoseconds. When event timing started. NULL if event has no timing information.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'The unit is picoseconds. When event timing ended. NULL if event has no timing information.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'The unit is picoseconds. Event duration. NULL if event has not timing information.',
  `ACCESS_MODE` enum('READ ONLY','READ WRITE') DEFAULT NULL COMMENT 'Transaction access mode.',
  `ISOLATION_LEVEL` varchar(64) DEFAULT NULL COMMENT 'Transaction isolation level. One of: REPEATABLE READ, READ COMMITTED, READ UNCOMMITTED, or SERIALIZABLE.',
  `AUTOCOMMIT` enum('YES','NO') NOT NULL COMMENT 'Whether autcommit mode was enabled when the transaction started.',
  `NUMBER_OF_SAVEPOINTS` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of SAVEPOINT statements issued during the transaction.',
  `NUMBER_OF_ROLLBACK_TO_SAVEPOINT` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of ROLLBACK_TO_SAVEPOINT statements issued during the transaction.',
  `NUMBER_OF_RELEASE_SAVEPOINT` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of RELEASE_SAVEPOINT statements issued during the transaction.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned DEFAULT NULL COMMENT 'Unused.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'The EVENT_ID value of the event within which this event is nested.',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'The nesting event type.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_transactions_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_transactions_history` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'The thread associated with the event.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'The event id associated with the event.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'This column is set to NULL when the event starts and updated to the thread current event number when the event ends.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'The name of the instrument from which the event was collected. This is a NAME value from the setup_instruments table.',
  `STATE` enum('ACTIVE','COMMITTED','ROLLED BACK') DEFAULT NULL COMMENT 'The current transaction state. The value is ACTIVE (after START TRANSACTION or BEGIN), COMMITTED (after COMMIT), or ROLLED BACK (after ROLLBACK).',
  `TRX_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'Unused.',
  `GTID` varchar(64) DEFAULT NULL COMMENT 'Transaction GTID, using the format DOMAIN-SERVER_ID-SEQUENCE_NO.',
  `XID_FORMAT_ID` int(11) DEFAULT NULL COMMENT 'XA transaction format ID for GTRID and BQUAL values.',
  `XID_GTRID` varchar(130) DEFAULT NULL COMMENT 'XA global transaction ID.',
  `XID_BQUAL` varchar(130) DEFAULT NULL COMMENT 'XA transaction branch qualifier.',
  `XA_STATE` varchar(64) DEFAULT NULL COMMENT 'The state of the XA transaction. The value is ACTIVE (after XA START), IDLE (after XA END), PREPARED (after XA PREPARE), ROLLED BACK (after XA ROLLBACK), or COMMITTED (after XA COMMIT).',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'The name of the source file containing the instrumented code that produced the event and the line number in the file at which the instrumentation occurs.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'The unit is picoseconds. When event timing started. NULL if event has no timing information.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'The unit is picoseconds. When event timing ended. NULL if event has no timing information.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'The unit is picoseconds. Event duration. NULL if event has not timing information.',
  `ACCESS_MODE` enum('READ ONLY','READ WRITE') DEFAULT NULL COMMENT 'Transaction access mode.',
  `ISOLATION_LEVEL` varchar(64) DEFAULT NULL COMMENT 'Transaction isolation level. One of: REPEATABLE READ, READ COMMITTED, READ UNCOMMITTED, or SERIALIZABLE.',
  `AUTOCOMMIT` enum('YES','NO') NOT NULL COMMENT 'Whether autcommit mode was enabled when the transaction started.',
  `NUMBER_OF_SAVEPOINTS` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of SAVEPOINT statements issued during the transaction.',
  `NUMBER_OF_ROLLBACK_TO_SAVEPOINT` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of ROLLBACK_TO_SAVEPOINT statements issued during the transaction.',
  `NUMBER_OF_RELEASE_SAVEPOINT` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of RELEASE_SAVEPOINT statements issued during the transaction.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned DEFAULT NULL COMMENT 'Unused.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'The EVENT_ID value of the event within which this event is nested.',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'The nesting event type.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_transactions_history_long 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_transactions_history_long` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'The thread associated with the event.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'The event id associated with the event.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'This column is set to NULL when the event starts and updated to the thread current event number when the event ends.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'The name of the instrument from which the event was collected. This is a NAME value from the setup_instruments table.',
  `STATE` enum('ACTIVE','COMMITTED','ROLLED BACK') DEFAULT NULL COMMENT 'The current transaction state. The value is ACTIVE (after START TRANSACTION or BEGIN), COMMITTED (after COMMIT), or ROLLED BACK (after ROLLBACK).',
  `TRX_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'Unused.',
  `GTID` varchar(64) DEFAULT NULL COMMENT 'Transaction GTID, using the format DOMAIN-SERVER_ID-SEQUENCE_NO.',
  `XID_FORMAT_ID` int(11) DEFAULT NULL COMMENT 'XA transaction format ID for GTRID and BQUAL values.',
  `XID_GTRID` varchar(130) DEFAULT NULL COMMENT 'XA global transaction ID.',
  `XID_BQUAL` varchar(130) DEFAULT NULL COMMENT 'XA transaction branch qualifier.',
  `XA_STATE` varchar(64) DEFAULT NULL COMMENT 'The state of the XA transaction. The value is ACTIVE (after XA START), IDLE (after XA END), PREPARED (after XA PREPARE), ROLLED BACK (after XA ROLLBACK), or COMMITTED (after XA COMMIT).',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'The name of the source file containing the instrumented code that produced the event and the line number in the file at which the instrumentation occurs.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'The unit is picoseconds. When event timing started. NULL if event has no timing information.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'The unit is picoseconds. When event timing ended. NULL if event has no timing information.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'The unit is picoseconds. Event duration. NULL if event has not timing information.',
  `ACCESS_MODE` enum('READ ONLY','READ WRITE') DEFAULT NULL COMMENT 'Transaction access mode.',
  `ISOLATION_LEVEL` varchar(64) DEFAULT NULL COMMENT 'Transaction isolation level. One of: REPEATABLE READ, READ COMMITTED, READ UNCOMMITTED, or SERIALIZABLE.',
  `AUTOCOMMIT` enum('YES','NO') NOT NULL COMMENT 'Whether autcommit mode was enabled when the transaction started.',
  `NUMBER_OF_SAVEPOINTS` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of SAVEPOINT statements issued during the transaction.',
  `NUMBER_OF_ROLLBACK_TO_SAVEPOINT` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of ROLLBACK_TO_SAVEPOINT statements issued during the transaction.',
  `NUMBER_OF_RELEASE_SAVEPOINT` bigint(20) unsigned DEFAULT NULL COMMENT 'The number of RELEASE_SAVEPOINT statements issued during the transaction.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned DEFAULT NULL COMMENT 'Unused.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'The EVENT_ID value of the event within which this event is nested.',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'The nesting event type.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_transactions_summary_by_account_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_transactions_summary_by_account_by_event_name` (
  `USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User for which summary is generated.',
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host for which summary is generated.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name for which summary is generated.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'The number of summarized events. This value includes all events, whether timed or nontimed.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of the summarized timed events. This value is calculated only for timed events because nontimed events have a wait time of NULL. The same is true for the other xxx_TIMER_WAIT values.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of the summarized timed events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of the summarized timed events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of the summarized timed events.',
  `COUNT_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ/WRITE transaction events.',
  `SUM_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ/WRITE transaction events.',
  `MIN_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ/WRITE transaction events.',
  `AVG_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ/WRITE transaction events.',
  `MAX_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ/WRITE transaction events.',
  `COUNT_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ ONLY transaction events.',
  `SUM_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ ONLY transaction events.',
  `MIN_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ ONLY transaction events.',
  `AVG_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ ONLY transaction events.',
  `MAX_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ ONLY transaction events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_transactions_summary_by_host_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_transactions_summary_by_host_by_event_name` (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host for which summary is generated.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name for which summary is generated.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'The number of summarized events. This value includes all events, whether timed or nontimed.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of the summarized timed events. This value is calculated only for timed events because nontimed events have a wait time of NULL. The same is true for the other xxx_TIMER_WAIT values.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of the summarized timed events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of the summarized timed events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of the summarized timed events.',
  `COUNT_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ/WRITE transaction events.',
  `SUM_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ/WRITE transaction events.',
  `MIN_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ/WRITE transaction events.',
  `AVG_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ/WRITE transaction events.',
  `MAX_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ/WRITE transaction events.',
  `COUNT_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ ONLY transaction events.',
  `SUM_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ ONLY transaction events.',
  `MIN_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ ONLY transaction events.',
  `AVG_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ ONLY transaction events.',
  `MAX_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ ONLY transaction events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_transactions_summary_by_thread_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_transactions_summary_by_thread_by_event_name` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread for which summary is generated.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name for which summary is generated.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'The number of summarized events. This value includes all events, whether timed or nontimed.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of the summarized timed events. This value is calculated only for timed events because nontimed events have a wait time of NULL. The same is true for the other xxx_TIMER_WAIT values.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of the summarized timed events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of the summarized timed events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of the summarized timed events.',
  `COUNT_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ/WRITE transaction events.',
  `SUM_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ/WRITE transaction events.',
  `MIN_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ/WRITE transaction events.',
  `AVG_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ/WRITE transaction events.',
  `MAX_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ/WRITE transaction events.',
  `COUNT_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ ONLY transaction events.',
  `SUM_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ ONLY transaction events.',
  `MIN_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ ONLY transaction events.',
  `AVG_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ ONLY transaction events.',
  `MAX_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ ONLY transaction events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_transactions_summary_by_user_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_transactions_summary_by_user_by_event_name` (
  `USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User for which summary is generated.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name for which summary is generated.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'The number of summarized events. This value includes all events, whether timed or nontimed.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of the summarized timed events. This value is calculated only for timed events because nontimed events have a wait time of NULL. The same is true for the other xxx_TIMER_WAIT values.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of the summarized timed events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of the summarized timed events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of the summarized timed events.',
  `COUNT_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ/WRITE transaction events.',
  `SUM_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ/WRITE transaction events.',
  `MIN_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ/WRITE transaction events.',
  `AVG_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ/WRITE transaction events.',
  `MAX_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ/WRITE transaction events.',
  `COUNT_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ ONLY transaction events.',
  `SUM_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ ONLY transaction events.',
  `MIN_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ ONLY transaction events.',
  `AVG_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ ONLY transaction events.',
  `MAX_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ ONLY transaction events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_transactions_summary_global_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_transactions_summary_global_by_event_name` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name for which summary is generated.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'The number of summarized events. This value includes all events, whether timed or nontimed.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of the summarized timed events. This value is calculated only for timed events because nontimed events have a wait time of NULL. The same is true for the other xxx_TIMER_WAIT values.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of the summarized timed events.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of the summarized timed events.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of the summarized timed events.',
  `COUNT_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ/WRITE transaction events.',
  `SUM_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ/WRITE transaction events.',
  `MIN_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ/WRITE transaction events.',
  `AVG_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ/WRITE transaction events.',
  `MAX_TIMER_READ_WRITE` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ/WRITE transaction events.',
  `COUNT_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total number of only READ ONLY transaction events.',
  `SUM_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The total wait time of only READ ONLY transaction events.',
  `MIN_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The minimum wait time of only READ ONLY transaction events.',
  `AVG_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The average wait time of only READ ONLY transaction events.',
  `MAX_TIMER_READ_ONLY` bigint(20) unsigned NOT NULL COMMENT 'The maximum wait time of only READ ONLY transaction events.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_waits_current 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_waits_current` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_ID uniquely identifies the row.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread''s current event number at the start of the event. Together with THREAD_ID uniquely identifies the row.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL when the event starts, set to the thread''s current event number at the end of the event.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event instrument name and a NAME from the setup_instruments table',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Name and line number of the source file containing the instrumented code that produced the event.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing started or NULL if timing is not collected.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing ended, or NULL if the event has not ended or timing is not collected.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds of the event''s duration or NULL if the event has not ended or timing is not collected.',
  `SPINS` int(10) unsigned DEFAULT NULL COMMENT 'Number of spin rounds for a mutex, or NULL if spin rounds are not used, or spinning is not instrumented.',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Name of the schema that contains the table for table I/O objects, otherwise NULL for file I/O and synchronization objects.',
  `OBJECT_NAME` varchar(512) DEFAULT NULL COMMENT 'File name for file I/O objects, table name for table I/O objects, the socket''s IP:PORT value for a socket object or NULL for a synchronization object.',
  `INDEX_NAME` varchar(64) DEFAULT NULL COMMENT 'Name of the index, PRIMARY for the primary key, or NULL for no index used.',
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'FILE for a file object, TABLE or TEMPORARY TABLE for a table object, or NULL for a synchronization object.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Address in memory of the object.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'EVENT_ID of event within which this event nests.',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'Nesting event type. Either statement, stage or wait.',
  `OPERATION` varchar(32) NOT NULL COMMENT 'Operation type, for example read, write or lock',
  `NUMBER_OF_BYTES` bigint(20) DEFAULT NULL COMMENT 'Number of bytes that the operation read or wrote, or NULL for table I/O waits.',
  `FLAGS` int(10) unsigned DEFAULT NULL COMMENT 'Reserved for use in the future.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_waits_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_waits_history` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_ID uniquely identifies the row.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread''s current event number at the start of the event. Together with THREAD_ID uniquely identifies the row.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL when the event starts, set to the thread''s current event number at the end of the event.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event instrument name and a NAME from the setup_instruments table',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Name and line number of the source file containing the instrumented code that produced the event.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing started or NULL if timing is not collected.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing ended, or NULL if the event has not ended or timing is not collected.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds of the event''s duration or NULL if the event has not ended or timing is not collected.',
  `SPINS` int(10) unsigned DEFAULT NULL COMMENT 'Number of spin rounds for a mutex, or NULL if spin rounds are not used, or spinning is not instrumented.',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Name of the schema that contains the table for table I/O objects, otherwise NULL for file I/O and synchronization objects.',
  `OBJECT_NAME` varchar(512) DEFAULT NULL COMMENT 'File name for file I/O objects, table name for table I/O objects, the socket''s IP:PORT value for a socket object or NULL for a synchronization object.',
  `INDEX_NAME` varchar(64) DEFAULT NULL COMMENT 'Name of the index, PRIMARY for the primary key, or NULL for no index used.',
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'FILE for a file object, TABLE or TEMPORARY TABLE for a table object, or NULL for a synchronization object.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Address in memory of the object.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'EVENT_ID of event within which this event nests.',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'Nesting event type. Either statement, stage or wait.',
  `OPERATION` varchar(32) NOT NULL COMMENT 'Operation type, for example read, write or lock',
  `NUMBER_OF_BYTES` bigint(20) DEFAULT NULL COMMENT 'Number of bytes that the operation read or wrote, or NULL for table I/O waits.',
  `FLAGS` int(10) unsigned DEFAULT NULL COMMENT 'Reserved for use in the future.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_waits_history_long 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_waits_history_long` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_ID uniquely identifies the row.',
  `EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread''s current event number at the start of the event. Together with THREAD_ID uniquely identifies the row.',
  `END_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'NULL when the event starts, set to the thread''s current event number at the end of the event.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event instrument name and a NAME from the setup_instruments table',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Name and line number of the source file containing the instrumented code that produced the event.',
  `TIMER_START` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing started or NULL if timing is not collected.',
  `TIMER_END` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds when the event timing ended, or NULL if the event has not ended or timing is not collected.',
  `TIMER_WAIT` bigint(20) unsigned DEFAULT NULL COMMENT 'Value in picoseconds of the event''s duration or NULL if the event has not ended or timing is not collected.',
  `SPINS` int(10) unsigned DEFAULT NULL COMMENT 'Number of spin rounds for a mutex, or NULL if spin rounds are not used, or spinning is not instrumented.',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Name of the schema that contains the table for table I/O objects, otherwise NULL for file I/O and synchronization objects.',
  `OBJECT_NAME` varchar(512) DEFAULT NULL COMMENT 'File name for file I/O objects, table name for table I/O objects, the socket''s IP:PORT value for a socket object or NULL for a synchronization object.',
  `INDEX_NAME` varchar(64) DEFAULT NULL COMMENT 'Name of the index, PRIMARY for the primary key, or NULL for no index used.',
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'FILE for a file object, TABLE or TEMPORARY TABLE for a table object, or NULL for a synchronization object.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Address in memory of the object.',
  `NESTING_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'EVENT_ID of event within which this event nests.',
  `NESTING_EVENT_TYPE` enum('TRANSACTION','STATEMENT','STAGE','WAIT') DEFAULT NULL COMMENT 'Nesting event type. Either statement, stage or wait.',
  `OPERATION` varchar(32) NOT NULL COMMENT 'Operation type, for example read, write or lock',
  `NUMBER_OF_BYTES` bigint(20) DEFAULT NULL COMMENT 'Number of bytes that the operation read or wrote, or NULL for table I/O waits.',
  `FLAGS` int(10) unsigned DEFAULT NULL COMMENT 'Reserved for use in the future.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_waits_summary_by_account_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_waits_summary_by_account_by_event_name` (
  `USER` char(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User. Used together with HOST and EVENT_NAME for grouping events.',
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host. Used together with USER and EVENT_NAME for grouping events.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with USER and HOST for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_waits_summary_by_host_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_waits_summary_by_host_by_event_name` (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host. Used together with EVENT_NAME for grouping events.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with USER and HOST for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_waits_summary_by_instance 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_waits_summary_by_instance` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with OBJECT_INSTANCE_BEGIN for grouping events.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'If an instrument creates multiple instances, each instance has a unique OBJECT_INSTANCE_BEGIN value to allow for grouping by instance.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_waits_summary_by_thread_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_waits_summary_by_thread_by_event_name` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread associated with the event. Together with EVENT_NAME uniquely identifies the row.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with THREAD_ID for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_waits_summary_by_user_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_waits_summary_by_user_by_event_name` (
  `USER` char(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User. Used together with EVENT_NAME for grouping events.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name. Used together with USER for grouping events.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.events_waits_summary_global_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `events_waits_summary_global_by_event_name` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.file_instances 구조 내보내기
CREATE TABLE IF NOT EXISTS `file_instances` (
  `FILE_NAME` varchar(512) NOT NULL COMMENT 'File name.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Instrument name associated with the file.',
  `OPEN_COUNT` int(10) unsigned NOT NULL COMMENT 'Open handles on the file. A value of greater than zero means that the file is currently open.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.file_summary_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `file_summary_by_event_name` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `COUNT_READ` bigint(20) unsigned NOT NULL COMMENT 'Number of all read operations, including FGETS, FGETC, FREAD, and READ.',
  `SUM_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all read operations that are timed.',
  `MIN_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all read operations that are timed.',
  `AVG_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all read operations that are timed.',
  `MAX_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all read operations that are timed.',
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) NOT NULL COMMENT 'Bytes read by read operations.',
  `COUNT_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Number of all write operations, including FPUTS, FPUTC, FPRINTF, VFPRINTF, FWRITE, and PWRITE.',
  `SUM_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all write operations that are timed.',
  `MIN_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all write operations that are timed.',
  `AVG_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all write operations that are timed.',
  `MAX_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all write operations that are timed.',
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) NOT NULL COMMENT 'Bytes written by write operations.',
  `COUNT_MISC` bigint(20) unsigned NOT NULL COMMENT 'Number of all miscellaneous operations not counted above, including CREATE, DELETE, OPEN, CLOSE, STREAM_OPEN, STREAM_CLOSE, SEEK, TELL, FLUSH, STAT, FSTAT, CHSIZE, RENAME, and SYNC.',
  `SUM_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all miscellaneous operations that are timed.',
  `MIN_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all miscellaneous operations that are timed.',
  `AVG_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all miscellaneous operations that are timed.',
  `MAX_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all miscellaneous operations that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.file_summary_by_instance 구조 내보내기
CREATE TABLE IF NOT EXISTS `file_summary_by_instance` (
  `FILE_NAME` varchar(512) NOT NULL COMMENT 'File name.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Address in memory. Together with FILE_NAME and EVENT_NAME uniquely identifies a row.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `COUNT_READ` bigint(20) unsigned NOT NULL COMMENT 'Number of all read operations, including FGETS, FGETC, FREAD, and READ.',
  `SUM_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all read operations that are timed.',
  `MIN_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all read operations that are timed.',
  `AVG_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all read operations that are timed.',
  `MAX_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all read operations that are timed.',
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) NOT NULL COMMENT 'Bytes read by read operations.',
  `COUNT_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Number of all write operations, including FPUTS, FPUTC, FPRINTF, VFPRINTF, FWRITE, and PWRITE.',
  `SUM_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all write operations that are timed.',
  `MIN_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all write operations that are timed.',
  `AVG_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all write operations that are timed.',
  `MAX_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all write operations that are timed.',
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) NOT NULL COMMENT 'Bytes written by write operations.',
  `COUNT_MISC` bigint(20) unsigned NOT NULL COMMENT 'Number of all miscellaneous operations not counted above, including CREATE, DELETE, OPEN, CLOSE, STREAM_OPEN, STREAM_CLOSE, SEEK, TELL, FLUSH, STAT, FSTAT, CHSIZE, RENAME, and SYNC.',
  `SUM_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all miscellaneous operations that are timed.',
  `MIN_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all miscellaneous operations that are timed.',
  `AVG_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all miscellaneous operations that are timed.',
  `MAX_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all miscellaneous operations that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.global_status 구조 내보내기
CREATE TABLE IF NOT EXISTS `global_status` (
  `VARIABLE_NAME` varchar(64) NOT NULL COMMENT 'The global status variable name.',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL COMMENT 'The global status variable value.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.hosts 구조 내보내기
CREATE TABLE IF NOT EXISTS `hosts` (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host name used by the client to connect, NULL for internal threads or user sessions that failed to authenticate.',
  `CURRENT_CONNECTIONS` bigint(20) NOT NULL COMMENT 'Current number of the host''s connections.',
  `TOTAL_CONNECTIONS` bigint(20) NOT NULL COMMENT 'Total number of the host''s connections'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.host_cache 구조 내보내기
CREATE TABLE IF NOT EXISTS `host_cache` (
  `IP` varchar(64) NOT NULL COMMENT 'Client IP address.',
  `HOST` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'IP''s resolved DNS host name, or NULL if unknown.',
  `HOST_VALIDATED` enum('YES','NO') NOT NULL COMMENT 'YES if the IP-to-host DNS lookup was successful, and the HOST column can be used to avoid DNS calls, or NO if unsuccessful, in which case DNS lookup is performed for each connect until either successful or a permanent error.',
  `SUM_CONNECT_ERRORS` bigint(20) NOT NULL COMMENT 'Number of connection errors. Counts only protocol handshake errors for hosts that passed validation. These errors count towards max_connect_errors.',
  `COUNT_HOST_BLOCKED_ERRORS` bigint(20) NOT NULL COMMENT 'Number of blocked connections because SUM_CONNECT_ERRORS exceeded the max_connect_errors system variable.',
  `COUNT_NAMEINFO_TRANSIENT_ERRORS` bigint(20) NOT NULL COMMENT 'Number of transient errors during IP-to-host DNS lookups.',
  `COUNT_NAMEINFO_PERMANENT_ERRORS` bigint(20) NOT NULL COMMENT 'Number of permanent errors during IP-to-host DNS lookups.',
  `COUNT_FORMAT_ERRORS` bigint(20) NOT NULL COMMENT 'Number of host name format errors, for example a numeric host column.',
  `COUNT_ADDRINFO_TRANSIENT_ERRORS` bigint(20) NOT NULL COMMENT 'Number of transient errors during host-to-IP reverse DNS lookups.',
  `COUNT_ADDRINFO_PERMANENT_ERRORS` bigint(20) NOT NULL COMMENT 'Number of permanent errors during host-to-IP reverse DNS lookups.',
  `COUNT_FCRDNS_ERRORS` bigint(20) NOT NULL COMMENT 'Number of forward-confirmed reverse DNS errors, which occur when IP-to-host DNS lookup does not match the originating IP address.',
  `COUNT_HOST_ACL_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors occurring because no user from the host is permitted to log in. These attempts return error code 1130 ER_HOST_NOT_PRIVILEGED and do not proceed to username and password authentication.',
  `COUNT_NO_AUTH_PLUGIN_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors due to requesting an authentication plugin that was not available. This can be due to the plugin never having been loaded, or the load attempt failing.',
  `COUNT_AUTH_PLUGIN_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors reported by an authentication plugin. Plugins can increment COUNT_AUTHENTICATION_ERRORS or COUNT_HANDSHAKE_ERRORS instead, but, if specified or the error is unknown, this column is incremented.',
  `COUNT_HANDSHAKE_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors detected at the wire protocol level.',
  `COUNT_PROXY_USER_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors detected when a proxy user is proxied to a user that does not exist.',
  `COUNT_PROXY_USER_ACL_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors detected when a proxy user is proxied to a user that exists, but the proxy user doesn''t have the PROXY privilege.',
  `COUNT_AUTHENTICATION_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors where authentication failed.',
  `COUNT_SSL_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors due to TLS problems.',
  `COUNT_MAX_USER_CONNECTIONS_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors due to the per-user quota being exceeded.',
  `COUNT_MAX_USER_CONNECTIONS_PER_HOUR_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors due to the per-hour quota being exceeded.',
  `COUNT_DEFAULT_DATABASE_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors due to the user not having permission to access the specified default database, or it not existing.',
  `COUNT_INIT_CONNECT_ERRORS` bigint(20) NOT NULL COMMENT 'Number of errors due to statements in the init_connect system variable.',
  `COUNT_LOCAL_ERRORS` bigint(20) NOT NULL COMMENT 'Number of local server errors, such as out-of-memory errors, unrelated to network, authentication, or authorization.',
  `COUNT_UNKNOWN_ERRORS` bigint(20) NOT NULL COMMENT 'Number of unknown errors that cannot be allocated to another column.',
  `FIRST_SEEN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Timestamp of the first connection attempt by the IP.',
  `LAST_SEEN` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Timestamp of the most recent connection attempt by the IP.',
  `FIRST_ERROR_SEEN` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Timestamp of the first error seen from the IP.',
  `LAST_ERROR_SEEN` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Timestamp of the most recent error seen from the IP.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.memory_summary_by_account_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `memory_summary_by_account_by_event_name` (
  `USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User portion of the account.',
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host portion of the account.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `COUNT_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of allocations to memory.',
  `COUNT_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of attempts to free the allocated memory.',
  `SUM_NUMBER_OF_BYTES_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes allocated.',
  `SUM_NUMBER_OF_BYTES_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes freed',
  `LOW_COUNT_USED` bigint(20) NOT NULL COMMENT 'Lowest number of allocated blocks (lowest value of CURRENT_COUNT_USED).',
  `CURRENT_COUNT_USED` bigint(20) NOT NULL COMMENT 'Currently allocated blocks that have not been freed (COUNT_ALLOC minus COUNT_FREE).',
  `HIGH_COUNT_USED` bigint(20) NOT NULL COMMENT 'Highest number of allocated blocks (highest value of CURRENT_COUNT_USED).',
  `LOW_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Lowest number of bytes used.',
  `CURRENT_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Current number of bytes used (total allocated minus total freed).',
  `HIGH_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Highest number of bytes used.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.memory_summary_by_host_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `memory_summary_by_host_by_event_name` (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host portion of the account.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `COUNT_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of allocations to memory.',
  `COUNT_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of attempts to free the allocated memory.',
  `SUM_NUMBER_OF_BYTES_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes allocated.',
  `SUM_NUMBER_OF_BYTES_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes freed',
  `LOW_COUNT_USED` bigint(20) NOT NULL COMMENT 'Lowest number of allocated blocks (lowest value of CURRENT_COUNT_USED).',
  `CURRENT_COUNT_USED` bigint(20) NOT NULL COMMENT 'Currently allocated blocks that have not been freed (COUNT_ALLOC minus COUNT_FREE).',
  `HIGH_COUNT_USED` bigint(20) NOT NULL COMMENT 'Highest number of allocated blocks (highest value of CURRENT_COUNT_USED).',
  `LOW_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Lowest number of bytes used.',
  `CURRENT_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Current number of bytes used (total allocated minus total freed).',
  `HIGH_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Highest number of bytes used.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.memory_summary_by_thread_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `memory_summary_by_thread_by_event_name` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Thread id.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `COUNT_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of allocations to memory.',
  `COUNT_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of attempts to free the allocated memory.',
  `SUM_NUMBER_OF_BYTES_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes allocated.',
  `SUM_NUMBER_OF_BYTES_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes freed',
  `LOW_COUNT_USED` bigint(20) NOT NULL COMMENT 'Lowest number of allocated blocks (lowest value of CURRENT_COUNT_USED).',
  `CURRENT_COUNT_USED` bigint(20) NOT NULL COMMENT 'Currently allocated blocks that have not been freed (COUNT_ALLOC minus COUNT_FREE).',
  `HIGH_COUNT_USED` bigint(20) NOT NULL COMMENT 'Highest number of allocated blocks (highest value of CURRENT_COUNT_USED).',
  `LOW_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Lowest number of bytes used.',
  `CURRENT_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Current number of bytes used (total allocated minus total freed).',
  `HIGH_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Highest number of bytes used.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.memory_summary_by_user_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `memory_summary_by_user_by_event_name` (
  `USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User portion of the account.',
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `COUNT_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of allocations to memory.',
  `COUNT_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of attempts to free the allocated memory.',
  `SUM_NUMBER_OF_BYTES_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes allocated.',
  `SUM_NUMBER_OF_BYTES_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes freed',
  `LOW_COUNT_USED` bigint(20) NOT NULL COMMENT 'Lowest number of allocated blocks (lowest value of CURRENT_COUNT_USED).',
  `CURRENT_COUNT_USED` bigint(20) NOT NULL COMMENT 'Currently allocated blocks that have not been freed (COUNT_ALLOC minus COUNT_FREE).',
  `HIGH_COUNT_USED` bigint(20) NOT NULL COMMENT 'Highest number of allocated blocks (highest value of CURRENT_COUNT_USED).',
  `LOW_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Lowest number of bytes used.',
  `CURRENT_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Current number of bytes used (total allocated minus total freed).',
  `HIGH_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Highest number of bytes used.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.memory_summary_global_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `memory_summary_global_by_event_name` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Event name.',
  `COUNT_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of allocations to memory.',
  `COUNT_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of attempts to free the allocated memory.',
  `SUM_NUMBER_OF_BYTES_ALLOC` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes allocated.',
  `SUM_NUMBER_OF_BYTES_FREE` bigint(20) unsigned NOT NULL COMMENT 'Total number of bytes freed',
  `LOW_COUNT_USED` bigint(20) NOT NULL COMMENT 'Lowest number of allocated blocks (lowest value of CURRENT_COUNT_USED).',
  `CURRENT_COUNT_USED` bigint(20) NOT NULL COMMENT 'Currently allocated blocks that have not been freed (COUNT_ALLOC minus COUNT_FREE).',
  `HIGH_COUNT_USED` bigint(20) NOT NULL COMMENT 'Highest number of allocated blocks (highest value of CURRENT_COUNT_USED).',
  `LOW_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Lowest number of bytes used.',
  `CURRENT_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Current number of bytes used (total allocated minus total freed).',
  `HIGH_NUMBER_OF_BYTES_USED` bigint(20) NOT NULL COMMENT 'Highest number of bytes used.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.metadata_locks 구조 내보내기
CREATE TABLE IF NOT EXISTS `metadata_locks` (
  `OBJECT_TYPE` varchar(64) NOT NULL COMMENT 'Object type. One of BACKUP, COMMIT, EVENT, FUNCTION, GLOBAL, LOCKING SERVICE, PROCEDURE, SCHEMA, TABLE, TABLESPACE, TRIGGER (unused) or USER LEVEL LOCK.',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Object schema.',
  `OBJECT_NAME` varchar(64) DEFAULT NULL COMMENT 'Object name.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Address in memory of the instrumented object.',
  `LOCK_TYPE` varchar(32) NOT NULL COMMENT 'Lock type. One of BACKUP_FTWRL1, BACKUP_START, BACKUP_TRANS_DML, EXCLUSIVE, INTENTION_EXCLUSIVE, SHARED, SHARED_HIGH_PRIO, SHARED_NO_READ_WRITE, SHARED_NO_WRITE, SHARED_READ, SHARED_UPGRADABLE or SHARED_WRITE.',
  `LOCK_DURATION` varchar(32) NOT NULL COMMENT 'Lock duration. One of EXPLICIT (locks released by explicit action, for example a global lock acquired with FLUSH TABLES WITH READ LOCK) , STATEMENT (locks implicitly released at statement end) or TRANSACTION (locks implicitly released at transaction end).',
  `LOCK_STATUS` varchar(32) NOT NULL COMMENT 'Lock status. One of GRANTED, KILLED, PENDING, POST_RELEASE_NOTIFY, PRE_ACQUIRE_NOTIFY, TIMEOUT or VICTIM.',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT 'Source file containing the instrumented code that produced the event, as well as the line number where the instrumentation occurred. This allows one to examine the source code involved.',
  `OWNER_THREAD_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'Thread that requested the lock.',
  `OWNER_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'Event that requested the lock.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.mutex_instances 구조 내보내기
CREATE TABLE IF NOT EXISTS `mutex_instances` (
  `NAME` varchar(128) NOT NULL COMMENT 'Instrument name associated with the mutex.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Memory address of the instrumented mutex.',
  `LOCKED_BY_THREAD_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'The THREAD_ID of the locking thread if a thread has a mutex locked, otherwise NULL.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.objects_summary_global_by_type 구조 내보내기
CREATE TABLE IF NOT EXISTS `objects_summary_global_by_type` (
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'Groups records together with OBJECT_SCHEMA and OBJECT_NAME.',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Groups records together with OBJECT_TYPE and OBJECT_NAME.',
  `OBJECT_NAME` varchar(64) DEFAULT NULL COMMENT 'Groups records together with OBJECT_SCHEMA and OBJECT_TYPE.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.performance_timers 구조 내보내기
CREATE TABLE IF NOT EXISTS `performance_timers` (
  `TIMER_NAME` enum('CYCLE','NANOSECOND','MICROSECOND','MILLISECOND','TICK') NOT NULL COMMENT 'Time name, used in the setup_timers table.',
  `TIMER_FREQUENCY` bigint(20) DEFAULT NULL COMMENT 'Number of timer units per second. Dependent on the processor speed.',
  `TIMER_RESOLUTION` bigint(20) DEFAULT NULL COMMENT 'Number of timer units by which timed values increase each time.',
  `TIMER_OVERHEAD` bigint(20) DEFAULT NULL COMMENT 'Minimum timer overhead, determined during initialization by calling the timer 20 times and selecting the smallest value. Total overhead will be at least double this, as the timer is called at the beginning and end of each timed event.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.prepared_statements_instances 구조 내보내기
CREATE TABLE IF NOT EXISTS `prepared_statements_instances` (
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'The address in memory of the instrumented prepared statement.',
  `STATEMENT_ID` bigint(20) unsigned NOT NULL COMMENT 'The internal statement ID assigned by the server.',
  `STATEMENT_NAME` varchar(64) DEFAULT NULL COMMENT 'For the binary protocol, this column is NULL. For the text protocol, this column is the external statement name assigned by the user.',
  `SQL_TEXT` longtext NOT NULL COMMENT 'The prepared statement text, with ? placeholder markers.',
  `OWNER_THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'Event thread id that created the prepared statement.',
  `OWNER_EVENT_ID` bigint(20) unsigned NOT NULL COMMENT 'Event id that created the prepared statement.',
  `OWNER_OBJECT_TYPE` enum('EVENT','FUNCTION','PROCEDURE','TABLE','TRIGGER') DEFAULT NULL COMMENT 'NULL for a prepared statement created by a client session. Type of the stored program that created the prepared statement.',
  `OWNER_OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'NULL for a prepared statement created by a client session. Schema of the stored program that created the prepared statement.',
  `OWNER_OBJECT_NAME` varchar(64) DEFAULT NULL COMMENT 'NULL for a prepared statement created by a client session. Name of the stored program that created the prepared statement.',
  `TIMER_PREPARE` bigint(20) unsigned NOT NULL COMMENT 'The time spent executing the statement preparation itself.',
  `COUNT_REPREPARE` bigint(20) unsigned NOT NULL COMMENT 'The number of times the statement was reprepared internally.',
  `COUNT_EXECUTE` bigint(20) unsigned NOT NULL COMMENT 'Total times the prepared statement was executed.',
  `SUM_TIMER_EXECUTE` bigint(20) unsigned NOT NULL COMMENT 'Total time spent executing all prepared statements.',
  `MIN_TIMER_EXECUTE` bigint(20) unsigned NOT NULL COMMENT 'Minimum time spent executing any of the prepared statements.',
  `AVG_TIMER_EXECUTE` bigint(20) unsigned NOT NULL COMMENT 'Average time spent executing any of the prepared statements.',
  `MAX_TIMER_EXECUTE` bigint(20) unsigned NOT NULL COMMENT 'Maximum time spent executing any of the prepared statements.',
  `SUM_LOCK_TIME` bigint(20) unsigned NOT NULL COMMENT 'The total time spent (in picoseconds) waiting for table locks for the prepared statements.',
  `SUM_ERRORS` bigint(20) unsigned NOT NULL COMMENT 'The total number of errors that occurend for the prepared statements.',
  `SUM_WARNINGS` bigint(20) unsigned NOT NULL COMMENT 'The total number of warnings that occurend for the prepared statements.',
  `SUM_ROWS_AFFECTED` bigint(20) unsigned NOT NULL COMMENT 'The total number of affected rows by the prepared statements.',
  `SUM_ROWS_SENT` bigint(20) unsigned NOT NULL COMMENT 'The total number of rows returned by the prepared statements.',
  `SUM_ROWS_EXAMINED` bigint(20) unsigned NOT NULL COMMENT 'The total number of rows examined by the prepared statements.',
  `SUM_CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL COMMENT 'The total number of on-disk temporary tables created by the prepared statements.',
  `SUM_CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL COMMENT 'The total number of in-memory temporary tables created by the prepared statements.',
  `SUM_SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL COMMENT 'The total number of full joins executed by the prepared statements.',
  `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL COMMENT 'The total number of range search joins executed by the prepared statements.',
  `SUM_SELECT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'The total number of joins that used ranges on the first table executed by the prepared statements.',
  `SUM_SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL COMMENT 'The total number of joins that check for key usage after each row executed by the prepared statements.',
  `SUM_SELECT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'The total number of joins that did a full scan of the first table executed by the prepared statements.',
  `SUM_SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL COMMENT 'The total number of merge passes that the sort algorithm has had to do for the prepared statements.',
  `SUM_SORT_RANGE` bigint(20) unsigned NOT NULL COMMENT 'The total number of sorts that were done using ranges for the prepared statements.',
  `SUM_SORT_ROWS` bigint(20) unsigned NOT NULL COMMENT 'The total number of sorted rows that were sorted by the prepared statements.',
  `SUM_SORT_SCAN` bigint(20) unsigned NOT NULL COMMENT 'The total number of sorts that were done by scanning the table by the prepared statements.',
  `SUM_NO_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'The total number of statements that performed a table scan without using an index.',
  `SUM_NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL COMMENT 'The total number of statements where no good index was found.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.replication_applier_configuration 구조 내보내기
CREATE TABLE IF NOT EXISTS `replication_applier_configuration` (
  `CHANNEL_NAME` char(64) NOT NULL COMMENT 'Replication channel name.',
  `DESIRED_DELAY` int(11) NOT NULL COMMENT 'Desired replica delay functionality not supported by MariaDB. Always 0.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.replication_applier_status 구조 내보내기
CREATE TABLE IF NOT EXISTS `replication_applier_status` (
  `CHANNEL_NAME` char(64) NOT NULL COMMENT 'The replication channel name.',
  `SERVICE_STATE` enum('ON','OFF') NOT NULL COMMENT 'Shows ON when the replication channel''s applier threads are active or idle, OFF means that the applier threads are not active.',
  `REMAINING_DELAY` int(10) unsigned DEFAULT NULL COMMENT 'Desired replica delay functionality not supported by MariaDB. Always 0.',
  `COUNT_TRANSACTIONS_RETRIES` bigint(20) unsigned NOT NULL COMMENT 'The number of retries that were made because the replication SQL thread failed to apply a transaction.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.replication_applier_status_by_coordinator 구조 내보내기
CREATE TABLE IF NOT EXISTS `replication_applier_status_by_coordinator` (
  `CHANNEL_NAME` char(64) NOT NULL COMMENT 'Replication channel name.',
  `THREAD_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'The SQL/coordinator thread ID.',
  `SERVICE_STATE` enum('ON','OFF') NOT NULL COMMENT 'ON (thread exists and is active or idle) or OFF (thread no longer exists).',
  `LAST_ERROR_NUMBER` int(11) NOT NULL COMMENT 'Last error number that caused the SQL/coordinator thread to stop.',
  `LAST_ERROR_MESSAGE` varchar(1024) NOT NULL COMMENT 'Last error message that caused the SQL/coordinator thread to stop.',
  `LAST_ERROR_TIMESTAMP` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Timestamp that shows when the most recent SQL/coordinator error occured.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.replication_connection_configuration 구조 내보내기
CREATE TABLE IF NOT EXISTS `replication_connection_configuration` (
  `CHANNEL_NAME` char(64) NOT NULL COMMENT 'The replication channel used.',
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The host name of the source that the replica is connected to.',
  `PORT` int(11) NOT NULL COMMENT 'The port used to connect to the source.',
  `USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The user name of the replication user account used to connect to the source.',
  `NETWORK_INTERFACE` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The network interface that the replica is bound to, if any.',
  `AUTO_POSITION` enum('1','0') NOT NULL COMMENT '1 if GTID auto-positioning is in use; otherwise 0.',
  `SSL_ALLOWED` enum('YES','NO','IGNORED') NOT NULL COMMENT 'Wether SSL is allowed for the replica connection.',
  `SSL_CA_FILE` varchar(512) NOT NULL COMMENT 'Path to the file that contains one or more certificates for trusted Certificate Authorities (CA) to use for TLS.',
  `SSL_CA_PATH` varchar(512) NOT NULL COMMENT 'Path to a directory that contains one or more PEM files that contain X509 certificates for a trusted Certificate Authority (CA) to use for TLS.',
  `SSL_CERTIFICATE` varchar(512) NOT NULL COMMENT 'Path to the certificate used to authenticate the master.',
  `SSL_CIPHER` varchar(512) NOT NULL COMMENT 'Which cipher is used for encription.',
  `SSL_KEY` varchar(512) NOT NULL COMMENT 'Path to the private key used for TLS.',
  `SSL_VERIFY_SERVER_CERTIFICATE` enum('YES','NO') NOT NULL COMMENT 'Wether the server certificate is verified as part of the SSL connection',
  `SSL_CRL_FILE` varchar(255) NOT NULL COMMENT 'Path to the PEM file containing one or more revoked X.509 certificates.',
  `SSL_CRL_PATH` varchar(255) NOT NULL COMMENT 'PATH to a folder containing PEM files containing one or more revoked X.509 certificates.',
  `CONNECTION_RETRY_INTERVAL` int(11) NOT NULL COMMENT 'The number of seconds between connect retries.',
  `CONNECTION_RETRY_COUNT` bigint(20) unsigned NOT NULL COMMENT 'The number of times the replica can attempt to reconnect to the source in the event of a lost connection.',
  `HEARTBEAT_INTERVAL` double(10,3) unsigned NOT NULL COMMENT 'Number of seconds after which a heartbeat will be sent.',
  `TLS_VERSION` varchar(255) NOT NULL COMMENT 'Not implemented, always blank.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.rwlock_instances 구조 내보내기
CREATE TABLE IF NOT EXISTS `rwlock_instances` (
  `NAME` varchar(128) NOT NULL COMMENT 'Instrument name associated with the read write lock',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Address in memory of the instrumented lock',
  `WRITE_LOCKED_BY_THREAD_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'THREAD_ID of the locking thread if locked in write (exclusive) mode, otherwise NULL.',
  `READ_LOCKED_BY_COUNT` int(10) unsigned NOT NULL COMMENT 'Count of current read locks held'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.session_account_connect_attrs 구조 내보내기
CREATE TABLE IF NOT EXISTS `session_account_connect_attrs` (
  `PROCESSLIST_ID` int(11) NOT NULL COMMENT 'Session connection identifier.',
  `ATTR_NAME` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Attribute name.',
  `ATTR_VALUE` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'Attribute value.',
  `ORDINAL_POSITION` int(11) DEFAULT NULL COMMENT 'Order in which attribute was added to the connection attributes.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.session_connect_attrs 구조 내보내기
CREATE TABLE IF NOT EXISTS `session_connect_attrs` (
  `PROCESSLIST_ID` int(11) NOT NULL COMMENT 'Session connection identifier.',
  `ATTR_NAME` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Attribute name.',
  `ATTR_VALUE` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'Attribute value.',
  `ORDINAL_POSITION` int(11) DEFAULT NULL COMMENT 'Order in which attribute was added to the connection attributes.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.session_status 구조 내보내기
CREATE TABLE IF NOT EXISTS `session_status` (
  `VARIABLE_NAME` varchar(64) NOT NULL COMMENT 'The session status variable name.',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL COMMENT 'The session status variable value.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.setup_actors 구조 내보내기
CREATE TABLE IF NOT EXISTS `setup_actors` (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '%' COMMENT 'Host name, either a literal, or the % wildcard representing any host.',
  `USER` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '%' COMMENT 'User name, either a literal or the % wildcard representing any name.',
  `ROLE` char(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '%' COMMENT 'Unused',
  `ENABLED` enum('YES','NO') NOT NULL DEFAULT 'YES' COMMENT 'Whether to enable instrumentation for foreground threads matched by the row.',
  `HISTORY` enum('YES','NO') NOT NULL DEFAULT 'YES' COMMENT 'Whether to log historical events for foreground threads matched by the row.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.setup_consumers 구조 내보내기
CREATE TABLE IF NOT EXISTS `setup_consumers` (
  `NAME` varchar(64) NOT NULL COMMENT 'Consumer name',
  `ENABLED` enum('YES','NO') NOT NULL COMMENT 'YES or NO for whether or not the consumer is enabled. You can modify this column to ensure that event information is added, or is not added.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.setup_instruments 구조 내보내기
CREATE TABLE IF NOT EXISTS `setup_instruments` (
  `NAME` varchar(128) NOT NULL COMMENT 'Instrument name',
  `ENABLED` enum('YES','NO') NOT NULL COMMENT 'Whether or not the instrument is enabled. It can be disabled, and the instrument will produce no events.',
  `TIMED` enum('YES','NO') NOT NULL COMMENT 'Whether or not the instrument is timed. It can be set, but if disabled, events produced by the instrument will have NULL values for the corresponding TIMER_START, TIMER_END, and TIMER_WAIT values.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.setup_objects 구조 내보내기
CREATE TABLE IF NOT EXISTS `setup_objects` (
  `OBJECT_TYPE` enum('EVENT','FUNCTION','PROCEDURE','TABLE','TRIGGER') NOT NULL DEFAULT 'TABLE' COMMENT 'Type of object to instrument.',
  `OBJECT_SCHEMA` varchar(64) DEFAULT '%' COMMENT 'Schema containing the object, either the literal or % for any schema.',
  `OBJECT_NAME` varchar(64) NOT NULL DEFAULT '%' COMMENT 'Name of the instrumented object, either the literal or % for any object.',
  `ENABLED` enum('YES','NO') NOT NULL DEFAULT 'YES' COMMENT 'Whether the object''s events are instrumented or not. Can be disabled, in which case monitoring is not enabled for those objects.',
  `TIMED` enum('YES','NO') NOT NULL DEFAULT 'YES' COMMENT 'Whether the object''s events are timed or not. Can be modified.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.setup_timers 구조 내보내기
CREATE TABLE IF NOT EXISTS `setup_timers` (
  `NAME` varchar(64) NOT NULL COMMENT 'Type of instrument the timer is used for.',
  `TIMER_NAME` enum('CYCLE','NANOSECOND','MICROSECOND','MILLISECOND','TICK') NOT NULL COMMENT 'Timer applying to the instrument type. Can be modified.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.socket_instances 구조 내보내기
CREATE TABLE IF NOT EXISTS `socket_instances` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'NAME from the setup_instruments table, and the name of the wait/io/socket/* instrument that produced the event.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Memory address of the object.',
  `THREAD_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'Thread identifier that the server assigns to each socket.',
  `SOCKET_ID` int(11) NOT NULL COMMENT 'The socket''s internal file handle.',
  `IP` varchar(64) NOT NULL COMMENT 'Client IP address. Blank for Unix socket file, otherwise an IPv4 or IPv6 address. Together with the PORT identifies the connection.',
  `PORT` int(11) NOT NULL COMMENT 'TCP/IP port number, from 0 to 65535. Together with the IP identifies the connection.',
  `STATE` enum('IDLE','ACTIVE') NOT NULL COMMENT 'Socket status, either IDLE if waiting to receive a request from a client, or ACTIVE'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.socket_summary_by_event_name 구조 내보내기
CREATE TABLE IF NOT EXISTS `socket_summary_by_event_name` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Socket instrument.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `COUNT_READ` bigint(20) unsigned NOT NULL COMMENT 'Number of all read operations, including RECV, RECVFROM, and RECVMSG.',
  `SUM_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all read operations that are timed.',
  `MIN_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all read operations that are timed.',
  `AVG_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all read operations that are timed.',
  `MAX_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all read operations that are timed.',
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) unsigned NOT NULL COMMENT 'Bytes read by read operations.',
  `COUNT_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Number of all write operations, including SEND, SENDTO, and SENDMSG.',
  `SUM_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all write operations that are timed.',
  `MIN_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all write operations that are timed.',
  `AVG_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all write operations that are timed.',
  `MAX_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all write operations that are timed.',
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Bytes written by write operations.',
  `COUNT_MISC` bigint(20) unsigned NOT NULL COMMENT 'Number of all miscellaneous operations not counted above, including CONNECT, LISTEN, ACCEPT, CLOSE, and SHUTDOWN.',
  `SUM_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all miscellaneous operations that are timed.',
  `MIN_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all miscellaneous operations that are timed.',
  `AVG_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all miscellaneous operations that are timed.',
  `MAX_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all miscellaneous operations that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.socket_summary_by_instance 구조 내보내기
CREATE TABLE IF NOT EXISTS `socket_summary_by_instance` (
  `EVENT_NAME` varchar(128) NOT NULL COMMENT 'Socket instrument.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'Address in memory.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `COUNT_READ` bigint(20) unsigned NOT NULL COMMENT 'Number of all read operations, including RECV, RECVFROM, and RECVMSG.',
  `SUM_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all read operations that are timed.',
  `MIN_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all read operations that are timed.',
  `AVG_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all read operations that are timed.',
  `MAX_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all read operations that are timed.',
  `SUM_NUMBER_OF_BYTES_READ` bigint(20) unsigned NOT NULL COMMENT 'Bytes read by read operations.',
  `COUNT_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Number of all write operations, including SEND, SENDTO, and SENDMSG.',
  `SUM_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all write operations that are timed.',
  `MIN_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all write operations that are timed.',
  `AVG_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all write operations that are timed.',
  `MAX_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all write operations that are timed.',
  `SUM_NUMBER_OF_BYTES_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Bytes written by write operations.',
  `COUNT_MISC` bigint(20) unsigned NOT NULL COMMENT 'Number of all miscellaneous operations not counted above, including CONNECT, LISTEN, ACCEPT, CLOSE, and SHUTDOWN.',
  `SUM_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all miscellaneous operations that are timed.',
  `MIN_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all miscellaneous operations that are timed.',
  `AVG_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all miscellaneous operations that are timed.',
  `MAX_TIMER_MISC` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all miscellaneous operations that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.status_by_account 구조 내보내기
CREATE TABLE IF NOT EXISTS `status_by_account` (
  `USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User for which the status variable is reported.',
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host for which the status variable is reported.',
  `VARIABLE_NAME` varchar(64) NOT NULL COMMENT 'Status variable name.',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL COMMENT 'Aggregated status variable value.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.status_by_host 구조 내보내기
CREATE TABLE IF NOT EXISTS `status_by_host` (
  `HOST` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Host for which the status variable is reported.',
  `VARIABLE_NAME` varchar(64) NOT NULL COMMENT 'Status variable name.',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL COMMENT 'Aggregated status variable value.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.status_by_thread 구조 내보내기
CREATE TABLE IF NOT EXISTS `status_by_thread` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'The thread identifier of the session in which the status variable is defined.',
  `VARIABLE_NAME` varchar(64) NOT NULL COMMENT 'Status variable name.',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL COMMENT 'Aggregated status variable value.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.status_by_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `status_by_user` (
  `USER` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'User for which the status variable is reported.',
  `VARIABLE_NAME` varchar(64) NOT NULL COMMENT 'Status variable name.',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL COMMENT 'Aggregated status variable value.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.table_handles 구조 내보내기
CREATE TABLE IF NOT EXISTS `table_handles` (
  `OBJECT_TYPE` varchar(64) NOT NULL COMMENT 'The table opened by a table handle.',
  `OBJECT_SCHEMA` varchar(64) NOT NULL COMMENT 'The schema that contains the object.',
  `OBJECT_NAME` varchar(64) NOT NULL COMMENT 'The name of the instrumented object.',
  `OBJECT_INSTANCE_BEGIN` bigint(20) unsigned NOT NULL COMMENT 'The table handle address in memory.',
  `OWNER_THREAD_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'The thread owning the table handle.',
  `OWNER_EVENT_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'The event which caused the table handle to be opened.',
  `INTERNAL_LOCK` varchar(64) DEFAULT NULL COMMENT 'The table lock used at the SQL level.',
  `EXTERNAL_LOCK` varchar(64) DEFAULT NULL COMMENT 'The table lock used at the storage engine level.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.table_io_waits_summary_by_index_usage 구조 내보내기
CREATE TABLE IF NOT EXISTS `table_io_waits_summary_by_index_usage` (
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'TABLE in the case of all indexes.',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Schema name.',
  `OBJECT_NAME` varchar(64) DEFAULT NULL COMMENT 'Table name.',
  `INDEX_NAME` varchar(64) DEFAULT NULL COMMENT 'Index name, or PRIMARY for the primary index, NULL for no index (inserts are counted in this case).',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events and the sum of the x_READ and x_WRITE columns.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `COUNT_READ` bigint(20) unsigned NOT NULL COMMENT 'Number of all read operations, and the sum of the equivalent x_FETCH columns.',
  `SUM_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all read operations that are timed.',
  `MIN_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all read operations that are timed.',
  `AVG_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all read operations that are timed.',
  `MAX_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all read operations that are timed.',
  `COUNT_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Number of all write operations, and the sum of the equivalent x_INSERT, x_UPDATE and x_DELETE columns.',
  `SUM_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all write operations that are timed.',
  `MIN_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all write operations that are timed.',
  `AVG_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all write operations that are timed.',
  `MAX_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all write operations that are timed.',
  `COUNT_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Number of all fetch operations.',
  `SUM_TIMER_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all fetch operations that are timed.',
  `MIN_TIMER_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all fetch operations that are timed.',
  `AVG_TIMER_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all fetch operations that are timed.',
  `MAX_TIMER_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all fetch operations that are timed.',
  `COUNT_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Number of all insert operations.',
  `SUM_TIMER_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all insert operations that are timed.',
  `MIN_TIMER_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all insert operations that are timed.',
  `AVG_TIMER_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all insert operations that are timed.',
  `MAX_TIMER_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all insert operations that are timed.',
  `COUNT_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Number of all update operations.',
  `SUM_TIMER_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all update operations that are timed.',
  `MIN_TIMER_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all update operations that are timed.',
  `AVG_TIMER_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all update operations that are timed.',
  `MAX_TIMER_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all update operations that are timed.',
  `COUNT_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Number of all delete operations.',
  `SUM_TIMER_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all delete operations that are timed.',
  `MIN_TIMER_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all delete operations that are timed.',
  `AVG_TIMER_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all delete operations that are timed.',
  `MAX_TIMER_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all delete operations that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.table_io_waits_summary_by_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `table_io_waits_summary_by_table` (
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'Since this table records waits by table, always set to TABLE.',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Schema name.',
  `OBJECT_NAME` varchar(64) DEFAULT NULL COMMENT 'Table name.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events and the sum of the x_READ and x_WRITE columns.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `COUNT_READ` bigint(20) unsigned NOT NULL COMMENT 'Number of all read operations, and the sum of the equivalent x_FETCH columns.',
  `SUM_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all read operations that are timed.',
  `MIN_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all read operations that are timed.',
  `AVG_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all read operations that are timed.',
  `MAX_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all read operations that are timed.',
  `COUNT_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Number of all write operations, and the sum of the equivalent x_INSERT, x_UPDATE and x_DELETE columns.',
  `SUM_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all write operations that are timed.',
  `MIN_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all write operations that are timed.',
  `AVG_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all write operations that are timed.',
  `MAX_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all write operations that are timed.',
  `COUNT_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Number of all fetch operations.',
  `SUM_TIMER_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all fetch operations that are timed.',
  `MIN_TIMER_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all fetch operations that are timed.',
  `AVG_TIMER_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all fetch operations that are timed.',
  `MAX_TIMER_FETCH` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all fetch operations that are timed.',
  `COUNT_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Number of all insert operations.',
  `SUM_TIMER_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all insert operations that are timed.',
  `MIN_TIMER_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all insert operations that are timed.',
  `AVG_TIMER_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all insert operations that are timed.',
  `MAX_TIMER_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all insert operations that are timed.',
  `COUNT_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Number of all update operations.',
  `SUM_TIMER_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all update operations that are timed.',
  `MIN_TIMER_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all update operations that are timed.',
  `AVG_TIMER_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all update operations that are timed.',
  `MAX_TIMER_UPDATE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all update operations that are timed.',
  `COUNT_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Number of all delete operations.',
  `SUM_TIMER_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all delete operations that are timed.',
  `MIN_TIMER_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all delete operations that are timed.',
  `AVG_TIMER_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all delete operations that are timed.',
  `MAX_TIMER_DELETE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all delete operations that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.table_lock_waits_summary_by_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `table_lock_waits_summary_by_table` (
  `OBJECT_TYPE` varchar(64) DEFAULT NULL COMMENT 'Since this table records waits by table, always set to TABLE.',
  `OBJECT_SCHEMA` varchar(64) DEFAULT NULL COMMENT 'Schema name.',
  `OBJECT_NAME` varchar(64) DEFAULT NULL COMMENT 'Table name.',
  `COUNT_STAR` bigint(20) unsigned NOT NULL COMMENT 'Number of summarized events and the sum of the x_READ and x_WRITE columns.',
  `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of the summarized events that are timed.',
  `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of the summarized events that are timed.',
  `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of the summarized events that are timed.',
  `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of the summarized events that are timed.',
  `COUNT_READ` bigint(20) unsigned NOT NULL COMMENT 'Number of all read operations, and the sum of the equivalent x_READ_NORMAL, x_READ_WITH_SHARED_LOCKS, x_READ_HIGH_PRIORITY and x_READ_NO_INSERT columns.',
  `SUM_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all read operations that are timed.',
  `MIN_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all read operations that are timed.',
  `AVG_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all read operations that are timed.',
  `MAX_TIMER_READ` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all read operations that are timed.',
  `COUNT_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Number of all write operations, and the sum of the equivalent x_WRITE_ALLOW_WRITE, x_WRITE_CONCURRENT_INSERT, x_WRITE_DELAYED, x_WRITE_LOW_PRIORITY and x_WRITE_NORMAL columns.',
  `SUM_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all write operations that are timed.',
  `MIN_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all write operations that are timed.',
  `AVG_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all write operations that are timed.',
  `MAX_TIMER_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all write operations that are timed.',
  `COUNT_READ_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Number of all internal read normal locks.',
  `SUM_TIMER_READ_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all internal read normal locks that are timed.',
  `MIN_TIMER_READ_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all internal read normal locks that are timed.',
  `AVG_TIMER_READ_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all internal read normal locks that are timed.',
  `MAX_TIMER_READ_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all internal read normal locks that are timed.',
  `COUNT_READ_WITH_SHARED_LOCKS` bigint(20) unsigned NOT NULL COMMENT 'Number of all internal read with shared locks.',
  `SUM_TIMER_READ_WITH_SHARED_LOCKS` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all internal read with shared locks that are timed.',
  `MIN_TIMER_READ_WITH_SHARED_LOCKS` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all internal read with shared locks that are timed.',
  `AVG_TIMER_READ_WITH_SHARED_LOCKS` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all internal read with shared locks that are timed.',
  `MAX_TIMER_READ_WITH_SHARED_LOCKS` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all internal read with shared locks that are timed.',
  `COUNT_READ_HIGH_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Number of all internal read high priority locks.',
  `SUM_TIMER_READ_HIGH_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all internal read high priority locks that are timed.',
  `MIN_TIMER_READ_HIGH_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all internal read high priority locks that are timed.',
  `AVG_TIMER_READ_HIGH_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all internal read high priority locks that are timed.',
  `MAX_TIMER_READ_HIGH_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all internal read high priority locks that are timed.',
  `COUNT_READ_NO_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Number of all internal read no insert locks.',
  `SUM_TIMER_READ_NO_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all internal read no insert locks that are timed.',
  `MIN_TIMER_READ_NO_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all internal read no insert locks that are timed.',
  `AVG_TIMER_READ_NO_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all internal read no insert locks that are timed.',
  `MAX_TIMER_READ_NO_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all internal read no insert locks that are timed.',
  `COUNT_READ_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Number of all external read locks.',
  `SUM_TIMER_READ_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all external read locks that are timed.',
  `MIN_TIMER_READ_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all external read locks that are timed.',
  `AVG_TIMER_READ_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all external read locks that are timed.',
  `MAX_TIMER_READ_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all external read locks that are timed.',
  `COUNT_WRITE_ALLOW_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Number of all internal read normal locks.',
  `SUM_TIMER_WRITE_ALLOW_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all internal write allow write locks that are timed.',
  `MIN_TIMER_WRITE_ALLOW_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all internal write allow write locks that are timed.',
  `AVG_TIMER_WRITE_ALLOW_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all internal write allow write locks that are timed.',
  `MAX_TIMER_WRITE_ALLOW_WRITE` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all internal write allow write locks that are timed.',
  `COUNT_WRITE_CONCURRENT_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Number of all internal concurrent insert write locks.',
  `SUM_TIMER_WRITE_CONCURRENT_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all internal concurrent insert write locks that are timed.',
  `MIN_TIMER_WRITE_CONCURRENT_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all internal concurrent insert write locks that are timed.',
  `AVG_TIMER_WRITE_CONCURRENT_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all internal concurrent insert write locks that are timed.',
  `MAX_TIMER_WRITE_CONCURRENT_INSERT` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all internal concurrent insert write locks that are timed.',
  `COUNT_WRITE_DELAYED` bigint(20) unsigned NOT NULL COMMENT 'Number of all internal write delayed locks.',
  `SUM_TIMER_WRITE_DELAYED` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all internal write delayed locks that are timed.',
  `MIN_TIMER_WRITE_DELAYED` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all internal write delayed locks that are timed.',
  `AVG_TIMER_WRITE_DELAYED` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all internal write delayed locks that are timed.',
  `MAX_TIMER_WRITE_DELAYED` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all internal write delayed locks that are timed.',
  `COUNT_WRITE_LOW_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Number of all internal write low priority locks.',
  `SUM_TIMER_WRITE_LOW_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all internal write low priority locks that are timed.',
  `MIN_TIMER_WRITE_LOW_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all internal write low priority locks that are timed.',
  `AVG_TIMER_WRITE_LOW_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all internal write low priority locks that are timed.',
  `MAX_TIMER_WRITE_LOW_PRIORITY` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all internal write low priority locks that are timed.',
  `COUNT_WRITE_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Number of all internal write normal locks.',
  `SUM_TIMER_WRITE_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all internal write normal locks that are timed.',
  `MIN_TIMER_WRITE_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all internal write normal locks that are timed.',
  `AVG_TIMER_WRITE_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all internal write normal locks that are timed.',
  `MAX_TIMER_WRITE_NORMAL` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all internal write normal locks that are timed.',
  `COUNT_WRITE_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Number of all external write locks.',
  `SUM_TIMER_WRITE_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Total wait time of all external write locks that are timed.',
  `MIN_TIMER_WRITE_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Minimum wait time of all external write locks that are timed.',
  `AVG_TIMER_WRITE_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Average wait time of all external write locks that are timed.',
  `MAX_TIMER_WRITE_EXTERNAL` bigint(20) unsigned NOT NULL COMMENT 'Maximum wait time of all external write locks that are timed.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.threads 구조 내보내기
CREATE TABLE IF NOT EXISTS `threads` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'A unique thread identifier.',
  `NAME` varchar(128) NOT NULL COMMENT 'Name associated with the server''s thread instrumentation code, for example thread/sql/main for the server''s main() function, and thread/sql/one_connection for a user connection.',
  `TYPE` varchar(10) NOT NULL COMMENT 'FOREGROUND or BACKGROUND, depending on the thread type. User connection threads are FOREGROUND, internal server threads are BACKGROUND.',
  `PROCESSLIST_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'The PROCESSLIST.ID value for threads displayed in the INFORMATION_SCHEMA.PROCESSLIST table, or 0 for background threads. Also corresponds with the CONNECTION_ID() return value for the thread.',
  `PROCESSLIST_USER` varchar(128) DEFAULT NULL COMMENT 'Foreground thread user, or NULL for a background thread.',
  `PROCESSLIST_HOST` varchar(60) DEFAULT NULL COMMENT 'Foreground thread host, or NULL for a background thread.',
  `PROCESSLIST_DB` varchar(64) DEFAULT NULL COMMENT 'Thread''s default database, or NULL if none exists.',
  `PROCESSLIST_COMMAND` varchar(16) DEFAULT NULL COMMENT 'Type of command executed by the thread. These correspond to the the COM_xxx client/server protocol commands, and the Com_xxx status variables. See Thread Command Values.',
  `PROCESSLIST_TIME` bigint(20) DEFAULT NULL COMMENT 'Time in seconds the thread has been in its current state.',
  `PROCESSLIST_STATE` varchar(64) DEFAULT NULL COMMENT 'Action, event or state indicating what the thread is doing.',
  `PROCESSLIST_INFO` longtext DEFAULT NULL COMMENT 'Statement being executed by the thread, or NULL if a statement is not being executed. If a statement results in calling other statements, such as for a stored procedure, the innermost statement from the stored procedure is shown here.',
  `PARENT_THREAD_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'THREAD_ID of the parent thread, if any. Subthreads can for example be spawned as a result of INSERT DELAYED statements.',
  `ROLE` varchar(64) DEFAULT NULL COMMENT 'Unused.',
  `INSTRUMENTED` enum('YES','NO') NOT NULL COMMENT 'YES or NO for Whether the thread is instrumented or not. For foreground threads, the initial value is determined by whether there''s a user/host match in the setup_actors table. Subthreads are again matched, while for background threads, this will be set to YES by default. To monitor events that the thread executes, INSTRUMENTED must be YES and the thread_instrumentation consumer in the setup_consumers table must also be YES.',
  `HISTORY` enum('YES','NO') NOT NULL COMMENT 'Whether to log historical events for the thread.',
  `CONNECTION_TYPE` varchar(16) DEFAULT NULL COMMENT 'The protocol used to establish the connection, or NULL for background threads.',
  `THREAD_OS_ID` bigint(20) unsigned DEFAULT NULL COMMENT 'The thread or task identifier as defined by the underlying operating system, if there is one.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `USER` char(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The connection''s client user name for the connection, or NULL if an internal thread.',
  `CURRENT_CONNECTIONS` bigint(20) NOT NULL COMMENT 'Current connections for the user.',
  `TOTAL_CONNECTIONS` bigint(20) NOT NULL COMMENT 'Total connections for the user.'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 performance_schema.user_variables_by_thread 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_variables_by_thread` (
  `THREAD_ID` bigint(20) unsigned NOT NULL COMMENT 'The thread identifier of the session in which the variable is defined.',
  `VARIABLE_NAME` varchar(64) NOT NULL COMMENT 'The variable name, without the leading @ character.',
  `VARIABLE_VALUE` longblob DEFAULT NULL COMMENT 'The variable value'
) ENGINE=PERFORMANCE_SCHEMA DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- silla_cms 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `silla_cms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `silla_cms`;

-- 테이블 silla_cms.am 구조 내보내기
CREATE TABLE IF NOT EXISTS `am` (
  `SEQ` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유키',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DATE` datetime DEFAULT NULL COMMENT '시작일자',
  `END_DATE` datetime DEFAULT NULL COMMENT '종료일자',
  `COUNT` int(11) DEFAULT NULL COMMENT '숫자값',
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용(에디터)',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.blogboard 구조 내보내기
CREATE TABLE IF NOT EXISTS `blogboard` (
  `BOARDNO` int(11) NOT NULL,
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTENTS` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WRITHER` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATEDATE` date DEFAULT NULL,
  PRIMARY KEY (`BOARDNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtccmmnclcode 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtccmmnclcode` (
  `CL_CODE` char(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '분류코드',
  `CL_CODE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '분류코드명',
  `CL_CODE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '분류코드설명',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`CL_CODE`),
  UNIQUE KEY `COMTCCMMNCLCODE_PK` (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통분류코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtccmmncode 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtccmmncode` (
  `CODE_ID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드ID',
  `CODE_ID_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드 명',
  `CODE_ID_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드 설명',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `CL_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '분류코드',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`CODE_ID`),
  UNIQUE KEY `COMTCCMMNCODE_PK` (`CODE_ID`),
  KEY `COMTCCMMNCODE_i01` (`CL_CODE`),
  CONSTRAINT `COMTCCMMNCODE_FK1` FOREIGN KEY (`CL_CODE`) REFERENCES `comtccmmnclcode` (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtccmmndetailcode 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtccmmndetailcode` (
  `CODE_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드ID',
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드',
  `CODE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드명',
  `CODE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드설명',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `SORT_ORDER` int(11) DEFAULT NULL COMMENT '정렬순서',
  `ATTR1` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추가필드1',
  `ATTR2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추가필드2',
  PRIMARY KEY (`CODE_ID`,`CODE`),
  UNIQUE KEY `COMTCCMMNDETAILCODE_PK` (`CODE_ID`,`CODE`),
  KEY `COMTCCMMNDETAILCODE_i01` (`CODE_ID`),
  CONSTRAINT `COMTCCMMNDETAILCODE_FK1` FOREIGN KEY (`CODE_ID`) REFERENCES `comtccmmncode` (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통상세코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtecopseq 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtecopseq` (
  `table_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '테이블명',
  `next_id` decimal(30,0) DEFAULT NULL COMMENT '다음아이디',
  PRIMARY KEY (`table_name`),
  UNIQUE KEY `tbl_COMTECOPSEQ` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='COMTECOPSEQ';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comthconfmhistory 구조 내보내기
CREATE TABLE IF NOT EXISTS `comthconfmhistory` (
  `CONFM_NO` decimal(8,0) NOT NULL COMMENT '승인번호',
  `CONFM_RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '승인요청자ID',
  `CONFMER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인자ID',
  `CONFM_DE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '승인일',
  `CONFM_TY_CODE` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '승인유형코드',
  `CONFM_STTUS_CODE` char(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '승인상태코드',
  `OPERT_TY_CODE` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작업유형코드',
  `OPERT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작업ID',
  `TRGET_JOB_TY_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대상업무유형코드',
  `TRGET_JOB_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대상업무ID',
  PRIMARY KEY (`CONFM_NO`),
  UNIQUE KEY `COMTHCONFMHISTORY_PK` (`CONFM_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='승인이력';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comthprogrmchangedtls 구조 내보내기
CREATE TABLE IF NOT EXISTS `comthprogrmchangedtls` (
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램파일명',
  `REQUST_NO` decimal(10,0) NOT NULL DEFAULT 0 COMMENT '요청번호',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청자ID',
  `CHANGE_REQUST_CN` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변경요청내용',
  `REQUST_PROCESS_CN` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청처리내용',
  `OPETR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리자ID',
  `PROCESS_STTUS_CODE` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '처리상태코드',
  `PROCESS_DE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리일',
  `RQESTDE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청일',
  `REQUST_SJ` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청제목',
  PRIMARY KEY (`PROGRM_FILE_NM`,`REQUST_NO`),
  UNIQUE KEY `COMTHPROGRMCHANGEDTLS_PK` (`PROGRM_FILE_NM`,`REQUST_NO`),
  KEY `COMTHPROGRMCHANGEDTLS_i01` (`PROGRM_FILE_NM`),
  CONSTRAINT `COMTHPROGRMCHANGEDTLS_FK1` FOREIGN KEY (`PROGRM_FILE_NM`) REFERENCES `comtnprogrmlist` (`PROGRM_FILE_NM`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램변경내역';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comthsyshist 구조 내보내기
CREATE TABLE IF NOT EXISTS `comthsyshist` (
  `HIST_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력ID',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `HIST_SE_CODE` char(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력구분코드',
  `HIST_CN` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이력내용',
  `SYS_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '시스템명',
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일ID',
  PRIMARY KEY (`HIST_ID`),
  UNIQUE KEY `COMTHSYSHIST_PK` (`HIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='시스템이력';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnauthorgroupinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnauthorgroupinfo` (
  `GROUP_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '그룹ID',
  `GROUP_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '그룹명',
  `GROUP_CREAT_DE` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '그룹생성일',
  `GROUP_DC` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹설명',
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `COMTNAUTHORGROUPINFO_PK` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='권한그룹정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnauthorinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnauthorinfo` (
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '권한코드',
  `AUTHOR_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한명',
  `AUTHOR_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한설명',
  `AUTHOR_CREAT_DE` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한생성일',
  `AUTHOR_ADM` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자권한여부 (S: SYSTEM 기본, Y:관리자, N:사용자)',
  PRIMARY KEY (`AUTHOR_CODE`),
  UNIQUE KEY `COMTNAUTHORINFO_PK` (`AUTHOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='권한정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnauthorrolerelate 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnauthorrolerelate` (
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  `ROLE_CODE` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '롤코드',
  `CREAT_DT` datetime DEFAULT NULL COMMENT '생성일시',
  PRIMARY KEY (`AUTHOR_CODE`,`ROLE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='권한롤관계';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnbbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnbbs` (
  `ntt_id` decimal(20,0) NOT NULL COMMENT '게시물ID',
  `bbs_id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판ID',
  `ntt_no` decimal(20,0) DEFAULT NULL COMMENT '게시물번호',
  `ntt_sj` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시물제목',
  `ntt_cn` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시물내용',
  `answer_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '댓글여부',
  `parntsctt_no` decimal(10,0) DEFAULT NULL COMMENT '부모글번호',
  `answer_lc` decimal(8,0) DEFAULT NULL COMMENT '댓글위치',
  `sort_ordr` decimal(8,0) DEFAULT NULL COMMENT '정렬순서',
  `rdcnt` decimal(10,0) DEFAULT NULL COMMENT '조회수',
  `use_at` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `ntce_bgnde` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시시작일',
  `ntce_endde` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시종료일',
  `ntcr_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시자ID',
  `ntcr_nm` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시자명',
  `password` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `atch_file_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일ID',
  `notice_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공지사항여부',
  `sj_bold_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목볼드여부',
  `secret_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀글여부',
  `frst_regist_pnttm` datetime NOT NULL COMMENT '최초등록시점',
  `frst_register_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '최초등록자ID',
  `last_updt_pnttm` datetime DEFAULT NULL COMMENT '최종수정시점',
  `last_updusr_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `blog_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '블로그 ID',
  PRIMARY KEY (`ntt_id`,`bbs_id`),
  UNIQUE KEY `COMTNBBS_PK` (`ntt_id`,`bbs_id`),
  KEY `COMTNBBS_i01` (`bbs_id`),
  CONSTRAINT `COMTNBBS_FK1` FOREIGN KEY (`bbs_id`) REFERENCES `comtnbbsmaster` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnbbsmaster 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnbbsmaster` (
  `bbs_id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판ID',
  `bbs_nm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판명',
  `bbs_intrcn` varchar(2400) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판소개',
  `bbs_ty_code` char(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판유형코드',
  `reply_posbl_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답장가능여부',
  `file_atch_posbl_at` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일첨부가능여부',
  `atch_posbl_file_number` decimal(2,0) NOT NULL COMMENT '첨부가능파일숫자',
  `atch_posbl_file_size` decimal(8,0) DEFAULT NULL COMMENT '첨부가능파일사이즈',
  `use_at` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `tmplat_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿ID',
  `cmmnty_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '커뮤니티ID',
  `frst_register_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '최초등록자ID',
  `frst_regist_pnttm` datetime NOT NULL COMMENT '최초등록시점',
  `last_updusr_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `last_updt_pnttm` datetime DEFAULT NULL COMMENT '최종수정시점',
  `blog_id` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '블로그 ID',
  `blog_at` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '블로그 여부',
  PRIMARY KEY (`bbs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판마스터';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnbbsmasteroptn 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnbbsmasteroptn` (
  `BBS_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판ID',
  `ANSWER_AT` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '댓글여부',
  `STSFDG_AT` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '만족도여부',
  `FRST_REGIST_PNTTM` datetime NOT NULL COMMENT '최초등록시점',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '최초등록자ID',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`BBS_ID`),
  UNIQUE KEY `COMTNBBSMASTEROPTN_PK` (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판마스터옵션';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnemplyrinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnemplyrinfo` (
  `EMPLYR_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '업무사용자ID',
  `ORGNZT_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직ID',
  `USER_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자명',
  `PASSWORD` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀번호',
  `EMPL_NO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사원번호',
  `IHIDNUM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주민등록번호',
  `SEXDSTN_CODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별코드',
  `BRTHDY` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '생일',
  `FXNUM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팩스번호',
  `HOUSE_ADRES` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주택주소',
  `PASSWORD_HINT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호힌트',
  `PASSWORD_CNSR` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호정답',
  `HOUSE_END_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주택끝전화번호',
  `AREA_NO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '지역번호',
  `DETAIL_ADRES` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세주소',
  `ZIP` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '우편번호',
  `OFFM_TELNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사무실전화번호',
  `MBTLNUM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이동전화번호',
  `EMAIL_ADRES` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일주소',
  `OFCPS_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '직위명',
  `HOUSE_MIDDLE_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주택중간전화번호',
  `GROUP_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹ID',
  `PSTINST_CODE` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소속기관코드',
  `EMPLYR_STTUS_CODE` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자상태코드',
  `ESNTL_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유ID',
  `CRTFC_DN_VALUE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인증DN값',
  `SBSCRB_DE` datetime DEFAULT NULL COMMENT '가입일자',
  `LOCK_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잠금여부',
  `LOCK_CNT` decimal(3,0) DEFAULT NULL COMMENT '잠금회수',
  `LOCK_LAST_PNTTM` datetime DEFAULT NULL COMMENT '잠금최종시점',
  `LAST_LOGIN` datetime DEFAULT NULL COMMENT '최종로그인시간',
  `PWD_CHNG_YN` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`EMPLYR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='업무사용자정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnemplyrscrtyestbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnemplyrscrtyestbs` (
  `SCRTY_DTRMN_TRGET_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '보안설정대상ID',
  `MBER_TY_CODE` char(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원유형코드',
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  KEY `comtnemplyrscrtyestbs_i04` (`AUTHOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자보안설정';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnerrorlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnerrorlog` (
  `seq` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `method_nm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '호출된메소드',
  `error_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '에러URL',
  `error_nm` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '에러명',
  `error_cont` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '에러내용',
  `parameter` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파라미터',
  `menu_no` decimal(20,0) DEFAULT NULL COMMENT '메뉴번호',
  `menu_nm` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴명',
  `site` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트(A:관리자, U:사용자)',
  `reg_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `reg_dt` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6403 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통에러로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnfile 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnfile` (
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `CREAT_DT` datetime NOT NULL COMMENT '생성일시',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  PRIMARY KEY (`ATCH_FILE_ID`),
  UNIQUE KEY `COMTNFILE_PK` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일속성';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnfiledetail 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnfiledetail` (
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `FILE_SN` decimal(10,0) NOT NULL COMMENT '파일순번',
  `FILE_STRE_COURS` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일저장경로',
  `STRE_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '저장파일명',
  `ORIGNL_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원파일명',
  `FILE_EXTSN` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일확장자',
  `FILE_CN` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일내용',
  `FILE_SIZE` decimal(8,0) DEFAULT NULL COMMENT '파일크기',
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`),
  UNIQUE KEY `COMTNFILEDETAIL_PK` (`ATCH_FILE_ID`,`FILE_SN`),
  KEY `COMTNFILEDETAIL_i01` (`ATCH_FILE_ID`),
  CONSTRAINT `COMTNFILEDETAIL_FK1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `comtnfile` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일상세정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtngnrlmber 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtngnrlmber` (
  `MBER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '회원ID',
  `PASSWORD` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀번호',
  `PASSWORD_HINT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호힌트',
  `PASSWORD_CNSR` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호정답',
  `IHIDNUM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주민등록번호',
  `MBER_NM` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '회원명',
  `ZIP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우편번호',
  `ADRES` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `AREA_NO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지역번호',
  `MBER_STTUS` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원상태',
  `DETAIL_ADRES` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세주소',
  `END_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '끝전화번호',
  `MBTLNUM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이동전화번호',
  `GROUP_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹ID',
  `MBER_FXNUM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원팩스번호',
  `MBER_EMAIL_ADRES` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원이메일주소',
  `MIDDLE_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '중간전화번호',
  `SBSCRB_DE` datetime DEFAULT NULL COMMENT '가입일자',
  `SEXDSTN_CODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별코드',
  `ESNTL_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유ID',
  `LOCK_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잠금여부',
  `LOCK_CNT` decimal(3,0) DEFAULT NULL COMMENT '잠금회수',
  `LOCK_LAST_PNTTM` datetime DEFAULT NULL COMMENT '잠금최종시점',
  `SECESSION_REASON` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴사유',
  `SECESSION_DT` datetime DEFAULT NULL COMMENT '탈퇴일자',
  `PASS_CHG_DT` datetime DEFAULT NULL COMMENT '비밀번호 변경일자',
  PRIMARY KEY (`MBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='일반회원';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnloginlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnloginlog` (
  `LOG_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '로그ID',
  `CONECT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속ID',
  `CONECT_IP` varchar(23) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속IP',
  `CONECT_MTHD` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속방식',
  `ERROR_OCCRRNC_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오류발생여부',
  `ERROR_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오류코드',
  `CREAT_DT` datetime DEFAULT NULL COMMENT '생성일시',
  PRIMARY KEY (`LOG_ID`),
  UNIQUE KEY `COMTNLOGINLOG_PK` (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='접속로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnmenucreatdtls 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnmenucreatdtls` (
  `MENU_NO` decimal(20,0) NOT NULL COMMENT '메뉴번호',
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  `MAPNG_CREAT_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '매핑생성ID',
  PRIMARY KEY (`MENU_NO`,`AUTHOR_CODE`),
  UNIQUE KEY `COMTNMENUCREATDTLS_PK` (`MENU_NO`,`AUTHOR_CODE`),
  KEY `COMTNMENUCREATDTLS_i02` (`MENU_NO`),
  KEY `COMTNMENUCREATDTLS_i03` (`MAPNG_CREAT_ID`),
  KEY `COMTNMENUCREATDTLS_i04` (`AUTHOR_CODE`),
  CONSTRAINT `COMTNMENUCREATDTLS_FK1` FOREIGN KEY (`AUTHOR_CODE`) REFERENCES `comtnauthorinfo` (`AUTHOR_CODE`),
  CONSTRAINT `COMTNMENUCREATDTLS_FK2` FOREIGN KEY (`MENU_NO`) REFERENCES `comtnmenuinfo` (`MENU_NO`) ON DELETE CASCADE,
  CONSTRAINT `COMTNMENUCREATDTLS_FK3` FOREIGN KEY (`MAPNG_CREAT_ID`) REFERENCES `comtnsitemap` (`MAPNG_CREAT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메뉴생성내역';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnmenuinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnmenuinfo` (
  `MENU_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴명',
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램파일명',
  `MENU_NO` decimal(20,0) NOT NULL COMMENT '메뉴번호',
  `UPPER_MENU_NO` decimal(20,0) DEFAULT NULL COMMENT '상위메뉴번호',
  `MENU_ORDR` decimal(5,0) NOT NULL COMMENT '메뉴순서',
  `MENU_DC` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴설명',
  `RELATE_IMAGE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계이미지경로',
  `RELATE_IMAGE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계이미지명',
  `MENU_VIEW_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 표시여부',
  `USER_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자유형',
  PRIMARY KEY (`MENU_NO`),
  UNIQUE KEY `COMTNMENUINFO_PK` (`MENU_NO`),
  KEY `COMTNMENUINFO_FK2` (`PROGRM_FILE_NM`),
  KEY `COMTNMENUINFO_i02` (`UPPER_MENU_NO`),
  CONSTRAINT `COMTNMENUINFO_FK1` FOREIGN KEY (`UPPER_MENU_NO`) REFERENCES `comtnmenuinfo` (`MENU_NO`) ON DELETE CASCADE,
  CONSTRAINT `COMTNMENUINFO_FK2` FOREIGN KEY (`PROGRM_FILE_NM`) REFERENCES `comtnprogrmlist` (`PROGRM_FILE_NM`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메뉴정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnprogrmlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnprogrmlist` (
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '프로그램파일명',
  `PROGRM_STRE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램저장경로',
  `PROGRM_KOREAN_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램한글명',
  `PROGRM_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램설명',
  `URL` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'URL',
  PRIMARY KEY (`PROGRM_FILE_NM`),
  UNIQUE KEY `COMTNPROGRMLIST_PK` (`PROGRM_FILE_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램목록';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnrestde 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnrestde` (
  `RESTDE_NO` decimal(6,0) NOT NULL COMMENT '휴일번호',
  `RESTDE` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일',
  `RESTDE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일명',
  `RESTDE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일설명',
  `RESTDE_SE_CODE` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일구분코드',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`RESTDE_NO`),
  UNIQUE KEY `COMTNRESTDE_PK` (`RESTDE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='휴일관리';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnroleinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnroleinfo` (
  `ROLE_CODE` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '롤코드',
  `ROLE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '롤명',
  `ROLE_PTTRN` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤패턴',
  `ROLE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤설명',
  `ROLE_TY` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤유형',
  `ROLE_SORT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '롤정렬',
  `ROLE_CREAT_DE` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '롤생성일',
  PRIMARY KEY (`ROLE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='롤정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnroles_hierarchy 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnroles_hierarchy` (
  `PARNTS_ROLE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '부모롤',
  `CHLDRN_ROLE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '자식롤',
  PRIMARY KEY (`PARNTS_ROLE`,`CHLDRN_ROLE`),
  UNIQUE KEY `comtnroles_hierarchy_i01` (`PARNTS_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='롤 계층구조';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnschdulinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnschdulinfo` (
  `SCHDUL_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '일정ID',
  `SCHDUL_SE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정구분',
  `SCHDUL_DEPT_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정부서ID',
  `SCHDUL_KND_CODE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SCHDUL_BGNDE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정시작일',
  `SCHDUL_ENDDE` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정종료일',
  `SCHDUL_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정명',
  `SCHDUL_CN` varchar(2500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정내용',
  `SCHDUL_PLACE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정장소',
  `SCHDUL_IPCR_CODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정중요도코드',
  `SCHDUL_CHARGER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '일정담당자ID',
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일ID',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `REPTIT_SE_CODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '반복구분코드',
  PRIMARY KEY (`SCHDUL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='일정정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnsitemap 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnsitemap` (
  `MAPNG_CREAT_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '매핑생성ID',
  `CREATR_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '생성자ID',
  `MAPNG_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '매핑파일명',
  `MAPNG_FILE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '매핑파일경로',
  PRIMARY KEY (`MAPNG_CREAT_ID`),
  UNIQUE KEY `COMTNSITEMAP_PK` (`MAPNG_CREAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사이트맵';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnsyslog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnsyslog` (
  `REQUST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청ID',
  `JOB_SE_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '업무구분코드',
  `INSTT_CODE` char(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기관코드',
  `OCCRRNC_DE` datetime DEFAULT NULL COMMENT '발생일',
  `RQESTER_IP` varchar(23) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자IP',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자ID',
  `TRGET_MENU_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대상메뉴명',
  `SVC_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서비스명',
  `METHOD_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메서드명',
  `PROCESS_SE_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리구분코드',
  `PROCESS_CO` decimal(10,0) DEFAULT NULL COMMENT '처리수',
  `PROCESS_TIME` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리시간',
  `RSPNS_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '응답코드',
  `ERROR_SE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오류구분',
  `ERROR_CO` decimal(10,0) DEFAULT NULL COMMENT '오류수',
  `ERROR_CODE` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오류코드',
  PRIMARY KEY (`REQUST_ID`),
  UNIQUE KEY `COMTNSYSLOG_PK` (`REQUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='시스템로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtntmplatinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtntmplatinfo` (
  `tmplat_id` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '템플릿ID',
  `tmplat_nm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿명',
  `tmplat_cours` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿경로',
  `use_at` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `tmplat_se_code` char(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '템플릿구분코드',
  `frst_register_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `frst_regist_pnttm` datetime DEFAULT NULL COMMENT '최초등록시점',
  `last_updusr_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `last_updt_pnttm` datetime DEFAULT NULL COMMENT '최종수정시점',
  PRIMARY KEY (`tmplat_id`),
  UNIQUE KEY `COMTNTMPLATINFO_PK` (`tmplat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='템플릿';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnuserlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnuserlog` (
  `OCCRRNC_DE` char(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '발생일',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '요청자ID',
  `SVC_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '서비스명',
  `METHOD_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '메서드명',
  `CREAT_CO` decimal(10,0) DEFAULT NULL COMMENT '생성수',
  `UPDT_CO` decimal(10,0) DEFAULT NULL COMMENT '수정수',
  `RDCNT` decimal(10,0) DEFAULT NULL COMMENT '조회수',
  `DELETE_CO` decimal(10,0) DEFAULT NULL COMMENT '삭제수',
  `OUTPT_CO` decimal(10,0) DEFAULT NULL COMMENT '출력수',
  `ERROR_CO` decimal(10,0) DEFAULT NULL COMMENT '오류수',
  PRIMARY KEY (`OCCRRNC_DE`,`RQESTER_ID`,`SVC_NM`,`METHOD_NM`),
  UNIQUE KEY `COMTNUSERLOG_PK` (`OCCRRNC_DE`,`RQESTER_ID`,`SVC_NM`,`METHOD_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtnweblog 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtnweblog` (
  `REQUST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청ID',
  `OCCRRNC_DE` datetime DEFAULT NULL COMMENT '발생일',
  `URL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자ID',
  `RQESTER_IP` varchar(23) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자IP',
  `parameter` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='웹로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtsbbssummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtsbbssummary` (
  `occrrnc_de` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '발생일',
  `stats_se` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '통계구분',
  `detail_stats_se` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '세부통계구분',
  `creat_co` decimal(10,0) DEFAULT NULL COMMENT '생성수',
  `tot_rdcnt` decimal(10,0) DEFAULT NULL COMMENT '총조회수',
  `avrg_rdcnt` decimal(10,0) DEFAULT NULL COMMENT '평균조회수',
  `top_inqire_bbsctt_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최고조회게시글ID',
  `mumm_inqire_bbsctt_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최소조회게시글ID',
  `top_ntcr_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최고게시자ID',
  PRIMARY KEY (`occrrnc_de`,`stats_se`,`detail_stats_se`),
  UNIQUE KEY `comtsbbssummary_pk` (`occrrnc_de`,`stats_se`,`detail_stats_se`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시물통계요약';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtssyslogsummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtssyslogsummary` (
  `occrrnc_de` char(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '발생일',
  `svc_nm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '서비스명',
  `method_nm` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메서드명',
  `creat_co` decimal(10,0) DEFAULT NULL COMMENT '생성수',
  `updt_co` decimal(10,0) DEFAULT NULL COMMENT '수정수',
  `rdcnt` decimal(10,0) DEFAULT NULL COMMENT '조회수',
  `delete_co` decimal(10,0) DEFAULT NULL COMMENT '삭제수',
  `outpt_co` decimal(10,0) DEFAULT NULL COMMENT '출력수',
  `error_co` decimal(10,0) DEFAULT NULL COMMENT '오류수',
  PRIMARY KEY (`occrrnc_de`,`svc_nm`,`method_nm`),
  UNIQUE KEY `COMTSSYSLOGSUMMARY_PK` (`occrrnc_de`,`svc_nm`,`method_nm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='시스템로그요약';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtsusersummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtsusersummary` (
  `occrrnc_de` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '발생일',
  `stats_se` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '통계구분',
  `detail_stats_se` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '세부통계구분',
  `user_co` decimal(10,0) DEFAULT NULL COMMENT '사용자수',
  PRIMARY KEY (`occrrnc_de`,`stats_se`,`detail_stats_se`),
  UNIQUE KEY `COMTSUSERSUMMARY_PK` (`occrrnc_de`,`stats_se`,`detail_stats_se`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자통계요약';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.comtsweblogsummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `comtsweblogsummary` (
  `occrrnc_de` char(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '발생일',
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'URL',
  `rdcnt` decimal(10,0) DEFAULT NULL COMMENT '조회수',
  PRIMARY KEY (`occrrnc_de`,`url`),
  UNIQUE KEY `COMTSWEBLOGSUMMARY_PK` (`occrrnc_de`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='웹로그 요약';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 뷰 silla_cms.comvmenulist 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `comvmenulist` (
	`MENU_NO` DECIMAL(20,0) NULL,
	`MENU_ORDR` DECIMAL(5,0) NULL,
	`MENU_NM` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`UPPER_MENU_NO` DECIMAL(20,0) NULL,
	`MENU_DC` VARCHAR(250) NULL COLLATE 'utf8mb4_unicode_ci',
	`RELATE_IMAGE_PATH` VARCHAR(100) NULL COLLATE 'utf8mb4_unicode_ci',
	`RELATE_IMAGE_NM` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`PROGRM_FILE_NM` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`level` INT(1) NULL,
	`TOP_MENU` DECIMAL(20,0) NULL,
	`USER_TYPE` VARCHAR(20) NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- 뷰 silla_cms.comvnusermaster 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `comvnusermaster` (
	`ESNTL_ID` CHAR(20) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_ID` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`PASSWORD` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_NM` VARCHAR(60) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_ZIP` VARCHAR(6) NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_ADRES` VARCHAR(100) NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_EMAIL` VARCHAR(500) NULL COLLATE 'utf8mb4_unicode_ci',
	`GROUP_ID` VARCHAR(20) NULL COLLATE 'utf8mb4_unicode_ci',
	`USER_SE` VARCHAR(3) NOT NULL COLLATE 'utf8mb4_general_ci',
	`ORGNZT_ID` VARCHAR(20) NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- 테이블 silla_cms.foodtable 구조 내보내기
CREATE TABLE IF NOT EXISTS `foodtable` (
  `num` int(100) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`seq`),
  UNIQUE KEY `seq` (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='김정숙 - 음식게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.hibernate_sequence 구조 내보내기
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.ids 구조 내보내기
CREATE TABLE IF NOT EXISTS `ids` (
  `table_name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `next_id` decimal(30,0) NOT NULL,
  PRIMARY KEY (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.lettemp 구조 내보내기
CREATE TABLE IF NOT EXISTS `lettemp` (
  `TEMP_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '임시데이터ID',
  `TEMP_VAL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '임시데이터값',
  PRIMARY KEY (`TEMP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='임시데이터저장소';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.master 구조 내보내기
CREATE TABLE IF NOT EXISTS `master` (
  `SEQ` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL,
  `FILE_NM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.scms_test 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_test` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `cont` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_dt` date DEFAULT NULL,
  `reg_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upd_dt` date DEFAULT NULL,
  `upd_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_access_ip 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_access_ip` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접근IP',
  `user_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접근자명',
  `use_yn` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `reg_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `reg_dt` datetime DEFAULT NULL COMMENT '등록일',
  `upd_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `upd_dt` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`idx`),
  UNIQUE KEY `idx` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='접근가능IP';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_banner 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_banner` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DT` datetime DEFAULT NULL COMMENT '시작일',
  `END_DT` datetime DEFAULT NULL COMMENT '종료일',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `LINK_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `LINK_TARGET` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크타겟',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `SYNC_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일연동여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='배너';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `REF` int(11) NOT NULL COMMENT 'REF',
  `BBS_LEVEL` int(11) NOT NULL COMMENT 'LEVEL',
  `STEP` int(11) NOT NULL COMMENT 'STEP',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `CATEGORY` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 아이디',
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `REPLY` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변',
  `SEC_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀글여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `NOTICE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공지여부',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `READ_CNT` int(11) NOT NULL COMMENT '조회수',
  `ATCH_FILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일아이디',
  `STATUS` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상태',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `PWD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `REG_NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자명',
  `REG_TEL` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 연락처',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_bbs_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs_category` (
  `CATEGORY_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '카테고리 인덱스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '게시판마스터 아이디',
  `CATEGORY_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리명',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`CATEGORY_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 카테고리';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_bbs_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs_comment` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글인덱스',
  `SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_COMMENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '댓글',
  `PASS` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `REG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자이름',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 댓글';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_bbs_manager 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs_manager` (
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `GROUP_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '회원권한아이디',
  `LIST_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록접근가능여부',
  `READ_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세접근가능여부',
  `WRITE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록접근가능여부',
  `UPDATE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정접근가능여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`BBS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 관리자 그룹';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_bbs_mast 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bbs_mast` (
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_NAME` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판이름',
  `BBS_TYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판타입',
  `BBS_SKIN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판스킨',
  `SNS_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS공유여부',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `CATEGORY_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리 사용여부',
  `LIST_COUNT` int(11) NOT NULL COMMENT '목록글갯수',
  `FILE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일사용여부',
  `FILE_COUNT` int(11) NOT NULL COMMENT '파일최대첨부수',
  `REG_LEVEL` int(11) DEFAULT NULL COMMENT '글등록권한',
  `COMMENT_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '댓글여부',
  `REPLY_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `DEL_YN` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT '삭제여부',
  `MENU_NO` decimal(20,0) DEFAULT NULL COMMENT '연결메뉴',
  PRIMARY KEY (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판마스터';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_bnr 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bnr` (
  `SEQ` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유키',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DATE` datetime DEFAULT NULL COMMENT '시작일자',
  `END_DATE` datetime DEFAULT NULL COMMENT '종료일자',
  `COUNT` int(11) DEFAULT NULL COMMENT '숫자값',
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용(에디터)',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `ATTACH` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ATTACH_DIR` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OFN` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_bnr_sub 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_bnr_sub` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `MAST_SEQ` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마스터시퀀스',
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_con 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_con` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `CON_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `REF` int(11) NOT NULL COMMENT 'REF',
  `CON_LEVEL` int(11) NOT NULL COMMENT 'LEVEL',
  `STEP` int(11) NOT NULL COMMENT 'STEP',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `CATEGORY` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 아이디',
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `REPLY` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변',
  `SEC_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀글여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `NOTICE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공지여부',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `READ_CNT` int(11) NOT NULL COMMENT '조회수',
  `ATCH_FILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일아이디',
  `STATUS` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상태',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='콘텐츠 게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_contents 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_contents` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `MENU_NO` decimal(20,0) DEFAULT NULL COMMENT '메뉴번호',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='컨텐츠';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_file_dtl 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_file_dtl` (
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `FILE_SN` decimal(10,0) NOT NULL COMMENT '파일순번',
  `FILE_STRE_COURS` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일저장경로',
  `STRE_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '저장파일명',
  `ORIGNL_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원파일명',
  `FILE_EXTSN` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일확장자',
  `FILE_CN` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일내용',
  `FILE_SIZE` decimal(8,0) DEFAULT NULL COMMENT '파일크기',
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`),
  UNIQUE KEY `SILLA_FILE_DTL_PK` (`ATCH_FILE_ID`,`FILE_SN`),
  KEY `SILLA_FILE_DTL_i01` (`ATCH_FILE_ID`),
  CONSTRAINT `SILLA_FILE_DTL_FK1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `silla_file_mast` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일상세정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_file_mast 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_file_mast` (
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `CREAT_DT` datetime NOT NULL COMMENT '생성일시',
  `USE_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  PRIMARY KEY (`ATCH_FILE_ID`),
  UNIQUE KEY `SILLA_FILE_MAST_PK` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일속성';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_holiday 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_holiday` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `STD_YEAR` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기준년도',
  `START_DT` datetime DEFAULT NULL COMMENT '시작일',
  `END_DT` datetime DEFAULT NULL COMMENT '종료일',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '휴일제목',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='휴일';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_homepage_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_homepage_info` (
  `SEQ` int(11) DEFAULT NULL COMMENT '시퀀스',
  `SITEMAP_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트맵 사용여부',
  `LOGIN_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 사용여부',
  `JOIN_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원가입 사용여부',
  `SLIDE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인 슬라이드 사용여부',
  `CARD_BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카드형 게시판 아이디',
  `CARD_BBS_CNT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카드형 게시판 노출건수',
  `CARD_BBS_POS` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카드형 게시판 위치',
  `PHOTO_BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진형 게시판 아이디',
  `PHOTO_BBS_CNT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진형 게시판 노출건수',
  `PHOTO_BBS_POS` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진형 게시판 위치',
  `LIST_BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록형 게시판 아이디',
  `LIST_BBS_CNT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록형 게시판 노출건수',
  `LIST_BBS_POS` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록형 게시판 위치',
  `PRIVACY_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보 처리방침 사용여부',
  `EMAIL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일주소무단수집거부 사용여부',
  `SITELINK_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관련사이트링크 사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자 아이디',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  UNIQUE KEY `SEQ` (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='홈페이지 설정';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_inttest 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_inttest` (
  `SEQ` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고유키',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DATE` datetime DEFAULT NULL COMMENT '시작일자',
  `END_DATE` datetime DEFAULT NULL COMMENT '종료일자',
  `COUNT` int(11) DEFAULT NULL COMMENT '숫자값',
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용(에디터)',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `ATCHFILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일 아이디',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='인턴 미션';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_inttest_parti 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_inttest_parti` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `MAST_SEQ` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마스터 시퀀스',
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='인턴 미션_참가자';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_inttest_sub 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_inttest_sub` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `MAST_SEQ` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마스터 시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='인턴미션_서브';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_login_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_login_log` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `LOGIN_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 아이디',
  `LOGIN_IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 아이피',
  `LOGIN_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 관리자 명',
  `LOGIN_TYPE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 타입',
  `LOGIN_TIME` datetime DEFAULT NULL COMMENT '로그인 시간',
  PRIMARY KEY (`SEQ`),
  UNIQUE KEY `SEQ` (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=4289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='로그인 로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_main_slide 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_main_slide` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `LINK_YN` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크사용여부',
  `LINK_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `IMG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `ORIGIN_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_TEXT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대체텍스트',
  `SORT_ORDER` int(11) DEFAULT NULL COMMENT '정렬순서',
  `USE_YN` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`),
  UNIQUE KEY `SEQ` (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메인슬라이드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_master_test 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_master_test` (
  `MASTER_SEQ` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유키',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DATE` datetime DEFAULT NULL COMMENT '시작일자',
  `END_DATE` datetime DEFAULT NULL COMMENT '종료일자',
  `COUNT` int(11) DEFAULT NULL,
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용(에디터)',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  `PASSWORD` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  `ATCH_FILE_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일ID',
  PRIMARY KEY (`MASTER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_offense_words 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_offense_words` (
  `OFFENSE_WORD` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '위반단어',
  `SEQ` int(11) NOT NULL COMMENT '시퀀스',
  UNIQUE KEY `SEQ` (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='금지단어';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_peakday 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_peakday` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `STD_YEAR` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기준년도',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DT` datetime DEFAULT NULL COMMENT '시작일',
  `END_DT` datetime DEFAULT NULL COMMENT '종료일',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='성수기';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_poll_answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_answer` (
  `ANSWER_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '답변 인덱스',
  `POLL_SEQ` int(11) NOT NULL COMMENT '설문조사 인덱스',
  `QUESTION_SEQ` int(11) NOT NULL COMMENT '질문 인덱스',
  `ANSWER` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '답변',
  `SORT_ORDER` int(11) NOT NULL COMMENT '정렬순서',
  `IS_ETC` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기타여부',
  UNIQUE KEY `ANSWER_SEQ` (`ANSWER_SEQ`),
  UNIQUE KEY `ANSWER_SEQ_2` (`ANSWER_SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=831 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사 답변';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_poll_mast 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_mast` (
  `POLL_SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `DESC` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '설명',
  `START_DT` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시 시작일',
  `END_DT` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시 종료일',
  `POLL_START_DT` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '응답 시작일',
  `POLL_END_DT` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '응답 종료일',
  `IS_USER_INFO` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '개인정보 수집여부',
  `USE_YN` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`POLL_SEQ`),
  UNIQUE KEY `SEQ` (`POLL_SEQ`),
  UNIQUE KEY `POLL_SEQ` (`POLL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사 마스터';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_poll_question 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_question` (
  `QUESTION_SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `POLL_SEQ` int(11) NOT NULL COMMENT '설문조사 시퀀스',
  `QUESTION` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '질문',
  `QUESTION_DESC` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '질문 부가설명',
  `QUESTION_TYPE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '문항 유형',
  `QUESTION_SELECT_TYPE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세선택',
  `QUESTION_SELECT_CNT` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '멀티선택 개수',
  `IS_REQUIRE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '필수응답여부',
  `SCALE_CNT` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '척도 개수',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 경로',
  `SORT_ORDER` int(11) NOT NULL COMMENT '정렬순서',
  PRIMARY KEY (`QUESTION_SEQ`),
  UNIQUE KEY `SEQ` (`QUESTION_SEQ`),
  UNIQUE KEY `QUESTION_SEQ` (`QUESTION_SEQ`),
  UNIQUE KEY `QUESTION_SEQ_2` (`QUESTION_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사 질문';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_poll_result 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_result` (
  `SEQ` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `POLL_SEQ` int(11) NOT NULL COMMENT '설문조사 시퀀스',
  `QUESTION_SEQ` int(11) NOT NULL COMMENT '질문 시퀀스',
  `ANSWER_SEQ` int(11) DEFAULT NULL COMMENT '답변 시퀀스',
  `ANSWER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변',
  `QUESTION_TYPE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '질문 타입',
  `IS_ETC` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '기타 여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 ID',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일자',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사결과';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_poll_user_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_poll_user_info` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `POLL_SEQ` int(11) NOT NULL COMMENT '설문조사 시퀀스',
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이름',
  `TEL` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '연락처',
  `EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이메일',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `VDL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '반영여부',
  PRIMARY KEY (`SEQ`),
  UNIQUE KEY `SEQ` (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='설문조사 개인정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_popup 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_popup` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DT` datetime DEFAULT NULL COMMENT '시작일',
  `END_DT` datetime DEFAULT NULL COMMENT '종료일',
  `WIDTH` int(11) DEFAULT NULL COMMENT '가로사이즈',
  `HEIGHT` int(11) DEFAULT NULL COMMENT '세로사이즈',
  `HORIZONTAL` int(11) DEFAULT NULL COMMENT '가로위치',
  `VERTICAL` int(11) DEFAULT NULL COMMENT '세로위치',
  `LAYER_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레이어팝업유무',
  `IMG_TEXT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대체텍스트',
  `LINK_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `LINK_TARGET` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크타겟',
  `COOKIE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '쿠키설정',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `SYNC_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일연동여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='팝업';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_relate_site 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_relate_site` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `LINK_URL` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `SYNC_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일연동여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관련사이트';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_site_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_site_info` (
  `IDX` int(11) NOT NULL COMMENT '시퀀스',
  `SITE_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 이름',
  `SITE_DESC` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 소개',
  `SITE_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 주소',
  `SITE_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표 이메일',
  `SITE_TEL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표 전화',
  `SITE_ADDR` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `COMP_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회사명',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 경로',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본파일명',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`IDX`),
  UNIQUE KEY `IDX` (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사이트 정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_sotest 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_sotest` (
  `SEQ` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고유키',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DATE` datetime DEFAULT NULL COMMENT '시작일자',
  `END_DATE` datetime DEFAULT NULL COMMENT '종료일자',
  `COUNT` int(11) DEFAULT NULL COMMENT '숫자값',
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용(에디터)',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='인턴 미션';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_sotest2 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_sotest2` (
  `SEQ` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고유키',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DATE` datetime DEFAULT NULL COMMENT '시작일자',
  `END_DATE` datetime DEFAULT NULL COMMENT '종료일자',
  `COUNT` int(11) DEFAULT NULL COMMENT '숫자값',
  `NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용(에디터)',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='인턴2 미션';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_sotest2_sub 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_sotest2_sub` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `MAST_SEQ` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마스터 시퀀스',
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='인턴2 미션_서브';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_sotest_sub 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_sotest_sub` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `MAST_SEQ` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마스터 시퀀스',
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='인턴 미션_서브';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_terms 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_terms` (
  `IDX` int(11) NOT NULL COMMENT '시퀀스',
  `TERM` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이용약관',
  `PRIVACY` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보처리방침',
  `PRIVACY_TITLE` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보 이용 목적',
  `PRIVACY_PERIOD` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '보유 및 이용기간',
  `PRIVACY_COMPANY` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '위탁받는자(수탁자)',
  `PRIVACY_CONTENT` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '위탁받는 업무내용',
  `PRIVACY_INFO` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '서비스 이용 안내문',
  `PRIVACY_MANAGER` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보 보호 책임자',
  `PRIVACY_HELP_CONT` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권익침해 구제방법',
  `APPLY_DT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '적용일',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  UNIQUE KEY `IDX` (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원약관';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_terms_collection 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_terms_collection` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TERMS_IDX` int(11) DEFAULT NULL COMMENT '약관 시퀀스',
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공통코드',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  UNIQUE KEY `IDX` (`IDX`),
  UNIQUE KEY `IDX_2` (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=1510 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='약관 수집개인정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_test 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_test` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `MAST_SEQ` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '마스터 시퀀스',
  `CODE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_testdtls 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_testdtls` (
  `UQ_DTLS_ID` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상세 고유 ID',
  `UQ_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '고유 ID',
  `CD_VAL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관심분야 값',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 ID',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`UQ_DTLS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신입교육 상세 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_testmst 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_testmst` (
  `UQ_ID` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유ID',
  `TITLE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DT` date DEFAULT NULL COMMENT '게시기간 시작일자',
  `END_DT` date DEFAULT NULL COMMENT '게시기간 종료일자',
  `NUMB` int(11) DEFAULT NULL COMMENT '숫자 값',
  `NM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이름',
  `PRT_PSN` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '참가자',
  `USE_YN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `AGE_VAL` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '연령대',
  `CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용',
  `FILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일ID',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자ID',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일자',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자ID',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일자',
  PRIMARY KEY (`UQ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='신입교육 마스터 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.silla_user_access_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `silla_user_access_log` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `ACCESS_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속자 아이디',
  `ACCESS_IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속자 아이피',
  `ACCESS_MENU` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속 메뉴',
  `ACCESS_URL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속 주소',
  `ACCESS_PARAM` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ACCESS_DATE` datetime DEFAULT NULL COMMENT '접속 일자',
  `ACCESS_WORK` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작업구분',
  PRIMARY KEY (`IDX`),
  UNIQUE KEY `IDX` (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='개인정보 접속기록';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.sub 구조 내보내기
CREATE TABLE IF NOT EXISTS `sub` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT,
  `MAST_SEQ` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`SEQ`),
  KEY `fk_seq` (`MAST_SEQ`),
  CONSTRAINT `fk_seq` FOREIGN KEY (`MAST_SEQ`) REFERENCES `master` (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.temp_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `temp_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '아이피',
  `time` datetime NOT NULL COMMENT '접속시간',
  `refer` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '유입경로',
  `agent` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '브라우저정보',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.temp_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `temp_member` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pw` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stat` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic_loc` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.testtable 구조 내보내기
CREATE TABLE IF NOT EXISTS `testtable` (
  `testId` int(200) NOT NULL,
  `tesrTitle` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testContents` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testName` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testDate` date DEFAULT NULL,
  PRIMARY KEY (`testId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='김정숙';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 silla_cms.testvo 구조 내보내기
CREATE TABLE IF NOT EXISTS `testvo` (
  `MASTER_SEQ` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL,
  `endDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regDt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seq` int(11) NOT NULL,
  `startDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updDt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useYn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MASTER_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 뷰 silla_cms.comvmenulist 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `comvmenulist`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `silla_cms`.`comvmenulist` AS with recursive menu as (select `c`.`MENU_NO` AS `MENU_NO`,`c`.`MENU_ORDR` AS `MENU_ORDR`,`c`.`MENU_NM` AS `MENU_NM`,`c`.`UPPER_MENU_NO` AS `UPPER_MENU_NO`,`c`.`MENU_DC` AS `MENU_DC`,`c`.`RELATE_IMAGE_PATH` AS `RELATE_IMAGE_PATH`,`c`.`RELATE_IMAGE_NM` AS `RELATE_IMAGE_NM`,`c`.`PROGRM_FILE_NM` AS `PROGRM_FILE_NM`,`c`.`MENU_NO` AS `TOP_MENU`,`c`.`USER_TYPE` AS `USER_TYPE`,1 AS `level` from `silla_cms`.`comtnmenuinfo` `c` where `c`.`UPPER_MENU_NO` = '0' and `c`.`MENU_NO` > 0 and `c`.`MENU_VIEW_YN` = 'Y' union all select `p`.`MENU_NO` AS `MENU_NO`,`p`.`MENU_ORDR` AS `MENU_ORDR`,`p`.`MENU_NM` AS `MENU_NM`,`p`.`UPPER_MENU_NO` AS `UPPER_MENU_NO`,`p`.`MENU_DC` AS `MENU_DC`,`p`.`RELATE_IMAGE_PATH` AS `RELATE_IMAGE_PATH`,`p`.`RELATE_IMAGE_NM` AS `RELATE_IMAGE_NM`,`p`.`PROGRM_FILE_NM` AS `PROGRM_FILE_NM`,`o`.`TOP_MENU` AS `TOP_MENU`,`p`.`USER_TYPE` AS `USER_TYPE`,1 + `o`.`level` AS `level` from (`silla_cms`.`comtnmenuinfo` `p` join `menu` `o` on(`p`.`UPPER_MENU_NO` = `o`.`MENU_NO`)) where `p`.`MENU_VIEW_YN` = 'Y')select `menu`.`MENU_NO` AS `MENU_NO`,`menu`.`MENU_ORDR` AS `MENU_ORDR`,`menu`.`MENU_NM` AS `MENU_NM`,`menu`.`UPPER_MENU_NO` AS `UPPER_MENU_NO`,`menu`.`MENU_DC` AS `MENU_DC`,`menu`.`RELATE_IMAGE_PATH` AS `RELATE_IMAGE_PATH`,`menu`.`RELATE_IMAGE_NM` AS `RELATE_IMAGE_NM`,`menu`.`PROGRM_FILE_NM` AS `PROGRM_FILE_NM`,`menu`.`level` AS `level`,`menu`.`TOP_MENU` AS `TOP_MENU`,`menu`.`USER_TYPE` AS `USER_TYPE` from `menu`;

-- 뷰 silla_cms.comvnusermaster 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `comvnusermaster`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `silla_cms`.`comvnusermaster` AS select `silla_cms`.`comtngnrlmber`.`ESNTL_ID` AS `ESNTL_ID`,`silla_cms`.`comtngnrlmber`.`MBER_ID` AS `USER_ID`,`silla_cms`.`comtngnrlmber`.`PASSWORD` AS `PASSWORD`,`silla_cms`.`comtngnrlmber`.`MBER_NM` AS `USER_NM`,`silla_cms`.`comtngnrlmber`.`ZIP` AS `USER_ZIP`,`silla_cms`.`comtngnrlmber`.`ADRES` AS `USER_ADRES`,`silla_cms`.`comtngnrlmber`.`MBER_EMAIL_ADRES` AS `USER_EMAIL`,' ' AS `GROUP_ID`,'GNR' AS `USER_SE`,' ' AS `ORGNZT_ID` from `silla_cms`.`comtngnrlmber` union all select `silla_cms`.`comtnemplyrinfo`.`ESNTL_ID` AS `ESNTL_ID`,`silla_cms`.`comtnemplyrinfo`.`EMPLYR_ID` AS `EMPLYR_ID`,`silla_cms`.`comtnemplyrinfo`.`PASSWORD` AS `PASSWORD`,`silla_cms`.`comtnemplyrinfo`.`USER_NM` AS `USER_NM`,`silla_cms`.`comtnemplyrinfo`.`ZIP` AS `ZIP`,`silla_cms`.`comtnemplyrinfo`.`HOUSE_ADRES` AS `HOUSE_ADRES`,`silla_cms`.`comtnemplyrinfo`.`EMAIL_ADRES` AS `EMAIL_ADRES`,`silla_cms`.`comtnemplyrinfo`.`GROUP_ID` AS `GROUP_ID`,'USR' AS `USER_SE`,`silla_cms`.`comtnemplyrinfo`.`ORGNZT_ID` AS `ORGNZT_ID` from `silla_cms`.`comtnemplyrinfo` order by `ESNTL_ID`;


-- test_db 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `test_db`;

-- 함수 test_db.F_GETCMMNCODE_NAME 구조 내보내기
DELIMITER //
CREATE FUNCTION `F_GETCMMNCODE_NAME`(V_CODE_ID VARCHAR(30), V_CODE VARCHAR(30)) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
    DECLARE V_RET VARCHAR(100);

    SELECT CODE_NM INTO V_RET
		FROM SCMS_CMMNDETAILCODE
	 WHERE CODE_ID = V_CODE_ID
		 AND CODE = V_CODE;

    RETURN V_RET;
END//
DELIMITER ;

-- 함수 test_db.F_GETMENU_URL 구조 내보내기
DELIMITER //
CREATE FUNCTION `F_GETMENU_URL`(P_MENU_NO VARCHAR(5), P_USER_ID VARCHAR(20), P_USER_TYPE VARCHAR(10)) RETURNS varchar(500) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
    DECLARE V_RET VARCHAR(500);
    DECLARE V_BBSURL VARCHAR(500);
    DECLARE CHK_CNT INT;

    IF P_USER_TYPE = 'HOME' THEN
        SELECT F_GETPROGRM_URL(MENU.PROGRM_FILE_NM) INTO V_RET
        FROM SCMS_MENUINFO MENU
        WHERE MENU.MENU_NO = P_MENU_NO
        AND MENU.USER_TYPE = P_USER_TYPE;
    ELSE
        SELECT F_GETPROGRM_URL(MENU.PROGRM_FILE_NM) INTO V_RET
        FROM SCMS_MENUINFO MENU
        JOIN SCMS_MENUCREATDTLS MENUAUTH ON MENUAUTH.MENU_NO = MENU.MENU_NO
        WHERE MENU.MENU_NO = P_MENU_NO
        AND MENU.USER_TYPE = P_USER_TYPE
        AND MENUAUTH.AUTHOR_CODE IN (
            SELECT C.AUTHOR_CODE
            FROM SCMS_EMPLYRSCRTYESTBS C
            WHERE C.EMPLYR_ID = P_USER_ID
        )
        GROUP BY MENU.PROGRM_FILE_NM;
    END IF;

    IF V_RET = 'dir' THEN
        SELECT URL INTO V_RET
        FROM (
            SELECT F_GETPROGRM_URL(MENU.PROGRM_FILE_NM) AS URL
                 , MENU.MENU_ORDR
            FROM SCMS_MENUINFO MENU
            JOIN SCMS_MENUCREATDTLS MENUAUTH ON MENUAUTH.MENU_NO = MENU.MENU_NO
            WHERE MENU.UPPER_MENU_NO = P_MENU_NO
            AND MENU.USER_TYPE = P_USER_TYPE
            AND MENUAUTH.AUTHOR_CODE IN (
                SELECT C.AUTHOR_CODE
                FROM SCMS_EMPLYRSCRTYESTBS C
                WHERE C.EMPLYR_ID = P_USER_ID
            )
            ORDER BY MENU.MENU_ORDR ASC
            LIMIT 1
        ) a;
    END IF;
    
    IF V_RET = 'BBS' THEN
	    IF P_USER_TYPE = 'HOME' THEN
    		SET V_BBSURL = '/board/boardList.do';
	    ELSE
    		SET V_BBSURL = '/admin/bbsArticle/list.do';
	    END IF;
	    
	    SELECT COUNT(BBS_ID) INTO CHK_CNT
		  FROM SCMS_BBSMENUMAP
		 WHERE MENU_NO = P_MENU_NO
		   AND USER_TYPE = P_USER_TYPE;
		   
		IF CHK_CNT = 0 THEN
			SET V_RET = CONCAT(V_BBSURL, '?bbsId=N');
		ELSE 
			IF P_USER_TYPE = 'HOME' THEN
				SELECT CONCAT(V_BBSURL, '?bbsId=', BBS_ID) INTO V_RET
				  FROM SCMS_BBSMENUMAP
				 WHERE MENU_NO = P_MENU_NO
				   AND USER_TYPE = P_USER_TYPE;
			ELSE
				SELECT CONCAT(V_BBSURL, '?bbsId=', BBSM.BBS_ID, '&bbsType=', BBSI.BBS_TYPE) INTO V_RET
				  FROM SCMS_BBSMENUMAP BBSM
				     , SCMS_BBSMAST BBSI
				  WHERE BBSI.BBS_ID = BBSM.BBS_ID
				    AND BBSM.MENU_NO = P_MENU_NO
				    AND BBSM.USER_TYPE = P_USER_TYPE;
	    	END IF;	    	
	    END IF;
    END IF;

    RETURN V_RET;
END//
DELIMITER ;

-- 함수 test_db.F_GETPROGRM_URL 구조 내보내기
DELIMITER //
CREATE FUNCTION `F_GETPROGRM_URL`(V_PROGRM_FILE_NM VARCHAR(100)) RETURNS varchar(500) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
BEGIN
    DECLARE V_RET VARCHAR(500);

    SELECT PAGE_URL INTO V_RET
     FROM SCMS_PROGRMPAGE
    WHERE PROGRM_FILE_NM = V_PROGRM_FILE_NM
	 	AND IS_MAIN = 'Y'
	 LIMIT 1;

    RETURN V_RET;
END//
DELIMITER ;

-- 테이블 test_db.scms_accessip 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_accessip` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접근IP',
  `USER_NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접근자명',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='접근가능IP';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_authorinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_authorinfo` (
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  `AUTHOR_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한명',
  `AUTHOR_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한설명',
  `AUTHOR_CREAT_DE` date NOT NULL DEFAULT curdate() COMMENT '권한생성일',
  `AUTHOR_ADM` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SORT_ORDR` int(11) DEFAULT NULL COMMENT '정렬순서',
  `IS_ADM` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관리자 여부',
  PRIMARY KEY (`AUTHOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='권한정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_banner 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_banner` (
  `SEQ` int(3) NOT NULL COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `LINK_YN` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크사용여부',
  `LINK_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `IMG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `ORIGIN_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_TEXT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대체텍스트',
  `SORT_ORDER` int(3) DEFAULT NULL COMMENT '정렬순서',
  `USE_YN` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메인슬라이드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_bannerr 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_bannerr` (
  `SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `TITLE` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DT` date DEFAULT NULL COMMENT '시작일',
  `END_DT` date DEFAULT NULL COMMENT '종료일',
  `IMG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `LINK_URL` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `LINK_TARGET` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크타겟',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='배너';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_bbs` (
  `SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `REF` int(11) NOT NULL COMMENT 'REF',
  `BBS_LEVEL` int(11) NOT NULL COMMENT 'LEVEL',
  `STEP` int(11) NOT NULL COMMENT 'STEP',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '제목',
  `CATEGORY` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 아이디',
  `CONTENT` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '내용',
  `REPLY` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '답변',
  `SEC_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀글여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `NOTICE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '공지여부',
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `READ_CNT` int(11) NOT NULL COMMENT '조회수',
  `ATCH_FILE_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATUS` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '상태',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` datetime DEFAULT NULL,
  `PWD` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자명',
  `REG_TEL` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_bbscategory 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_bbscategory` (
  `CATEGORY_SEQ` int(11) NOT NULL COMMENT '카테고리 인덱스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 카테고리';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_bbscomment 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_bbscomment` (
  `COMMENT_ID` int(11) NOT NULL COMMENT '댓글인덱스',
  `SEQ` int(11) NOT NULL COMMENT '시퀀스',
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_COMMENT` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '댓글',
  `PASS` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_IP` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자아이피',
  `REG_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 댓글(미사용)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_bbsmanager 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_bbsmanager` (
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `GROUP_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  `LIST_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록접근가능여부',
  `READ_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세접근가능여부',
  `WRITE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록접근가능여부',
  `UPDATE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정접근가능여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`BBS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판 관리자 그룹';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_bbsmast 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_bbsmast` (
  `BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `BBS_NAME` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판이름',
  `BBS_TYPE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판타입',
  `BBS_SKIN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판스킨',
  `SNS_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SNS공유여부',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용여부',
  `CATEGORY_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '카테고리 사용여부',
  `LIST_COUNT` int(11) NOT NULL COMMENT '목록글갯수',
  `FILE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일사용여부',
  `FILE_COUNT` int(11) NOT NULL COMMENT '파일최대첨부수',
  `REG_LEVEL` int(11) DEFAULT NULL,
  `COMMENT_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REPLY_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` datetime NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPD_DT` datetime DEFAULT NULL,
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `MENU_NO` int(11) DEFAULT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL COMMENT '첨부파일 최대 용량',
  PRIMARY KEY (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판마스터';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_bbsmenumap 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_bbsmenumap` (
  `MENU_NO` int(11) NOT NULL COMMENT '메뉴번호',
  `BBS_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '게시판마스터아이디',
  `USER_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자유형',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`BBS_ID`,`USER_TYPE`,`MENU_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='게시판메뉴맵핑';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_cmmnclcode 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_cmmnclcode` (
  `CL_CODE` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '분류코드',
  `CL_CODE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '분류코드명',
  `CL_CODE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '분류코드설명',
  `USE_AT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`CL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통분류코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_cmmncode 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_cmmncode` (
  `CODE_ID` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드ID',
  `CODE_ID_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드 명',
  `CODE_ID_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드 설명',
  `USE_AT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `CL_CODE` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '분류코드',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_cmmndetailcode 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_cmmndetailcode` (
  `CODE_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드ID',
  `CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '코드',
  `CODE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드명',
  `CODE_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '코드설명',
  `USE_AT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL COMMENT '최초등록시점',
  `FRST_REGISTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최초등록자ID',
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL COMMENT '최종수정시점',
  `LAST_UPDUSR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '최종수정자ID',
  `SORT_ORDER` int(3) DEFAULT NULL,
  `ATTR1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추가필드1',
  `ATTR2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추가필드2',
  `ATTR3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추가필드3',
  `ATTR4` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '추가필드4',
  `ATTR5` int(11) DEFAULT NULL COMMENT '추가필드5(숫자)',
  `ATTR6` int(11) DEFAULT NULL COMMENT '추가필드6(숫자)',
  PRIMARY KEY (`CODE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통상세코드';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_contents 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_contents` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `MENU_NO` int(3) DEFAULT NULL COMMENT '메뉴번호',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='컨텐츠';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_copseq 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_copseq` (
  `TABLE_NAME` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '테이블명',
  `NEXT_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='시퀀스관리';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_emplyrinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_emplyrinfo` (
  `EMPLYR_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '업무사용자ID',
  `ORGNZT_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '조직ID',
  `USER_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자명',
  `PASSWORD` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀번호',
  `EMPL_NO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사원번호',
  `IHIDNUM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주민등록번호',
  `SEXDSTN_CODE` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별코드',
  `BRTHDY` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '생일',
  `FXNUM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '팩스번호',
  `HOUSE_ADRES` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주택주소',
  `PASSWORD_HINT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호힌트',
  `PASSWORD_CNSR` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호정답',
  `HOUSE_END_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주택끝전화번호',
  `AREA_NO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '지역번호',
  `DETAIL_ADRES` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세주소',
  `ZIP` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '우편번호',
  `OFFM_TELNO` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사무실전화번호',
  `MBTLNUM` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이동전화번호',
  `EMAIL_ADRES` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일주소',
  `OFCPS_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '직위명',
  `HOUSE_MIDDLE_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '주택중간전화번호',
  `GROUP_ID` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹ID',
  `PSTINST_CODE` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '소속기관코드',
  `EMPLYR_STTUS_CODE` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사용자상태코드',
  `ESNTL_ID` char(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유ID',
  `CRTFC_DN_VALUE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '인증DN값',
  `SBSCRB_DE` datetime DEFAULT NULL COMMENT '가입일자',
  `LOCK_AT` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잠금여부',
  `LOCK_CNT` decimal(3,0) DEFAULT NULL COMMENT '잠금회수',
  `LOCK_LAST_PNTTM` datetime DEFAULT NULL COMMENT '잠금최종시점',
  `LAST_LOGIN` datetime DEFAULT NULL COMMENT '최종로그인시간',
  `PWD_CHNG_YN` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`EMPLYR_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='업무사용자정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_emplyrscrtyestbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_emplyrscrtyestbs` (
  `SCRTY_DTRMN_TRGET_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '보안설정대상ID',
  `MBER_TY_CODE` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원유형코드',
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  `EMPLYR_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '회원아이디'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자보안설정';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_errorlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_errorlog` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `METHOD_NM` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '호출된메소드',
  `ERROR_URL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '에러URL',
  `ERROR_NM` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '에러명',
  `ERROR_CONT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '에러내용',
  `PARAM` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파라미터',
  `MENU_NO` int(3) DEFAULT NULL COMMENT '메뉴번호',
  `MENU_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴명',
  `SITE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트(A:관리자, U:사용자)',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='공통에러로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_filedtl 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_filedtl` (
  `ATCH_FILE_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `FILE_SN` int(11) NOT NULL COMMENT '파일순번',
  `FILE_STRE_COURS` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일저장경로',
  `STRE_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '저장파일명',
  `ORIGNL_FILE_NM` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FILE_EXTSN` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일확장자',
  `FILE_CN` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `FILE_GBN` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FILE_DOWN_LIMIT_DT` date DEFAULT NULL COMMENT '파일 다운로드 기한',
  `FILE_DOWN_LIMIT_CNT` int(11) DEFAULT NULL COMMENT '파일 다운로드 제한 수',
  `FILE_DOWN_CNT` int(11) DEFAULT NULL COMMENT '파일 다운로드 수',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '삭제여부',
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일상세정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_filemast 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_filemast` (
  `ATCH_FILE_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일ID',
  `CREAT_DT` date NOT NULL COMMENT '생성일시',
  `USE_AT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STD_GBN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GIS_TRANS_DT` date DEFAULT NULL,
  `GIS_TRANS_AT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='파일속성';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_filemng 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_filemng` (
  `FILE_MNG_CD` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일 코드',
  `FILE_USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '첨부파일 사용여부',
  `FILE_MAX_ATCH_CNT` int(11) NOT NULL COMMENT '파일 최대 첨부개수',
  `FILE_MAX_SIZE` int(11) NOT NULL COMMENT '파일 최대 용량',
  `FILE_DOWN_DT_LIMIT_SET` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일 다운로드 기한 설정',
  `FILE_DOWN_DT_LIMIT` int(11) DEFAULT NULL COMMENT '파일 다운로드 기한',
  `FILE_DOWN_CNT_LIMIT_SET` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일 다운로드 횟수 설정',
  `FILE_DOWN_CNT_LIMIT` int(11) DEFAULT NULL COMMENT '파일 다운로드 횟수',
  `FILE_STRE_COURS` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일 저장 경로',
  `FILE_EXT` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '파일 확장자',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자',
  `REG_DT` date NOT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`FILE_MNG_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='첨부파일관리';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_gnrlmber 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_gnrlmber` (
  `MBER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '회원ID',
  `PASSWORD` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비밀번호',
  `PASSWORD_HINT` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호힌트',
  `PASSWORD_CNSR` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '비밀번호정답',
  `IHIDNUM` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주민등록번호',
  `MBER_NM` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '회원명',
  `ZIP` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '우편번호',
  `ADRES` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `AREA_NO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지역번호',
  `MBER_STTUS` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원상태',
  `DETAIL_ADRES` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '상세주소',
  `END_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '끝전화번호',
  `MBTLNUM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '이동전화번호',
  `GROUP_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '그룹ID',
  `MBER_FXNUM` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원팩스번호',
  `MBER_EMAIL_ADRES` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원이메일주소',
  `MIDDLE_TELNO` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '중간전화번호',
  `SBSCRB_DE` date DEFAULT NULL COMMENT '가입일자',
  `SEXDSTN_CODE` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '성별코드',
  `ESNTL_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '고유ID',
  `LOCK_AT` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '잠금여부',
  `LOCK_CNT` int(3) DEFAULT NULL COMMENT '잠금회수',
  `LOCK_LAST_PNTTM` date DEFAULT NULL COMMENT '잠금최종시점',
  `SECESSION_REASON` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '탈퇴사유',
  `SECESSION_DT` date DEFAULT NULL COMMENT '탈퇴일자',
  `PASS_CHG_DT` date DEFAULT NULL COMMENT '비밀번호 변경일자',
  PRIMARY KEY (`MBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='일반회원(미사용)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_homepageinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_homepageinfo` (
  `SEQ` int(1) NOT NULL COMMENT '시퀀스',
  `SITEMAP_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트맵 사용여부',
  `LOGIN_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 사용여부',
  `JOIN_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회원가입 사용여부',
  `SLIDE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메인 슬라이드 사용여부',
  `CARD_BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카드형 게시판 아이디',
  `CARD_BBS_CNT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카드형 게시판 노출건수',
  `CARD_BBS_POS` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카드형 게시판 위치',
  `PHOTO_BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진형 게시판 아이디',
  `PHOTO_BBS_CNT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진형 게시판 노출건수',
  `PHOTO_BBS_POS` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사진형 게시판 위치',
  `LIST_BBS_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록형 게시판 아이디',
  `LIST_BBS_CNT` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록형 게시판 노출건수',
  `LIST_BBS_POS` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '목록형 게시판 위치',
  `PRIVACY_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보 처리방침 사용여부',
  `EMAIL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이메일주소무단수집거부 사용여부',
  `SITELINK_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관련사이트링크 사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 아이디',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자 아이디',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='홈페이지 설정(미사용)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_loginlog 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_loginlog` (
  `SEQ` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '시퀀스',
  `LOGIN_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 아이디',
  `LOGIN_IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 아이피',
  `LOGIN_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 관리자 명',
  `LOGIN_TYPE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '로그인 타입',
  `LOGIN_TIME` date DEFAULT NULL COMMENT '로그인 시간',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='로그인 로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_menucreatdtls 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_menucreatdtls` (
  `MENU_NO` int(3) NOT NULL COMMENT '메뉴번호',
  `AUTHOR_CODE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한코드',
  `AUTH_GRADE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한레벨코드',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`MENU_NO`,`AUTHOR_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메뉴생성내역';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_menuinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_menuinfo` (
  `MENU_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '메뉴명',
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램파일명',
  `MENU_NO` int(3) NOT NULL COMMENT '메뉴번호',
  `UPPER_MENU_NO` int(3) DEFAULT NULL COMMENT '상위메뉴번호',
  `MENU_ORDR` int(3) NOT NULL COMMENT '메뉴순서',
  `MENU_DC` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴설명',
  `RELATE_IMAGE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계이미지경로',
  `RELATE_IMAGE_NM` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '관계이미지명',
  `MENU_VIEW_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '메뉴 표시여부',
  `USER_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자유형',
  `BTN_USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '공통버튼사용여부',
  `FILE_USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '첨부파일사용여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  `IP_BLOCK_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '아이피 차단 페이지여부',
  PRIMARY KEY (`MENU_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='메뉴정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_offensewords 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_offensewords` (
  `OFFENSE_WORD` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '위반단어',
  `SEQ` int(1) NOT NULL COMMENT '시퀀스',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='금지단어';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_popup 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_popup` (
  `SEQ` int(5) NOT NULL COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `START_DT` date DEFAULT NULL COMMENT '시작일',
  `END_DT` date DEFAULT NULL COMMENT '종료일',
  `WIDTH` int(5) DEFAULT NULL COMMENT '가로사이즈',
  `HEIGHT` int(5) DEFAULT NULL COMMENT '세로사이즈',
  `HORIZONTAL` int(5) DEFAULT NULL COMMENT '가로위치',
  `VERTICAL` int(5) DEFAULT NULL COMMENT '세로위치',
  `LAYER_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레이어팝업유무',
  `IMG_TEXT` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대체텍스트',
  `LINK_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `LINK_TARGET` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크타겟',
  `COOKIE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '쿠키설정',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `SYNC_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일연동여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='팝업';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_progrmchangedtls 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_progrmchangedtls` (
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램파일명',
  `REQUST_NO` int(10) NOT NULL COMMENT '요청번호',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청자ID',
  `CHANGE_REQUST_CN` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '변경요청내용',
  `REQUST_PROCESS_CN` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청처리내용',
  `OPETR_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리자ID',
  `PROCESS_STTUS_CODE` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '처리상태코드',
  `PROCESS_DE` date DEFAULT NULL COMMENT '처리일',
  `RQESTDE` date DEFAULT NULL COMMENT '요청일',
  `REQUST_SJ` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청제목',
  PRIMARY KEY (`PROGRM_FILE_NM`,`REQUST_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램변경내역(미사용)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_progrmlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_progrmlist` (
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램파일명',
  `PROGRM_STRE_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램저장경로',
  `PROGRM_KOREAN_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램한글명',
  `PROGRM_DC` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램설명',
  `USER_TYPE` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`PROGRM_FILE_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램목록';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_progrmpage 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_progrmpage` (
  `PAGE_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '페이지아이디',
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램아이디',
  `PAGE_URL` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '페이지주소',
  `PAGE_GBN` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '페이지구분',
  `PAGE_DESC` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '페이지설명',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  `IS_MAIN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 메인 페이지',
  PRIMARY KEY (`PAGE_ID`,`PROGRM_FILE_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램페이지';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_progrmpageobj 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_progrmpageobj` (
  `OBJ_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '오브젝트 아이디',
  `PAGE_ID` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '페이지 아이디',
  `PROGRM_FILE_NM` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '프로그램 아이디',
  `OBJ_NAME` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '오브젝트 명',
  `AUTH_GRADE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '권한레벨',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`OBJ_ID`,`PAGE_ID`,`PROGRM_FILE_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='프로그램 오브젝트';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_relatesite 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_relatesite` (
  `SEQ` int(3) NOT NULL COMMENT '시퀀스',
  `TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '제목',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지경로',
  `LINK_URL` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '링크주소',
  `USE_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `DEL_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `SYNC_YN` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일연동여부',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='관련사이트(미사용)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_siteinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_siteinfo` (
  `IDX` int(3) NOT NULL COMMENT '시퀀스',
  `SITE_TITLE` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 이름',
  `SITE_DESC` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 소개',
  `SITE_URL` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사이트 주소',
  `SITE_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표 이메일',
  `SITE_TEL` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '대표 전화',
  `SITE_ADDR` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '주소',
  `COMP_NAME` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '회사명',
  `IMG_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지명',
  `IMG_PATH` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 경로',
  `ORIGNL_FILE_NM` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '원본파일명',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사이트 정보(미사용)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_terms 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_terms` (
  `IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `TERM_GUBUN` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '약관 구분',
  `TERM_DT` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '적용일자',
  `TERM_CONTENT` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '내용',
  `REG_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자',
  `REG_DT` date DEFAULT NULL COMMENT '등록일',
  `UPD_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `UPD_DT` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='회원약관';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_useraccesslog 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_useraccesslog` (
  `IDX` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '시퀀스',
  `ACCESS_ID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속자 아이디',
  `ACCESS_IP` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속자 아이피',
  `ACCESS_MENU` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속 메뉴',
  `ACCESS_URL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '접속 주소',
  `ACCESS_PARAM` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파라미터',
  `ACCESS_DATE` date DEFAULT NULL COMMENT '접속 일자',
  `ACCESS_WORK` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '작업구분',
  PRIMARY KEY (`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='개인정보 접속기록(미사용)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_usersummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_usersummary` (
  `OCCRRNC_DE` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '발생일',
  `STATS_SE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '통계구분',
  `DETAIL_STATS_SE` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '세부통계구분',
  `USER_CO` int(5) DEFAULT NULL COMMENT '사용자수',
  PRIMARY KEY (`OCCRRNC_DE`,`STATS_SE`,`DETAIL_STATS_SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자통계요약(미사용)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_user_grt_grant_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_user_grt_grant_log` (
  `PSN_INFO_TRET_SYS` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '개인정보처리시스템',
  `COMP_CD` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사업장 코드(인사회계시스템 사업장코드)',
  `USER_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자 ID',
  `PGM_ID` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 ID',
  `ROLE_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '역할ID',
  `GRT_TRET_GBN` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한 처리 구분(01:부여, 02:변경, 03:해제)',
  `GRT_TRET_DTM` date DEFAULT NULL COMMENT '권한 처리 일시',
  `USER_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자 명',
  `USER_IP` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용자 IP',
  `GRT_TRET_DTLS` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '권한 처리 상세(1:읽기,2:출력,3:수정,4:전체,5:금지)',
  `REF_PGM_ID` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '참조 프로그램 ID',
  `PGM_NAME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '프로그램 명',
  `TRETER_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '처리자 ID',
  `INS_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '입력자 ID',
  `INS_DTM` date DEFAULT NULL COMMENT '입력일시',
  `UPD_ID` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자 ID',
  `UPD_DTM` date DEFAULT NULL COMMENT '수정일시'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자 권한 부여';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_weblog 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_weblog` (
  `REQUST_ID` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '요청ID',
  `OCCRRNC_DE` date DEFAULT NULL COMMENT '발생일',
  `URL` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'URL',
  `RQESTER_ID` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자ID',
  `RQESTER_IP` varchar(23) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '요청자IP',
  `PARAM` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파라미터',
  PRIMARY KEY (`REQUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='웹로그';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 test_db.scms_weblogsummary 구조 내보내기
CREATE TABLE IF NOT EXISTS `scms_weblogsummary` (
  `OCCRRNC_DE` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '발생일',
  `URL` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'URL',
  `RDCNT` int(5) DEFAULT NULL COMMENT '조회수',
  PRIMARY KEY (`OCCRRNC_DE`,`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='웹로그 요약(미사용)';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 뷰 test_db.vcms_menulist 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `vcms_menulist` (
	`MENU_NO` INT(11) NULL,
	`MENU_ORDR` INT(11) NULL,
	`MENU_NM` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`UPPER_MENU_NO` INT(11) NULL,
	`MENU_DC` VARCHAR(250) NULL COLLATE 'utf8mb4_unicode_ci',
	`RELATE_IMAGE_PATH` VARCHAR(100) NULL COLLATE 'utf8mb4_unicode_ci',
	`RELATE_IMAGE_NM` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`PROGRM_FILE_NM` VARCHAR(60) NULL COLLATE 'utf8mb4_unicode_ci',
	`MENU_LEVEL` INT(1) NULL,
	`TOP_MENU` INT(11) NULL,
	`USER_TYPE` VARCHAR(20) NULL COLLATE 'utf8mb4_unicode_ci',
	`IP_BLOCK_YN` VARCHAR(10) NULL COLLATE 'utf8mb4_unicode_ci'
) ENGINE=MyISAM;

-- 뷰 test_db.vcms_menulist 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `vcms_menulist`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `test_db`.`vcms_menulist` AS with recursive menu as (select `c`.`MENU_NO` AS `MENU_NO`,`c`.`MENU_ORDR` AS `MENU_ORDR`,`c`.`MENU_NM` AS `MENU_NM`,`c`.`UPPER_MENU_NO` AS `UPPER_MENU_NO`,`c`.`MENU_DC` AS `MENU_DC`,`c`.`RELATE_IMAGE_PATH` AS `RELATE_IMAGE_PATH`,`c`.`RELATE_IMAGE_NM` AS `RELATE_IMAGE_NM`,`c`.`PROGRM_FILE_NM` AS `PROGRM_FILE_NM`,`c`.`MENU_NO` AS `TOP_MENU`,`c`.`USER_TYPE` AS `USER_TYPE`,`c`.`IP_BLOCK_YN` AS `IP_BLOCK_YN`,1 AS `MENU_LEVEL` from `test_db`.`scms_menuinfo` `c` where `c`.`UPPER_MENU_NO` = '0' and `c`.`MENU_NO` > 0 and `c`.`MENU_VIEW_YN` = 'Y' union all select `p`.`MENU_NO` AS `MENU_NO`,`p`.`MENU_ORDR` AS `MENU_ORDR`,`p`.`MENU_NM` AS `MENU_NM`,`p`.`UPPER_MENU_NO` AS `UPPER_MENU_NO`,`p`.`MENU_DC` AS `MENU_DC`,`p`.`RELATE_IMAGE_PATH` AS `RELATE_IMAGE_PATH`,`p`.`RELATE_IMAGE_NM` AS `RELATE_IMAGE_NM`,`p`.`PROGRM_FILE_NM` AS `PROGRM_FILE_NM`,`o`.`TOP_MENU` AS `TOP_MENU`,`p`.`USER_TYPE` AS `USER_TYPE`,`p`.`IP_BLOCK_YN` AS `IP_BLOCK_YN`,1 + `o`.`MENU_LEVEL` AS `MENU_LEVEL` from (`test_db`.`scms_menuinfo` `p` join `menu` `o` on(`p`.`UPPER_MENU_NO` = `o`.`MENU_NO`)) where `p`.`MENU_VIEW_YN` = 'Y')select `menu`.`MENU_NO` AS `MENU_NO`,`menu`.`MENU_ORDR` AS `MENU_ORDR`,`menu`.`MENU_NM` AS `MENU_NM`,`menu`.`UPPER_MENU_NO` AS `UPPER_MENU_NO`,`menu`.`MENU_DC` AS `MENU_DC`,`menu`.`RELATE_IMAGE_PATH` AS `RELATE_IMAGE_PATH`,`menu`.`RELATE_IMAGE_NM` AS `RELATE_IMAGE_NM`,`menu`.`PROGRM_FILE_NM` AS `PROGRM_FILE_NM`,`menu`.`MENU_LEVEL` AS `MENU_LEVEL`,`menu`.`TOP_MENU` AS `TOP_MENU`,`menu`.`USER_TYPE` AS `USER_TYPE`,`menu`.`IP_BLOCK_YN` AS `IP_BLOCK_YN` from `menu`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
