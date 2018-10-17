// namespace
window.semantic = {
  handler: {}
};

// Allow for console.log to not break IE
if (typeof window.console == "undefined" || typeof window.console.log == "undefined") {
  window.console = {
    log: function () {},
    info: function () {},
    warn: function () {}
  };
}
if (typeof window.console.group == 'undefined' || typeof window.console.groupEnd == 'undefined' || typeof window.console.groupCollapsed == 'undefined') {
  window.console.group = function () {};
  window.console.groupEnd = function () {};
  window.console.groupCollapsed = function () {};
}
if (typeof window.console.markTimeline == 'undefined') {
  window.console.markTimeline = function () {};
}
window.console.clear = function () {};

// ready event
semantic.ready = function () {
  // fix main menu to page on passing
  $('.main.menu').visibility({
    type: 'fixed'
  });
  // $('.overlay').visibility({
  //     type: 'fixed',
  //     offset: 80
  // });

  //lazy load images
  // $('img').visibility({
  //   type: 'image',
  //   transition: 'vertical flip in',
  //   duration: 500
  // });
  // show dropdown on hover
  // $('.main.menu .ui.dropdown').dropdown({
  //     on: 'hover'
  // });

  $('.menu-principal .ui.dropdown')
    .dropdown();


  // http://gregfranko.com/jquery.tocify.js/
  $("#tocContents")
    .tocify({
      context: "#content",
      selectors: "h1,h2,h3,h4",
      theme: "none",
      scrollTo: "135",
      showAndHide: false,
      extendPage: false
    });

  // STICKY MAIN MENU
  $('.ui.sticky')
    .sticky({
      context: '#content',
      offset: 135,
      bottomOffset: 20
    });

  // LISTE RB hover
  $('a', '.list-rb').mouseover(function () {
    rb = $(this).data("reserve") + '-on';
    $("path[data-reserve='" + rb + "']").hide();
  }).mouseleave(function (e) {
    $("path[data-reserve='" + rb + "']").show();
  });

  // CARTE RB hover
  $('path', '#reserves-on').mouseenter(function (e) {
    //set active status in rb list
    rb_on = $(this).data('reserve');
    rb = rb_on.split('-');
    rb = rb[0];
    var listTarget = $(".item[data-reserve='" + rb + "']");
    listTarget.toggleClass('hovered');
    listTarget.addClass('cursor','pointer');
    $("path[data-reserve='" + rb_on + "']").hide();
  });

  $('path', '#reserves-off').mouseleave(function () {
    //rb_id = '#' + $(this).data('reserve') + '-on';
    $("path[data-reserve='" + rb_on + "']").show();
    $('a', '.list-rb').removeClass('hovered');
  });
  $('path', '#reserves-off').popup({
    content: 'the rb'
  });

  $("path", "#reserves-off").on("click", function() {
    //console.log('click');
    rb_on = $(this).data('reserve');
    rb = rb_on.split('-');
    rb = rb[0];
    var listTarget = $(".item[data-reserve='" + rb + "']").attr('href');
    document.location.href = listTarget;
  });

  //eco-acteurs filtres
  // select eco-acteurs reserve
  $('#eco-reserve').dropdown({
    debug: true,
    onChange: function (value, text) {
      //redirect with url param for filtering items
      console.log("ok");
      if(value !== 'all'){
        removedParam = removeParam('numpage');
        addParam = insertParam('biosphere', value);
        //console.log(addParam);
        document.location.search = addParam;
        //document.location.href = addParam;
      } else {
        removedParam = removeParam('biosphere');
        document.location.href = removedParam;
        //console.log(removedParam);
      }
    }
  });

  // select eco-acteurs odd
  $('#eco-odd').dropdown({
    debug: true,
    onChange: function (value, text) {
      //redirect with url param for filtering items
      //console.log("ok");
      if(value !== 'all'){
        removedParam = removeParam('numpage');
        addParam = insertParam('odd', value);
        //console.log(addParam);
        document.location.search = addParam;
      } else {
        removedParam = removeParam('odd');
        document.location.href = removedParam;
        //console.log(removedParam);
      }
    }
  });

  //laureats filtres
   // select laureats annee
    $('#laureat-annee').dropdown({
      debug: true,
      onChange: function (value, text) {
        //redirect with url param for filtering items
        console.log("ok");
        if(value !== 'all'){
          removedParam = removeParam('numpage');
          addParam = insertParam('annee', value);
          //console.log(addParam);
          document.location.search = addParam;
          //document.location.href = addParam;
        } else {
          removedParam = removeParam('annee');
          document.location.href = removedParam;
          //console.log(removedParam);
        }
      }
    });
    // select laureats reserve
    $('#laureat-reserve').dropdown({
      debug: true,
      onChange: function (value, text) {
        //redirect with url param for filtering items
        console.log("ok");
        if(value !== 'all'){
          removedParam = removeParam('numpage');
          addParam = insertParam('biosphere', value);
          //console.log(addParam);
          document.location.search = addParam;
          //document.location.href = addParam;
        } else {
          removedParam = removeParam('biosphere');
          document.location.href = removedParam;
          //console.log(removedParam);
        }
      }
    });
  
    // select laureats odd
    $('#laureat-odd').dropdown({
      debug: true,
      onChange: function (value, text) {
        //redirect with url param for filtering items
        //console.log("ok");
        if(value !== 'all'){
          removedParam = removeParam('numpage');
          addParam = insertParam('odd', value);
          //console.log(addParam);
          document.location.search = addParam;
        } else {
          removedParam = removeParam('odd');
          document.location.href = removedParam;
          //console.log(removedParam);
        }
      }
    });

  //actualites filtres
   // select actualites annee
    $('#actualite-annee').dropdown({
      debug: true,
      onChange: function (value, text) {
        //redirect with url param for filtering items
        console.log("ok");
        if(value !== 'all'){
          removedParam = removeParam('numpage');
          addParam = insertParam('annee', value);
          //console.log(addParam);
          document.location.search = addParam;
          //document.location.href = addParam;
        } else {
          removedParam = removeParam('annee');
          document.location.href = removedParam;
          //console.log(removedParam);
        }
      }
    });
      // select actualite typo
    $('#actualite-typo').dropdown({
      debug: true,
      onChange: function (value, text) {
        //redirect with url param for filtering items
        //console.log("ok");
        if(value !== 'all'){
          removedParam = removeParam('numpage');
          addParam = insertParam('typo', value);
          //console.log(addParam);
          document.location.search = addParam;
        } else {
          removedParam = removeParam('typo');
          document.location.href = removedParam;
          //console.log(removedParam);
        }
      }
    });
    // select actualite reserve
    $('#actualite-reserve').dropdown({
      debug: true,
      onChange: function (value, text) {
        //redirect with url param for filtering items
        console.log("ok");
        if(value !== 'all'){
          removedParam = removeParam('numpage');
          addParam = insertParam('biosphere', value);
          //console.log(addParam);
          document.location.search = addParam;
          //document.location.href = addParam;
        } else {
          removedParam = removeParam('biosphere');
          document.location.href = removedParam;
          //console.log(removedParam);
        }
      }
    });

  // utilities
  function insertParam(key, value) {
    key = encodeURI(key);
    value = encodeURI(value);

    var kvp = document.location.search.substr(1).split('&');

    var i = kvp.length;
    var x;
    while (i--) {
      x = kvp[i].split('=');

      if (x[0] == key) {
        x[1] = value;
        kvp[i] = x.join('=');
        break;
      }
    }
    if (i < 0) {
      kvp[kvp.length] = [key, value].join('=');
    }
    kvp = kvp.join('&');
return kvp;
    //this will reload the page, it's likely better to store this until finished
   // document.location.search = kvp.join('&');
  }

  function removeParam(parameter)
{
  var url=document.location.href;
  var urlparts= url.split('?');

 if (urlparts.length>=2)
 {
  var urlBase=urlparts.shift(); 
  var queryString=urlparts.join("?"); 

  var prefix = encodeURIComponent(parameter)+'=';
  var pars = queryString.split(/[&;]/g);
  for (var i= pars.length; i-->0;)               
      if (pars[i].lastIndexOf(prefix, 0)!==-1)   
          pars.splice(i, 1);
  url = urlBase+'?'+pars.join('&');
  window.history.pushState('',document.title,url); // added this line to push the new url directly to url bar .
  
}
return( url );
//  document.location.href = url;
}


}; // attach ready event
$(document).ready(semantic.ready);
jQuery.event.special.touchstart = {
  setup: function (_, ns, handle) {
    if (ns.includes("noPreventDefault")) {
      this.addEventListener("touchstart", handle, {
        passive: false
      });
    } else {
      this.addEventListener("touchstart", handle, {
        passive: true
      });
    }
  }
};