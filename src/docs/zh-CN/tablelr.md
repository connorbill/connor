## Table-lr 表格

用于展示左右显示内容布局表格

### 基础表格

基础的表格展示用法。

:::demo 
```html
  <template>
    <vui-table-lr
      :column="layoutTable"
    >
      <template>
          <tbody>
          <tr>
              <td>图片类型：</td>
              <td>
                  
              </td>
          </tr>
          <tr>
              <td>图片：</td>
              <td>
                  
              </td>
          </tr>
          </tbody>
      </template>
    </vui-table-lr>
  </template>

  <script>
    export default {
      data() {
        return {
          layoutTable: [
              {width: 150},
              {width: 800},
          ],
        };
      },
      mounted() {
      },
      methods: {
      }
    }
  </script>
```
:::










### Table-lr Attributes
| 参数      | 说明          | 类型      | 可选值                           | 默认值  |
|---------- |-------------- |---------- |--------------------------------  |-------- |
| column | 设置每列的宽度， 数组中 width 字段表示宽度 | array | — | — |

### Table-lr Slot
| name | 说明 |
|------|--------|
| vui-table-lr 标签内即内容 | <template><tbody></tbody></template> 中，加 tbody 标签 |
