-- 개인 유저 테이블
INSERT INTO employee (employee_name, employee_password, employee_fullname, employee_email, employee_tel, employee_gender, employee_birth, employee_address, employee_info_thumbnail, created_at)
VALUES
('ssar', '1234', '홍길동', 'ssar@ssar.com', '01011111111', 'M', '1990-01-01', '서울특별시 강남구', NULL, NOW()),
('cos', '1234', '최성훈', 'cos@cos.com', '01022222222', 'M', '1991-01-01', '서울특별시 강북구', NULL, NOW()),
('love', '1234', '장보고', 'love@love.com', '01033333333', 'M', '1992-01-01', '서울특별시 강서구', NULL, NOW()),
('toby', '1234', '김동훈', 'toby@toby.com', '01044444444', 'M', '1993-01-01', '서울특별시 강동구', NULL, NOW()),
('alice', '1234', '앨리스', 'alice@alice.com', '01055555555', 'F', '1994-01-01', '서울특별시 관악구', NULL, NOW()),
('cat', '1234', '김토끼', 'cat@cat.com', '01066666666', 'F', '1995-01-01', '서울특별시 강서구', NULL, NOW()),
('dog', '1234', '박강아지', 'dog@dog.com', '01077777777', 'F', '1996-01-01', '서울특별시 성북구', NULL, NOW()),
('elephant', '1234', '정코끼리', 'elephant@elephant.com', '01088888888', 'F', '1997-01-01', '서울특별시 은평구', NULL, NOW()),
('fox', '1234', '신여우', 'fox@fox.com', '01099999999', 'F', '1998-01-01', '서울특별시 노원구', NULL, NOW()),
('grape', '1234', '김포도', 'grape@grape.com', '01000000000', 'F', '1999-01-01', '서울특별시 양천구', NULL, NOW());

-- 학교명 테이블 (관리자가 생성)
INSERT INTO school_master (school_name, created_at) VALUES
('한양대학교', NOW()),
('서강대학교', NOW()),
('연세대학교', NOW());

-- 자격증명 테이블 (관리자가 생성)
INSERT INTO license_master (license_name, created_at) VALUES
('정보처리기사', NOW()),
('정보보안기사', NOW()),
('SQLD', NOW()),
('SQLP', NOW()),
('CCNA', NOW()),
('CCNP', NOW()),
('CISA', NOW()),
('CISSP', NOW()),
('SCJP', NOW()),
('SCJD', NOW());

-- 기술스택 테이블 (관리자가 생성)
INSERT INTO stack_master (stack_name, created_at) VALUES
('Java', NOW()),
('Python', NOW()),
('JavaScript', NOW()),
('C#', NOW()),
('PHP', NOW()),
('Ruby', NOW()),
('Swift', NOW()),
('Objective-C', NOW()),
('Kotlin', NOW()),
('Go', NOW());

-- employee의 최종학력 테이블
INSERT INTO employee_graduate (employee_id, school_id, school_graduate, created_at)
VALUES
(1, 1, '졸업', NOW()),
(2, 2, '재학중', NOW()),
(3, 3, '졸업', NOW()),
(4, 4, '재학중', NOW()),
(5, 5, '졸업', NOW()),
(6, 1, '졸업', NOW()),
(7, 2, '재학중', NOW()),
(8, 3, '졸업', NOW()),
(9, 4, '재학중', NOW()),
(10, 5, '졸업', NOW());

-- 경력사항 테이블
INSERT INTO employee_career (employee_id, career_company, career_start, career_end, created_at)
VALUES
(1, '네이버', '2015-01-01', '2017-12-31', NOW()),
(1, '카카오', '2018-01-01', '2020-06-30', NOW()),
(2, 'CJ ENM', '2016-04-01', '2018-03-31', NOW()),
(2, 'SK 텔레콤', '2018-04-01', '2021-03-31', NOW()),
(3, 'NC 소프트', '2017-07-01', '2019-06-30', NOW()),
(3, '네이버', '2019-07-01', '2021-06-30', NOW()),
(4, '삼성전자', '2018-05-01', '2020-04-30', NOW()),
(4, 'LG 전자', '2020-05-01', '2022-02-28', NOW()),
(5, '카카오', '2019-01-01', '2021-12-31', NOW()),
(6, 'SK 하이닉스', '2020-02-01', '2022-01-31', NOW());

