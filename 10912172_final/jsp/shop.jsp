<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="assets/images/logo.ico" type="image/x-icon" >
    <script src="assets/src/header.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/css/header.css">
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bttop.css">
    <link rel="stylesheet" type="text/css" href="assets/css/shop.css">
    <link rel="stylesheet" type="text/css" href="assets/css/product_card.css">
    <title>Shop</title>
</head>
<body>
    <!--header-->
    <header>
        <a href="index.jsp" class="logo"><span class="Tchange">MEME</span>RY</a>
        <ul>
          <li><a href="../aboutus.html">About Us</a></li>
          <li><a href="shop.jsp">Shop</a></li>       
          <li><a href="cart.jsp">Cart</a></li>
          <% if(session.getAttribute("ID")!=null){%>
            <a href="signout.jsp" style="text-decoration:none;">登出</a>
            <%if(session.getAttribute("ID").equals("admin")){%>	
              <li><a href="Mmember.jsp" style="text-decoration:none;">後臺管理</a></li>
            <%}else{%>
              <li><a href="member.jsp" style="text-decoration:none;">會員專區</a></li>
          <%}}else{%>
            <li><a href="login.jsp">MemberShip</a></li>
          <%}%>
    </header>
    <a href="#Top">
      <img src="assets/images/backtotop.png" width="100px" class="backtotop">
    </a>
    <div class="box">
      <div class="container-1">
        <form action="search.jsp">
          <span class="icon"><i class="fa fa-search"></i></span>
          <input type="search" name="search" id="search" placeholder="Search..." />
          <button type="submit">search</button>
        </form>
      </div>
    </div>
    <!--shop title-->
    <div class="container">
      <div class="card">
        <div class="imgbx">
          <a href="#gallery1"><img src="assets/images/kind1.png" ></a>
        </div>
        <div class="content">
          <h2>印象派<br>Impressionnisme</h2>
          <p>
            印象派強調人對外界物體的光和影的感覺和印象，在創作技法上反對因循守舊，主張藝術的革新。 繪畫技巧方面，印象派對光和色進行了探討，研究出用外光描寫對象的方法，並認識到色彩的變化是由色光造成的。
          </p>
        </div>
      </div>
      <div class="card">
        <div class="imgbx">
          <a href="#gallery2"><img src="assets/images/kind2.png" alt=""></a>
        </div>
        <div class="content">
          <h2>浮世絵<br>UKIYOE</h2>
          <p>
            日本的一種繪畫藝術形式，因巧妙地與木板活版印刷結合而在江戶時代廣為流行，起源於17世紀，並以18、19世紀的江戶為中心迎來創作與商業上的全盛時期，主要描繪人們日常生活、風景、和戲劇。
          </p>
        </div>
      </div>
      <div class="card">
        <div class="imgbx">
          <a href="#gallery3"><img src="assets/images/kind3.png" alt=""></a>
        </div>
        <div class="content">
          <h2>文藝復興<br>The Renaissance</h2>
          <p>
            文藝復興繪畫中出現的換色法、明暗對照法、暈塗法和統合法這四種風格迥異的繪畫技法被後世廣為流傳，許多藝術巨匠都曾經出神入化地運用它們創造出輝煌而美麗的藝術珍品。       
          </p>
        </div>
      </div>
      <div class="card">
        <div class="imgbx">
          <a href="#gallery4"><img src="assets/images/kind4.png" alt=""></a>
        </div>
        <div class="content">
          <h2>超現實主義<br>Surréalisme</h2>
          <p>
            超現實主義是一種現代西方文藝流派。 兩次世界大戰之間盛行於歐洲，在視覺藝術領域中其影響最為深遠。 致力於探索人類的潛意識心理，主張突破合乎邏輯與實際的現實觀，徹底放棄以邏輯和有序經驗記憶為基礎的現實形象。         
          </p>
        </div>
      </div>
    </div>
   
    <!--product-->
    <section id="gallery1">
      <hr><div class="title"><span class="Tchange">印象</span>派 | <span class="Tchange">Impression</span>nisme</div>
      <div class="gallery"> 
        <%
        request.setCharacterEncoding("utf-8");
        String imp = new String("印象派");
        String uki =new String("浮世絵");
        String the =new String("文藝復興");
        String sur =new String("超現實主義");
          String sql2 = "SELECT * FROM products WHERE 種類='"+imp+"'";
          ResultSet rs2 = con.createStatement().executeQuery(sql2);
          while(rs2.next())
        {%>
        <div class="contenter">
          <img src="<%out.print(rs2.getString(5));%>">
          <h3><input type="hidden" name="pname" value="<%out.print(rs2.getString(2));%>"><%out.print(rs2.getString(2));%></h3>
          <p><%out.print(rs2.getString(3));%></p>
          <h6>$<%out.print(rs2.getString(4));%></h6>
          <a href="product.jsp?page=<%out.print(rs2.getString(1));%>"><button class="buy" type="submit">Buy Now</button></a>
        </div>
      <%}%>
      </div>
    </section>


    <section id="gallery2">
      <hr><div class="title"><span class="Tchange">浮世</span>絵 | <span class="Tchange">UKI</span>YOE</div>
      <div class="gallery">
      <%
        String sql5 = "SELECT * FROM products WHERE 種類='"+uki+"'";
        ResultSet rs5 = con.createStatement().executeQuery(sql5);
        while(rs5.next())
      {%>
      <div class="contenter">
        <img src="<%out.print(rs5.getString(5));%>">
        <h3><input type="hidden" name="pname" value="<%out.print(rs5.getString(2));%>"><%out.print(rs5.getString(2));%></h3>
        <p><%out.print(rs5.getString(3));%></p>
        <h6>$<%out.print(rs5.getString(4));%></h6>
        <a href="product.jsp?page=<%out.print(rs5.getString(1));%>"><button class="buy" type="submit">Buy Now</button></a>
      </div>
    <%}%>
      </div>
    </section>

    <section id="gallery3">
      <hr><div class="title"><span class="Tchange">文藝</span>復興 | <span class="Tchange">The Renaiss</span>ance</div>
      <div class="gallery">
      <%
        String sql3 = "SELECT * FROM products WHERE 種類='"+the+"'";
        ResultSet rs3 = con.createStatement().executeQuery(sql3);
        while(rs3.next())
      {%>
      <div class="contenter">
        <img src="<%out.print(rs3.getString(5));%>">
        <h3><input type="hidden" name="pname" value="<%out.print(rs3.getString(2));%>"><%out.print(rs3.getString(2));%></h3>
        <p><%out.print(rs3.getString(3));%></p>
        <h6>$<%out.print(rs3.getString(4));%></h6>
        <a href="product.jsp?page=<%out.print(rs3.getString(1));%>"><button class="buy" type="submit">Buy Now</button></a>
      </div>
    <%}%>
      </div>
    </section>

    <section id="gallery4">
      <hr><div class="title"><span class="Tchange">超現實</span>主義 | <span class="Tchange">Surréa</span>lisme</div>
      <div class="gallery">
        <%
        String sql4 = "SELECT * FROM products WHERE 種類='"+sur+"'";
        ResultSet rs4 = con.createStatement().executeQuery(sql4);
        while(rs4.next())
      {%>
      <div class="contenter">
        <img src="<%out.print(rs4.getString(5));%>">
        <h3><input type="hidden" name="pname" value="<%out.print(rs4.getString(2));%>"><%out.print(rs4.getString(2));%></h3>
        <p><%out.print(rs4.getString(3));%></p>
        <h6>$<%out.print(rs4.getString(4));%></h6>
        <a href="product.jsp?page=<%out.print(rs4.getString(1));%>"><button class="buy" type="submit">Buy Now</button></a>
      </div>
    <%}%>
      </div>
      </div>
    </section>

    <!--footer-->
    <footer>
      <div class="Copyright">
        <p>Copyright © 2022 , CYCUIM<br>GROUP22</p>
        <div class="contact">
          <a href="mailto:bra987662@gmail.com"><img src="assets/images/mail.png"></a>
        </div>
        <p>CONTACT US</p>
      </div>
    </footer>
  
</body>
</html>