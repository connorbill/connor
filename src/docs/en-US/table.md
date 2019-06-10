## Table 表格

用于展示多条结构类似的数据，可对数据进行排序、筛选、对比或其他自定义操作。

### 基础表格

基础的表格展示用法。

:::demo 
```html
  <template>
    <vui-table
      :data="list"
      :property="property"
      class-name="vui-risk-table"
      scroll="about"
    >
      <template v-slot:operator="slotProps">
        <div v-for="(item, index) in domArr" :key="index">
          <div v-for="(dom, indexDom) in domArr[index].a" :key="indexDom">
            {{dom}}
          </div>
        </div>
        <div @click="addDom(slotProps.row.index)">增加</div>
        <div @click="delDom(slotProps.row.index)">减少</div>
      </template>
    </vui-table>
  </template>

  <script>
    export default {
      data() {
        return {
          property: [],
          list: [],
          domArr: [
            {
              a: [1, 2]
            },
            {
              a: [1, 2]
            }
          ],
          dataArr: [
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type1',
              lendingRate: 'Rate',
              serviceTariffing: '1Tariffing',
              serviceTariffing2: '1Tariffing2',
              serviceTariffing3: '1Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type2',
              lendingRate: 'Rate',
              serviceTariffing: '2Tariffing',
              serviceTariffing2: '2Tariffing2',
              serviceTariffing3: '2Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type3',
              lendingRate: 'Rate',
              serviceTariffing: '3Tariffing',
              serviceTariffing2: '3Tariffing2',
              serviceTariffing3: '3Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type4',
              lendingRate: 'Rate',
              serviceTariffing: '4Tariffing',
              serviceTariffing2: '4Tariffing2',
              serviceTariffing3: '4Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type5',
              lendingRate: 'Rate',
              serviceTariffing: '5Tariffing',
              serviceTariffing2: '5Tariffing2',
              serviceTariffing3: '5Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type6',
              lendingRate: 'Rate',
              serviceTariffing: '6Tariffing',
              serviceTariffing2: '6Tariffing2',
              serviceTariffing3: '6Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type7',
              lendingRate: 'Rate',
              serviceTariffing: '7Tariffing',
              serviceTariffing2: '7Tariffing2',
              serviceTariffing3: '7Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type8',
              lendingRate: 'Rate',
              serviceTariffing: '8Tariffing',
              serviceTariffing2: '8Tariffing2',
              serviceTariffing3: '8Tariffing3'
            }
          ],
          propertyArr: [
            {
              headTitle: '序号', // 表头名称
              width: 60, // 这一列宽度
              prop: '',
              slot: 'indexSlot',
              fixed: 'left', // 固定在左侧
              className: '',
              position: '',
              type: 'index' // 字段类型 index 为序号，
            },
            {
              headTitle: '借款主体',
              width: 150,
              prop: 'storeName',
              slot: 'storeName',
              className: '',
              fixed: 'left',
              type: ''
            },
            {
              headTitle: '借款金额（元）',
              width: 150,
              prop: 'appropriationAmount',
              slot: 'appropriationAmount',
              className: '',
              fixed: '',
              type: ''
            },
            {
              // 单位 ： period_unit 0 月， 1 日
              headTitle: '借款期限',
              width: 100,
              prop: 'appropriationDate',
              slot: 'appropriationDate',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '还款方式',
              width: 150,
              prop: 'repaymentType',
              slot: 'repaymentType',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '借款利率（%）',
              width: 110,
              prop: 'lendingRate',
              slot: 'lendingRate',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '居间服务费率（%）',
              width: 130,
              prop: 'serviceTariffing',
              slot: 'serviceTariffing',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '居222',
              width: 130,
              prop: 'serviceTariffing2',
              slot: 'serviceTariffing3',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '居333',
              width: 130,
              prop: 'serviceTariffing3',
              slot: 'serviceTariffing3',
              className: '',
              fixed: '',
              type: ''
            }
          ]
        };
      },
      mounted() {
        var that = this;
        // setTimeout(function() {
        //   that.property = [].concat(that.propertyArr);
        //   // that.list = [].concat([1, 2, 3, 4, 5, 6]);
        // }, 3000);
        that.property = [].concat(that.propertyArr);
        that.list = [].concat(this.dataArr);
      },
      methods: {
        addDom(index) {
          this.domArr.push({a: [1, 2, 3]});
        },
        delDom() {
          this.domArr.splice(0, 1);
        },
        changeCol: function(a) {
          if (a === 1) {
            this.property.splice(2, 1);
            this.list.splice(1, 1);
          } else {
            this.property.push(
              {
                headTitle: '状态',
                width: 100,
                prop: 'statusName',
                slot: 'statusName',
                className: '',
                fixed: '',
                type: ''
              });
            this.list.push(5);
          }
        }
      }
    }
  </script>
```
:::

