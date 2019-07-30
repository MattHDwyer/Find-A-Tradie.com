// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require select2
//= require home

$(document).ready(function() {
  $('#trade_selectbox').select2({
    width: 'resolve',
    multiple: true,
    maximumSelectionLength: 1,
    ajax: {
      url: '/gettrade.json',
      dataType: 'json',
      type: 'GET',
      processResults: function(data) {
        return {
          results: $.map(data, function(item) {
            return { id: item.id, text: item.trade_name }
          })
        }
      }
    }
  })
  $('#location_selectbox').select2({
    width: 'resolve',
    multiple: true,
    maximumSelectionLength: 1,
    ajax: {
      url: '/getlocation.json',
      dataType: 'json',
      type: 'GET',
      processResults: function(data) {
        return {
          results: $.map(data, function(item) {
            return {
              id: item.name,
              text: item.name + ',' + item.state + ' ' + item.postcode
            }
          })
        }
      }
    }
  })
})
