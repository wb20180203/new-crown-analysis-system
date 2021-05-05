<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/rem.js"></script>
    <link rel="stylesheet" href="../css/map.css">
    <link rel="stylesheet" href="../css/style.css">
    <title>新冠肺炎分析系统</title>

</head>

<body>
<div class="loading">
    <div class="loadbox">  页面加载中... </div>
</div>
<div class="data">
    <div class="container-flex" tabindex="0" hidefocus="true">
        <div class="box-left">
            <div class="left-top">
                <div class="current-num">
                    <div>新冠型肺炎确诊人数</div>
                    <p id="allcount">xxxx人</p>
                </div>
            </div>
            <div class="left-center">
                <div class="title-box">
                    <h6>今日国内疫情分析</h6>
                </div>
                <div class="chart-box pie-chart" style="">
                    <div id="pie_fanzui" style="width:100%;">
                    
                    </div>
                    
                </div>
            </div>
            <div class="left-bottom" class="select">
                <div class="title-box">
                    <h6>各省的疫情分析</h6>
                    <select id="proNameOne"  onchange="selectByName()" style="height:20px;width:50px;margin-left:10px;font-size: 12px" >
                		
                	</select>	
                </div>
                
                <div class="chart-box pie-chart">
                
                   <div id="pie_yiqing" style="width:100%;">
                   
                   </div>
                	
                </div>
            </div>
        </div>
        <div class="box-center">
            <div class="center-top">
                <h1><img src="../images/jinghui.png" style="width:55px;margin-right:20px;"/>新冠型肺炎分析系统</h1>
            </div>
            <div class="center-center">
                <div class="weather-box">
                    <div class="data">
                        <p class="time" id="time">00:00:00</p>
                        <p id="date"></p>
                    </div>
                    <div class="weather">
                        <img id="weatherImg" src="../images/weather/weather_img01.png" alt="">
                        <div id="weather">
                            <p class="active">多云</p>
                            <p>16-22℃</p>
                            <p>成都市锦江区</p>
                        </div>
                    </div>
                </div>
                <img src="../images/line_bg.png" alt="">
                <div class="select-box" style="height: 0.3rem;">
                    
                    <div data-type="2">
                        <div class="select" tabindex="0" hidefocus="true" >
                         
                          <a href="javascript:loadChinaMap()" style="color: #cdddf7">返回</a>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="center-bottom">
                <div class="chart-box">
                    <div id="china_map" style="width:100%;height:95%;"></div>
                </div>
                
            </div>

        </div>
        <div class="box-right">
            <div class="right-top">
                <div class="title-box">
                    <h6 id="barTitle">各省确诊人数前五的地区</h6>
                     <select id="confirmArea" style="height:20px;width:50px;margin-left:10px;font-size: 12px" onchange="selectAreaByConfirm()">
                	
                	</select>
                </div>
        
                    <div class="chart-box ">
					   <div id="confirmCount" style="width:100%;height:100%;">
            
                    </div>
                </div>
                
            </div>
            <div class="right-center">
            	
                <div class="title-box">
                    <h6>各省治愈人数前五的地区</h6>
                       <select id="curedArea" style="height:20px;width:50px;margin-left:10px;font-size: 12px" onchange="selectAreaByCured()">
                		
                	</select>
                </div>
                <div class="chart-box ">
                    
                    <div id="cureCount" style="width:100%;height:100%;"></div>
                    
                </div>
            </div>
            
            
            <div class="right-bottom">
                <div class="title-box">
                	<p id="switchBtn"><span class="active" data-dataType="income">各省死亡人数前五的地区</span></p>
                    <select id="deadArea" style="height:20px;width:50px;margin-left:10px;font-size: 12px" onchange="selectAreaByDead()">
                		<option value="湖北" >湖北</option>
                		<option value="陕西" >陕西</option>
                		<option value="四川" >四川</option>
                	</select>
                </div>
                <div class="chart-box ">
					   <div id="deadCount" style="width:100%;height:100%;">
            
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="../js/echarts.min.js"></script>
<script type="text/javascript" src="../js/china.js"></script>
<script type="text/javascript" src="../myjs/selectCurYingqing.js"></script>
<script type="text/javascript" src="../myjs/selectYiqingByProvince.js"></script>
<script type="text/javascript" src="../myjs/selectCountYiqing.js"></script>
<script type="text/javascript" src="../myjs/selectFiveConfirmByProvince.js"></script>
<script type="text/javascript" src="../myjs/selectFiveCuredByProvince.js"></script>
<script>

    $(function () {
        selectAreaByDead();

        $(".loading").fadeOut();
    })

    function selectAreaByDead() {
        //初始化echarts区域
        var my_echars = echarts.init(document.getElementById('deadCount'));
        //假数据
        var data = [23,12,9,8,3];
        var	area = ['境外输入','朝阳区','大庆区','海淀区','丰台区']
        //定义echarts配置选项
        var	option = {
            // backgroundColor: 'grey',
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left:10,
                right:10,
                top:10,
                bottom:10,
                containLabel: true,

            },

            xAxis: {
                type: 'value',
                axisLine:{
                    lineStyle:{
                        color:'rgba(255,255,255,0.3)'
                    }
                },
                splitLine:{
                    lineStyle:{
                        color:'rgba(255,255,255,0)'
                    }
                },
                axisLabel:{
                    color:"rgba(255,255,255,0.5)"
                },
                boundaryGap: [0, 0.01]
            },
            yAxis: {
                type: 'category',
                axisLine:{
                    lineStyle:{
                        color:'rgba(255,255,255,0.3)'
                    }
                },
                splitLine:{
                    lineStyle:{
                        color:'rgba(255,255,255,0.3)'
                    }
                },
                axisLabel:{
                    color:"red"
                },
                data: area
            },
            series: [
                {
                    name: '各省疫情死亡前5地区',
                    type: 'bar',
                    barWidth :10,
                    itemStyle: {
                        normal: {
                            color:'#3b73cf',
                            opacity: 1,
                            barBorderRadius: 5,
                        }
                    },
                    data: data
                }
            ]
        };
        //给初始化后的echarts对象应用配置项
        my_echars.setOption(option);

    }
</script>
</html>