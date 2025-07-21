

// **------ pie_charts 1**
document.addEventListener('DOMContentLoaded', function () {
  setTimeout(function () {
      const rawNames = window.topClientData?.names || [];
      const rawTotals = window.topClientData?.totals || [];

      const names = [];
      const totals = [];

      // Filter valid entries
      for (let i = 0; i < rawNames.length; i++) {
          const name = rawNames[i];
          const total = rawTotals[i];

          if (name && total !== null && !isNaN(total)) {
              names.push(name);
              totals.push(total);
          }
      }

      if (!names.length || !totals.length) {
          console.warn('No data available for Top Clients chart.');
          return;
      }
      const options = {
          series: totals,
          chart: {
              height: 340,
              type: 'pie',
          },
          labels: names,
          colors: [
              getLocalStorageItem('color-primary', '#056464'),
              getLocalStorageItem('color-secondary', '#74788D'),
              '#0FB450', '#EA5659', '#FAC10F'
          ],
          legend: {
              position: 'bottom',
              show: true,
          },
          responsive: [{
              breakpoint: 1366,
              options: {
                  chart: {
                      height: 250
                  },
                  legend: {
                      show: true,
                  },
              }
          }]
      };

      const pieContainer = document.querySelector("#pie1");
      if (pieContainer) {
          // If chart is already rendered, destroy it
          if (pieContainer._chartInstance) {
              pieContainer._chartInstance.destroy();
          }

          const chart = new ApexCharts(pieContainer, options);
          chart.render();

          // Save reference for future cleanup
          pieContainer._chartInstance = chart;
      }
  }, 200); // Allow Blade to inject window.topClientData
});

//  **------pie_charts 2**

document.addEventListener("DOMContentLoaded", function () {
  if (typeof window.topClientsRevenueData !== 'undefined') {
      const names = window.topClientsRevenueData.names || [];
      const totals = window.topClientsRevenueData.totals || [];

      const options = {
          series: totals,
          chart: {
              type: 'donut',
              height: 340,
          },
          labels: names,
          legend: {
              show: true, // ✅ force show
              position: 'bottom',
              horizontalAlign: 'center',
              fontSize: '14px',
              labels: {
                  colors: '#333'
              }
          },
          colors: [
              '#3C91F3',
              '#ACB8C8',
              '#231928',
              getLocalStorageItem('color-primary', '#056464'),
              getLocalStorageItem('color-secondary', '#74788D')
          ],
          tooltip: {
              y: {
                  formatter: function (val) {
                      return new Intl.NumberFormat().format(val) + ' PKR';
                  }
              }
          },
          responsive: [{
              breakpoint: 1366,
              options: {
                  chart: {
                      height: 250
                  },
                  legend: {
                      show: true, // ✅ KEEP true here
                      position: 'bottom'
                  }
              }
          }]
      };

      const chart = new ApexCharts(document.querySelector("#pie2"), options);
      chart.render();
  }
});


// 


// **------ pie_charts 3**

