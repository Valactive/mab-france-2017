// namespace
window.semantic = {
    handler: {}
  };

  // Allow for console.log to not break IE
  if (typeof window.console == "undefined" || typeof window.console.log == "undefined") {
    window.console = {
      log  : function() {},
      info : function(){},
      warn : function(){}
    };
  }
  if(typeof window.console.group == 'undefined' || typeof window.console.groupEnd == 'undefined' || typeof window.console.groupCollapsed == 'undefined') {
    window.console.group = function(){};
    window.console.groupEnd = function(){};
    window.console.groupCollapsed = function(){};
  }
  if(typeof window.console.markTimeline == 'undefined') {
    window.console.markTimeline = function(){};
  }
  window.console.clear = function(){};

  // ready event
  semantic.ready = function() {
        var $container = $('.main.container');
        // fix main menu to page on passing
            $('.main.menu').visibility({
                type: 'fixed'
            });
            // $('.overlay').visibility({
            //     type: 'fixed',
            //     offset: 80
            // });
        // lazy load images
            // $('img').visibility({
            //     type: 'image',
            //     transition: 'vertical flip in',
            //     duration: 500
            // });
        // show dropdown on hover
            $('.main.menu .ui.dropdown').dropdown({
                on: 'hover'
            });

            $('.ui.dropdown')
              .dropdown()
            ;

        // http://gregfranko.com/jquery.tocify.js/
        $("#tocContents").tocify({
            context:".main.container",
            selectors: "h1,h2,h3,h4",
            theme: "none",
            scrollTo: "65",
            showAndHide: false
        });
        // STICKY MAIN MENU
        $('.ui.sticky')
        .sticky({
        context: '#content',
        offset: 65
        });

        // LISTE RB hover
        $('a', '.list-rb').mouseover(function() {
          rb = '#' + $(this).data("reserve") + '-on';
          $(rb).hide();
        }).mouseleave(function(e){
          $(rb).show();
        });

        // CARTE RB hover
        $('path','#reserves-on').mouseenter(function(e){ 
          //set active status in rb list
          rb_on = $(this).data('reserve');
          rb = rb_on.split('-');
          rb = rb[0];
          var listTarget = $(".item[data-reserve='"+rb+"']");
          listTarget.toggleClass('hovered');
          $("path[data-reserve='"+rb_on+"']").hide();
        });
        $('path', '#reserves-off').mouseleave(function(){
          //rb_id = '#' + $(this).data('reserve') + '-on';
          $("path[data-reserve='"+rb_on+"']").show();
          $('a', '.list-rb').removeClass('hovered');
        });
  };

  // attach ready event
$(document).ready(semantic.ready);