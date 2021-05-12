<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

myinfoOK.jsp 입니다. <br/>

<%
//	form에 입력된 한글 데이터가 post 방식으로 전송될 때 깨지는 현상을 방지한다.
//	한글 깨짐을 방지하려면 최초의 request.getParameter()가 실행되기 전에(맨 처음에) 아래 내용을 코딩하면 된다.
	request.setCharacterEncoding("UTF-8");

//	get 방식도 한글이 깨졌었다. => tomcat server 7.0 부터 get 방식을 사용할 때 한글이 깨지지 않고 처리된다.
//	get 방식에서 한글이 깨지면 서버 환경 설정에서 한글이 깨지지 않도록 설정해야 한다. => server.xml 파일을 수정해야 한다.
//	Servers 폴더의 server.xml 파일을 열고 64번줄의 Connector 태그에 

//	request.getParameter() : 이전 페이지에서 submit 버튼이 클릭되서 넘어오는 데이터를 받는다. => 무조건 문자열로 받는다.
	String name = request.getParameter("name");
	out.println(name + "님 안녕하세요<br/>");
	String id = request.getParameter("id");
	out.println(id + "님 안녕하세요<br/>");
	String pwd = request.getParameter("pwd");
	out.println(name + "님 비밀번호는" + pwd + "입니다.<br/>");
	
	try {
		int age = Integer.parseInt(request.getParameter("age"));
		out.println(name + "님의 나이는" + age + "살 입니다.<br/>");
		out.println(name + "님의 나이는 내년에" + (age + 1) + "살 입니다.<br/>");
	} catch (NumberFormatException e) {
		out.println("잘못된 나이가 입력되었습니다.<br/>");
		out.println("<script>");
		out.println("alert('잘못된 나이가 입력되었습니다.')");
		out.println("</script>");
		
	}
	
	String gender = request.getParameter("gender");
	out.println(name + "님 성별은" + gender + "입니다.<br/>");
	
//	checkbox는 여러 항목을 선택할 수 있는데 아래와 같이 getParameter() 메소드를 이용해서 받으면 맨 처음에 선택한 값 1개만 받을 수 있다.
//	String hobbies = request.getParameter("hobbies");
//	out.println(name + "님 취미는 " + hobbies + "입니다.<br/>");
	
//	checkbox에서 넘어오는 데이터를 받을 때는 넘어오는 항목이 여러개일 수 있기 때문에 getParameterValues() 메소드로 받아서 배열에 저장해서 처리해야 한다.
	String[] hobbies = request.getParameterValues("hobbies");
	out.println(name + "님의 취미는");
	try {
		for (int i = 0; i < hobbies.length; i++) {
			out.println(hobbies[i] + " ");
		}
	} catch (NullPointerException e) {
		out.println("취미는 없어요..");
	}
	out.println("입니다.<br/>");
	
	String trip = request.getParameter("trip");
	out.println(name + "님은 " + trip + "에 가고 싶어합니다.<br/>");
	
	String[] travel = request.getParameterValues("travel");
	out.println(name + "님은");
	try {
		for (int i = 0; i < travel.length; i++) {
			out.println(travel[i] + " ");
		}
	} catch (NullPointerException e) {
		out.println("가고 싶어 합니다.<br/>");
	}
	out.println("없어요ㅜ로나코땜에..<br/>");
	
	String content = request.getParameter("content");
//	태그 사용 가능, 줄바꿈 불가능
//	out.println(name + "님이 남긴글" + content + "<br/>");
//	태그 사용 불가능, 줄바꿈 불가능	
//	out.println(name + "님이 남긴글" + content.replace("<", "&lt;").replace(">", "&gt;") + "<br/>");
//	태그 사용 가능, 줄바꿈 가능		
//	out.println(name + "님이 남긴글" + content.replace("\r\n", "<br/>") + "<br/>");
//	태그 사용 불가능, 줄바꿈 가능		
//	반드시 replace("<", "&lt;").replace(">", "&gt;") 뒤에 replace("\r\n", "<br/>")를 써야한다.
	out.println(name + "님이 남긴글" + content.replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br/>") + "<br/>");





%>
<a href = "myinfo.jsp">돌아가기</a>

</body>
</html>
















