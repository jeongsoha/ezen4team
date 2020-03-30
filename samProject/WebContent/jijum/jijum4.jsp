<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp"%>

<% 

String tab = (String) request.getParameter("tab");
   if (tab == null) {
      tab = "";
   }
   
 String viewpage = (String) request.getParameter("viewPage");
   if (viewpage == null) {
      viewpage = "1";
   }
   
int unit = 5;
      String viewPage = request.getParameter("viewPage");
      if (viewPage == null) {  // 첫 진입 null 이면 에러(수정)
         viewPage = "1";
      }
   
      String totalSql = " select count(*) total from pjijum ";
      
   if (tab.equals("a")) {
      totalSql += "  WHERE jirecomend='Y'";
   } else if (tab.equals("b")) {
      totalSql += "  WHERE  jiabil1='Y'";
   } else if (tab.equals("c")) {
      totalSql += "  WHERE  jiabil2='Y'";
   } else if (tab.equals("d")) {
      totalSql += "  WHERE  jiabil3='Y'";

   }
   
      ResultSet rs2 = stmt2.executeQuery(totalSql);
      rs2.next();
      int total = rs2.getInt("total");
      int totalPage = (int) Math.ceil((double)total/unit);
      int startNo = (Integer.parseInt(viewPage)-1) * unit +1;  //  1 -> 1 ,  2 -> 11 , 3 -> 21
      int endNo = startNo+unit-1;
      
      

   
   
%>

    
<%
   String sql = " select b.* from (select a.*, rownum rn from (SELECT jiname, jiaddr,"
                          + " jitel, jiabil1, jiabil2,jiabil3, "
                     + " jirecomend,jistate, "
                    + " jistar, addrji" 
                          + " FROM pjijum  ";
      
      


   if (tab.equals("a")) {
      sql += "  WHERE jirecomend='Y' "   + " ) a ) b  ";
   } else if (tab.equals("b")) {
      sql += "  WHERE  jiabil1='Y'"    + " ) a ) b  ";
   } else if (tab.equals("c")) {
      sql += "  WHERE  jiabil2='Y'"    + " ) a ) b  ";
   } else if (tab.equals("d")) {
      sql += "  WHERE  jiabil3='Y'"    + " ) a ) b  ";

   } else    sql += " ) a ) b  ";
   
   sql +=   " where rn >="+startNo+" and rn <="+endNo+" " ;

   ResultSet rs = stmt.executeQuery(sql);
   
   
   
   
%>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>홈대리점</title>

</head>



<body>

   <%@include file="../include/header.jsp"%>


   <div class="tabmenu">

      <ul>
         <li id="tab1" class="btnCon"><a class="btn "
            href="jijum4.jsp?tab=a" style=height:50px;line-height:50px>프리미엄 스토어</a>
            <div class="tabCon"></div>
         <li id="tab2" class="btnCon"><a class="btn"
            href="jijum4.jsp?tab=b" style=height:50px;line-height:50px>전기자전거 서비스지정점</a>
            <div class="tabCon"></div></li>

         <li id="tab3" class="btnCon"><a class="btn"
            href="jijum4.jsp?tab=c" style=height:50px;line-height:50px>서비스지정점</a>
            <div class="tabCon"></div></li>

         <li id="tab4" class="btnCon"><a class="btn"
            href="jijum4.jsp?tab=d" style=height:50px;line-height:50px>전기자전거취급점</a>
            <div class="tabCon"></div></li>
      </ul>

      <table width="300;">

         

         <%
            while (rs.next()) {

               String name = rs.getString("jiname");
               String addr = rs.getString("jiaddr");
               String tel = rs.getString("jitel");
               String abil1 = rs.getString("jiabil1");
               String abil2 = rs.getString("jiabil2");
               String abil3 = rs.getString("jiabil3");
               String comend = rs.getString("jirecomend");
               String state = rs.getString("jistate");
               String star = rs.getString("jistar");
               String addrji = rs.getString("addrji");
         %>



         <tr style="border-top: 2px solid red; text-align: center; ">

            <td>
            <a href="?tab=<%=tab%>&addrji=<%=addrji%>&viewPage=<%=viewpage%>"> <h2><%=name%></h2></a></td>
                    <tr><td><h6><%=addr%></h6></td></tr>
            <td ><h5><%=tel%></h5></td>
            <tr></tr>
            <td style="border-bottom: 2px solid red;"> 고객만족점수: <%=star%></td>

         </tr>

         <%
            }
         %>
         <%@include file="api.jsp"%>
      
      </table>
      
         
         
   </div>


   <br>
   <br>
   
    <div Style="width:300px; margin-left: 200px" > <!--  페이지 버튼 가운데 정렬을 위한 div -->
   
  <ul class="pagination pagination-sm">
             
     <% for(int i=1 ; i<=totalPage ; i++) {
        %>    
     <li class="page-item"> <a class="page-link" href="jijum4.jsp?tab=<%=tab %>&viewPage=<%=i%>"><%=i %>
      
     </a></li>
     <% }%>
    </ul>

</div>     


   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>

   <%@include file="../include/footer.jsp"%>

</body>
</html>