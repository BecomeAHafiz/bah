/**
 * Created with JetBrains RubyMine.
 * User: adel
 * Date: 02/02/13
 * Time: 12:48
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function(){
    $(".frm_relation_ayah_user").submit(function(){
        $(this).toggleClass("frm_relation_ayah_user", addOrRemove);
        $(this).find(':submit').hide();
    });
})