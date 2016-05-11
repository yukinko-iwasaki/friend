 
$(".inputtrack" ).dialog({autoOpen: false });
  $("#progress").click(function(){
  $(".inputtrack").dialog("open");
  });

  $(".inputtrack").submit(function(){
  $(this).dialog("close");
  });


  $(function () {
    $('#container').highcharts({
        chart: {
            type: 'area'
        },
        title: {
            text: '<%= @goal.goal_name %>'
        },
        xAxis: {
            allowDecimals: false,
            labels: {
                formatter: function () {
                    return this.value; // clean, unformatted number for year
                }
            }
        },
        yAxis: {
            title: {
                text: '<%= @goal.qunit %>'
            },
            labels: {
                formatter: function () {
                    return this.value;
                }
            }
        },
        tooltip: {
            pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
        },
        plotOptions: {
            area: {
                pointStart: <%= 3.weeks.ago.at_midnight.to_i * 1000 %>,
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2,
                    states: {
                        hover: {
                            enabled: true
                        }
                    }
                }
            }
        },
        series: [{
            pointInterval: <%= 1.day * 1000 %>,
            name: '<%= @goal.goal_name %>',
            data: <%= (3.weeks.ago.to_date..Date.today).map { |date| Track.where(goal_id: params[:id]).total_on(date).to_f}.inspect %>
        },]
    });
});