var options = {
    series: [44, 55, 13, 33],
    chart: {
      height: 340,
    type: 'donut',
  },
  dataLabels: {
    enabled: false
  },
  markers: {
    colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'), '#0FB450','#EA5659','#FAC10F','#3C91F3','#ACB8C8','#231928']
 },
  fill: {
    colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'), '#0FB450','#EA5659','#FAC10F','#3C91F3','#ACB8C8','#231928']
  },
  labels: ["Device 1", "Device 2","Device 3","Device 4"],

  colors:[getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'), '#0FB450','#EA5659','#FAC10F','#3C91F3','#ACB8C8','#231928'],
  responsive: [{
    breakpoint: 1366,
    options: {
        chart: {
          height: 240
        },
        legend: {
          show: false,
        },
    }
}],
  legend: {
    position: 'bottom',
    offsetY: 0,

  }
  
  };

  var chartItem = new ApexCharts(document.querySelector("#chart9"), options);
  chartItem.render();


// function appendData() {
//   var arr = chartItem.w.globals.series.slice()
//   arr.push(Math.floor(Math.random() * (100 - 1 + 1)) + 1)
//   return arr;
// }

// function removeData() {
//   var arr = chartItem.w.globals.series.slice()
//   arr.pop()
//   return arr;
// }

// function reset() {
//     return [44, 55, 13, 33];

// }

// document.querySelector("#add").addEventListener("click", function() {
//   chartItem.updateSeries(appendData())
// })

// document.querySelector("#remove").addEventListener("click", function() {
//   chartItem.updateSeries(removeData())
// })

// document.querySelector("#reset").addEventListener("click", function() {
//   chartItem.updateSeries(reset())
// })


//  **------pie_charts 4**

var pie4 = {
    series: [25, 15, 44, 55, 41, 17],
    chart: {
      height: 340,
        // width: '100%',
        type: 'pie',
    },
    labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
    theme: {
        monochrome: {
            enabled: true
        }
    },
    plotOptions: {
        pie: {
            dataLabels: {
                offset: -5
            }
        }
    },
    title: {
        text: "Monochrome Pie"
    },
    
    dataLabels: {
        formatter(val, opts) {
            console.log("val", val, "opt", opts);
            const name = opts.w.globals.labels[opts.seriesIndex]
            console.log("name", name);
            return name + val.toFixed(1) + '%'
        }
    },
    legend: {
        show: false
    },
    fill: {
        colors: [getLocalStorageItem('color-primary','#056464')]
      },
      responsive: [{
        breakpoint: 567,
        options: {
            chart: {
              height: 250
            },
            legend: {
              show: false,
            },
        }
    }]
};

var chart4 = new ApexCharts(document.querySelector("#pie4"), pie4);
chart4.render();

//  **------pie_charts 5**

var options = {
    series: [44, 55, 41, 17],
    chart: {
      height: 340,
        type: 'donut',
    },
    plotOptions: {
        pie: {
            startAngle: -90,
            endAngle: 270
        }
    },
    dataLabels: {
        enabled: false
    },
    fill: {
        type: 'gradient',
        colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'),'#0FB450','#EA5659','#FAC10F'],
    },
    colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'),'#0FB450','#EA5659','#FAC10F'],
    legend: {
        formatter: function (val, opts) {
            return val + " - " + opts.w.globals.series[opts.seriesIndex]
        },
        position: 'bottom'
    },
    title: {
        text: ''
    },
    
    responsive: [{
        breakpoint: 1366,
        options: {
            chart: {
              height: 250
            },
            legend: {
              show: false,
            },
        }
    }]
};

var chart = new ApexCharts(document.querySelector("#pie5"), options);
chart.render();

// **------ pie_charts 6**

var options = {
    series: [44, 55, 41, 17, 15],
    chart: {
        height: 380,
        type: 'donut',
        dropShadow: {
            enabled: true,
            color: '#111',
            top: -1,
            left: 3,
            blur: 3,
            opacity: 0.2
        }
    },
    stroke: {
        width: 0,
    },
    plotOptions: {
        pie: {
            donut: {
                labels: {
                    show: true,
                    total: {
                        showAlways: true,
                        show: true
                    }
                }
            }
        }
    },
    labels: ["Comedy", "Action", "SciFi", "Drama", "Horror"],
    dataLabels: {
        dropShadow: {
            blur: 3,
            opacity: 0.8
        }
    },
    fill: {
        type: 'pattern',
        opacity: 1,
        pattern: {
            enabled: true,
            style: ['verticalLines', 'squares', 'horizontalLines', 'circles', 'slantedLines'],
        },
    },
    states: {
        hover: {
            filter: 'none'
        }
    },
    theme: {
        palette: 'palette2'
    },
    title: {
        text: "Favourite Movie Type"
    },
    legend: {
      position: 'bottom',
    },
    responsive: [{
      breakpoint: 1366,
      options: {
          chart: {
              height: 250
          },
          legend: {
            show: false,
          },
      }
  }],
    colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'),'#0FB450','#EA5659','#FAC10F'],
};

var chart = new ApexCharts(document.querySelector("#pie6"), options);
chart.render();

//  **------pie_chart 7**

var options = {
    series: [44, 33, 54, 45],
    chart: {
    height: 340,
    type: 'pie',
  },
  colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'),'#0FB450','#EA5659','#FAC10F'],
  fill: {
    type: 'image',
    opacity: 0.85,
    image: {
        src: ['../assets/images/blog/27.jpg', '../assets/images/blog/27.jpg', '../assets/images/blog/27.jpg', '../assets/images/blog/27.jpg'],
      width: 25,
      imagedHeight: 25
    },
  },
  stroke: {
    width: 4
  },
  legend: {
    position: 'bottom',
  },
  dataLabels: {
    enabled: true,
    style: {
      colors: ['#111']
    },
    background: {
      enabled: true,
      foreColor: '#fff',
      borderWidth: 0
    }
  },
  };

  var chart = new ApexCharts(document.querySelector("#pie7"), options);
  chart.render();

  // **------ polar_chart 1**

var options = {
    series: [14, 23, 21, 17, 15],
    height: 600,
    chart: {
      type: 'polarArea',
    },
    stroke: {
      colors: ['#fff']
    },
    fill: {
      opacity: 0.8
    },
    legend: {
      position: 'bottom'
    },
    colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'), '#0FB450', '#EA5659', '#FAC10F '],
    responsive: [{
      breakpoint: 1366,
      options: {
        chart: {
          height:250,
        },
      }
    }]
  };
  
  var chart = new ApexCharts(document.querySelector("#polar1"), options);
  chart.render();
  
  
  //  **------polar_chart 2**
  
  
  var options = {
    series: [42, 30, 52, 40, 56],
    chart: {
      height: 340,
      type: 'polarArea'
    },
    labels: ['Rose A', 'Rose B', 'Rose C', 'Rose D'],
    fill: {
      opacity: 1,
  
    },
    colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'), '#0FB450', '#EA5659', '#FAC10F', '#3C91F3', '#ACB8C8'],
    stroke: {
      width: 1,
      colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'), '#0FB450', '#EA5659', '#FAC10F', '#3C91F3', '#ACB8C8'],
    },
    yaxis: {
      show: false
    },
    legend: {
      position: 'bottom',
    },
  
    plotOptions: {
      polarArea: {
        rings: {
          strokeWidth: 0
        },
        colors: [getLocalStorageItem('color-primary','#056464'),getLocalStorageItem('color-secondary','#74788D'), '#0FB450', '#EA5659', '#FAC10F', '#3C91F3', '#ACB8C8', '#231928',],
        spokes: {
          strokeWidth: 0,
        },
      }
    },
  };
  
  var chart = new ApexCharts(document.querySelector("#polar2"), options);
  chart.render();
  

