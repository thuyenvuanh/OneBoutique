<%-- 
    Document   : index
    Created on : Mar 10, 2022, 9:44:07 AM
    Author     : SE161502 Vu Anh Thuyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <c:forEach var="product" items="${list}" varStatus="loop">
        <div class="col-xl-3 col-sm-6 col-md-4 pb-3 d-flex justify-content-center">
            <!--<form action="${root}/cart/add.do">-->
            <form action="<c:url value="/cart/add.do"/>">
                <div class="card" style="width: 18rem;">
                    <img src="${root}/products/${product.id}.jpg" class="card-img-top" alt="${product.description}">
                    <input type="hidden" value="${product.id}" name="id"/>
                    <div class="card-body">
                        <h5 class="card-title">${loop.count} ${product.description}</h5>
                        <p class="card-text">
                            Price: <fmt:formatNumber value="${product.price}" pattern="$#,##0.00" /><br/>
                            Discount <fmt:formatNumber value="${product.discount}" pattern="#%" /><br/>
                            Price: <strike><fmt:formatNumber value="${product.price}" type="currency" /></strike>
                        <span style="color:red;font-size:20px;">
                            <fmt:formatNumber value="${product.price*(1 - product.discount)}" type="currency" />
                        </span><br/>
                        Discount <fmt:formatNumber value="${product.discount}" type="percent" /><br/>
                        </p>
                        <div class="row" style="height: 60px;">
                            <div class="col-8" style="height: 100%;">
                                <div class="form-floating" style="height: 100%;">
                                    <input name="quantity" value="1" type="number" class="form-control" id="email" placeholder="Quantity" required>
                                    <label for="quantity">Quantity</label>
                                </div>
                            </div>
                            <div class="col-4" style="height: 100%; padding: 2px;">
                                <button style="height: 100%; width: 100%;" type="submit" class="btn btn-primary"><i class="bi bi-cart-plus"> Add</i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </c:forEach>
</div>
<div class="row">
    <div class="col" style="text-align: right;">
        <br/>
        <form action="<c:url value="/home/trousers.do"/>">
            <button type="submit" class="btn btn-sm btn-default" name="op" value="FirstPage" title="First Page" <c:if test="${page==1}">disabled</c:if>><i class="bi bi-chevron-bar-left"></i></button>
            <button type="submit" class="btn btn-sm btn-default" name="op" value="PreviousPage" title="Previous Page" <c:if test="${page==1}">disabled</c:if>><i class="bi bi-chevron-left"></i></button>
            <button type="submit" class="btn btn-sm btn-default" name="op" value="NextPage" title="Next Page" <c:if test="${page==totalPage}">disabled</c:if>><i class="bi bi-chevron-right"></i></button>
            <button type="submit" class="btn btn-sm btn-default" name="op" value="LastPage" title="Last Page" <c:if test="${page==totalPage}">disabled</c:if>><i class="bi bi-chevron-bar-right"></i></button>
            <input type="number" name="gotoPage" min="1" max="${totalPage}" value="${page}" class="btn btn-sm btn-outline-default" style="text-align: right;width: 50px;" title="Enter page number"/>
            <button type="submit" class="btn btn-sm btn-default" name="op" value="GotoPage" title="Goto Page"><i class="bi bi-arrow-up-right-circle"></i></button>
        </form>
        Page ${page}/${totalPage}
    </div>
</div>
