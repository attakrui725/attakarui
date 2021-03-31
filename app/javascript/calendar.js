

document.addEventListener('turbolinks:load', function () {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, interactionPlugin,]

  });

  calendar.render();
});
