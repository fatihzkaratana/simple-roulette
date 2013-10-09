<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*,java.sql.*,java.text.*,javax.sql.*,java.util.*,javax.naming.*,oracle.jdbc.*" %><%! Connection conn;

    String[][] runData = new String[10][250];
    String[] loadData = new String[10];
    String[] resultData = new String[10];
    String[] webTime = new String[10];
    String[] sel_gameno = new String[10];
    String[] new_gameno = new String[10];
    Integer[] sel_rowno = new Integer[10];
    Integer[] dataVarmi = new Integer[10];
    Integer[] resultVarmi = new Integer[10];
    Integer[] dataLoading = new Integer[10];
    String Sifirmala;

    String checknull(String xvalue) {
        return (xvalue == null) ? "" : xvalue;
    }

    Integer checkintzero(Integer xvalue) {
        return (xvalue == null) ? 0 : xvalue;
    }

    String checknullzero(String xvalue) {
        return (xvalue == null) ? "0" : xvalue;
    }

    void arraysifirla(int j) {
            sel_rowno[j] = 0;
            dataVarmi[j] = 0;
            resultVarmi[j] = 0;
            loadData[j] = "";
            resultData[j] = "";
            webTime[j] = "";
            sel_gameno[j] = "";
            for (int i = 0; i < 250; i++ )    runData[j][i]    = "";                       
    }
    void arrayallsifir() {
        for (int j = 0; j < 10; j++) {
            sel_rowno[j] = 0;  
            dataLoading[j] = 0;
            dataVarmi[j] = 0;
            resultVarmi[j] = 0;
            loadData[j] = "";
            resultData[j] = "";
            webTime[j] = "";
            sel_gameno[j] = "";
            for (int i = 0; i < 250; i++ )    runData[j][i]    = "";                       
        }
    }