-- employee의 자격증 테이블
INSERT INTO employee_license (employee_id, license_id, license_issuer, created_at)
VALUES
    (1, 1, '한국산업인력공단', NOW()),
    (1, 2, '한국산업인력공단', NOW()),
    (2, 1, '한국산업인력공단', NOW()),
    (2, 3, '한국교육개발원', NOW()),
    (3, 2, '한국교육개발원', NOW()),
    (3, 3, '한국산업인력공단', NOW()),
    (4, 2, '한국산업인력공단', NOW()),
    (4, 3, '한국산업인력공단', NOW()),
    (5, 1, '한국교육개발원', NOW()),
    (5, 2, '한국산업인력공단', NOW());

-- employee의 기술스택 테이블
INSERT INTO employee_stack (employee_id, stack_id, stack_acquistion, created_at) VALUES 
(1, 1, '2020-01-01', NOW()),
(1, 2, '2019-05-01', NOW()),
(2, 1, '2021-02-01', NOW()),
(2, 3, '2019-12-01', NOW()),
(3, 4, '2020-11-01', NOW()),
(3, 2, '2018-09-01', NOW()),
(4, 1, '2022-01-01', NOW()),
(4, 4, '2021-06-01', NOW()),
(5, 3, '2020-03-01', NOW()),
(5, 2, '2019-08-01', NOW());

-- 기업 테이블
-- INSERT INTO company(company_username, company_password, company_fullname, company_ceo_name, company_license_number, company_tel, company_address, company_email, company_thumbnail, company_establish, company_sales, company_employees_number, company_introduction, company_history, company_vision, created_at)
-- VALUES
-- ('company1', '1234', '삼성전자', '김기남', '123456-123456', '02-123-1234', '서울시 강남구 역삼동', 'samsung@samsung.com', 'thumbnail1', '1969-03-01', 100000000, 30000, '삼성전자입니다.', '삼성전자의 연혁', '삼성전자의 미래목표', NOW()),
INSERT INTO company (company_username, company_password, company_fullname, company_ceo_name, company_license_number, company_tel, company_address, company_email, company_thumbnail, company_establish, company_sales, company_employees_number, company_introduction, company_history, company_vision, created_at)
VALUES
('alphago', '1234', '알파고', '홍길동', '123456789012', '02-123-4567', '서울시 강남구', 'company1@example.com', '/images/kakao.jpg', '2010-01-01', 1000000000, 1000, '알파고는 인공지능 기술을 기반으로 다양한 분야에서 연구와 개발을 진행하고 있습니다.', '알파고는 2010년에 창립되어 현재까지 다양한 분야에서 연구와 개발을 진행하고 있습니다.', '알파고는 인공지능 기술을 활용해 사람들의 생활을 더 편리하고 풍요롭게 만드는 것을 목표로 합니다.', NOW()),
('naver', '1234', '네이버', '임꺽정', '123456789012', '02-123-4567', '경기도 성남시', 'company2@example.com', '/images/kakao.jpg', '2002-01-01', 1000000000, 5000, '네이버는 웹툰, 카페, 쇼핑 등 다양한 분야에서 서비스를 제공하고 있습니다.', '네이버는 2002년에 창립되어 현재까지 다양한 분야에서 성장하고 있습니다.', '네이버는 국내 최대 포털 사이트로서 다양한 서비스를 제공하는 것을 목표로 하고 있습니다.', NOW()),
('kakao', '1234', '카카오', '이순신', '123456789012', '02-123-4567', '경기도 성남시', 'company3@example.com', '/images/kakao.jpg', '2010-01-01', 2000000000, 2000, '카카오는 모바일 메신저와 콘텐츠 플랫폼을 중심으로 다양한 비즈니스를 진행하고 있습니다.', '카카오는 2010년에 창립되어 현재까지 다양한 분야에서 성장하고 있습니다.', '카카오는 모바일 메신저와 콘텐츠 플랫폼을 중심으로 세상을 더 편리하게 만드는 것을 목표로 합니다.', NOW()),
('line', '1234', '주식회사 라인', '김삿갓', '123-45-67890', '02-1234-5678', '서울특별시 송파구 석촌호수로 94 (잠실동)', 'contact@linecorp.com', 'https://www.logolynx.com/images/logolynx/15/15daaa7ee1ccbf5ec8c5b937eab40ca7.png', '2010-09-01', 220000, 2531, '라인은 전 세계 42개국에서 2억 7천만 명이 사용하는 모바일 메신저 및 인터넷 서비스를 제공하는 기업입니다.', '2011년 6월 23일, NHN이 라인사업부를 묶어 라인을 설립하였습니다. 초기에는 라인사업부에서 NHN Japan이 일본에서만 서비스를 제공하던 네이버 라인, 라인 게임즈(현재 줄여서 라인 게임스)가 있었습니다.', '최고의 모바일 플랫폼 기업이 되기 위해 지속적으로 새로운 서비스를 출시하고 기술적 혁신을 추구합니다.', NOW());

