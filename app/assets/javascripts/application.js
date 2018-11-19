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
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= stub 'plc'


function approve(model, id) {
  console.log(model + " " + id)
  $.ajax({
    type: 'POST',
    url: '/' + model + '/approve',
    data: { id: id }, 
    success: function(data, textStatus, jqXHR) {
      update(model, id)
    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log("banans")
      console.log(errorThrown)
    }
  });
}

function reject(model, id) {
  console.log(model + " " + id)
  $.ajax({
    type: 'POST',
    url: '/' + model + '/reject',
    data: { id: id }, 
    success: function(data, textStatus, jqXHR) {
      update(model, id)
    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log("banans")
      console.log(errorThrown)
    }
  });
}

function rsvp(id, status) {
  console.log(id)
  console.log('/event/' + (status? 'rsvp':'unrsvp'))
  $.ajax({
    type: 'POST',
    url: '/event/' + (status? 'rsvp':'unrsvp'),
    data: { id: id }, 
    success: function(data, textStatus, jqXHR) {
      update("event", id)
    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log("banans")
      console.log(errorThrown)
    }
  });
}

function update(model, id) {
  $.ajax({
    type: 'GET',
    url: '/' + model + '/get_partial',
    data: { id: id }, 
    success: function(data, textStatus, jqXHR) {
      $('#' + id).after(data)
      $('#' + id).remove()

    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log("banans")
      console.log(errorThrown)
    }
  })
}


