import $ from 'jquery';
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

window.onload = function () {
  $('#modal1').modal({
    show: false
  });

  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, interactionPlugin],
    initialView: 'dayGridMonth',
    selectable: true,
    events: [
      {
        id: 123,
        title: 'サンプルイベント',
        start: new Date()
      }
    ],
    eventClick: (event) => {
      $('#modal1').modal('show');
    }
  });
  calendar.render();
}
