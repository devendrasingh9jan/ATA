<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>ATA</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <style>
        .form-gap {
            padding-top: 70px;
        }

        .container {
            height: 100%;
            align-content: center;
        }

        input {
            font-size: 1.05em;
            font-weight: 300;
            margin-top: 18px;
            padding: 8px 8px;
            width: 288px;
            margin-left: 10px;
        }

        .input-group-text {

            padding: 10px 10px;
            margin-top: 19px;
            margin-left: 35px;
            position: absolute;


        }


        .card-header h1 {
            color: white;
            margin-left: 15px;
            margin-bottom: 18px;
            position: relative;
        }

        .login_btn {
            color: black;
            background-color: #28a745;
            width: 100px;
            margin-left: 270px;
        }

        .login_btn:hover {
            color: black;
            background-color: white;
        }


    </style>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <title>Terminals</title>
</head>
<body>
<div class="form-gap"></div>
<div align="center" class="container">
    <div class="">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">Forgot Password?</h2>
                        <p><b>You can reset your password here.</b></p>
                        <div class="panel-body">

                            <form id="forget-form" role="form" autocomplete="off" class="form" method="post"
                                  action="forgetPassword/user" modelAttribute="user">

                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-envelope color-blue"></i></span>
                                        <input id="username" name="username" value="" placeholder="email address"
                                               class="form-control" required="required" type="email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input name="recover-submit" class="btn btn-lg btn-primary btn-block"
                                           value="Verify Email" type="submit">
                                </div>

                                <input type="hidden" class="hide" name="token" id="token" value="">
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
