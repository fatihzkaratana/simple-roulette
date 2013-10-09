</head>
<body id="SansCemberi" class="game">
    <div id="wrapper">
        <div id="overlay">
            <div id="loader">
                <h1><%= loadingInfo %></h1>
                <label id="loadCounter"></label>
                <h1><%= pleaseWait %></h1>
            </div>
        </div>
        <div id="close">
            <a href="#" title=""></a>
        </div>
        <div id="logo">
            <a href="#" title="">
                <h1 title=""></h1>
            </a>
            <div class="clr"></div>
        </div>
        <div id="picker">
            <ul id="pickList">
                <li id="seperator"></li>
            </ul>
        </div>
        <div id="roller">
            <div id="table">
                <img alt="Roller Ball" id="ball" src="assets/images/ball.png" />
                <div id="countWrapper"><label id="counter"></label></div>
            </div>
        </div>
        <div id="betBoard">
            <ul id="color" class="board">
                <% try {
                for (int i = 0;i < colors.length; i++){ %>
                <li class="item" id="color<%= i %>">
                    <h1 id="color-Heading-<%= i %>"><%= colors[i] %></h1>
                    <div id="color-Rate-<%= i %>" class="rate">0.00</div>
                    <div id="color-Box-<%= i %>" class="price deposit">0</div>
                </li>
                <%  }
                  }catch(Exception e){
                      System.out.print(e);
                  }
                %>
                <li class="clr"></li>
            </ul>
            <div class="clr"></div>
            <ul id="numbers" class="board">
                <% try {
                for (int i = 0;i < numbers.length; i++){ %>
                <li class="item">
                    <h1 id="numbers-Heading-<%= i %>"><%= numbers[i] %></h1>
                    <div id="numbers-Rate-<%= i %>" class="rate">0.00</div>
                    <div id="numbers-Box-<%= i %>" class="price deposit">0</div>
                </li>
                <%  }
                  }catch(Exception e){
                      System.out.print(e);
                  }
                %>
                <li class="clr"></li>
            </ul>
            <div class="clr"></div>
            <ul id="specials" class="board">
                <% try {
                for (int i = 0;i < specials.length; i++){ %>
                <li class="item">
                    <h1 id="specials-Heading-<%= i %>"><%= specials[i] %></h1>
                    <div id="specials-Rate-<%= i %>" class="rate">0.00</div>
                    <div id="specials-Box-<%= i %>" class="price deposit">0</div>
                </li>
                <%  }
                  }catch(Exception e){
                      System.out.print(e);
                  }
                %>
                <li class="clr"></li>
            </ul>
            <div class="clr"></div>
            <ul id="prices">
                <% try {
            for (int i = 0;i < prices.length; i++){ %>
                <li class="item">
                    <button id="btnPrice<%= prices[i] %>" class="btnPrice"><%= prices[i] %></button>
                </li>
                <%  }
                  }catch(Exception e){
                      System.out.print(e);
                  }
                %>
                <li class="clr"></li>
            </ul>
            <div class="clr"></div>
            <div id="finance">
                <div id="balance" class="info">
                    <h1><%= balanceAmount %></h1>
                    <div id="balanceAmount" class="amount">0,000</div>
                </div>
                <div id="deposit" class="info">
                    <h1><%= depositAmount %></h1>
                    <div id="depositAmount" class="amount">0</div>
                </div>
            </div>
        </div>
            
        <div class="clr"></div>
        <div id="winners" class="box">
            <h1><%= winners %></h1>
            <h3><%= titles[3] %></h3><h3><%= titles[0] %></h3><h3 class="noMargin"><%= titles[2] %></h3>
            <ul id="winnerList" class="infoList">
                <li id="seperator"></li>
            </ul>
        </div>
        <div id="myBets" class="box">
            <h1><%= myBets %></h1>
            <h3><%= titles[0] %></h3><h3><%= titles[1] %></h3><h3 class="noMargin"><%= titles[2] %></h3>
            <ul id="myBetList" class="infoList">
                <li id="seperator"></li>
            </ul>
        </div>
        <div id="buttons">
            <button type="reset" id="btnReset"><%= clear %></button>
            <button type="button" id="btnSubmit"><%= deposit %></button>
            <div class="clr"></div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
            $.startGame({
                angle: Math.round(-360 * 4  - <%= mathRandom().toString() %>)
            });
        });
    </script>
</body>