### 表格



:::demo 
```html
  <template>
          <vui-table
            :data="list"
            :property="property"
            class-name="vui-risk-table"
            scroll="about"
            :show-footer="true"
            max-height="200"
          >
            <template v-slot:operator="slotProps">
              <div v-for="(item, index) in domArr" :key="index">
                <div v-for="(dom, indexDom) in domArr[index].a" :key="indexDom">
                  {{dom}}
                </div>
              </div>
              <div @click="addDom(slotProps.row.index)">增加</div>
              <div @click="delDom(slotProps.row.index)">减少</div>
            </template>
            <template v-slot:footer="slotProps">
              <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
              </tr>
            </template>
          </vui-table>
  </template>

  <script>
    export default {
      data() {
        return {
          property: [],
          list: [],
          domArr: [
            {
              a: [1, 2]
            },
            {
              a: [1, 2]
            }
          ],
          dataArr: [
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type1',
              lendingRate: 'Rate',
              serviceTariffing: '1Tariffing',
              serviceTariffing2: '1Tariffing2',
              serviceTariffing3: '1Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type2',
              lendingRate: 'Rate',
              serviceTariffing: '2Tariffing',
              serviceTariffing2: '2Tariffing2',
              serviceTariffing3: '2Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type3',
              lendingRate: 'Rate',
              serviceTariffing: '3Tariffing',
              serviceTariffing2: '3Tariffing2',
              serviceTariffing3: '3Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type4',
              lendingRate: 'Rate',
              serviceTariffing: '4Tariffing',
              serviceTariffing2: '4Tariffing2',
              serviceTariffing3: '4Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type5',
              lendingRate: 'Rate',
              serviceTariffing: '5Tariffing',
              serviceTariffing2: '5Tariffing2',
              serviceTariffing3: '5Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type6',
              lendingRate: 'Rate',
              serviceTariffing: '6Tariffing',
              serviceTariffing2: '6Tariffing2',
              serviceTariffing3: '6Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type7',
              lendingRate: 'Rate',
              serviceTariffing: '7Tariffing',
              serviceTariffing2: '7Tariffing2',
              serviceTariffing3: '7Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type8',
              lendingRate: 'Rate',
              serviceTariffing: '8Tariffing',
              serviceTariffing2: '8Tariffing2',
              serviceTariffing3: '8Tariffing3'
            }
          ],
          propertyArr: [
            {
              headTitle: '序号', // 表头名称
              width: 60, // 这一列宽度
              prop: '',
              slot: 'indexSlot',
              fixed: 'left', // 固定在左侧
              className: '',
              position: '',
              type: 'index' // 字段类型 index 为序号，
            },
            {
              headTitle: '借款主体',
              width: 150,
              prop: 'storeName',
              slot: 'storeName',
              className: '',
              fixed: 'left',
              type: ''
            },
            {
              headTitle: '借款金额（元）',
              width: 150,
              prop: 'appropriationAmount',
              slot: 'appropriationAmount',
              className: '',
              fixed: '',
              type: ''
            },
            {
              // 单位 ： period_unit 0 月， 1 日
              headTitle: '借款期限',
              width: 100,
              prop: 'appropriationDate',
              slot: 'appropriationDate',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '还款方式',
              width: 150,
              prop: 'repaymentType',
              slot: 'repaymentType',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '借款利率（%）',
              width: 110,
              prop: 'lendingRate',
              slot: 'lendingRate',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '居间服务费率（%）',
              width: 130,
              prop: 'serviceTariffing',
              slot: 'serviceTariffing',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '居222',
              width: 130,
              prop: 'serviceTariffing2',
              slot: 'serviceTariffing3',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '居333',
              width: 130,
              prop: 'serviceTariffing3',
              slot: 'serviceTariffing3',
              className: '',
              fixed: '',
              type: ''
            }
          ]
        };
      },
      mounted() {
        var that = this;
        // setTimeout(function() {
        //   that.property = [].concat(that.propertyArr);
        //   // that.list = [].concat([1, 2, 3, 4, 5, 6]);
        // }, 3000);
        that.property = [].concat(that.propertyArr);
        that.list = [].concat(this.dataArr);
      },
      methods: {
        addDom(index) {
          this.domArr.push({a: [1, 2, 3]});
        },
        delDom() {
          this.domArr.splice(0, 1);
        },
        changeCol: function(a) {
          if (a === 1) {
            this.property.splice(2, 1);
            this.list.splice(1, 1);
          } else {
            this.property.push(
              {
                headTitle: '状态',
                width: 100,
                prop: 'statusName',
                slot: 'statusName',
                className: '',
                fixed: '',
                type: ''
              });
            this.list.push(5);
          }
        }
      }
    }
  </script>
```
:::

