## Button 按钮
常用的操作按钮。

### 基础用法

基础的按钮用法。

:::demo 使用`type`、`plain`属性来定义 Button 的样式。

```html
  <vui-button >默认按钮</vui-button>
  <vui-button type="primary" >主要按钮</vui-button>
  <vui-button type="success" >主要按钮</vui-button>
  <vui-button type="warning" >主要按钮</vui-button>
  <vui-button type="danger" >主要按钮</vui-button>
  <vui-button type="info" >主要按钮</vui-button>
  <div style="margin-top: 10px;">
    <vui-button plain>朴素按钮</vui-button>
    <vui-button type="primary" plain>主要按钮</vui-button>
  <vui-button type="success" plain>主要按钮</vui-button>
  <vui-button type="warning" plain>主要按钮</vui-button>
  <vui-button type="danger" plain>主要按钮</vui-button>
  <vui-button type="info" plain>主要按钮</vui-button>
  </div>
  <div style="margin-top: 10px;">
    <vui-button round>圆角按钮</vui-button>
    <vui-button type="primary" round>主要按钮</vui-button>
    <vui-button type="success" round>成功按钮</vui-button>
    <vui-button type="info" round>信息按钮</vui-button>
    <vui-button type="warning" round>警告按钮</vui-button>
    <vui-button type="danger" round>危险按钮</vui-button>
  </div>

```
:::

### 禁用状态

按钮不可用状态。

:::demo 你可以使用`disabled`属性来定义按钮是否可用，它接受一个`Boolean`值。

```html
  <vui-button disabled>默认按钮</vui-button>
  <vui-button type="primary" disabled>主要按钮</vui-button>
  <div style="margin-top: 10px;">
    <vui-button plain disabled>默认按钮</vui-button>
    <vui-button type="primary" plain disabled>主要按钮</vui-button>
  </div>
```
:::


### 文字按钮

没有边框和背景色的按钮。

:::demo
```html
<vui-button type="text">文字按钮</vui-button>
<vui-button type="text" disabled>文字按钮</vui-button>
```
:::

### 加载中

点击按钮后进行数据加载操作，在按钮上显示加载状态。

:::demo 要设置为 loading 状态，只要设置`loading`属性为`true`即可。

```html
  <vui-button type="primary" :loading="true">加载中</vui-button>
```
:::

### Attributes
| 参数      | 说明    | 类型      | 可选值       | 默认值   |
|---------- |-------- |---------- |-------------  |-------- |
| type     | 类型   | string    |   primary / success / warning / danger / info / text |     —    |
| plain     | 是否朴素按钮   | boolean    | — | false   |
| round     | 是否圆角按钮   | boolean    | — | false   |
| circle     | 是否圆形按钮   | boolean    | — | false   |
| loading     | 是否加载中状态   | boolean    | — | false   |
| disabled  | 是否禁用状态    | boolean   | —   | false   |
