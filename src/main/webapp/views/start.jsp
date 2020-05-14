<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Photo Service Chain </title>
    <link href="${contextPath}/resources/css/font.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <meta id="_csrf_token" value="${_csrf.token}"/>

    <script src="${contextPath}/resources/js/app-ajax.js" type="text/javascript"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="${contextPath}/resources/css/ui-lightness/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css" />
    <script src="${contextPath}/resources/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/js/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>


<script>
    $(function () {
        $("#dialog").dialog({
            autoOpen: false
        });
        $("#openD").click(function () {
            $("#dialog").dialog("open");
        });
    });
</script>
</head>

<body>
<%--<ul>--%>
<%--    --%>
<%--    <li><button id ="inwork" onclick="MessageBox()" >О Компании</button></li>--%>
<%--    <li><a onclick="MessageBox()">Оплата и доставка</a></li>--%>
<%--    <li><a onclick="MessageBox()">Новости</a></li>--%>
<%--    <li><a onclick="MessageBox()">Техподдержка</a></li>--%>
<%--    <button style="float:right" class="button" type="submit" onclick="document.forms['logoutForm'].submit()">Выйти--%>
<%--    </button>--%>


<%--    <c:if test="${pageContext.request.userPrincipal.name != null}">--%>
<%--    <form id="logoutForm" method="POST" action="${contextPath}/logout">--%>
<%--        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--    </form>--%>
<%--    <p class="userInput"> Вы вошли как: ${pageContext.request.userPrincipal.name}--%>
<%--        </c:if>--%>

<%--</ul>--%>

<ul class="ul-class">
    <li><a href="#">Главная</a></li>
    <li><a href="#" >Услуги</a>
        <ul class="ul-class">
            <li><a href="#" style="font-size: medium">Печать фотографий</a></li>
            <li><a href="#" style="font-size: medium" onclick="MessageBox()">Реставрация фотографий </a></li>
            <li><a href="#" style="font-size: medium" onclick="MessageBox()">Печать на сувенирах</a></li>
        </ul>
    </li>
    <li><a href="#" onclick="MessageBox()">Оплата и доставка</a></li>
    <li><a href="#" onclick="MessageBox()">Контакты</a></li>
    <li style="float: right" >
         <a id="openD" href="#">Войти</a>
    </li>
</ul>

<div id="dialog" title="Авторизация">
    <form method="post" action="">
        <span >e-mail</span>: 
        <input name="login" type="text" size="10"><br>
        <span> Пароль</span>: 
        <input name="pass" type="password" size="8">
        <br>
        <input type="submit" name="Submit" value="Войти">
    </form>
</div>

<div class="image">
    <img src="${contextPath}/resources/css/316.jpg" alt="" width="100%">
    <div class="mu" style="padding-top: 30px ">
        Печать фотографий
        <ul style="list-style:circle">
            <li style="font-size: 15px; color: black">Удобный заказ на сайте</li>
        </ul>
        <ul style="list-style:circle">
            <li style="font-size: 15px; color: black">Печать за 1 час</li>
        </ul>
        <ul style="list-style:circle">
            <li style="font-size: 15px; color: black">7 фотоцентров в Самаре</li>
        </ul>
    </div>
    <button class="order"> Заказать печать  </button>
</div>
</div>
</body>
</html>
