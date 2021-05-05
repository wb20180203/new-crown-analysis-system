//构建一个全局变量
var china_map;
//定义加载事件
$(function () {
    //创建地图容器
    china_map = echarts.init(document.getElementById("china_map"));
    //运行加载中国地图
    loadChinaMap();
    //地图鼠标点击事件
    china_map.on('click', function (params) {
        console.log(params);

        //获取省份名称
        var city = params.name
        if(city != null && city != ""){
            //加载省级地图
            loadProvinceName(city);
        }
    });
})

//加载中国地图
function loadChinaMap() {
	//假数据
    var data = [];

    var option = {

        title: {
            text: '新冠型肺炎人口来源分析',
            textStyle: {color: '#fff'},
            //subtext: '纯属虚构',
            x: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        visualMap: {
            show: false,
            x: 'left',
            y: 'bottom',
            //layoutCenter:['30%','30%'],
            splitList: [
                {start: 0, end: 100},
                {start: 100, end: 300},
                {start: 300, end: 500},
                {start: 500, end: 800},
                {start: 800, end: 1500},
                {start: 1500, end: 100000}
            ],
            color: ['red', 'yellow', 'Purple', 'DarkCyan', 'green', 'Lime']
        },
        series: [{
            name: '新冠型肺炎人口来源分析',
            type: 'map',
            mapType: 'china',
            roam: true,
            label: {
                normal: {
                    show: true
                },
                emphasis: {
                    show: false
                }
            },
            data: []
        }]
    };
    //对echart图表应用配置
    china_map.setOption(option);
    //给窗口注册resize事件，当窗口大小有变化时，让echarts图表也同时变化
    window.addEventListener("resize",function(){
        china_map.resize();
    });

    //发ajax请求拿真实数据,对图表进行数据更新
    $.ajax({
        url: "./queryCount",
        type: "get",
        dataType: "json",
        success: function (result){
            //重新设置图表数据
            console.log(result.date);
            china_map.setOption({series:{data:result.data}})
        },
        error: function (err){
            console.log(JSON.stringify(err));
        }
    })
}

//加载省级地图
function loadProvinceName(city) {
    //转圈动画
    china_map.showLoading();
    //需要ajax请求省级地图轮廓数据
    $.get("../json/" + city + ".json", function (geoJson) {
        console.log("===" + geoJson);
        china_map.hideLoading();
        // 注册echarts对应省份的地图轮廓数据
        echarts.registerMap(city, geoJson);
        var data = [{name:'境外输入',value:123}, {name:'朝阳区', value:23}];

        var option = {
            title: {
                text: city + '新冠肺炎人口来源分析',
                textStyle: {color: '#fff'},
                //subtext: '纯属虚构',
                x: 'center'
            },
            tooltip: {
                trigger: 'item'
            },
            visualMap: {
                show: false,
                x: 'left',
                y: 'bottom',
                //layoutCenter:['30%','30%'],
                splitList: [
                    {start: 0, end: 100}, {start: 100, end: 300},
                    {start: 300, end: 500}, {start: 500, end: 800},
                    {start: 800, end: 1500}, {start: 1500, end: 100000},
                ],
                color: ['red', 'yellow', 'Purple', 'DarkCyan', 'green', 'Lime']
            },
            series: [{
                name: city + '新冠肺炎人口来源分析',
                type: 'map',
                mapType: city,
                roam: true,
                label: {
                    normal: {
                        show: true
                    },
                    emphasis: {
                        show: false
                    }
                },
                data: data
            }]
        };
        china_map.setOption(option);

        $.ajax({
            url: "./areaInfo",
            type: "get",
            dataType: "json",
            data: {"province":city},
            success: function (result){
                //重新设置图表数据
                console.log(result.date);
                china_map.setOption({series:{data:result.data}})
            },
            error: function (err){
                console.log(JSON.stringify(err));
            }
        })
    });
}


