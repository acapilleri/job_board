window.onload = function()
    {
        if(window.jQuery)
        {
            $(document).ready(function(){
                $('.mytooltip').tooltip({'placement':'top', 'trigger' : 'hover'});
            });
        }
    }