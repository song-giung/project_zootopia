# 프로젝트
### 요약
* 설명 : 2018년 국비지원 웹 개발자 양성과정에서 진행했던 파이널 프로젝트(팀)
* 기간 : 약 한달(2018.7)
* 주제 : 반려동물을 임시 보호하고 케어해주는 펫시팅 중개 사이트
* 사용 기술 : 
  - JAVA(JSP / Servlet - MVC2) 
  - DB : ORACLE 11G
  - HTML / CSS
  - JavaScript / jQuery
  - Spring FrameWork(5.0.6)
  - Tomcat 8.5
* **담당 부분** : 
  - 개요 : 파이널 프로젝트에서는 게시판을 만들어보고 싶어서 게시판을 만들었습니다.  
  이미지를 첨부할수 있도록 하였고 페이징 처리, 추천, 신고, 댓글달기 기능을 만들었습니다. 관리자는 신고가 일정건수 이상인 게시물들만 모아서 처리할 수 있도록 하였습니다.  
  스프링 프레임웤을 사용하였고 CSS는 bootstrap을 이용하여서 모바일에서도 화면이 정상적으로 나오도록 하였고, 동적인 화면 전환 등은 ajax를 사용하였습니다.  
보다 자세한 화면 설명과 작성 코드는 상단 링크의 깃 저장소의 README.md에 기술하였습니다.
  - 팀장
  - 게시판
* **작성 소스 코드 위치** 
  - java :
    - [com.naver.zootopia.action.BoardAction.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/action/BoardAction.java)
    - [com.naver.zootopia.DAO.PetBoardDAOImpl.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/DAO/PetBoardDAOImpl.java)
    - [com.naver.zootopia.DAO.PetBoardService.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/DAO/PetBoardService.java)
    - [com.naver.zootopia.DAO.PetBoardServiceImpl.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/DAO/PetBoardServiceImpl.java)
    - [com.naver.zootopia.model.BoardBean.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/model/BoardBean.java)
    - [com.naver.zootopia.model.BoardReplyBean.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/model/BoardReplyBean.java)
    - [com.naver.zootopia.model.FavoriteBean.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/model/FavoriteBean.java)
    - [com.naver.zootopia.model.ImageBean.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/model/ImageBean.java)
    - [com.naver.zootopia.model.ReportBean.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/model/ReportBean.java)
    - [com.naver.zootopia.model.UpBean.java](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/java/com/naver/zootopia/model/UpBean.java) 
  - sql : /src/main/resources/sql/[board.xml](https://github.com/rldnddl87/project_zootopia/blob/master/src/main/resources/sql/board.xml)  
  - jsp : src/main/webapp/jsp/board/[하위 파일](https://github.com/rldnddl87/project_zootopia/tree/master/src/main/webapp/jsp/board)
  
***
### 프로젝트 리뷰
![프로젝트리뷰02](/project_introduction/review02.png)
***
### 프로젝트 계획서
![프로젝트계획서](/project_introduction/project_plan.png)
***
### 테이블 정의서
![테이블정의서](/project_introduction/define_table.png)
