<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>
	 

<script type="text/javascript">
   
   var authKey = "";
   var mId = "";
   // AJAX 를 통해 아이디를 찾는다.
   $(document).ready(function(){
      $('#findIdBtn').click(function(){
         $.ajax({
            url: 'findId',
            type: 'POST',
            dataType: 'json',
            data: 'mName=' + $('#mName').val() + '&mEmail=' + $('#mEmail').val(),
            success: function(data) {
               if ( data.result != "NO" ) {
                  
                     mId = data.result;
                  
                  $.ajax({
                     url : 'emailAuth',
                     type : 'POST',
                     dataType : 'json',
                     data : 'mEmail=' + $('#mEmail').val(),
                     success : function(data) {
                           alert('인증번호를 발송했습니다.');
                           authKey = data.authKey;
                     },
                     error : function() {
                        alert('AJAX 통신이 실패했습니다.');
                     }
                  });
               } else {
                  alert('일치하는 이메일 정보가 없습니다. 다시 작성해 주세요.');
               }
            },
            error: function() {
               alert('AJAX 통신이 실패했습니다.');
            }
         });
      });
         
      $('#realFindIdBtn').click(function(){

         if ($('#authKey').val() == authKey && authKey != "") {
            alert('인증되었습니다.');
               $('#findIdResult').text(mId);
         }else if(mId == ""){
            alert('이메일인증을 진행하세요.');
         }
         else {
            alert('인증번호를 확인하세요.');
         }
         
      });
   
   
   });
   
</script>
<div class="find-id-box">

   <p id="bold">아이디 찾기</p>
   <hr id="line"/>
   <p id="nobold">회원가입 시, 입력하신 회원정보 또는 본인인증으로 아이디를 확인할 수 있습니다.<p>
   <p id="nobold">인증번호는 가입 시 적어주신 이메일로 보내드립니다.<p>
   <form method="POST">
      <br/><p id="tableon">  본인확인용 정보로 찾기</p>  
      <table>
         <tr>
            <td>이 름</td>
            <td> <input class="findId-text" id="mName" type="text" name="mName" autofocus /></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td>
               <input class="findId-text" id="mEmail" type="text" name="mEmail"/>
               <input id="findIdBtn" type="button" value="인증번호 받기" />
            </td>
         </tr>
         <tr>
            <td>인증번호 입력</td>
            <td>
               <input id="authKey" type="text" name="authKey" />
               <input id="realFindIdBtn" type="button" value="아이디 찾기" />
             <div id="findIdResult"></div>  <!-- AJAX 처리 결과가 나타나는 위치이다. -->                  
            </td>
         </tr>
         
      </table>
      <div class="btnbox">
         <input id="findPwBtn"  type="button" value="비밀번호 찾기" onclick="location.href='findPwPage'"/>
      </div>
      <br/><br/>
   </form>
</div>






<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>