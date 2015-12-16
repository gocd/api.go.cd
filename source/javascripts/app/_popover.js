//= require ../lib/_jquery.webui-popover

$(function() {
  $('[data-popover]').webuiPopover({
    trigger: 'hover',
    animation: 'fade',
    width: 300,
  });
});
