var trigger=false,      //  trigger checks the rotation complete and let the user pick stake prices
    dflag = false,      //  dflag checks the default stake value and controller the return value
    dId,                //  dId defines the default stake value box
    dValue,             //  dValue returns the default stake value to the game
    addValue,           //  addValue defines the stake will be added the total amount
    i = 0,
    totalDeposit = 0,   //  totalDeposit controls the total stake amount if is 50 or not
    betList = "",       //  betList defines which rates are chosen by the user and added to the my bets lits
    xgameno = 0,
    xrowno = 0,
    xsubdata = '',
    xcardno = '',
    xtutarsec = 0,
    xbahisacik = 0,
    xloadscript = '',
    xwaitajax = false,
    xcounter  = 10,
    xtimerload,
    xtimerdata,
    xtimersubid,
    xtimersecond,
    xbahisvar = 0,
    xservererror = 0,
    logVar = 0;


$.startGame = function(params){
    jQuery.fx.off = true;
    $.runLoader(15);
    setInterval("checkconn()", 9000);
    
    //  define initial default stake price as 5
    pId = $('#btnPrice5').attr("id");
    $('#btnPrice5').addClass('default');
    dflag = true;
    dValue = $('#btnPrice5').html();
    //
    //  call the rotateLoop function
    $.rotateLoop(params["angle"]);
    $('.btnPrice').click(function(){$.makeDefault($(this))});
    addValue = 0;   // addValue defines deposit amount for each stake box
    totalDeposit = 0;   //  totalDeposit defines the total amount including by each stake box
    $('.price').click(function(){$.choosePrice(addValue, $(this))});
    $('#btnReset').click(function(){$.clearValue()});
    $('#btnSubmit').click(function(){$.makeDeposit()});
}

/*
 * @function rotateLoop is a method to control mail loop function
 *
 */
$.rotateLoop = function(angle){
    $.rotateMyBall(angle);
}

/*
 *  @function clearValue is a method to clear all price and deposit value
 *
 */
$.clearValue = function(){
    if ( trigger ){
        try{
            $('.price').each(function(){
              $(this).html('0');
            });
            $('#depositAmount').html('0');
            totalDeposit = 0;
            addValue = 0;
            betList = "";
        }catch(err){
            console.log(err);
        }   
    }
}

/*
 *  @function choosePrice is a method to define default stake rate from one of 1,2,3,4,5,10
 *  @param e is the parameter to define which object will be used
 *  @param addition the value will be added
 *
 */
$.choosePrice = function(addition, e){
    try{
        if ( trigger ){
            addition = parseInt(e.html());
            addition += parseInt(dValue);
            totalDeposit += parseInt(dValue);
            if ( totalDeposit <= 50 ){
                e.html(addition);
                $('#depositAmount').html(totalDeposit);
            }
        }
    }catch(err){
        console.log("Error occured on choosePrice: " + err);
    }
}

/*
 *  @function makeDefault is a method to define default stake rate from one of 1,2,3,4,5,10
 *  @param e    is the parameter to define which object will be used
 *
 */
$.makeDefault = function(e){
    try{
        if ( trigger ){
            if ( dflag == false ){
                e.addClass('default');
                pId = e.attr("id");
                dValue = e.html();
                dflag = true;
            }else{
                $('#' + pId).removeClass('default');
                e.addClass('default');
                pId = e.attr("id");
                dValue = e.html();
                dflag = true;
            }
        }
    }catch(err){
        console.log("Error occured on makeDefault: " + err);
    }
}

/*
 *  @function makeDeposit is a method to implement depositing the amount when the deposit button hitted
 *
 */
$.makeDeposit = function(){
    try{
        betList += $.getListItem('Heading');
        $.loadMyBets(betList);
        $.clearValue();
        trigger = false;
    }catch(err){
        console.log("Error occured on makeDeposit: " + err);
    }
}

/*
 * @function $.countDown is a method to create a countdown timer with its parameter lim
 * @param lim is a parameter to make the countdown function start from
 * @param label is a parameter where the timer will be shown
 */
$.countDown = function(lim,label) {
    try{
        setTimeout(function(){
            $(label).fadeIn(500);
            $(label).html(lim);
            lim--;
            if ( lim > -1 ){
                $.countDown(lim,label);
            }else{
                $.clearValue();
                $(label).fadeOut(500);
            }
        },1000);
    }catch(err){
        console.log("Error occured on countDown: " + err);
    }
}

$.runLoader = function(lim){
    try{
        $.countDown(lim,'#loader label');
        setTimeout(function(){
            $('#overlay').fadeOut(1000);
        },15000);
        jQuery.fx.off = false;
    }catch(err){
        console.log("Error occured on runLoader" + err);
    }
}

