<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%!
class 교수 {
    private String 교수id = "inha";

    public boolean 교수체크(String 교수id) {
        return this.교수id.equals(교수id);
    }
}

class 성적 {
    private String 교수id;
    private String 학생id;
    private int 자바;
    private int DB;
    private int 보안;
    private int 총점;
    private double 평균;
    private String 학점;

    private 교수 교수객체 = new 교수();

    public String 성적입력(String 교수id, String 학생id, int 자바, int DB, int 보안) {
        if (!교수객체.교수체크(교수id)) {
            return "에러: 교수 권한이 없습니다.<br>";
        }

        this.교수id = 교수id;
        this.학생id = 학생id;
        this.자바 = 자바;
        this.DB = DB;
        this.보안 = 보안;

        this.총점 = 자바 + DB + 보안;
        this.평균 = 총점 / 3.0;

        return "성적 입력 완료<br>"
             + "교수id: " + this.교수id + "<br>"
             + "학생id: " + this.학생id + "<br>"
             + "자바: " + this.자바 + "<br>"
             + "DB: " + this.DB + "<br>"
             + "보안: " + this.보안 + "<br>"
             + "총점: " + this.총점 + "<br>"
             + "평균: " + this.평균 + "<br>";
    }

    public String 학점조회(String 교수id) {
        if (!교수객체.교수체크(교수id)) {
            return "에러: 조회 권한이 없습니다.<br>";
        }

        if (평균 >= 90) {
            학점 = "A학점";
        } else if (평균 >= 80) {
            학점 = "B학점";
        } else {
            학점 = "C학점";
        }

        return "학점조회 완료<br>"
             + "학생id: " + this.학생id + "<br>"
             + "평균: " + this.평균 + "<br>"
             + "학점: " + this.학점 + "<br>";
    }
}

class Add_Sungjuk_UI {
    private 성적 성적객체;

    public Add_Sungjuk_UI(성적 성적객체) {
        this.성적객체 = 성적객체;
    }

    public String 성적입력요청() {
        return 성적객체.성적입력("inha", "2024001", 90, 85, 95);
    }
}

class Search_Sungjuk_UI {
    private 성적 성적객체;

    public Search_Sungjuk_UI(성적 성적객체) {
        this.성적객체 = 성적객체;
    }

    public String 학점조회요청() {
        return 성적객체.학점조회("inha");
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리 시스템</title>
</head>
<body>

<h2>성적처리 시스템 실행 결과</h2>

<%
    성적 성적객체 = new 성적();

    Add_Sungjuk_UI addUI = new Add_Sungjuk_UI(성적객체);
    Search_Sungjuk_UI searchUI = new Search_Sungjuk_UI(성적객체);

    out.println("<h3>1. 성적입력 결과</h3>");
    out.println(addUI.성적입력요청());

    out.println("<hr>");

    out.println("<h3>2. 학점조회 결과</h3>");
    out.println(searchUI.학점조회요청());
%>

</body>
</html>