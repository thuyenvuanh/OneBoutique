<%-- 
    Document   : index
    Created on : Mar 6, 2022, 7:12:45 PM
    Author     : SE161293 Nguyen Minh Tam
--%>

<%-- 
Document   : index
Created on : Mar 1, 2022, 7:50:11 AM
Author     : SE161293 Nguyen Minh Tam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>Cart Management</title>
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">

<div class="container">
    <div class="row">
        <div class="col">
            <h1>Your Cart</h1>
            <hr/>
            <table class="table table-striped align-middle">
                <thead>
                    <tr>
                        <th class="text-right">No. </th>
                        <th class="text-right">Id</th>
                        <th>Image</th>
                        <th>Description</th>
                        <th class="text-right">Old Price</th>
                        <th class="text-right">Discount</th>
                        <th class="text-right">New Price</th>
                        <th class="text-right">Quantity</th>
                        <th class="text-right">Cost</th>
                        <th>Operations</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="total" value="0"></c:set>
                    <c:forEach var="item" items="${cart.items}" varStatus="loop" >
                    <form>    
                        <tr>
                            <td class="text-right">${loop.count}</td>
                            <td class="text-right">
                                ${item.id}<input type="hidden" value="${item.id}" name="id"/>
                            </td>
                            <td><img src="<c:url value="/products/${item.id}.jpg"/>"height="60"/></td>
                            <td>${item.description}</td>
                            <td class="text-right"><fmt:formatNumber value= "${item.price}" type="currency"/></td>
                            <td class="text-right"><fmt:formatNumber value= "${item.discount}" type="percent"/></td>
                            <td class="text-right"><fmt:formatNumber value= "${item.price*(1- item.discount)}" type="currency"/></td>
                            <td class="text-right"><input type="number" value="${item.quantity}" name="quantity" style="width: 80px"/></td>
                            <td class="text-right"><fmt:formatNumber value= "${item.price*(1- item.discount) * item.quantity}" type="currency"/></td>
                            <td class="text-right">
                                <button type="submit" style="width: 48%;" class="btn btn-sm btn-outline-success" value="update" name="op" formaction="<c:url value="/cart/update.do"/>"><i class="bi bi-arrow-repeat"></i> Update</button>
                                <button type="submit" style="width: 48%;" class="btn btn-sm btn-outline-danger" name="op" value="delete" formaction="<c:url value="/cart/delete.do"/>"><i class="bi bi-cart-dash"></i> Delete</button>
                            </td>
                        </tr>
                    </form>
                    <c:set var = "total" value="${total + item.price*(1- item.discount) * item.quantity}"/>
                </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>Total</th>
                        <th class="text-right"></th>
                        <th class="text-right"></th>
                        <th class="text-right"></th>
                        <th class="text-right"></th>
                        <th class="text-right"></th>
                        <th class="text-right"><fmt:formatNumber value= "${total}" type="currency"/></th>
                        <th class="text-right"><a class="btn btn-sm btn-outline-danger" style="width: 100%;" href="<c:url value="/cart/empty.do"/>"><i class="bi bi-cart-x"></i> Empty Your Cart</a></th>
                    </tr>
                </tfoot>
            </table>
            <a class="btn btn-sm btn-outline-success" href="<c:url value="/checkout/index.do"/>" style="float: right;"><i class="bi bi-credit-card"></i > Check Out</a>
            <a class="btn btn-sm btn-outline-primary mx-2" href="<c:url value="/home/index.do"/>" style="float: right;"><i class="bi bi-box-arrow-in-left"></i> Continue Shopping</a> 

        </div>
    </div>
</div>


