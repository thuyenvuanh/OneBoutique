<%-- 
    Document   : login_form
    Created on : Mar 18, 2022, 1:53:53 PM
    Author     : SE161502 Vu Anh Thuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="row">
        <div class="col-lg-2 col-md-1"></div>
        <div class="col-lg-8 col-md-10">
            <div class="p-5 bg-light rounded-3">
                <h3 class="mb-4" style="text-align: center">SIGN IN</h3>
                <form method="POST">
                    <div class="form-floating mb-3">
                        <input name="email" value="${email}" type="email" class="form-control" id="email" placeholder="name@example.com" required>
                        <label for="email">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="password" type="password" class="form-control" id="password" placeholder="123456" required>
                        <label for="password">Password</label>
                    </div>
                        <p style="color: red;">${message}</p>
                    <div class="row">
                        <div class="col-8">
                            <a href="<c:url value="/auth/register_form.do"/>" type="button" class="btn btn-link">New one? Create an account</a>
                        </div>
                        <div class="col-4" style="text-align: end;">
                            <button formaction="<c:url value="/auth/login.do"/>" type="submit" class="btn btn-primary">Sign in</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-lg-2 col-md-1"></div>
    </div>
</div>