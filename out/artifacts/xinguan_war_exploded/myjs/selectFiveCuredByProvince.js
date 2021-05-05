$(function(){
	//下拉框加载34个省市自治区名称
	loadPName("curedArea");
	
	loadCuredData("北京")
})

//加载数据
function loadCuredData(name){
	var my_echarts =echarts.init(document.getElementById("cureCount"));

	var data = [88, 45, 36, 23, 16, 10];
	var	area = ['境外输入','朝阳区','海淀区','西城区','大庆区']

	option = {
		// backgroundColor: "#141f56",

		tooltip: {
			show: false,
			trigger: 'item',
			backgroundColor: 'rgba(0,0,0,0.4)', // 背景
			padding: [8, 10], //内边距
			// extraCssText: 'box-shadow: 0 0 3px rgba(255, 255, 255, 0.4);', //添加阴影
			formatter: function(params) {
				if (params.seriesName != "") {
					return params.name + ' ：  ' + params.value + ' 辆';
				}
			},

		},
		grid: {
			borderWidth: 0,
			top: 20,
			bottom: 10,
			left:10,
			right:10,
			textStyle: {
				color: "#fff"
			},
			containLabel: true
		},
		xAxis: [{
			type: 'category',

			axisTick: {
				show: false
			},

			axisLine: {
				show: true,
				lineStyle: {
					color:'rgba(255,255,255,0.2)',
				}
			},
			axisLabel: {
				inside: false,
				textStyle: {
					color: '#bac0c0',
					fontWeight: 'normal',
					fontSize: '12',
				},
				// formatter:function(val){
				//     return val.split("").join("\n")
				// },
			},
			data: area,
		}, {
			type: 'category',
			axisLine: {
				show: false
			},
			axisTick: {
				show: false
			},
			axisLabel: {
				show: false
			},
			splitArea: {
				show: false
			},
			splitLine: {
				show: false
			},
			data: area,
		}],
		yAxis: {
			min:0,
			type: 'value',
			axisTick: {
				show: false
			},
			axisLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,0.2)',
				}
			},
			splitLine: {
				show: true,
				lineStyle: {
					color: 'rgba(255,255,255,0.1)',
				}
			},
			axisLabel: {
				textStyle: {
					color: '#bac0c0',
					fontWeight: 'normal',
					fontSize: '12',
				},
				formatter: '{value}',
			},
		},
		series: [{
			type: 'bar',
			itemStyle: {
				normal: {
					show: true,
					color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
						offset: 0,
						color: '#00c0e9'
					}, {
						offset: 1,
						color: '#3b73cf'
					}]),
					barBorderRadius: 50,
					borderWidth: 0,
				},
				emphasis: {
					shadowBlur: 15,
					shadowColor: 'rgba(105,123, 214, 0.7)'
				}
			},
			zlevel: 2,
			barWidth: '20%',
			data: data,
		},
			{
				name: '',
				type: 'bar',
				xAxisIndex: 1,
				zlevel: 1,
				itemStyle: {
					normal: {
						color: 'transparent',
						borderWidth: 0,
						shadowBlur: {
							shadowColor: 'rgba(255,255,255,0.31)',
							shadowBlur: 10,
							shadowOffsetX: 0,
							shadowOffsetY: 2,
						},
					}
				},
				barWidth: '20%',
				data: [30, 30, 30, 30, 30]
			}
		]
	}

	my_echarts.setOption(option);

	window.addEventListener("resize",function(){
		my_echarts.resize();
	});
}

//下拉框触发的函数
function selectAreaByCured(){
	var name = $("#confirmArea").val();
	loadCuredData(name)

}
