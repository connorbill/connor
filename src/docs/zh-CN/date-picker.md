
## DatePicker 日期选择器

用于选择或输入日期,本组件依赖[My97DatePicker](http://www.my97.net/),为了保持与后台系统统一

###  选择

:::demo 
```html
<template>
  <div class="block">
    <span class="demonstration">默认</span>
    <!--<vui-date-picker
      v-model="value1"
      date-format="yyyy-MM-dd"
      placeholder="选择日期">
    </vui-date-picker>-->
  </div>
</template>

<script>
  export default {
    data() {
      return {
        value1: '',
      };
    }
  };
</script>
```
:::



### Attributes
| 参数      | 说明          | 类型      | 可选值                           | 默认值  |
|---------- |-------------- |---------- |--------------------------------  |-------- |
| value / v-model | 绑定值 |  string / number | — | — |
| disabled | 是否禁用 | boolean | — | false |
| rule | 校验规则 |  | Array | - |
| date-format | 日期格式 | string | — | yyyy-MM-dd |
| idName | 输入框id | string | — | value |
| option | 其它日期配置项，请参考[My97DatePicker](http://www.my97.net/)，配置项完全相同 | Object | — | value |
| class-name | 输入框样式 | string | — | value |

### Events
| 事件名称      | 说明    | 回调参数      |
|---------|--------|---------|
| change | 用户确认选定的值时触发 | 组件绑定值。格式与绑定值一致，可受 `value-format` 控制 |
| blur | 当 input 失去焦点时触发 | 组件实例 |
| focus | 当 input 获得焦点时触发 | 组件实例 |