### 表格

:::demo 
```html
  <template>
          <vui-table
            :data="list"
            :property="property"
            class-name="vui-risk-table"
            scroll="seesaw"
            :show-footer="true"
            max-height="200"
          >
            <template v-slot:operator="slotProps">
              <div v-for="(item, index) in domArr" :key="index">
                <div v-for="(dom, indexDom) in domArr[index].a" :key="indexDom">
                  {{dom}}
                </div>
              </div>
              <div @click="addDom(slotProps.row.index)">增加</div>
              <div @click="delDom(slotProps.row.index)">减少</div>
            </template>
            <template v-slot:footer="slotProps">
              <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
              </tr>
            </template>
          </vui-table>
  </template>

  <script>
    export default {
      data() {
        return {
          property: [],
          list: [],
          domArr: [
            {
              a: [1, 2]
            },
            {
              a: [1, 2]
            }
          ],
          dataArr: [
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type1',
              lendingRate: 'Rate',
              serviceTariffing: '1Tariffing',
              serviceTariffing2: '1Tariffing2',
              serviceTariffing3: '1Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type2',
              lendingRate: 'Rate',
              serviceTariffing: '2Tariffing',
              serviceTariffing2: '2Tariffing2',
              serviceTariffing3: '2Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type3',
              lendingRate: 'Rate',
              serviceTariffing: '3Tariffing',
              serviceTariffing2: '3Tariffing2',
              serviceTariffing3: '3Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type4',
              lendingRate: 'Rate',
              serviceTariffing: '4Tariffing',
              serviceTariffing2: '4Tariffing2',
              serviceTariffing3: '4Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type5',
              lendingRate: 'Rate',
              serviceTariffing: '5Tariffing',
              serviceTariffing2: '5Tariffing2',
              serviceTariffing3: '5Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type6',
              lendingRate: 'Rate',
              serviceTariffing: '6Tariffing',
              serviceTariffing2: '6Tariffing2',
              serviceTariffing3: '6Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type7',
              lendingRate: 'Rate',
              serviceTariffing: '7Tariffing',
              serviceTariffing2: '7Tariffing2',
              serviceTariffing3: '7Tariffing3'
            },
            {
              storeName: 'storeName',
              appropriationAmount: 'Amount',
              appropriationDate: 'Date',
              repaymentType: 'Type8',
              lendingRate: 'Rate',
              serviceTariffing: '8Tariffing',
              serviceTariffing2: '8Tariffing2',
              serviceTariffing3: '8Tariffing3'
            }
          ],
          propertyArr: [
            {
              headTitle: '序号', // 表头名称
              width: 60, // 这一列宽度
              prop: '',
              slot: 'indexSlot',
              fixed: 'left', // 固定在左侧
              className: '',
              position: '',
              type: 'index' // 字段类型 index 为序号，
            },
            {
              headTitle: '借款主体',
              width: 150,
              prop: 'storeName',
              slot: 'storeName',
              className: '',
              fixed: 'left',
              type: ''
            },
            {
              headTitle: '借款金额（元）',
              width: 150,
              prop: 'appropriationAmount',
              slot: 'appropriationAmount',
              className: '',
              fixed: '',
              type: ''
            },
            {
              // 单位 ： period_unit 0 月， 1 日
              headTitle: '借款期限',
              width: 100,
              prop: 'appropriationDate',
              slot: 'appropriationDate',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '还款方式',
              width: 150,
              prop: 'repaymentType',
              slot: 'repaymentType',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '借款利率（%）',
              width: 110,
              prop: 'lendingRate',
              slot: 'lendingRate',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '居间服务费率（%）',
              width: 130,
              prop: 'serviceTariffing',
              slot: 'serviceTariffing',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '居222',
              width: 130,
              prop: 'serviceTariffing2',
              slot: 'serviceTariffing3',
              className: '',
              fixed: '',
              type: ''
            },
            {
              headTitle: '居333',
              width: 130,
              prop: 'serviceTariffing3',
              slot: 'serviceTariffing3',
              className: '',
              fixed: '',
              type: ''
            }
          ]
        };
      },
      mounted() {
        var that = this;
        // setTimeout(function() {
        //   that.property = [].concat(that.propertyArr);
        //   // that.list = [].concat([1, 2, 3, 4, 5, 6]);
        // }, 3000);
        that.property = [].concat(that.propertyArr);
        that.list = [].concat(this.dataArr);
      },
      methods: {
        addDom(index) {
          this.domArr.push({a: [1, 2, 3]});
        },
        delDom() {
          this.domArr.splice(0, 1);
        },
        changeCol: function(a) {
          if (a === 1) {
            this.property.splice(2, 1);
            this.list.splice(1, 1);
          } else {
            this.property.push(
              {
                headTitle: '状态',
                width: 100,
                prop: 'statusName',
                slot: 'statusName',
                className: '',
                fixed: '',
                type: ''
              });
            this.list.push(5);
          }
        }
      }
    }
  </script>
```
:::


