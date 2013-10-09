<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*,java.text.*,javax.sql.*,java.util.*,javax.naming.*" %>
<%! String checknull(String xvalue) {
        return (xvalue == null) ? "" : xvalue;
    }

    String checknullzero(String xvalue) {
        return (xvalue == null) ? "0" : xvalue;
    }%>
<%
    Integer xsub_id = Integer.parseInt(checknullzero((String) session.getAttribute("sub_id")));

    if (xsub_id > 1000000) {

        Connection conn;
        String xgameno = checknullzero(request.getParameter("gameno"));
        String xrowno = checknullzero(request.getParameter("rowno"));
        String xtype = checknullzero(request.getParameter("type"));

        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/nicogame");
            conn = ds.getConnection();
        } catch (SQLException e) {
            conn = null;
        }

        if (conn != null && xgameno.length() > 5) {
            if (xtype.equals("ADDBET")) {
                try {
                    CallableStatement cs = conn.prepareCall("{?=call webscript_gethighlov_subbet(?,?,?,?,?,?,?,?,?)}");
                    cs.registerOutParameter(1, java.sql.Types.VARCHAR);
                    cs.setString(2, checknull((String) request.getRemoteAddr()));
                    cs.setString(3, checknullzero((String) session.getId()));
                    cs.setString(4, checknullzero((String) session.getAttribute("sub_id")));
                    cs.setString(5, checknullzero(request.getParameter("gameid")));
                    cs.setString(6, checknullzero(request.getParameter("tableid")));
                    cs.setString(7, checknullzero(request.getParameter("gameno")));
                    cs.setString(8, checknullzero(request.getParameter("cardno")));
                    cs.setString(9, checknullzero(request.getParameter("rowno")));
                    cs.setString(10, checknullzero(request.getParameter("data")));
                    cs.execute();
                    out.println(checknull(cs.getString(1)));
                    cs.close();
                } catch (Exception e) {
                }
            } else if (xtype.equals("SHOWBET")) {
                try {
                    CallableStatement cs = conn.prepareCall("{?=call webscript_gethighlov_subshow(?,?,?,?,?,?,?)}");
                    cs.registerOutParameter(1, java.sql.Types.VARCHAR);
                    cs.setString(2, checknull((String) request.getRemoteAddr()));
                    cs.setString(3, checknullzero((String) session.getId()));
                    cs.setString(4, checknullzero((String) session.getAttribute("sub_id")));
                    cs.setString(5, checknullzero(request.getParameter("gameid")));
                    cs.setString(6, checknullzero(request.getParameter("tableid")));
                    cs.setString(7, checknullzero(request.getParameter("gameno")));
                    cs.setString(8, checknullzero(request.getParameter("cardno")));
                    cs.execute();
                    out.println(checknull(cs.getString(1)));
                    cs.close();
                } catch (Exception e) {
                }
            } else if (xtype.equals("ACCBAL")) {
                try {
                    CallableStatement cs = conn.prepareCall("{?=call webscript_accounts(?,?,?,?,?)}");
                    cs.registerOutParameter(1, java.sql.Types.VARCHAR);
                    cs.setString(2, checknull((String) request.getRemoteAddr()));
                    cs.setString(3, checknullzero((String) session.getId()));
                    cs.setString(4, checknullzero((String) session.getAttribute("sub_id")));
                    cs.setString(5, checknullzero(request.getParameter("gameid")));
                    cs.setString(6, checknullzero(request.getParameter("tableid")));
                    cs.execute();
                    out.println(checknull(cs.getString(1)));
                    cs.close();
                } catch (Exception e) {
                }
            } else if (xtype.equals("PUTBAL")) {
                try {
                    CallableStatement cs = conn.prepareCall("{?=call webscript_opentableacc(?,?,?,?,?,?,?,?)}");
                    cs.registerOutParameter(1, java.sql.Types.VARCHAR);
                    cs.setString(2, checknull((String) request.getRemoteAddr()));
                    cs.setString(3, checknullzero((String) session.getId()));
                    cs.setString(4, checknullzero((String) session.getAttribute("sub_id")));
                    cs.setString(5, checknullzero(request.getParameter("gameid")));
                    cs.setString(6, checknullzero(request.getParameter("tableid")));
                    cs.setString(7, checknullzero(request.getParameter("gameno")));
                    cs.setString(8, checknullzero(request.getParameter("sitid")));
                    cs.setString(9, checknullzero(request.getParameter("gamestake")));
                    cs.execute();
                    out.println(checknull(cs.getString(1)));
                    cs.close();
                } catch (Exception e) {
                }
            } else if (xtype.equals("CLOSE")) {
                try {
                    CallableStatement cs = conn.prepareCall("{?=call webscript_closetableacc(?,?,?,?,?,?)}");
                    cs.registerOutParameter(1, java.sql.Types.VARCHAR);
                    cs.setString(2, checknull((String) request.getRemoteAddr()));
                    cs.setString(3, checknullzero((String) session.getId()));
                    cs.setString(4, checknullzero((String) session.getAttribute("sub_id")));
                    cs.setString(5, checknullzero(request.getParameter("gameid")));
                    cs.setString(6, checknullzero(request.getParameter("tableid")));
                    cs.setString(7, checknullzero(request.getParameter("gameno")));
                    cs.execute();
                    out.println(checknull(cs.getString(1)));
                    cs.close();
                } catch (Exception e) {
                }
            } else if (xtype.equals("CONNECT")) {
                try {
                    CallableStatement cs = conn.prepareCall("{?=call webscript_connection(?,?,?,?,?,?)}");
                    cs.registerOutParameter(1, java.sql.Types.VARCHAR);
                    cs.setString(2, checknull((String) request.getRemoteAddr()));
                    cs.setString(3, checknullzero((String) session.getId()));
                    cs.setString(4, checknullzero((String) session.getAttribute("sub_id")));
                    cs.setString(5, checknullzero(request.getParameter("gameid")));
                    cs.setString(6, checknullzero(request.getParameter("tableid")));
                    cs.setString(7, checknullzero(request.getParameter("gameno")));
                    cs.execute();
                    out.println(checknull(cs.getString(1)));
                    cs.close();
                } catch (Exception e) {
                }
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException eee) {
            }
            conn = null;
        }
    }
%>

