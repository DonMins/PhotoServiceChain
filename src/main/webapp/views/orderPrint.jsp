<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

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
    <style>
        .table_dark {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 14px;
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
            border-right: 1px solid #37B5A5;
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
    <li><a class="${pageContext.request.userPrincipal.name != 'admin' ? 'hide': 'a-class'}" href="${contextPath}/users">Пользователи</a>
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
<table>
    <tr>
        <th>
            <form id="file-selector" style="background-color: #f2f2f2; border: 2px solid #a9c358; height: 800px; width: 500px;
margin-top: 15px;  border-radius: 5px;" method="post" enctype="multipart/form-data"
                  action="${contextPath}/upload?${_csrf.parameterName}=${_csrf.token}">

                <h style="color: black">Оформление заказа</h>
                <br>
                <input style="margin-top: 30px;width: 400px;border: 1px solid black;" name="surname" type="text"
                       placeholder="Фамилия" autofocus="true" required value="${surname}"/> <br>

                <input style="margin-top: 10px;width: 400px;border: 1px solid black;" name="name" type="text"
                       placeholder="Имя" required value="${name}"/> <br>

                <input style="margin-top: 10px;width: 400px;border: 1px solid black;" name="patronymic" type="text"
                       placeholder="Отчество" required value="${patronymic}"/> <br>

                <input style="margin-top: 10px;width: 400px;border: 1px solid black;" name="email" type="email"
                       placeholder="Email" required value="${email}"/> <br>

                <input style="margin-top: 10px;width: 400px; border: 1px solid black" name="phone" type="tel"
                       placeholder="Телефон" required value="${phone}"/> <br>

                <select onchange="changeSize()" style="margin-top: 10px;width: 400px; border: 1px solid black"
                                              id="select" name="sizePhoto">
                <option disabled selected>Выберите размер фотографий для печати</option>
                <option value="10Х15">10Х15</option>
                <option value="15Х21">15Х21</option>
                <option value="21Х30">21Х30</option>
                <option value="30Х42">30Х42</option>
            </select>

                <select name="typePhoto" onchange="changeSize()" style="margin-top: 10px;width: 400px; border: 1px solid black"
                        id="select2">
                    <option disabled selected>Выберите тип фотографий для печати</option>
                    <option value="Глянцевая">Глянцевая</option>
                    <option value="Матовая">Матовая</option>
                </select>

                <p><input id="photo" style="color: black; width: 400px; border: 1px solid black;"
                          onchange="showInfo(this)" type="file"
                          name="photo" multiple accept="image/*">
                    <textarea class="textarea" id="you-file" readonly
                              style="height: 100px; margin-top: 30px"
                              placeholder="Информация о Ваших фотографиях"></textarea>

                    <textarea name="comment" style="margin-top: 30px" class="textarea"
                              placeholder="Напишите комментарии и пожелания"></textarea>
                    <br>

                    <label style="color: black;">
                        ИТОГО:
                    </label>
                    <output id="total" style="color: black; margin-top: 30px;width: 300px; " readonly></output>
                    <input id="totalHidden" name="total" style="color: black; margin-top: 30px;width: 300px;" hidden></input>
                    <input style="margin-left: 20px; background: red; border: 0 none;  cursor: pointer; -webkit-border-radius: 5px;
                        border-radius: 5px;   font-size: 15pt;   color: white;" type="submit" value="Отправить на печать">

            </form>
        </th>
        <th style="color: black; padding-left: 20px;font-size: 15px; text-align: left">
            <div class="container center-block">
                <table class="table_dark" border="1">
                    <thead>
                    <tr>
                        <th scope="col">Размер фотографии,см </th>
                        <th scope="col">от 1 шт. (Глянцевая)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>10Х15</td>
                        <td>7.9 руб</td>
                    </tr>
                    <tr>
                        <td>15Х21</td>
                        <td>25 руб</td>
                    </tr>
                    <tr>
                        <td>21Х30</td>
                        <td>60 руб</td>
                    </tr>
                    <tr>
                        <td>30Х42</td>
                        <td>160 руб</td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <div class="container center-block">
                <table class="table_dark" border="1">
                    <thead>
                    <tr>
                        <th scope="col">Размер фотографии,см </th>
                        <th scope="col">от 1 шт. (Матовая)</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>10Х15</td>
                        <td>15 руб</td>
                    </tr>
                    <tr>
                        <td>15Х21</td>
                        <td>28 руб</td>
                    </tr>
                    <tr>
                        <td>21Х30</td>
                        <td>62 руб</td>
                    </tr>
                    <tr>
                        <td>30Х42</td>
                        <td>170 руб</td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <div style="margin-top: 30px">
                Закажите фотографии через интернет и получите в фотоцентре готовый заказ.<br>

                Цифровая печать на профессиональных фотопринтерах.<br>

                Печать фотографий через интернет от 2-х часов!<br>

                Срок выполнения заказа зависит от количества фотографий.<br>

                При заказе более 100 фотографий срок выполнения заказа от 4-х часов в рабочее время.<br>

                В случае, если у Вас небольшой заказ, до 10 фотографий, мы его успеем выполнить за 1 час.<br>

                Фотографии формата 30*42 доставляются на следующий рабочий день.<br>

                При несоответствии формата фотографий при печати произойдет автоматическое обрезание
                их по краям, оператор за обрезанные фотографии ответственности не несет.<br>

                Для обеспечения печати «в край» без полей, фотография автоматически увеличивается на 1‒2%,
                вследствие чего возможна обрезка фото по контуру 2‒3 мм. Если для ваших снимков это критично,
                пожалуйста, при заказе указывайте «печать с полями».<br>

                Оттенок цвета при печати на глянцевой, суперглянцевой и матовой бумаге может отличаться от цветопередачи
                Вашего монитора в пределах нормы.<br>

                Указан срок выполнения заказа в рабочее время, а не время после оформления заказа.)<br>

                График работы: ПН -СБ с 10:00 до 20:00<br>

                ВС с 10:00 до 18:00 <br>
            </div>
        </th>
    </tr>

</table>
</body>
</html>