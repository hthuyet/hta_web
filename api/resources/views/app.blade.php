<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>

    @include('partials.htmlheader')

    <body class="skin-blue sidebar-mini">
        <style type="text/css">
            .modal {
                display:    none;
                position:   fixed;
                z-index:    1000;
                top:        0;
                left:       0;
                height:     100%;
                width:      100%;
                background: rgba( 255, 255, 255, .8 ) 
                    url('/img/loading.gif') 
                    50% 50% 
                    no-repeat;
            }

            /* When the body has the loading class, we turn
               the scrollbar off with overflow:hidden */
            body.loading {
                overflow: hidden;   
            }

            /* Anytime the body has the loading class, our
               modal element will be visible */
            body.loading .modal {
                display: block;
            }
        </style>
        <div class="wrapper">

            @include('partials.mainheader')

            @include('partials.sidebar')

            <script src="/plugins/jQuery/jQuery-2.1.4.min.js"></script>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">

                @include('partials.contentheader')

                <!-- Main content -->
                <section class="content">
                    <!-- Your Page Content Here -->
                    @yield('main-content')
                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->

            @include('partials.controlsidebar')

            @include('partials.footer')

        </div><!-- ./wrapper -->

        <div class="modal fade" id="confirm-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        Xác thực hành động
                    </div>
                    <div class="modal-body">
                        Bạn có muốn thực hiện không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-success btn-ok">Ok</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal"><!-- Place at bottom of page --></div>
        @include('partials.scripts')

        @yield('inpage-script')
        <script type="text/javascript">
            $('#confirm-dialog').on('show.bs.modal', function (e) {
                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            });

            //Dinh dang dd/mm/yyyy
            function convertToDate(input) {
                var tmp = input.split("/");
                return new Date(parseInt(tmp[2]), parseInt(tmp[1]) - 1, parseInt(tmp[0]));
            }
        </script>
    </body>
</html>