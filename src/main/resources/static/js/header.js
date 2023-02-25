
$(document).ready(()=>{
    $('.my_nav .nav-item').click(function() {
        $(this).addClass('active').siblings().removeClass('active');
    });
})
