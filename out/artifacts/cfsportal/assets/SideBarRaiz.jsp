<%-- 
    Document   : SideBar
    Created on : Apr 9, 2020, 1:26:27 AM
    Author     : ferrero.alexis
--%>

    <!-- Sidebar -->
    <div id="sidebar-wrapper">
      <ul class="sidebar-nav nav-pills nav-stacked" id="menu">

        <li class="active">
        <li>
          <a href="index.jsp">
            <ion-item>
              <ion-icon class="icon" name="home"></ion-icon> <span class="text">Home</span>
            </ion-item>
          </a>
        </li>
        <li>
          <a href="#">
            <ion-item>
              <ion-icon class="icon" name="construct"></ion-icon> <span class="text">Services</span>
            </ion-item>
          </a>
          <ul class="nav-pills nav-stacked" style="list-style-type:none;">
            <li><a href="jsp/BanSearch.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="build"></ion-icon><span class="subText">Billing Account</span>
                </ion-item>
              </a></li>
            <li><a href="jsp/sidSearch.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="build"></ion-icon><span class="subText">Service ID</span>
                </ion-item>
              </a></li>
          </ul>
        </li>
        <li>
          <a href="#">
            <ion-item>
              <ion-icon class="icon" name="contact"></ion-icon> <span class="text">Customer Care</span>
            </ion-item>
          </a>
          <ul class="nav-pills nav-stacked" style="list-style-type:none;">
            <li><a href="jsp/BCCForm.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="today"></ion-icon><span class="subText">Refacturaci�n</span>
                </ion-item>
              </a>
            </li>
            <li><a class="link" href="jsp/TicketsTriage.jsp">
                <ion-item>
                <ion-icon class="subIcon" name="pulse"></ion-icon><span class="subText">Tickets Triage</span>
                </ion-item>
                </a>
            </li>
        </ul>
        </li>
        <li>
          <a href="Report.jsp">
            <ion-item>
              <ion-icon class="icon" name="stats"></ion-icon> <span class="text">Dashboards</span>
            </ion-item>
          </a>
        </li>
        <li>
          <a href="#">
            <ion-item>
              <ion-icon class="icon" name="cog"></ion-icon> <span class="text">Billing Operations</span>
            </ion-item>
          </a>
            <ul class="nav-pills nav-stacked" style="list-style-type:none;">
            <li><a href="jsp/billingOps.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="pulse"></ion-icon><span class="subText">Open Subcases</span>
                </ion-item>
              </a>
            </li>
            <li><a href="jsp/EMA_BOT.jsp">
                <ion-item>
                  <ion-icon class="subIcon" name="pulse"></ion-icon><span class="subText">Tickets Re-Bill</span>
                </ion-item>
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
   