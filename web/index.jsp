<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ include file="includes/controller/variables.jsp" %>
<%!
    String checknull(String xvalue) {
        return (xvalue == null) ? "" : xvalue;
    }

    String checknullzero(String xvalue) {
        return (xvalue == null) ? "0" : xvalue;
    }

    public Integer mathRandom() {
        return ((int) (Math.random() * 750));
    }
%>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <title>Nicosia Games - Şans Çemberi</title>
        <meta name="viewport" content="width=device-width; user-scalable=0;" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <meta content="text/html; charset=utf-8" http-equiv=Content-Type>
        <link rel="stylesheet" type="text/css" href="assets/css/css.css" />
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.path.js"></script>
        <script type="text/javascript" src="assets/js/app.js"></script>
    </head>
<%
    if ( 
         checknullzero((String) session.getAttribute("sub_id")).equals("0") ||
         checknullzero((String) session.getAttribute("sub_id")).equals("1") ||
         checknullzero((String) session.getAttribute("sub_id")) == null
       )
    {
%>
        <%@include file="includes/view/error.jsp" %>
<%  }else{ %>
        <%@include file="includes/view/game.jsp" %>
<%  }
    /*
 * 
 * head tag will end in other view pages
 * 
 */
%>

