## Scrollbar 美化滚动条

用于在鼠标滚轮动作时，控制内容区移动方向

### 基础用法

展示用法。

:::demo 
```html
  <template>
    <div>
    <div class="li-scroll">
      <vui-scrollbar
        scroll="about"
        tag="ul"
        :viewStyle="{height: '100px'}"
        view-class="list">
        <slot>
          <li style="white-space: nowrap;">板凳要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳
            要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳要坐十年冷，文章不写一句空。表示做学问的人
            要耐下心来坐十年冷板凳，毫无怨言end</li>
          <li style="white-space: nowrap;">板凳要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳
            要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳要坐十年冷，文章不写一句空。表示做学问的人
            要耐下心来坐十年冷板凳，毫无怨言end</li>
          <li style="white-space: nowrap;">板凳要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳
            要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳要坐十年冷，文章不写一句空。表示做学问的人
            要耐下心来坐十年冷板凳，毫无怨言end</li>
          <li style="white-space: nowrap;">板凳要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳
            要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳要坐十年冷，文章不写一句空。表示做学问的人
            要耐下心来坐十年冷板凳，毫无怨言end</li>
          <li style="white-space: nowrap;">板凳要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳
            要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳要坐十年冷，文章不写一句空。表示做学问的人
            要耐下心来坐十年冷板凳，毫无怨言end</li>
          <li style="white-space: nowrap;">板凳要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳
            要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳要坐十年冷，文章不写一句空。表示做学问的人
            要耐下心来坐十年冷板凳，毫无怨言end</li>
          <li style="white-space: nowrap;">板凳要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳
            要坐十年冷，文章不写一句空。表示做学问的人要耐下心来坐十年冷板凳，毫无怨言板凳要坐十年冷，文章不写一句空。表示做学问的人
            要耐下心来坐十年冷板凳，毫无怨言end</li>
        </slot>
      </vui-scrollbar>
    </div>
    </div>
  </template>
<style>
 
</style>
  <script>
    export default {
      data() {
        return {
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










### Scrollbar Attributes
| 参数      | 说明          | 类型      | 可选值                           | 默认值  |
|---------- |-------------- |---------- |--------------------------------  |-------- |
| wrapStyle |  | string | — | — |
| wrapClass |  | string | — | — |
| viewClass |  | string | — | — |
| viewStyle | | string | — | — |
| tag | 包含内容的标签名 | string | — | div |
| scroll | 鼠标滚轮动作时，内容滚动方向seesaw: 上下， about： 左右滚动 | string | seesaw / about  | about |
| showX | 是否显示横向滚动条 | boolen | — | true |
| showY | 是否显示竖向滚动条 | boolen | — | true |


