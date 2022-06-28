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

<title>Check Out</title>
<link rel="stylesheet" href="<c:url value="/css/site.css"/>">
<jsp:useBean id="now" class="java.util.Date" />
<div class="container">
    <div class="row">
        <div class="col">
            <h1>Your Order</h1>
            <hr/>
            ID: ${user.id} <br/>
            Name: ${user.name} <br/>
            Address: ${user.address} <br/>
            Phone: ${user.phone} <br/>
            Email: ${user.email} <br/>
            Order date: <fmt:formatDate value="${now}" pattern="dd-MM-yyyy" />
            <table class="table table-striped">
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
                    </tr>
                </thead>
                <tbody>
                    <c:set var="total" value="0"></c:set>
                    <c:forEach var="item" items="${cart.items}" varStatus="loop" >    
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
                        </tr>
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
                    </tr>
                </tfoot>
            </table>
            <a class="btn btn-sm btn-outline-success" href="<c:url value="/checkout/pay.do"/>" style="float: right;"><i class="bi bi-wallet"></i> Pay</a>
            <a class="btn btn-sm btn-outline-primary mx-2" href="<c:url value="/home/index.do"/>" style="float: right;"><i class="bi bi-box-arrow-in-left"></i> Continue Shopping</a> 

        </div>
    </div>
</div>


