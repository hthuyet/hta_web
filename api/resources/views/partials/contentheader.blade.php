<!-- Content Header (Page header) -->
<section class="content-header">

    @if (count($errors) > 0)
    <div class="alert alert-danger">
        <strong>Have problem!:</strong> <br><br>
        <ul>
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    @if(Session::has('flash_message'))
    <div class="alert alert-success">
        {{ Session::get('flash_message') }}
    </div>
    @endif
    @if(Session::has('error_message'))
    <div class="alert alert-error">
        {{ Session::get('error_message') }}
    </div>
    @endif
</section>


<div id = "myAlert" class = "alert alert-success" style="display: none;">
    <a href = "#" class = "close" data-dismiss = "alert">&times;</a>
    <strong id="alartTitle">Warning!</strong> <span id='alertContent'>There was a problem with your network connection.</span>
</div>

<script type="text/javascript">
    $body = $("body");
    function validateHhMm(value) {
        return /^([0-1]?[0-9]|2[0-3]):([0-5][0-9])(:[0-5][0-9])?$/.test(value);
    }

    function isNumeric(value) {
      return !isNaN(parseFloat(value)) && isFinite(value);
    }
    
    function resetMessage() {
        $("#myAlert").removeAttr('class');
        $("#myAlert").attr('class', '');
        $('#myAlert')[0].className = '';
        $("#myAlert").hide();

    }
    function showWarning(message, title, autoHide) {
        resetMessage();
        $("#myAlert").addClass("alert alert-warning");
        $("#myAlert").show();
        if (title) {
            $("#alartTitle").html(title);
        } else {
            $("#alartTitle").html("Warning");
        }
        $("#alertContent").html(message);
        $("#myAlert").alert();
        if (autoHide) {
            setTimeout(function () {
                $("#myAlert").hide();
            }, 3000);
        }
    }
    function showError(message, title, autoHide) {
        resetMessage();
        $("#myAlert").addClass("alert alert-error");
        $("#myAlert").show();
        if (title) {
            $("#alartTitle").html(title);
        } else {
            $("#alartTitle").html("Error");
        }
        $("#alertContent").html(message);
        $("#myAlert").alert();
        if (autoHide) {
            setTimeout(function () {
                $("#myAlert").hide();
            }, 3000);
        }
    }
    function showSuccess(message, title, autoHide) {
        resetMessage();
        $("#myAlert").addClass("alert alert-success");
        $("#myAlert").show();
        if (title) {
            $("#alartTitle").html(title);
        } else {
            $("#alartTitle").html("Success");
        }
        $("#alertContent").html(message);
        $("#myAlert").alert();
        if (autoHide) {
            setTimeout(function () {
                $("#myAlert").hide();
            }, 3000);
        }
    }
    
    function showLoading(){
        $body.addClass("loading");
    }
    function hideLoading(){
        $body.removeClass("loading");
    }
</script>