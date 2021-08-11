<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="loginStyle.css">
    <script data-main="scripts/main" src="../script/require.js" async defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script src="../script/handleresponse.mjs" type="text/javascript"></script>
</head>
<body>

<h2>Modal Login Form</h2>

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
<div id="responseContent"></div>

<div id="id01" class="modal">

    <form class="modal-content animate" action="./login.cfm" method="post">
        <div class="imgcontainer">
            <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
        </div>

        <div class="container">
            <label for="uname"><b>Username</b></label>
            <input type="text" placeholder="Enter Username" name="uname" required>

            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required>

            <button type="submit">Login</button>
            <div id="g_id_onload"
                 data-client_id="814349166161-oir3bnft2t9kahepqqsms3cdurdhltav.apps.googleusercontent.com"
                 data-context="signin"
                 data-ux_mode="popup"
                 data-callback="handleresponse"
                 data-auto_prompt="false">
            </div>
            <div class="g_id_signin"
                 data-type="standard"
                 data-shape="pill"
                 data-theme="filled_blue"
                 data-text="signin_with"
                 data-size="medium"
                 data-logo_alignment="left">
            </div>
            <script>
                function handleresponse(response){
                    $.ajax({
                        type: "POST",
                        url: "../script/handleresponse.mjs",
                        data: response.credential,

                        success: function (data) {
                            console.log(data);
                        }
                    });
                }
            </script>

            <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
            </label>
        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
            <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
    </form>
</div>

<script>
    // Get the modal
    var modal = document.getElementById('id01');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>
