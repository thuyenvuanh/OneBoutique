<%-- 
    Document   : register_form
    Created on : Mar 19, 2022, 1:41:13 AM
    Author     : SE161502 Vu Anh Thuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="row">
        <div class="col-lg-2 col-md-1"></div>
        <div class="col-lg-8 col-md-10">
            <div class="p-5 bg-light rounded-3">
                <h3 class="mb-4" style="text-align: center">SIGN UP</h3>
                <form method="POST">
                    <div class="form-floating mb-3">
                                <input name="fullName" value="${fullName}" type="text" class="form-control" id="fullName" placeholder="Jogn Wick" required>
                                <label for="fullName">Full Name</label>
                            </div>
                    <div class="form-floating mb-3">
                        <input name="email" value="${email}" type="email" class="form-control" id="emailIpnut" placeholder="name@email.com" required>
                        <label for="email">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="password" type="password" class="form-control" id="passwordInput" placeholder="123456" required>
                        <label for="password">Password</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="passwordConfirm" type="password" class="form-control" id="passwordConfirmInput" placeholder="123456" required>
                        <label for="passwordConfirm">Password Confirm</label>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="form-floating mb-3">
                                <input name="username" value="${username}" type="text" class="form-control" id="username" placeholder="johnsmith123" required>
                                <label for="username">Username</label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-floating mb-3">
                                <input name="phone" value="${phone}" type="tel" class="form-control" id="phone" placeholder="(+1)123456789" required>
                                <label for="phone">Phone</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="address" value="${address}" type="text" class="form-control" id="address" placeholder="1 ABC Str, HCMC, VN" required>
                        <label for="address">Address</label>
                    </div>
                    <p style="color: red;">${message}</p>
                    <div class="row">
                        <div class="col-8">
                            <a href="<c:url value="/auth/login_form.do"/>" class="btn btn-link">Already have an account? Sign in</a>
                        </div>
                        <div class="col-4" style="text-align: end;">
                            <button formaction="<c:url value="/auth/register.do"/>" type="submit" class="btn btn-success">Let's start</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-lg-2 col-md-1"></div>
    </div>
</div>