%><%

    String xload = checknullzero(request.getParameter("load"));
    Integer xgameid = Integer.parseInt(checknullzero(request.getParameter("gameid")));
    Integer xgatbid = Integer.parseInt(checknullzero(request.getParameter("tableid")));

    
 if (Sifirmala == null) {
        arrayallsifir();
        Sifirmala = "1";
    }
    if (conn == null) {
        try {
            String connStr = "jdbc:oracle:thin:@(DESCRIPTION="
                    + "(ADDRESS_LIST="
                    + "(ADDRESS=(PROTOCOL=TCP)"
                    + "(HOST=192.168.1.104)"
                    + "(PORT=1521)"
                    + ")"
                    + ")"
                    + "(CONNECT_DATA="
                    + "(SERVICE_NAME=HLGS)"
                    + "(SERVER=DEDICATED)"
                    + ")"
                    + ")";

            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            conn = DriverManager.getConnection(connStr, "HLGS", "HLS");
        } catch (SQLException e) {
            conn = null;
        }
    } else if (conn != null && xgameid == 2 && xgatbid < 10 && xgatbid > 0) {
        java.text.DateFormat dateformat = new SimpleDateFormat("yyyyMMddHHmmss");
        java.util.Date date = new java.util.Date();
        String system_dateStr = dateformat.format(date);
        long datenumber = Long.parseLong(system_dateStr);
        if (webTime[xgatbid] == null) {
            webTime[xgatbid] = "" + datenumber;
        }


                try {

                    CallableStatement stmtps = conn.prepareCall("{?=call webscript_checkvalue(?,?,?,?,?,?,?,?)}");
                    stmtps.registerOutParameter(1, java.sql.Types.VARCHAR);
                    stmtps.setString(2, ""+xgameid); 
                    stmtps.setString(3, ""+xgatbid); 
                    stmtps.setString(4, ""+sel_rowno[xgatbid]); 
                    stmtps.setString(5, sel_gameno[xgatbid]);
                    stmtps.setString(6, checknullzero(request.getParameter("gameno")));
                    stmtps.setString(7, checknullzero(request.getParameter("rowno")));
                    stmtps.setString(8, checknullzero(""+datenumber));
                    stmtps.setString(9, checknullzero(""+webTime[xgatbid]));                    
                    stmtps.execute();
                    stmtps.close(); 
                    stmtps = null;
                } catch (Exception e) { }           
        
        
        if (datenumber >= (Long.parseLong("0"+webTime[xgatbid])) && dataLoading[xgatbid] == 0) {
            dataLoading[xgatbid] = 1;
            webTime[xgatbid] = "" + (datenumber + 1);

            dataVarmi[xgatbid] = 0;
            resultVarmi[xgatbid] = 0;
            String recdata = "";
          try {
          
                Statement stmtsql = conn.createStatement();
                ResultSet rsetsql = stmtsql.executeQuery(" SELECT  /*+INDEX(hlgs_gamescript_run ind_hlgs_gamescript_gameno)*/ gasc_id, gasc_result, sqlonly_highlovdata (gasc_runid) rundata FROM   hlgs_gamescript_run WHERE       gatb_gameno = " + checknullzero(sel_gameno[xgatbid]) + " AND gasc_id BETWEEN " + (sel_rowno[xgatbid] + 1) + " AND 999 AND gasc_runned = 1 AND LENGTH (gasc_runscript) > 3  AND gasc_runtime BETWEEN SYSDATE - 1 / 1000 and SYSDATE ORDER BY 1"); //AND gasc_runtime BETWEEN SYSDATE - 1 / 1000
                while (rsetsql.next()) {
                    sel_rowno[xgatbid] = rsetsql.getInt("gasc_id");
                    resultVarmi[xgatbid] = rsetsql.getInt("gasc_result");
                    recdata = checknull(rsetsql.getString("rundata"));
                    if (recdata.length() > 3) {
                        runData[xgatbid][sel_rowno[xgatbid]] = recdata;
                    }
                    dataVarmi[xgatbid] = 1;
                }
                rsetsql.close();
                stmtsql.close();
                rsetsql = null;
                stmtsql = null;
            } catch (SQLException edd) {}
            if (resultVarmi[xgatbid] == 1) {
              
                try {
    
                    CallableStatement stmtps = conn.prepareCall("{?=call highlov.bet_wonlist(?,?)}");
                    stmtps.registerOutParameter(1, java.sql.Types.VARCHAR);
                    stmtps.setString(2, checknullzero(request.getParameter("gameid")));
                    stmtps.setString(3, checknullzero(request.getParameter("tableid")));
                    stmtps.execute();
                    resultData[xgatbid] = checknull(stmtps.getString(1));
                    stmtps.close();

                } catch (Exception e) { }
            } else {
                resultData[xgatbid] = "";
            }
            if (dataVarmi[xgatbid] == 1) {
                try {
                    CallableStatement  stmtps = conn.prepareCall("{?=call sqlonly_highlovload(?,?,?)}");
                    stmtps.registerOutParameter(1, java.sql.Types.VARCHAR);
                    stmtps.setString(2, checknullzero(request.getParameter("gameid")));
                    stmtps.setString(3, checknullzero(request.getParameter("tableid")));
                    stmtps.setString(4, sel_gameno[xgatbid]);
                    stmtps.execute();
                    loadData[xgatbid] = checknull(stmtps.getString(1));
                    stmtps.close();

                } catch (Exception e) { }
            } else {
                try {     
                     
                    CallableStatement  stmtps = conn.prepareCall("{?=call sqlonly_highlov_newgame(?,?)}");
                    stmtps.registerOutParameter(1, java.sql.Types.VARCHAR);
                    stmtps.setString(2, checknullzero(request.getParameter("gameid")));
                    stmtps.setString(3, checknullzero(request.getParameter("tableid")));
                    stmtps.execute();
                    new_gameno[xgatbid] = checknullzero(stmtps.getString(1));
                    stmtps.close();
                   
                     if (!(checknullzero(new_gameno[xgatbid]).equals(checknullzero(sel_gameno[xgatbid])))) {
                        arraysifirla(xgatbid);
                        sel_gameno[xgatbid] = checknullzero(new_gameno[xgatbid]);
                        sel_rowno[xgatbid] = 0;
                    }
                     stmtps = null;
                     
                } catch (Exception e) {
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException eee) {
                        }
                        conn = null;
                    }
                }
            }
            dataLoading[xgatbid] = 0;
        }
    }
    String xgameno = checknullzero(request.getParameter("gameno"));
    String xrowno = checknullzero(request.getParameter("rowno"));

    Integer xindex = Integer.parseInt(xrowno) + 1;
    if (xload.equals("data")) {
        for (int i = xindex; i < 250; i++) {
            if (runData[xgatbid][i].length() > 3) {
                out.print(runData[xgatbid][i]);
            }
        }
    } else if (xload.equals("load")) {
        out.print(checknull(loadData[xgatbid]));
    } else if (xload.equals("result")) {
        out.print(checknull(resultData[xgatbid]));
    }
      out.print(" xgameno = " + checknullzero(sel_gameno[xgatbid]) + ";");
     if (Integer.parseInt(xrowno) != checkintzero(sel_rowno[xgatbid])) {
        out.print(" xrowno = " + sel_rowno[xgatbid] + ";");
    }
        %>