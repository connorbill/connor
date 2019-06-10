## Select 选择器

当选项过多时，使用下拉菜单展示并选择内容。

### 基础用法

适用广泛的基础单选
:::demo `v-model`的值为当前被选中的`vui-option`的 value 属性值
```html
<template>
  <vui-select
    v-model="value"
    :option="options"
    select-id="value"
    select-name="label"
  ></vui-select>
</template>

<script>
  export default {
    data() {
      return {
        options: [{
          value: '选项1',
          label: '黄金糕'
        }, {
          value: '选项2',
          label: '双皮奶'
        }, {
          value: '选项3',
          label: '蚵仔煎'
        }, {
          value: '选项4',
          label: '龙须面'
        }, {
          value: '选项5',
          label: '北京烤鸭'
        }],
        value: ''
      }
    }
  }
</script>
```
:::


### 禁用状态

选择器不可用状态

:::demo 为`vui-select`设置`disabled`属性，则整个选择器不可用
```html
<template>
  <vui-select v-model="value3" disabled>
  </vui-select>
</template>
  
<script>
  export default {
    data() {
      return {
        options: [{
          value: '选项1',
          label: '黄金糕'
        }, {
          value: '选项2',
          label: '双皮奶'
        }, {
          value: '选项3',
          label: '蚵仔煎'
        }, {
          value: '选项4',
          label: '龙须面'
        }, {
          value: '选项5',
          label: '北京烤鸭'
        }],
        value3: ''
      }
    }
  }
</script>
```
:::



### Select Attributes
| 参数      | 说明          | 类型      | 可选值                           | 默认值  |
|---------- |-------------- |---------- |--------------------------------  |-------- |
| value / v-model | 绑定值 | boolean / string / number | — | — |
| disabled | 是否禁用 | boolean | — | false |
| select-id | 选项对应value字段 | string | — | value |
| select-name | 显示的选项字段 | string | — | value |
| select-default-name | 默认空值选项显示文字 | string | — | value |
| show-default-name | 是否显示默认为空选项（比如是否显示“请选择”） | string | — | value |
| option | option数组 | string | — | value |
| class-name | select框样式 | string | — | value |

### Select Events
| 事件名称 | 说明 | 回调参数 |
|---------|---------|---------|
| change | 选中值发生变化时触发 | 目前的选中值 |

