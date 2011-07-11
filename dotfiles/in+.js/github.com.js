// Borrowed with thanks from https://raw.github.com/tsigo/dotfiles/master/js/github.com.js
// Gemfile linker: Adds rubygems.org links to each `gem` entry in a Gemfile
// ------------------------------------------------------------------------------

function linkGems() {
  if (document.location.href.match(/\/blob\/.*\/Gemfile/)) {
    $('div.line span.n:contains("gem")+span.s2, div.line span.n:contains("gem")+span.s1').each(function() {
      var gem_name = $(this).text().replace(/['"]/g, '')
      $(this).html('"<a href="http://rubygems.org/gems/' + gem_name + '" target="_new">' + gem_name + '</a>"')
    })

    // Use the same color
    $('span.s1 a').css('color', $('span.s1').css('color'))
    $('span.s2 a').css('color', $('span.s2').css('color'))
  }
}

$('#slider a.js-slide-to, .breadcrumb a').live('click', function() {
  // Give the file time to load
  setTimeout(linkGems, 500)
})
linkGems()

// Infinite scroll on commit logs
// ------------------------------------------------------------------------------

var content_id  = 'div#commit'
var waypoint_id = 'div.pagination:last'
var next_id     = 'a[hotkey="l"]'

function successCallback(d) {
  $d = $(d)
  $(content_id).append($d.find(content_id).html())
  $(waypoint_id).html($d.find(waypoint_id).html())
}

if ($(content_id).length > 0 && $(waypoint_id).length > 0) {
  $(window).bind('scroll', function() {
    paginationWaypoint(waypoint_id, next_id, waypointCallback)
  })
}

// Easy activity log scanning
// Keep track of your last seen activity log entry, and fade out everything after it
// ------------------------------------------------------------------------------

if (document.location.href.match(/github.com\/?$/)) {
  var last = localStorage.getItem('last_alert')

  if (last) {
    var hit_last = false
    $('div.news div.alert').each(function() {
      console.debug($(this).find('time').attr('title'), hit_last)
      if ($(this).find('time').attr('title') == last) {
        hit_last = true
      }

      if (hit_last) {
        $(this).css({'opacity': '0.5'})
      }
    })
  }

  // Store the timestamp of the latest entry in localStorage
  localStorage.setItem('last_alert', $('div.news div.alert:first').find('time').attr('title'))
}
