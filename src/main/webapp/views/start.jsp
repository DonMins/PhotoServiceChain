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
    <script>
        var orderPrint = "${contextPath}/orderPrint";
        var NowUser = "${pageContext.request.userPrincipal.name}"
    </script>

    <script src="${contextPath}/resources/js/app-ajax.js" type="text/javascript"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="${contextPath}/resources/css/ui-lightness/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
    <script src="${contextPath}/resources/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/js/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>


    <script>
        $(function () {
            $("#dialog").dialog({
                autoOpen: false,
                modal: true,
                minHeight: 300,
                minWidth: 300,
                resizable: false,
                draggable: false,
                close: function () {
                    var error = document.getElementById("error-span");
                    error.hidden = true;
                }

            });
            $("#openD").click(function () {
                $("#dialog").dialog("open");
            });


            $("#registration").dialog({
                autoOpen: false,
                modal: true,
                minHeight: 300,
                minWidth: 300,
                resizable: false,
                draggable: false,
                close: function () {
                    document.getElementById("username-error").hidden = true;
                    document.getElementById("password-error").hidden = true;
                    document.getElementById("email-error").hidden = true;
                    document.getElementById("confirmPassword-error").hidden = true;
                }

            });
            $("#regist").click(function () {
                $("#registration").dialog("open");
            });
        });
    </script>
</head>

<body onload=openDialog(${error.length()});openDialog(${success.length()});OpenRegistration(${errorReg.length()})>
<ul class="ul-class">
    <li><a class="a-class" href="${contextPath}/start">Главная</a></li>
    <li><a class="a-class" href="#">Услуги</a>
        <ul class="ul-class">
            <li><a class="a-class" href="javascript:orderBox()" style="font-size: medium">Печать фотографий</a></li>
            <li><a class="a-class" href="#" style="font-size: medium" onclick="MessageBox()">Реставрация фотографий </a>
            </li>
            <li><a class="a-class" href="#" style="font-size: medium" onclick="MessageBox()">Печать на сувенирах</a>
            </li>
        </ul>
    </li>
    <li><a class="a-class" href="#" onclick="MessageBox()">Оплата и доставка</a></li>
    <li><a class="a-class" href="#" onclick="MessageBox()">Контакты</a></li>
    <li><a class="${pageContext.request.userPrincipal.name != 'admin' ? 'hide': 'a-class'}" href="${contextPath}/users">Пользователи</a>
    </li>
    <li><a class="${pageContext.request.userPrincipal.name == null ? 'hide': 'a-class'}" href="${contextPath}/allOrder">Заказы</a>
    </li>

    <li style="float: right">
        <a class="${pageContext.request.userPrincipal.name != null ? 'hide': 'a-class'}" id="openD" href="#">
            <img src="${contextPath}/resources/css/closed_door1.png" alt="л"
                 style="width: 25px;height: 25px;vertical-align: text-top;">Войти
        </a>
    </li>

    <li style="float: right">
        <a id="exit" class="${pageContext.request.userPrincipal.name == null ? 'hide': 'a-class'}"
           onclick="document.forms['logoutForm'].submit()"
           href="#">
            <img src="${contextPath}/resources/css/open_door1.png" alt="л"
                 style="width: 25px;height: 25px;vertical-align: text-top;">Выйти
        </a>
    </li>
    <li style="float: right">
        <p class="${pageContext.request.userPrincipal.name == null ? 'hide': 'userInput'}">
            <img src="${contextPath}/resources/css/man1.png" alt="man"
                 style="width: 20px;height: 20px;vertical-align: middle;">
            Вы вошли как: ${pageContext.request.userPrincipal.name}</p>
    </li>
    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</ul>

<div id="dialog" title="Авторизация">
    <form method="POST" action="${contextPath}/login" class="form-signin">
        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" type="text" placeholder="Имя пользователя"
                   autofocus="true" required/>
            <input style="margin-top: 10px" name="password" type="password" placeholder="Пароль" required/>
            <span id="error-span" style="color: red; font-size: 14px;margin-top: 10px">${error}</span>
            <br>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button type="submit" class="button"
                    style="color:white; background-color:#819A32;width: 100%; margin-top: 20px"> Войти
            </button>
            <h4 class="text-center"><a id="regist" href="#">Создать учетную запись</a></h4>
        </div>
    </form>
</div>


<div id="registration" title="Регистрация">
    <form method="POST" action="${contextPath}/registration" class="form-signin">
        <div class="form-group ${error != null ? 'has-error' : ''}">
            <input name="username" type="text" placeholder="Имя пользователя" autofocus="true" required/>
            <span id="username-error" style="color: red; font-size: 14px;margin-top: 10px">${username}</span>

            <input style="margin-top: 10px" name="surname" type="text" placeholder="Фамилия" required/>
            <input style="margin-top: 10px" name="name" type="text" placeholder="Имя" required/>
            <input style="margin-top: 10px" name="patronymic" type="text" placeholder="Отчество" required/>
            <input style="margin-top: 10px" name="phone" type="tel" placeholder="Телефон" required/>

            <input style="margin-top: 10px" name="email" type="email" placeholder="Email" required/>
            <span id="email-error" style="color: red; font-size: 14px;margin-top: 10px">${email}</span>

            <input style="margin-top: 10px" name="password" type="password" placeholder="Пароль" required/>
            <span id="password-error" style="color: red; font-size: 14px;margin-top: 10px">${password}</span>

            <input style="margin-top: 10px" name="confirmPassword" type="password" placeholder="Повторить пароль"
                   required/>
            <span id="confirmPassword-error"
                  style="color: red; font-size: 14px;margin-top: 10px">${confirmPassword}</span>

            <br>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button type="submit" class="button"
                    style="color:white; background-color:#819A32;width: 100%; margin-top: 20px"> Зарегистрироваться
            </button>
        </div>
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
    <button class="order" onclick="orderBox()"> Заказать печать</button>
</div>
</div>
</body>
</html>
