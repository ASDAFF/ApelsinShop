function LoginPanelHideShow() {
    var LoginPanel = document.getElementById("LoginPanel");
    var LoginPanelButon = document.getElementById("LoginPanelButon");
    if (LoginPanel.style.display != "block") {
        LoginPanel.style.display = "block";
        LoginPanelButon.className = 'LoginPanelButonOn';
    } else {
        LoginPanel.style.display = "none";
        LoginPanelButon.className = 'LoginPanelButon';
    }
}    

function UserPanelHideShowElements(id) {
    var Element = document.getElementById(id);
    if (Element.style.display != "block") {
        Element.style.display = "block";
    } else {
        Element.style.display = "none";
    }
}


function UserPanelShowElements(id) {
    var Element = document.getElementById(id);
    Element.style.display = "block";
}

function UserPanelHideElements(id) {
    var Element = document.getElementById(id);
    Element.style.display = "none";
}

  