/*
 * @function $.push is a method to add or push a new list item to the targeted ul dom element
 * @param target is the target ul which the new list item will be pushed
 * @param item is the new list item will be pushed
 * @param duration is the duration of the pushing which defines how much long the animation would be
 * @param height
 * @param width
 */
$.push = function(target, item, duration, height, width){
    $(target + ' ' + 'li:first').before(item);
    if ( $(target + ' ' +'li.item').length >= 7 ){
        $(target + ' ' + 'li:last').remove();
    }
    $( target + ' ' + 'li.item' ).animate({
        height: height, //41, 
        width: width //36
    }, 1000, "linear").animate({
        opacity: .5
    }, duration, "linear");
}


/*
 * @function pickWinner is a method to show which ball picked with number and color
 * @param path is the picked ball identifier 
 *
 */
$.pickWinner = function(path){
    $.pickedBall = '<li class="item" id="ball'+path["end"]+'"></li>';
    $.push('#pickList',$.pickedBall, 5000, 41, 36);
}

$.loadWinner = function(){
    lastWinner = "<li class=\"item\">" + 
                        "<span class=\"title notice\">" + Math.round(Math.random() * 999999) + "</span>" +
                        "<span class=\"value notice\">" + Math.round(Math.random() * 101) + "</span>" +
                        "<span class=\"return notice\">" + Math.round(Math.random() * 11) + "</span>" +
                      "</li>";
    $.push('#winnerList',lastWinner, 1000, 15, 295);
}

$.loadMyBets = function(myBets){
    $.push('#myBetList',myBets, 1000, 15, 295);
}

/*
 * @function rotateMyBall is the main function which spins the ball on the roller and fires the other functions and parameters
 * @param angle is the parameter helps to find out the end point at the given angle
 */
$.rotateMyBall = function (angle){    
    $.path.params = new $.path.arc(
    { 
        center : [205,210],
        radius : 135,
        start  : -180,
        end    : angle,
        dir    : -1 
    }
    );
    try{
        trigger = false;
        $("#table #ball").animate(
        {
            path : $.path.params
        },
        {
            duration: 4000,
            easing: 'swing', 
            complete: function() {
                try{
                    console.log("Rotation complete");
                    trigger = true;
                    $.countDown(15,'#counter');
                    $.pickWinner($.path.params);
                    $.loadWinner();
                }catch(err){
                    console.log("Error occured on rotateMyBall: " + err);
                }
            }
        }
        
        );
        setTimeout(function(){
            angle = Math.round(-360 * 4  - Math.random() * 999);
            $.rotateLoop(angle);
        }, 21000);

    }catch(err){
        
        console.log(err);
    }
}

/*
 * @function $.getListItem is a method can be use to get a list item details and generate new one
 */
$.getListItem = function(receive){
    var id = ""; //$(sender).attr('id');
    var listItem = "";
    $(".deposit").each(function(){
       if ( $(this).html() != 0 ){
           id  = $(this).attr('id').split("-");
           listItem += "<li class=\"item\">" + 
                        "<span class=\"title notice\" id=\"" + id[0] + "-" + id[2] + "\">" + $("#" + id[0] + "-" + receive + "-" + id[2]).html() + "</span>" +
                        "<span class=\"value notice\">" + $(this).html() + "</span>" +
                        "<span class=\"return notice\">" + $(this).html() + "</span>" +
                      "</li>";
       }
    });
    return listItem;
}
/*
 *  Betting functions
 *
 */
function parayukle(){
  try{
    run_script(true,'hlgs_highlow_subid.jsp','type=ACCBAL&gameid='+xgameid+'&tableid='+xtableid+'&gameno='+xgameno+'&rnd='+Random_Number());   
       } catch(err) { }
}

function girisyap(){
   try{
   run_script(true,'hlgs_highlow_subid.jsp','type=PUTBAL&gameid='+xgameid+'&tableid='+xtableid+'&gameno='+xgameno+'&gamestake='+$("#gamestake").val()+'&rnd='+Random_Number());    
      } catch(err) { }
}

function standby(){
    try{
        run_script(false,'hlgs_highlow_subid.jsp','type=CLOSE&gameid='+xgameid+'&tableid='+xtableid+'&gameno='+xgameno+'&rnd='+random_number());
    } catch(err) { }
} 

function heartbeat(){
    clearTimeout(xtimerdata);
    try{ 
        if (parseInt(cnum(xgameno,0)) > 100) {
            if (xwaitajax) run_script(true,'hlgs_highlow_move.jsp','load=data&gameid='+xgameid+'&tableid='+xtableid+'&gameno='+xgameno+'&rowno='+xrowno+'&rnd='+Random_Number());
        }
    } catch(err) { }
    xtimerdata = setTimeout(heartbeat,2100);
}
function heartload(){
    clearTimeout(xtimerload);
    try{
        run_script(false,'hlgs_highlow_move.jsp','load=load&gameid='+xgameid+'&tableid='+xtableid+'&gameno='+xgameno+'&rowno='+xrowno+'&rnd='+Random_Number());
    } catch(err) { }
     if (parseInt(cnum(xgameno,0)) < 100)   xtimerload = setTimeout(heartload,2000); 

}

