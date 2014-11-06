$(function () {
   $('#work_order_start_date').datetimepicker();
   $('#work_order_due_date').datetimepicker();
   $("#work_order_start_date").on("dp.change",function (e) {
      $('#work_order_due_date').data("DateTimePicker").setMinDate(e.date);
   });
   $("#work_order_due_date").on("dp.change",function (e) {
      $('#work_order_start_date').data("DateTimePicker").setMaxDate(e.date);
   });
});

$(function () {
   $('#misc_work_order_start_date').datetimepicker();
   $('#misc_work_order_due_date').datetimepicker();
   $("#misc_work_order_start_date").on("dp.change",function (e) {
      $('#misc_work_order_due_date').data("DateTimePicker").setMinDate(e.date);
   });
   $("#misc_work_order_due_date").on("dp.change",function (e) {
      $('#misc_work_order_start_date').data("DateTimePicker").setMaxDate(e.date);
   });
});