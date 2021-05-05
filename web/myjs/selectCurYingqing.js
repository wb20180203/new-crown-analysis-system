//文档加载事件
$(function(){
	var pie_cur_country =echarts.init(document.getElementById("pie_fanzui"));
	var data =[{name:'现有确诊', value:8854},{name:'现有治愈', value:8765}, {name:'现有死亡', value:433}]

	option = {
		title : {
			x:'center'

		},
		tooltip : {
			trigger: 'item',
			formatter: "{a} <br/>{b} : {c} ({d}%)"
		},
		legend: {
			orient: 'horizontal',
			// left: 'left',
			data: ['现有确诊','现有治愈','现有死亡'],
			textStyle: {color: 'white'}
		},

		label: {
			normal: {
				textStyle: {
					color: 'red'  // 改变标示文字的颜色
				}
			}
		},
		series : [
			{
				name: '今日国内疫情分析',
				type: 'pie',
				radius : '55%',
				center: ['50%', '60%'],
				data:data,

				itemStyle: {
					emphasis: {
						shadowBlur: 10,
						shadowOffsetX: 0,
						shadowColor: 'rgba(0, 0, 0, 0.5)'
					}
				}

			}
		]

	};


	// 使用刚指定的配置项和数据显示图表。
	pie_cur_country.setOption(option);

	window.addEventListener("resize",function(){
		pie_cur_country.resize();
	});

})