function bahisyap(){
    try{
        var tutar1 = parseInt(cnum($('#rate1_tutar').html(),0));
        var tutar2 = parseInt(cnum($('#rate2_tutar').html(),0));
        var tutar3 = parseInt(cnum($('#rate3_tutar').html(),0));
        var tutar4 = parseInt(cnum($('#rate4_tutar').html(),0));
        if (tutar1 > 0 ||tutar2 > 0 ||tutar3 > 0 ||tutar4 > 0){
            xbahisvar = 1;
            xsubdata = '1|'+cnum($('#rate1').html(),0)+'|'+tutar1+'|2|'+cnum($('#rate2').html(),0)+'|'+tutar2+'|3|'+cnum($('#rate3').html(),0)+'|'+tutar3+'|4|'+cnum($('#rate4').html(),0)+'|'+tutar4;
            run_script(false,'hlgs_highlow_subid.jsp','type=ADDBET&gameid='+xgameid+'&tableid='+xtableid+'&gameno='+xgameno+'&cardno='+xcardno+'&rowno='+xrowno+'&data='+xsubdata+'&rnd='+Random_Number());
        } else{
            openmesaj('Lütfen Tutar yazan yerlerin birinin üzerine gelerek açılan listeden 1 ile 10 arasında bir tutar seçiniz..',5000);
        }
    } catch(err) { }
}
function bahisgoster(){
    try{
        if (parseInt(cnum(xgameno,0)) > 100 && parseInt(xbahisvar)>0) {
            run_script(true,'hlgs_highlow_subid.jsp','type=SHOWBET&gameid='+xgameid+'&tableid='+xtableid+'&gameno='+xgameno+'&cardno='+xcardno+'&rowno='+xrowno+'&rnd='+Random_Number());
        }
    } catch(err) { }
}

function checkconn(){
    try{
        run_script(true,'hlgs_highlow_subid.jsp','type=CONNECT&gameid='+xgameid+'&tableid='+xtableid+'&gameno='+xgameno+'&rnd='+Random_Number());
    } catch(err) { }

}

function blist(){
    try{
        run_script(true,'hlgs_highlow_move.jsp','load=result&gameid='+xgameid+'&tableid='+xtableid+'&gameno='+xgameno+'&rowno='+xrowno+'&rnd='+Random_Number());
    } catch(err) { }
}

function hh(xobj){
    try{
        $("#"+xobj).hide();
    } catch(err) {}
}
function ss(xobj){
    try{
        $("#"+xobj).show();
    } catch(err) {}
}
function cnum(xnumber,xvalue){
    if (isNaN(parseInt(xnumber))) {
        return(xvalue);
    } else {
        return(xnumber);
    }
}
function fnum(xnumber){
    if (isNaN(parseFloat(xnumber))) {
        return(0);
    } else {
        return(parseFloat(xnumber));
    }
}

function Random_Number(){
    return(Math.random().toString().substring(12));
}

function ReplaceAll(Source,stringToFind,stringToReplace){
    var temp = Source;
    var index = temp.indexOf(stringToFind);
    while(index != -1){
        temp = temp.replace(stringToFind,stringToReplace);
        index = temp.indexOf(stringToFind);
    }
    return temp;
}

/*
 * @function run_script
 * 
 */
$.runScript = function(xasync, xurl,xdata){
    xwaitajax = xasync;
    try{
        $.ajax({
            url: xurl,
            data: xdata,
            async: true,
            global: false,
            cache: false,
            type: "POST",
            dataType: "script",
            timeout: 3000,
            success: function(data) {
                var veri = jQuery.trim(data);
                xservererror = 0;
                if (veri.length > 3 ) {
                    log(veri);
                }
                runafter();
            },
            error:function (xhr, ajaxOptions, thrownError){
               
                if (parseInt(xhr.status) > 0) {
                    xservererror = xservererror + 1;
                    if (xservererror > 4) {
                        openmesaj(xurl+'<br>'+xhr.status+' - '+ xhr.statusText+'<br>Oyun Ana Bilgisayarı ile bağlantınız kopmuştur.<br/> Lütfen sayfayı yenileyiniz.',2500);
                        xservererror = 0;
                    }
                }
            }
        });
    } catch(err){ 
        console.log("Error occured on runScript: " + err);
    }
    xwaitajax = true;
}