//定义文档加载事件
$(function(){
	//运行加载34个省市自治区的名称函数
	loadPName("proNameOne");
	//默认加载
	loadData("北京");
})
//加载34个省市自治区名称
function loadPName(id){
	
	// 异步请求服务器加载34各省市自治区的数据
	var html = ""
	html +="<option value='北京'>北京</option>";
	html +="<option value='四川'>四川</option>";
	html +="<option value='重庆'>重庆</option>";
	html +="<option value='山东'>山东</option>";
	$("#"+id+"").html(html);
}
//加载饼图数据
function loadData(name){
	console.log(name)
	var pie_cur_prov =echarts.init(document.getElementById("pie_yiqing"));
	var data =[{name:'现有确诊', value:254},{name:'现有治愈', value:245}, {name:'现有死亡', value:10}]

	option = {
		backgroundColor: 'rgba(0,0,0,0)',
		tooltip: {
			trigger: 'item',
			formatter: "{b}: <br/>{c} ({d}%)"
		},
		color: [ '#20b9cf', '#2089cf', '#205bcf'],
		legend: { //图例组件，颜色和名字
			x: '70%',
			y: 'center',
			orient: 'vertical',
			itemGap: 12, //图例每项之间的间隔
			itemWidth: 10,
			itemHeight: 10,
			icon: 'rect',
			data: ['现有确诊', '现有治愈', '现有死亡'],
			textStyle: {
				color: [],
				fontStyle: 'normal',
				fontFamily: '微软雅黑',
				fontSize: 12,
			}
		},
		series: [{
			name: '各省疫情分析',
			type: 'pie',
			clockwise: false, //饼图的扇区是否是顺时针排布
			minAngle: 20, //最小的扇区角度（0 ~ 360）
			center: ['35%', '50%'], //饼图的中心（圆心）坐标
			radius: [40, 60], //饼图的半径
			//  avoidLabelOverlap: true, ////是否启用防止标签重叠
			itemStyle: { //图形样式
				normal: {
					borderColor: 'transparent',
					borderWidth: 2,
				},
			},
			label: { //标签的位置
				normal: {
					show: true,
					position: 'inside', //标签的位置
					formatter: "{c}({d}%)",  //标签上显示图表的value+百分比
					textStyle: {
						color: '#fff',
					}
				},
				emphasis: {
					show: true,
					textStyle: {
						fontWeight: 'bold'
					}
				}
			},
			data: data
		}, {
			name: '',
			type: 'pie',
			clockwise: false,
			silent: true,
			minAngle: 20, //最小的扇区角度（0 ~ 360）
			center: ['35%', '50%'], //饼图的中心（圆心）坐标
			radius: [0, 40], //饼图的半径
			itemStyle: { //图形样式
				normal: {
					borderColor: '#1e2239',
					borderWidth: 1.5,
					opacity: 0.21,
				}
			},
			label: { //标签的位置
				normal: {
					show: false,
				}
			},
			data: data
		}]
	};

	pie_cur_prov.setOption(option);
	window.addEventListener("resize",function(){
		pie_cur_prov.resize();
	});
	
}
//下来框选中触发的函数
function selectByName(){
	var name = $("#proNameOne").val();
	loadData(name);
}