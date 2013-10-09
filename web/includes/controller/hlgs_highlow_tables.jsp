<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="include_dosya/Top.jsp"%>
<%@ include file="include_dosya/Sayfa_UstUstHtml.jsp" %>
<%@ include file="include_dosya/Center_AllPageTop.jsp" %>
<style>
    .fLeft { float: left; }
    .clear { clear: both; }
    #yuksekdusuk_title, #kkkp_title { font-size: 16px; font-weight: bold; color: #FFF; }
    #yuksekdusuk, #kkkp { width: 600px; height: 50px; margin: 0 auto }
    #gamelogo { background: url(images/yuksek_dusuk_main.png) no-repeat -2px -12px; width: 151px; height: 143px; }
    #gamelogo2 { background: url(images/kkkp_main.png) no-repeat -2px -12px; width: 151px; height: 143px; }
    #gamecontainer { background: url(images/backg.png) repeat-x 0 3px; width: 340px; height: 143px; }
    #gamecorner { background: url(images/backg_corner.png) no-repeat; width: 30px; height: 143px; }
    .box { cursor:pointer; background: url(images/box.png) no-repeat; width: 85px; height: 78px; margin-top: 30px; text-align: center; font-size: 12px; 
           font-weight: bold; letter-spacing: -1px; padding-top: 27px}
    .boxtitle { font-size: 12px; font-weight: bold; text-align: center; color: #FFF; width: 85px; margin-top: -23px; padding-bottom: 9px;}
    a {outline: none;border:0px;text-decoration: none; color: #000; color:black;}
    a:hover {outline: none;border:0px; text-decoration: underline; color:red;}
    img {outline: none;border:0px}
</style>
<script type="text/javascript">
    $(document).ready(function() {

    });

    function openpoker(xname, xdata ){
        var centeredY,
        centeredX,
        windowURL = 'hlgs_nicobet.jsp?sub_link='+xname+'&'+xdata,
        windowName = xname,
        xHeight = 680,
        xWidth = 960,
        centerBrowser = 1;
        var windowFeatures =  'height='+xHeight+',width='+xWidth+',toolbar=0,scrollbars=0,status=0,resizable=0,location=0,menuBar=0';

        if(centerBrowser){

            if ($.browser.msie) {//hacked together for IE browsers
                centeredY = (window.screenTop - 120) + ((((document.documentElement.clientHeight + 120)/2) - (xHeight/2)));
                centeredX = window.screenLeft + ((((document.body.offsetWidth + 20)/2) - (xWidth/2)));
            }else{
                centeredY = window.screenY + (((window.outerHeight/2) - (xHeight/2)));
                centeredX = window.screenX + (((window.outerWidth/2) - (xWidth/2)));
            }
            var newwin = window.open(windowURL, windowName, windowFeatures+',left=' + centeredX +',top=' + centeredY).focus();
        }else {
            centeredY = (screen.height - xHeight)/2;
            centeredX = (screen.width - xWidth)/2;
            var newwin = window.open(windowURL, windowName, windowFeatures+',left=' + centeredX +',top=' + centeredY).focus();
            //   if (newwin == null)   { alert("Yeni pencere açılamadı. Lütfen Menu / Tools / Pop-Up Blocker'dan Bu Site için pencere açmasına izin verin."); }
        }
        return false;
    }  

    function random_number(){
        return(Math.random().toString().substring(12));
    }

    function replaceall(Source,stringToFind,stringToReplace){
        var temp = Source;
        var index = temp.indexOf(stringToFind);
        while(index != -1){
            temp = temp.replace(stringToFind,stringToReplace);
            index = temp.indexOf(stringToFind);
        }
        return temp;
    }


</script>

<body id="bodybody">
    <table class="pagetitle" align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
        <tr>
            <td width="1%" align="left"> <img  onclick="top.window.SH_frmTopMenu('O');" src="images/nicoball_title.png" style="cursor:pointer" title="Full Ekran Aç/Kapat" alt="" border="0" ></td>
            <td width="100%" align="left">HighLow (Yüksek/Düşük) Masalar</td>
            <td width="100" align="right"> </td>	  
        </tr>
    </table>


    <table style="display:none;" align="center" width="100%" border="0"cellspacing="0" cellpadding="0">
        <tr valign="middle" align="center"><td valign="middle" align="center">
                <table cellpadding="0" cellspacing="0" style="width: auto; height: auto"><tr style="height:20px">
                        <td style="width:20px;background: url('images/corners.png') left top no-repeat">&nbsp;</td>
                        <td style="background: url('images/corners_topbottom.png') left top repeat-x">&nbsp;</td>
                        <td style="width:20px;background: url('images/corners.png') right top no-repeat">&nbsp;</td></tr>
                    <tr><td style="background: url('images/corners_mid.png') left top repeat-y; height: 100%; width: 20px;"></td><td style="background-color:#101010;height:100%;">
                            <TABLE bgcolor="#fafafa" align="center" width="475px" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0">
                                <tr class="menu" valign="top" style="font-size:9pt;">
                                    <td colspan="8" align="center" bgcolor="#CCCCCC"><span  style="color:darkred;font-size: 10pt;font-weight: bold;">Tüm Müşterilerimizin Dikkatine</span></td>
                                </tr>
                                <tr class="menu" valign="top">     
                                    <td colspan="8" align="center" style="color:red" bgcolor="#ffffff">
                                        Nicosia HighLow (Yüksek/Düşük) test için açılmıştır. <br/>
                                        Hiçbir şekilde Nicosia Betting Hesabınızdan para transferi yapılmamaktadır.
                                        Oynamak istediğiniz masada Oyuna.Gir tuşuna basınız. 
                                        Bekleme yazısından sonra gelen Bakiye Bilgisi ekranından Avatarınızı seçip Nickname(Kısaisim)inizi altındaki boş kırmızı alana yazınız.
                                        Onaylıyorum tuşuna bastıktan sonra masaya 100 TL ile oturmuş olacaksınız. 
                                    </td>
                                </tr>
                            </TABLE>
                        </td><td style="width: 20px;background: url('images/corners_mid.png') right top repeat-y; height: 100%;"></td></tr><tr style="height:20px"><td style="width:20px;background: url('images/corners.png') left bottom no-repeat">&nbsp;</td><td style="background: url('images/corners_topbottom.png') left bottom repeat-x">&nbsp;</td><td style="width:20px;background: url('images/corners.png') right bottom no-repeat">&nbsp;</td></tr></table>
            </td>
        </tr>
    </table>    


<center>
    <div id="test"  onclick="openpoker('highlow', 'gata_id=9&amp;game_id=2&amp;gatb_id=9&amp;minstake=1&amp;maxstake=10');">
        <a href="#">
            <img src="images/yuksek_dusuk_test.png" width="337" height="85" />
        </a>
    </div>

    <div id="yuksekdusuk_title"> Yüksek - Düşük Masaları </div>
    <div id="yuksekdusuk">

        <div id="gamelogo" class="fLeft"></div>

        <div id="gamecontainer" class="fLeft">

            <div class="box fLeft" onclick="openpoker('highlow', 'gata_id=1&amp;game_id=2&amp;gatb_id=1&amp;minstake=1&amp;maxstake=10');">
                <div class="boxtitle">Masa 1</div>
                <a href="#">Min 1 TL <br /> Max 10 TL</a>
            </div>

            <div class="box fLeft" onclick="openpoker('highlow', 'gata_id=2&amp;game_id=2&amp;gatb_id=2&amp;minstake=2&amp;maxstake=20');">
                <div class="boxtitle">Masa 2</div>
                <a href="#">Min 2 TL <br /> Max 20 TL</a>
            </div>

            <div class="box fLeft" onclick="openpoker('highlow', 'gata_id=3&amp;game_id=2&amp;gatb_id=3&amp;minstake=3&amp;maxstake=30');">
                <div class="boxtitle">Masa 3</div>
                <a href="#">Min 3 TL <br /> Max 30 TL</a>
            </div>

            <div class="box fLeft" onclick="openpoker('highlow', 'gata_id=4&amp;game_id=2&amp;gatb_id=4&amp;minstake=5&amp;maxstake=50');">
                <div class="boxtitle">Masa 4</div>
                <a href="#">Min 5 TL <br /> Max 50 TL</a>
            </div>

        </div>
        <div id="gamecorner" class="fLeft"></div>
        <div class="clear"></div>


        <div id="kkkp_title"> Kupa - Karo - Maça - Sinek </div>
        <div id="kkkp">

            <div id="gamelogo2" class="fLeft"></div>

            <div id="gamecontainer" class="fLeft">

                <div class="box fLeft" onclick="openpoker('highlow', 'gata_id=5&amp;game_id=2&amp;gatb_id=5&amp;minstake=1&amp;maxstake=10');">
                    <div class="boxtitle">Masa 1</div>
                    <a href="#">Min 1 TL <br /> Max 10 TL</a>
                </div>

                <div class="box fLeft" onclick="openpoker('highlow', 'gata_id=6&amp;game_id=2&amp;gatb_id=6&amp;minstake=2&amp;maxstake=20');">
                    <div class="boxtitle">Masa 2</div>
                    <a href="#">Min 2 TL <br /> Max 20 TL</a>
                </div>

                <div class="box fLeft" onclick="openpoker('highlow', 'gata_id=7&amp;game_id=2&amp;gatb_id=7&amp;minstake=3&amp;maxstake=30');">
                    <div class="boxtitle">Masa 3</div>
                    <a href="#">Min 3 TL <br /> Max 30 TL</a>
                </div>

                <div class="box fLeft" onclick="openpoker('highlow', 'gata_id=8&amp;game_id=2&amp;gatb_id=8&amp;minstake=5&amp;maxstake=50');">
                    <div class="boxtitle">Masa 4</div>
                    <a href="#">Min 5 TL <br /> Max 50 TL</a>
                </div>

            </div>

            <div id="gamecorner" class="fLeft"></div>
            <div class="clear"></div>



        </div>    
</center>
        <%@ include file="include_dosya/Center_AllPage.jsp"%>
</body>
</html>
<%@ include file="include_dosya/Top_End.jsp" %>
