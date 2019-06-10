## 省市区三级联动

用于页面中省市区自动填充



### 基本用法

可编辑选择

:::demo 

```html
<template>
<div>
  <vui-addr 
      :address-config="addressConfig"
      :province-arr="allProvince"
      :address-obj="{
          'provinceId': surveyData.table.province,
          'cityId': surveyData.table.city,
          'areaId': surveyData.table.county,
          'address': surveyData.table.address,
      }"
      v-on:province="function(event){surveyData.table.province = event.target.value}"
      v-on:city="function(event){surveyData.table.city = event.target.value}"
      v-on:area="function(event){surveyData.table.county = event.target.value}"
      v-on:address="function(event){surveyData.table.address = event.target.value}"
      v-on:addresstext="function(event){surveyData.table.addressText = event}"
  ></vui-addr>
</div>
</template>
<script>
   export default {
      data(){
        return {
        allProvince: [],
        addressConfig: {
          sProvinceInterface: '/provinceCtrl/findHatProvinceAll',
          sCityInterface: '/provinceCtrl/findByCityParentCode',
          sAreaInterface: '/provinceCtrl/findByAreaParentCode',
          sCityParam: 'code',
          sAreaParam: 'code',
          sProvinceId: 'provinceid',
          sProvinceName: 'province',
          sCityId: 'cityid',
          sCityName: 'city',
          sAreaId: 'areaid',
          sAreaName: 'area'
        },
        
        //门店经营调查情况及重要财务数据报表
        surveyData: {
                table: {
                    // 经营地址
                    province: '',
                    city: '',
                    county: '',
                    address: '',
                },
            }
        };
      },
      mounted(){
          this.getProvince();
      },
      methods: {
        getProvince: function() {
            
        }
      }
   };
 </script>

```
:::


### Attributes
| 参数          | 说明            | 类型            | 可选值                 | 默认值   |
|-------------  |---------------- |---------------- |---------------------- |-------- |
| address-config | 可以不传，有默认值， | Object | — |  |
| address-config(sProvinceInterface) | 省接口地址| string | — | /provinceCtrl/findHatProvinceAll |
| address-config.sCityInterface | 市接口地址| string | — | /provinceCtrl/findByCityParentCode |
| address-config.sAreaInterface | 区接口地址| string | — | /provinceCtrl/findByAreaParentCode |
| address-config.sCityParam | 获取市数据的接口传参名字| string | — | code |
| address-config.sAreaParam | 获取区数据的接口传参名字| string | — | code |
| address-config.sProvinceId | 省选择框每一个选项value值对应的的字段名| string | — | provinceid |
| address-config.sProvinceName |省选择框每一个选项显示的字段名| string | — | province |
| address-config.sCityId | 市选择框每一个选项value值对应的的字段名| string | — | cityid |
| address-config.sCityName |市选择框每一个选项显示的字段名| string | — | city |
| address-config.sAreaId | 区选择框每一个选项value值对应的的字段名| string | — | areaid |
| address-config.sAreaName |区选择框每一个选项显示的字段名| string | — | area |
| province-arr | 所有省数组，require(所有配置选项中必须传的值) | Array | — | [] |
| address-obj | 省市区address的值 | Object | - | |
| address-obj(provinceId) | 省的值 | string | - | 空|
| address-obj(cityId) | 市的值 | string | - | 空|
| address-obj(areaId) | 区的值 | string | - | 空|
| address-obj(address) | address的值 | string | - | 空|
| province-rule-detail | 省的校验规则 | string | - | []|
| city-rule-detail | 市的校验规则 | string | - | []|
| area-rule-detail | 区的校验规则 | string | - | []|
| address-rule-detail | address的校验规则 | string | - | []|


### Events

| 事件名称 | 说明 | 回调参数 |
|---------|--------|---------|
| province | 在 省 Select 值改变时触发 | 返回一个特殊变量 $event, 其值是event.target.value(: string \| number)   |
| city | 在 市 Select 值改变时触发 | 返回一个特殊变量 $event, 其值是event.target.value(: string \| number)   |
| area | 在 区 Select 值改变时触发 | 返回一个特殊变量 $event, 其值是event.target.value(: string \| number)   |
| address | 在 address  值改变时触发 | 返回一个特殊变量 $event, 其值是event.target.value(: string \| number)   |
| addresstext | 在 addresstext 省市区address的字符串拼接 | 返回具体值，value(: string \| number)   |
