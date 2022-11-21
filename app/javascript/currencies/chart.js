import Highcharts from 'highcharts';

const pricesData = prices.map((price) => [
    new Date(price.timestamp).getTime(),
    parseFloat(price.price_usd)
])

const buildChart = () => {
    const chart = Highcharts.chart('container', {
        chart: {
            type: 'spline',
            scrollablePlotArea: {
                minWidth: 600,
                scrollPositionX: 1
            }
        },
        title: {
            text: '',
            // align: 'left'
        },
        xAxis: {
            type: 'datetime',
            reversed: true,
            title: {
                text: 'Timestamp'
            },
            labels: {
                format: '{value:%m/%e/%Y %l:%M %p}',
            },
            gridLineWidth: 1,
        },
        yAxis: {
            title: {
                text: 'Price'
            },
        },
        legend: {
            enabled: false
        },
        tooltip: {
            headerFormat: '{point.key:%a, %b %e, %Y %l:%M %p}<br/>',
            pointFormat: '{series.name}: <b>{point.y:.2f}$</b><br/>',
        },
        plotOptions: {
            spline: {
                lineWidth: 2,
                marker: {
                    enabled: false
                },
                pointInterval: 3600000, // one hour
                pointStart: Date.UTC(2022, 5, 13, 0, 0, 0)
            }
        },
        series: [{
            name: 'Price',
            data: pricesData
        }],
    });

}

export default buildChart