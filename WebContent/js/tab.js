window.onload = function () {
    var $menuEle = $('dt');
    $menuEle.click(function () {
        $('dd').addClass('hidden');
        $(this).next().removeClass('hidden');
    })
}