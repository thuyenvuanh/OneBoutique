<%-- 
    Document   : layout
    Created on : Feb 23, 2022, 10:47:32 AM
    Author     : PHT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>One Boutique - Fashion shopping</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body style="height: 100%; min-height: 100%">
        <div class="container-fluid">
            <!--navigator-->
            <div class="row">
                <nav class="navbar navbar-expand-lg navbar-light bg-white">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="<c:url value="/home/index.do"/>"><img src="${root}/images/logo.jpg" height="50"/> OneBoutique</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link" name="Shirts" aria-current="page" href="<c:url value="/home/shirts.do?"/>">Shirts</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" name="Troursers" href="<c:url value="/home/trousers.do?category=1"/>">Trousers</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" name="Jackets" href="<c:url value="/home/jackets.do?category=3"/>">Jackets</a>
                                </li>
                            </ul>
                            <form class="d-flex">
                                <c:if test="${user == null}">
                                    <button formaction="<c:url value="/auth/login_form.do"/>" class="btn btn-primary mx-2" type="submit"><i class="bi bi-box-arrow-in-right"> Login</i></button>
                                    <button formaction="<c:url value="/auth/register_form.do"/>" class="btn btn-outline-success mx-2" type="submit"><i class="bi bi-person-plus"> Register</i></button>
                                </c:if>
                                <c:if test="${user != null}">    
                                    <button formaction="<c:url value="/user/index.do"/>" class="btn btn-outline-secondary mx-2" type="submit"><i class="bi bi-person-check"></i> Welcome ${user.name}</button>
                                    <button formaction="<c:url value="/auth/logout.do"/>" class="btn btn-danger mx-2" type="submit"><i class="bi bi-box-arrow-left"></i> Logout</button>
                                </c:if>
                                <a style="text-decoration: none;" class="btn btn-link mx-2" href="<c:url value="/cart/index.do"/>"><i class="bi bi-cart"></i> ${cart.numOfProducts}</a>
                            </form> 
                        </div>

                    </div>
                </nav>
            </div>

            <!--body-->
            <div class="row content py-3">
                <div class="col">                    
                    <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp" />
                </div>
            </div>
            <!--footer-->
            <div class="row footer">
                <div class="col">
                    <hr/>
                    &copy; Copyright 2021-2022 PRJ. All Rights Reserved.
                </div>
            </div>
        </div>        
    </body>
</html>