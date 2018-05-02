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

        $('.ui.sticky')
        .sticky({
        context: '#content',
        offset: 65
        });

        // Carte RB
        $('a', '.list-rb').mouseover(function() {
          var rb = '#' + $(this).data("reserve");
          console.log(rb);
          $(rb).hide();
        });
  };

  // attach ready event
$(document).ready(semantic.ready);