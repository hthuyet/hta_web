<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.1.4 -->
<script src="{{ asset('plugins/jQuery/jQuery-2.2.0.min.js') }}"></script>
<script src="{{ asset('plugins/jQuery/jquery.syotimer.min.js') }}"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="{{ asset('js/bootstrap.min.js') }}" type="text/javascript"></script>

<!-- Select2 -->
<script src="{{ asset('plugins/select2/select2.full.min.js') }}"></script>
<!-- Datepicker -->
<script src="{{ asset('plugins/datepicker/bootstrap-datepicker.js') }}"></script>

<script src="{{ asset('plugins/select2/select2.full.min.js') }}"></script>
<script src="{{ asset('plugins/input-mask/jquery.inputmask.js') }}"></script>
<script src="{{ asset('plugins/input-mask/jquery.inputmask.date.extensions.js') }}"></script>
<script src="{{ asset('plugins/input-mask/jquery.inputmask.extensions.js') }}"></script>
<script src="{{ asset('js/clipboard.min.js') }}" type="text/javascript"></script>

<!-- bootstrap datepicker -->
<script src="{{ asset('plugins/datepicker/bootstrap-datepicker.js') }}"></script>

<!-- bootstrap color picker -->
<script src="{{ asset('plugins/colorpicker/bootstrap-colorpicker.min.js') }}"></script>

<script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('plugins/datatables/dataTables.bootstrap.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('js/app.min.js') }}" type="text/javascript"></script>

<script src="{{ asset('js/jquery.tristate.js') }}" type="text/javascript"></script>

<script src="{{ asset('flag/assets/docs.js') }}" type="text/javascript"></script>

<script type='text/javascript' src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAnR1ZBueYqcx9Wj1HQSP9i5YyF0qU4q0Q&sensor=false&extension=.js&output=embed"></script>



<!-- Optionally, you can add Slimscroll and FastClick plugins.
      Both of these plugins are recommended to enhance the
      user experience. Slimscroll is required when using the/plugins/datepicker/bootstrap-datepicker.js
      fixed layout. -->
<script>
      $(function () {
            //Initialize Select2 Elements
            $(".select2").select2();

            //Money Euro
            $("[data-mask]").inputmask();
            //Date picker
            $('.datepicker').datepicker({
                autoclose: true,
                format: 'dd/mm/yyyy' 
            });
            $(".notification-link").on("click", function () {
                if($(this).data('type') == 3){
                    $("#notificationModal .modal-title").text($(this).data('title'));
                    $("#notificationModal .modal-body").text($(this).data('content'));
                    $('#notificationModal').modal('show'); 
                }
            });

            $(function() {
                $('.tristate').tristate();
            });

      });
</script>