-- 이력서 테이블
INSERT INTO resume (employee_id, resume_title, resume_salary, CV, created_at) VALUES
(1, '개발자 이력서', '5000', '저는 개발자로서 5년 경력이 있습니다...', NOW()),
(1, '마케터 이력서', '4000', '저는 광고 마케팅 분야에서 3년 경력이 있습니다...', NOW()),
(2, '디자이너 이력서', '4500', '저는 UI/UX 디자인 분야에서 4년 경력이 있습니다...', NOW()),
(3, '개발자 이력서', '5500', '저는 자바 개발자로서 7년 경력이 있습니다...', NOW()),
(3, '데이터 분석가 이력서', '5000', '저는 데이터 분석가로서 6년 경력이 있습니다...', NOW()),
(4, '마케터 이력서', '4500', '저는 SNS 마케팅 분야에서 4년 경력이 있습니다...', NOW()),
(5, '디자이너 이력서', '4000', '저는 그래픽 디자인 분야에서 3년 경력이 있습니다...', NOW()),
(6, '개발자 이력서', '6000', '저는 스프링 프레임워크를 이용한 개발 경험이 5년 있습니다...', NOW()),
(7, '데이터 분석가 이력서', '5500', '저는 기업 데이터를 분석하고 시각화하는 경험이 6년 있습니다...', NOW()),
(8, '디자이너 이력서', '4500', '저는 반응형 웹사이트 디자인 분야에서 4년 경력이 있습니다...', NOW()),
(11, '디자이너 이력서111', '4500', '저는 반응형 웹사이트 디자인 분야에서 4년 경력이 있습니다...', NOW()),
(11, '디자이너 이력서', '4500', '저는 반응형 웹사이트 디자인 분야에서 4년 경력이 있습니다...', NOW());

-- 공고 테이블
INSERT INTO announcement (company_id, stack_id, announcement_title, announcement_content, announcement_carrer, announcement_hire_type, announcement_rec_num, announcement_salary, announcement_area, created_at)
VALUES (1, 1, '신입 개발자 모집', '한국어 처리 엔진을 개발하는 프로젝트의 개발자를 모집합니다.', '신입', '정규직', 3, '3500', '서울 강남구', now()),
       (2, 3, '데이터 분석가 채용', '사용자 행동을 분석하고 추천 알고리즘을 개발하는 데이터 분석가를 채용합니다.', '경력', '정규직', 2, '5000', '서울 종로구', now()),
       (3, 2, '웹 프론트엔드 개발자 모집', '다양한 웹 서비스를 개발하고 유지보수하는 웹 프론트엔드 개발자를 모집합니다.', '신입', '계약직', 5, '2800', '경기 성남시', now()),
       (1, 5, '백엔드 개발자 채용', '서비스의 안정성을 유지하고 기능을 개발하는 백엔드 개발자를 채용합니다.', '경력', '정규직', 1, '6000', '서울 마포구', now()),
       (4, 4, 'iOS 앱 개발자 모집', '다양한 iOS 앱 개발 프로젝트에서 일하는 iOS 앱 개발자를 모집합니다.', '경력', '정규직', 2, '4500', '서울 강서구', now()),
       (2, 1, 'Java 개발자 채용', '다양한 Java 프로젝트를 개발하고 유지보수하는 Java 개발자를 채용합니다.', '경력', '계약직', 3, '3800', '서울 영등포구', now());

-- 지원자 리스트
INSERT INTO apply (announcement_id, resume_id, created_at) VALUES
(1, 1, NOW()),
(1, 2, NOW()),
(1, 3, NOW()),
(2, 1, NOW()),
(2, 2, NOW()),
(2, 3, NOW()),
(3, 1, NOW()),
(3, 2, NOW()),
(3, 3, NOW()),
(4, 1, NOW());