### Table Attributes
| 参数      | 说明          | 类型      | 可选值                           | 默认值  |
|---------- |-------------- |---------- |--------------------------------  |-------- |
| data | 显示的数据 | array | — | — |
| property | 每列的配置项 | array | — | — |
| height | Table 的高度，默认为自动高度。如果 height 为 number 类型，单位 px；如果 height 为 string 类型，则这个高度会设置为 Table 的 style.height 的值，Table 的高度会受控于外部样式。  | string/number | — | — |
| max-height | Table 的最大高度 | string/number | — | — |
| show-header | 是否显示表头 | boolean | — | true |
| empty-text | 空数据时显示的文本内容，也可以通过 `slot="empty"` 设置 | String | — | 暂无数据 |
| show-footer | 是否在表尾显示合计行 | Boolean | — | false |

### property Attributes
| 参数      | 说明          | 类型      | 可选值                           | 默认值  |
|---------- |-------------- |---------- |--------------------------------  |-------- |
| type | 对应列的类型。如果设置了 `index` 则显示该行的索引（从 1 开始计算）； | string | - | — |
| prop | 对应列内容的字段名，也可以使用 property 属性 | string | — | — |
| width | 对应列的宽度 | string | — | — |
| fixed | 列是否固定在左侧或者右侧 | string | left, right | — |
| className | 列的 className | string | — | — |
| headTitle | 列的 表头名字 | string | — | — |
| slot | 列的 对应 slot | string | — | — |
| class-name | 列的 className | string | — | — |


