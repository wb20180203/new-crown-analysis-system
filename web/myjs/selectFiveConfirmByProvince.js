$(function(){
	//下拉框加载34个省市自治区名称
	loadPName("confirmArea");
	
	loadConfirmData("北京")
})

//加载数据
function loadConfirmData(name){
	var pie_confirm =echarts.init(document.getElementById("confirmCount"));

	var data = [
		{value:70, name:'NO.4'},
		{value:90, name:'NO.3'},
		{value:110, name:'NO.2'},
		{value:150, name:'NO.1'},
		{value:40, name:'NO.5'}
	];

	option = {

		tooltip : {
			trigger: 'item',
			formatter: "{b}: <br/>  {c} ({d}%)"
		},

		toolbox: {
			show : false,
			feature : {
				mark : {show: true},
				dataView : {show: true, readOnly: false},
				magicType : {
					show: true,
					type: ['pie', 'funnel']
				},
				restore : {show: true},
				saveAsImage : {show: true}
			}
		},
		calculable : true,
		series : [
			{
				name:'排名',
				type:'pie',
				color: ['#33b565', '#20cc98', '#20b9cf', '#2089cf', '#205bcf'],
				radius : [20, 70],
				center : ['50%', '50%'],
				roseType : 'area',
				data:data
			}
		]
	};
	pie_confirm.setOption(option);

	window.addEventListener("resize",function(){
		pie_confirm.resize();
	});
}

//下拉框触发的函数
function selectAreaByConfirm(){
	var name = $("#confirmArea").val();
	loadConfirmData(name)

}
