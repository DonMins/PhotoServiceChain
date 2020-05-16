<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html;charset=UTF-8" language="java"%>

<html>
<head>
    <link href="${contextPath}/resources/css/font.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <meta id="_csrf_token" value="${_csrf.token}"/>

    <script src="${contextPath}/resources/js/app-ajax.js" type="text/javascript"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="${contextPath}/resources/css/ui-lightness/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css"/>
    <script src="${contextPath}/resources/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/js/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>
    <title>Все заказы</title>
    <style>
        .table_dark {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 14px;
            max-width: 100%;
            width: 100%;
            text-align: center;
            border-collapse: collapse;
            background: #252F48;
            margin-top: 10px;
        }
        .table_dark th {
            color: #EDB749;
            border-bottom: 1px solid #37B5A5;
            padding: 12px 17px;
        }
        .table_dark td {
            color: #CAD4D6;
            border-bottom: 1px solid #37B5A5;
            border-right:1px solid #37B5A5;
            padding: 7px 17px;
        }
        .table_dark tr:last-child td {
            border-bottom: none;
        }
        .table_dark td:last-child {
            border-right: none;
        }
        .table_dark tr:hover td {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<ul class="ul-class">
    <li><a class="a-class" href="${contextPath}/start">Главная</a></li>
    <li><a class="a-class" href="#">Услуги</a>
        <ul class="ul-class">
            <li><a class="a-class" href="#" style="font-size: medium">Печать фотографий</a></li>
            <li><a class="a-class" href="#" style="font-size: medium" onclick="MessageBox()">Реставрация фотографий </a>
            </li>
            <li><a class="a-class" href="#" style="font-size: medium" onclick="MessageBox()">Печать на сувенирах</a>
            </li>
        </ul>
    </li>
    <li><a class="a-class" href="#" onclick="MessageBox()">Оплата и доставка</a></li>
    <li><a class="a-class" href="#" onclick="MessageBox()">Контакты</a></li>
    <li><a class="${pageContext.request.userPrincipal.name != 'admin' ? 'hide': 'a-class'}" href="${contextPath}/users">Пользователи</a></li>
    <li><a class="${pageContext.request.userPrincipal.name == null ? 'hide': 'a-class'}" href="${contextPath}/allOrder">Заказы</a></li>

    <li style="float: right">
        <a class="${pageContext.request.userPrincipal.name != null ? 'hide': 'a-class'}" id="openD" href="#">
            <img src="${contextPath}/resources/css/closed_door1.png" alt="л"
                 style="width: 25px;height: 25px;vertical-align: text-top;">Войти
        </a>
    </li>

    <li style="float: right">
        <a id="exit" class="${pageContext.request.userPrincipal.name == null ? 'hide': 'a-class'}" onclick="document.forms['logoutForm'].submit()"
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

<div class="container center-block">
    <table class="table_dark" border="1">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Имя пользователя</th>
            <th scope="col">Фамилия</th>
            <th scope="col">Имя</th>
            <th scope="col">Отчество</th>
            <th scope="col">Телефон</th>
            <th scope="col">Email</th>
            <th scope="col">Размер</th>
            <th scope="col">Тип</th>
            <th scope="col">Названия</th>
            <th scope="col">Комментарий</th>
            <th scope="col">Сумма</th>
            <th scope="col">Статус</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${order}" var="item" varStatus="status">
            <tr>
                <th scope="row">${status.index+1}</th>
                <td>${item.users.username}</td>
                <td>${item.users.surname}</td>
                <td>${item.users.name}</td>
                <td>${item.users.patronymic}</td>
                <td>${item.users.phone}</td>
                <td>${item.users.email}</td>
                <td>${item.sizePhoto}</td>
                <td>${item.typePhoto}</td>
                <td>${item.linkOnPhoto}</td>
                <td>${item.comment}</td>
                <td>${item.total}</td>
                <td>${item.isStatus()}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>