<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<script type="text/javascript" src="/js1/font.js"></script>
<link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css" />
<title>ATA</title>
<style>body { }
.error-template {padding: 40px 15px;text-align: center;}
.error-actions {margin-top:15px;margin-bottom:15px;}
.error-actions .btn { margin-right:10px; }
</style>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1>
                    Oops!</h1>
                <h2>
                    <c:if test="${not empty error}">
                        <div align="center" style="color: red">${error}</div>
                    </c:if></h2>
                <div class="error-details">
                    Sorry, an error has occurred, Requested page not found!
                </div>
                <div class="error-actions">
                    <a href="/login" class="btn btn-primary btn-success"><span class="fa fa-home" aria-hidden="true"></span>
                        Take Me Home </a>
                </div>
            </div>
        </div>
    </div>
</div>
